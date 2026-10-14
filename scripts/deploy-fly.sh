#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT/backend"

if ! command -v flyctl >/dev/null 2>&1 && ! command -v fly >/dev/null 2>&1; then
  echo "Install Fly CLI first:"
  echo "  curl -L https://fly.io/install.sh | sh"
  exit 1
fi

FLY="$(command -v flyctl || command -v fly)"

echo "Deploying HireRe API to Fly.io from backend/"
"$FLY" deploy

echo
echo "After deploy, set on Vercel:"
echo "  NEXT_PUBLIC_API_URL=https://hirere-api.fly.dev"
echo "Then redeploy the frontend."
