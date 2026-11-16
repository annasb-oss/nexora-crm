# NEXORA CRM

CRM web app for customer management, sales pipeline and follow-up activities.

## Stack
- React + TypeScript + Vite
- Supabase (planned for authentication and database)
- Cloudflare Pages (planned for free frontend hosting)

## Run locally
```bash
npm install
npm run dev
```

Copy `.env.example` to `.env.local` when configuring Supabase. Never commit credentials, private keys or real customer data.

## Project status
Early development. The current version is a frontend prototype using sample data. Authentication, database persistence, permissions, reporting and production security are still to be implemented.
