import type { VercelRequest, VercelResponse } from '@vercel/node';

const SUPABASE_X402_URL =
  'https://ywabnlhkmhbyewqhbsjm.supabase.co/functions/v1/ora-x402';

export default async function handler(req: VercelRequest, res: VercelResponse) {
  try {
    const upstream = await fetch(SUPABASE_X402_URL, {
      method: req.method,
      headers: { 'Content-Type': 'application/json' },
      body: req.method !== 'GET' && req.method !== 'HEAD' ? JSON.stringify(req.body) : undefined,
    });
    const data = await upstream.json();
    res.status(upstream.status).json(data);
  } catch (err) {
    res.status(502).json({ ok: false, error: 'upstream_unreachable' });
  }
}
