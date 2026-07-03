// ORA . nucleo estatico
// Este ficheiro era um esqueleto Express nunca usado em producao —
// importava express/cors/helmet/compression/morgan/dotenv/pino sem
// essas dependencias estarem no package.json, o que rebentava o
// build Vercel (preset Express) em todos os deploys desde D92.
// O portal ORUM publica-se via GitHub Pages; este ficheiro existe
// apenas para o build Vercel deixar de falhar.
import type { VercelRequest, VercelResponse } from '@vercel/node';

export default function handler(_req: VercelRequest, res: VercelResponse) {
  res.status(410).json({ estado: 'ORUM vive em GitHub Pages', nota: 'este endpoint nao serve o organismo' });
}
