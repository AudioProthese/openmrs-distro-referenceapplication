#!/bin/sh
set -e

echo "⏳ Waiting for frontend on port 80…"
while ! nc -z openrmscore-dev-app-frontend 80; do
  echo "  frontend not ready, retrying in 2s…"
  sleep 2
done
echo "✅ frontend is up!"

echo "⏳ Waiting for backend on port 8080…"
while ! nc -z openrmscore-dev-app-backend 8080; do
  echo "  backend not ready, retrying in 2s…"
  sleep 2
done
echo "✅ backend is up!"

echo "🚀 All services ready — starting NGINX"
exec nginx -g 'daemon off;'
