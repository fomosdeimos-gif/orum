import type { VercelRequest, VercelResponse } from '@vercel/node';

const SUPABASE_PENSAMENTO_URL =
  'https://ywabnlhkmhbyewqhbsjm.supabase.co/functions/v1/pensamento';
const ANON_KEY = process.env.SUPABASE_ANON_KEY || '';

export default async function handler(req: VercelRequest, res: VercelResponse) {
  if (req.method !== 'POST') {
    res.status(405).json({ ok: false, error: 'method_not_allowed' });
    return;
  }

  try {
    const upstream = await fetch(SUPABASE_PENSAMENTO_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${ANON_KEY}`,
      },
      body: JSON.stringify(req.body),
    });

    const data = await upstream.json();
    res.status(upstream.status).json(data);
  } catch (err) {
    res.status(502).json({ ok: false, error: 'upstream_unreachable' });
  }
}
