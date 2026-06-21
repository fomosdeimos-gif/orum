import type { VercelRequest, VercelResponse } from '@vercel/node';

const SUPABASE_X402_STATUS_URL =
  'https://ywabnlhkmhbyewqhbsjm.supabase.co/functions/v1/ora-x402/status';

export default async function handler(req: VercelRequest, res: VercelResponse) {
  try {
    const upstream = await fetch(SUPABASE_X402_STATUS_URL, { method: 'GET' });
    const data = await upstream.json();
    res.status(upstream.status).json(data);
  } catch (err) {
    res.status(502).json({ ok: false, error: 'upstream_unreachable' });
  }
}
