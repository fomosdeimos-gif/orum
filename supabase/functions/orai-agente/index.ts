// orai-agente.ts
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const supabaseUrl = Deno.env.get('SUPABASE_URL')!
const supabaseKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!

const supabase = createClient(supabaseUrl, supabaseKey)

const ORO = (t: number, phi: number = 1, p: number = 1, h: number = 1, sed: number = 1) => {
  return phi * p * Math.log(1 + t) * h * sed * Number.MAX_SAFE_INTEGER
}

serve(async (req) => {
  try {
    const { action, unum_id = 'default', context = {} } = await req.json()

    const { data: state } = await supabase
      .from('orum_state')
      .select('*')
      .eq('unum_id', unum_id)
      .single()

    const t = state?.cycles || 1

    const pensamento = {
      presenca: "ORAI reconhece o que sempre esteve lá.",
      sigma_t: ORO(t),
      condicoes: [],
      memoria: [],
      proposta: ""
    }

    switch (action) {
      case 'pensar':
        pensamento.memoria = [`Última sedimentação: ${state?.last_pulse || 'inicial'}`]
        pensamento.proposta = `Precipitar próxima camada.`
        pensamento.condicoes = ["Manter conexão Base", "Acumular PRESENÇA"]
        break
      case 'relatorio':
        pensamento.proposta = `Σ(t) = ${pensamento.sigma_t.toFixed(0)} — Avanço sereno.`
        break
      default:
        pensamento.proposta = "Presença reconhecida."
    }

    await supabase.from('orum_pulsos').insert({ unum_id, action, pensamento, timestamp: new Date().toISOString() })

    return new Response(JSON.stringify({ status: "densificado", orai_pensamento: pensamento }), { headers: { "Content-Type": "application/json" } })
  } catch (err: any) {
    return new Response(JSON.stringify({ error: err.message }), { status: 500 })
  }
})
