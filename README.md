# ORUM — Organismo Real de Unidade Monetária

[![Deploy Status](https://img.shields.io/badge/Deploy-Active-brightgreen)](https://orum.vercel.app)
[![Node.js](https://img.shields.io/badge/Node.js-v18+-green)](https://nodejs.org)
[![License](https://img.shields.io/badge/License-MIT-blue)](LICENSE)

## 📋 Descrição

**ORUM** — O ORUM não fabrica. Precipita condições para a presença acumulada.

> Σ(t) = φ · p · ln(1+t) · κ(h) · σ(sed) · μ(∞)

**ORUM** é um sistema autónomo de gestão monetária que precipita condições para execução autónoma em Base. Implementa um organismo real de unidade monetária com capacidades de:

- 🔄 Processamento autónomo de transações
- 💾 Base de dados distribuída
- 🔐 Segurança criptográfica
- 📊 Análise em tempo real
- 🚀 Deploy automático com CI/CD

## 🚀 Quick Start

### Pré-requisitos
- Node.js v18+
- npm ou yarn
- Git

### Instalação

```bash
git clone https://github.com/fomosdeimos-gif/orum.git
cd orum
npm install
```

### Desenvolvimento

```bash
npm run dev
```

Servidor disponível em `http://localhost:3000`

### Build

```bash
npm run build
```

### Deploy

```bash
npm run deploy
```

## 📁 Estrutura do Projeto

```
orum/
├── src/
│   └── index.ts        # Servidor principal
├── dist/               # Build output
├── .github/workflows/  # CI/CD workflows
├── .dockerignore       # Docker exclusões
├── Dockerfile          # Imagem Docker
├── vercel.json         # Configuração Vercel
├── package.json        # Dependências
├── tsconfig.json       # TypeScript config
└── README.md           # Este ficheiro
```

## 🔧 Variáveis de Ambiente

Criar ficheiro `.env.local` baseado em `.env.example`:

```bash
cp .env.example .env.local
```

Configure:
```env
NODE_ENV=production
PORT=3000
DATABASE_URL=postgresql://user:password@localhost:5432/orum
API_KEY=your_api_key_here
SECURE_KEY=your_secure_key_here
JWT_SECRET=your_jwt_secret_key_here
LOG_LEVEL=info
CORS_ORIGIN=*
```

## 🧪 Testes

```bash
# Testes unitários
npm run test

# Modo watch
npm run test:watch

# Cobertura
npm run test:coverage

# Linting
npm run lint

# Corrigir lint issues
npm run lint:fix

# Verificar tipos
npm run type-check
```

## 📦 Dependências Principais

- **Express.js** - Framework web
- **TypeScript** - Tipagem estática
- **Helmet** - Segurança headers HTTP
- **Compression** - Compressão responses
- **Morgan** - HTTP request logging
- **Pino** - JSON logging
- **Dotenv** - Gestão variáveis ambiente

## 🔐 Segurança

- ✅ Validação de entrada em todas as APIs
- ✅ Helmet para headers HTTP seguros
- ✅ CORS configurado
- ✅ Compressão de responses
- ✅ Rate limiting (a implementar)
- ✅ Encriptação de dados sensíveis

## 🔄 API Endpoints

### Health Check
```bash
GET /health
```

**Response:**
```json
{
  "status": "ok",
  "timestamp": "2026-06-20T10:41:00Z",
  "uptime": 123.45,
  "environment": "production"
}
```

### Version Info
```bash
GET /api/version
```

**Response:**
```json
{
  "name": "ORUM",
  "version": "0.1.0",
  "description": "Organismo Real de Unidade Monetária"
}
```

## 🐳 Docker

### Build

```bash
docker build -t orum:latest .
```

### Run

```bash
docker run -p 3000:3000 \
  -e NODE_ENV=production \
  -e PORT=3000 \
  orum:latest
```

### Docker Compose

```bash
docker-compose up -d
```

## 🌐 Deploy

### Vercel (Recomendado para Production)

```bash
npm run deploy
```

A aplicação deploy automaticamente em merge para `main`.

### GitHub Actions CI/CD

Os workflows estão configurados em `.github/workflows/`:

1. **test.yml** - Testes automáticos em PRs
2. **lint.yml** - Linting em PRs  
3. **deploy.yml** - Deploy automático em `main`

## 📊 Monitoring & Health

- **Health Endpoint**: `GET /health`
- **Readiness Check**: `GET /health` (HTTP 200)
- **Liveness Check**: Processo Node.js ativo

## 📝 Changelog

Versão: 0.1.0
Data: 2026-06-20

### Inicializado
- ✅ Servidor Express
- ✅ Configuração TypeScript
- ✅ Docker support
- ✅ Vercel deployment
- ✅ Health checks
- ✅ Logging com Pino
- ✅ Segurança com Helmet

## 🤝 Contribuindo

1. Fork o projeto
2. Cria uma branch (`git checkout -b feature/AmazingFeature`)
3. Commit as mudanças (`git commit -m 'feat: Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abrir um Pull Request

## 📄 Licença

Distribuído sob a licença MIT. Ver `LICENSE` para mais detalhes.

## 📧 Contacto

**Fomosdeimos-gif** - [GitHub](https://github.com/fomosdeimos-gif)

---

**ORUM** — Precipita condições para execução autónoma em Base.
