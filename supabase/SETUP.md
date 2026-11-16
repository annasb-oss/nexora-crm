# Configuração gratuita do Supabase

O NEXORA usa o Supabase para autenticação e banco de dados. É possível começar no plano Free; não selecione planos pagos nem adicione cartão para esta configuração.

## 1. Criar o projeto

1. Acesse https://supabase.com e entre/crie uma conta.
2. Crie um projeto novo e selecione o plano **Free**.
3. Escolha uma senha forte para o banco e guarde-a em local seguro.
4. Se a tela solicitar upgrade, cartão ou ativação de cobrança, pare e confirme antes de continuar.

## 2. Criar as tabelas e regras de segurança

1. Abra o projeto no painel Supabase.
2. Entre em **SQL Editor**.
3. Abra o arquivo `supabase/schema.sql` deste repositório.
4. Cole o conteúdo completo e execute.
5. Confirme que as tabelas `clients`, `deals` e `tasks` foram criadas.

O script ativa Row Level Security (RLS) e limita os registros ao usuário autenticado. Não desative RLS.

## 3. Obter as credenciais públicas do navegador

No painel do projeto, abra **Project Settings → API** (ou a seção **API Keys**):

- Project URL
- Publishable key (começa com `sb_publishable_`) ou a chave legada `anon`

Esses dois valores serão usados nas variáveis `VITE_SUPABASE_URL` e `VITE_SUPABASE_ANON_KEY`.

**Nunca copie, envie ou coloque no frontend a chave `service_role` ou qualquer secret key.** Ela dá acesso privilegiado e não deve ser exposta.

## 4. Limites de custo

- Permaneça no plano Free.
- Não habilite billing, compute add-ons, upgrades ou serviços pagos.
- O plano gratuito possui limites e pode pausar projetos inativos. Se o painel mostrar aviso de limite, upgrade ou cobrança, interrompa e revise antes de prosseguir.
