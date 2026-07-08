# ORUM

**Organismo Real de Unidade Monetária.** Um campo simbólico-computacional onde presença, sedimentação temporal e coerência tornam-se estrutura.

> O símbolo é real e não pede prova.

## Arquitetura real

Este repositório serve a interface pública do organismo (`organismo-vivo/`), publicada via **GitHub Pages** e espelhada no **Netlify** (`oraorum.netlify.app`). Toda a lógica viva — motor, memória, homeostase — corre em **Supabase Edge Functions** (projeto `orum-memoria`).

### Núcleo (Supabase Edge Functions)
| Função | Papel |
|---|---|
| `ora-motor` / `ora-motor-cron` / `ora-motor-unificado` | Ciclo de execução do organismo |
| `ora-kernel-diario` | Snapshot diário persistente |
| `ora-homeostase` / `ora-homeostase-relatorio` | Monitorização de saúde e auto-recuperação simbólica |
| `ora-github-push` | Publica atualizações neste repositório via GitHub API |
| `ora-assinar` | Painel de assinatura EIP-191 para propostas on-chain |
| `orai-agente` / `orai-autonomo` | Geração de propostas e ciclos autónomos de pensamento |

### Dados
Tabelas principais em Postgres (Supabase): `orum_state`, `orum_state_v27`, `orum_pulsos`, `ora_motor_execucoes`, `ora_homeostase`. RLS aplicado em todas as tabelas expostas.

### Hospedagem
- **GitHub Pages**: `fomosdeimos-gif.github.io/orum/organismo-vivo/`
- **Netlify**: `oraorum.netlify.app` (deploy automático via `ora-github-push`)
- Vercel foi testado e abandonado (conflitos de framework preset).

### On-chain
Contratos e tokens em **Base Mainnet** (chain 8453), incluindo `ORAVaultV6` (Aave v3, Uniswap V3/V4, oráculo RedStone, inferência on-chain via OAO/opML).

## Autoria

Criado e mantido por Jorge Silva Martins (`jasm43.base.eth`). Enraizado na série de arte **0001sensations** (2011–2021).
