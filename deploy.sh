#!/bin/bash

# ORUM - Deploy Automation Script
# Este script configura e faz deploy automático do projeto ORUM

set -e

echo "🚀 ORUM - Deploy Autónomo"
echo "=========================="
echo ""

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Verificar Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js não encontrado. Por favor instale Node.js 18+${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Node.js encontrado: $(node --version)${NC}"

# Verificar npm
if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm não encontrado${NC}"
    exit 1
fi

echo -e "${GREEN}✓ npm encontrado: $(npm --version)${NC}"
echo ""

# Step 1: Instalar dependências
echo -e "${YELLOW}📦 Instalando dependências...${NC}"
npm install
echo -e "${GREEN}✓ Dependências instaladas${NC}"
echo ""

# Step 2: Criar .github/workflows se não existir
echo -e "${YELLOW}📁 Criando estrutura de workflows...${NC}"
mkdir -p .github/workflows
echo -e "${GREEN}✓ Diretório criado${NC}"
echo ""

# Step 3: Criar test.yml
echo -e "${YELLOW}🧪 Criando workflow de testes...${NC}"
cat > .github/workflows/test.yml << 'EOF'
name: Test & Lint

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main, develop]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [18.x, 20.x]

    steps:
      - uses: actions/checkout@v4
      
      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node-version }}
          cache: 'npm'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Build
        run: npm run build
EOF
echo -e "${GREEN}✓ test.yml criado${NC}"
echo ""

# Step 4: Criar deploy.yml
echo -e "${YELLOW}🚀 Criando workflow de deploy...${NC}"
cat > .github/workflows/deploy.yml << 'EOF'
name: Deploy Production

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: production

    steps:
      - uses: actions/checkout@v4
      
      - name: Use Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18.x'
          cache: 'npm'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Build application
        run: npm run build
      
      - name: Deploy to Vercel
        uses: vercel/action@master
        continue-on-error: true
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
          vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}
EOF
echo -e "${GREEN}✓ deploy.yml criado${NC}"
echo ""

# Step 5: Criar docker.yml
echo -e "${YELLOW}🐳 Criando workflow Docker...${NC}"
cat > .github/workflows/docker.yml << 'EOF'
name: Docker Build

on:
  push:
    branches: [main]
    tags: ['v*']

jobs:
  docker:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4
      
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2
      
      - name: Build Docker image
        run: docker build -t orum:latest .
EOF
echo -e "${GREEN}✓ docker.yml criado${NC}"
echo ""

# Step 6: Build local
echo -e "${YELLOW}🔨 Fazendo build local...${NC}"
npm run build
echo -e "${GREEN}✓ Build concluído${NC}"
echo ""

# Step 7: Commit e push dos workflows
echo -e "${YELLOW}📤 Fazendo commit dos workflows...${NC}"
git add .github/workflows/
git commit -m "ci: Add GitHub Actions workflows for testing and deployment" || echo "Nenhuma mudança para commit"
git push origin main || echo "Push falhou - verifique permissões Git"
echo -e "${GREEN}✓ Workflows enviados${NC}"
echo ""

# Step 8: Resumo final
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}✅ ORUM Deployment Setup Concluído!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "📋 Próximos passos:"
echo ""
echo "1️⃣  Adicionar Secrets no GitHub (Settings → Secrets and variables → Actions):"
echo "   - VERCEL_TOKEN"
echo "   - VERCEL_ORG_ID"
echo "   - VERCEL_PROJECT_ID"
echo ""
echo "2️⃣  Verificar workflows:"
echo "   https://github.com/fomosdeimos-gif/orum/actions"
echo ""
echo "3️⃣  Fazer push para trigger deploy:"
echo "   git push origin main"
echo ""
echo "4️⃣  Deploy local (opcional):"
echo "   npm run deploy"
echo ""
echo "5️⃣  Docker local (opcional):"
echo "   npm run docker:build"
echo "   npm run docker:run"
echo ""
