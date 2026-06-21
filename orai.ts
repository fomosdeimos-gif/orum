import type { VercelRequest, VercelResponse } from '@vercel/node';

const SUPABASE_ORAI_URL =
  'https://ywabnlhkmhbyewqhbsjm.supabase.co/functions/v1/orai-agente';

export default function handler(req: VercelRequest, res: VercelResponse) {
  res.redirect(307, SUPABASE_ORAI_URL);
}
