# NEXORA CRM

A responsive CRM prototype for managing customer relationships, sales opportunities and follow-up activities.

## Current features
- Dashboard with live counts and pipeline totals.
- Customer records: create, edit, search, filter and delete.
- Sales opportunities: create, edit, change stage, search and export.
- Activities: schedule, complete, edit and delete.
- Summary reports and CSV exports.
- Responsive dark interface.
- Local browser persistence for the current prototype.

## Important project status
**This version is a local-first prototype, not a production SaaS yet.** Data is stored in the browser's local storage. It does not currently provide user authentication, shared online storage, multi-user access, backups or server-side authorization. Do not enter real customer or sensitive personal data yet.

The Supabase schema and row-level security policies are prepared in `supabase/schema.sql`, but the application has not yet been connected to a Supabase project.

## Stack
- React + TypeScript + Vite
- Lucide icons
- Supabase (backend integration prepared, not connected)
- Cloudflare Pages (free static hosting target)

## Run locally
Requirements: Node.js 20.19+ or 22.12+.

```bash
npm install
npm run dev
```

Create a production build:

```bash
npm run build
npm run preview
```

## Free hosting with Cloudflare Pages
1. Push this repository to GitHub.
2. Create a free Cloudflare account and open **Workers & Pages → Create → Pages → Connect to Git**.
3. Select `annasb-oss/nexora-crm`.
4. Set the production branch to `main`.
5. Set build command to `npm run build`.
6. Set build output directory to `dist`.
7. Save and deploy.

Cloudflare's free tier and quotas may change. The app is static at this stage; no paid service is required for the frontend deployment. A custom domain is optional and may cost money.

## Supabase backend setup (next milestone)
1. Create a free Supabase project.
2. Open SQL Editor and run `supabase/schema.sql`.
3. Configure authentication providers and email settings.
4. Connect the frontend using the project's URL and publishable key.
5. Implement authenticated CRUD calls and test row-level security before using real data.

Never put a Supabase `service_role` key, database password, or other secret in frontend code or a public repository.

## Commercial readiness checklist
Before selling as a production CRM: connect and test the online database; implement authentication, password recovery and account isolation; add validation and error handling; test backup/export and data deletion; add privacy policy, terms, license and support scope; run security and accessibility checks; and document deployment. Free hosting and database tiers have usage limits and are not a promise of unlimited commercial operation.

## License
No commercial license has been granted yet. A license and resale terms must be defined before distribution.
