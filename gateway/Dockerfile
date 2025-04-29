# syntax=docker/dockerfile:1.3
FROM nginx:1.25-alpine

ENV FRAME_ANCESTORS ""

# Installation de netcat pour le test de connexion
RUN apk add --no-cache bash gettext

# Copie des fichiers de configuration
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf.template /etc/nginx/templates/

# Script d'attente pour les autres services
COPY <<EOF /wait-for-services.sh
#!/bin/bash
set -e

echo "Waiting for frontend service..."
until getent hosts frontend; do
  echo "Frontend service not available yet - waiting 2s..."
  sleep 2
done
echo "Frontend service is up!"

echo "Waiting for backend service..."
until getent hosts backend; do
  echo "Backend service not available yet - waiting 2s..."
  sleep 2
done
echo "Backend service is up!"

echo "All services are available - starting NGINX"
exec nginx -g 'daemon off;'
EOF

RUN chmod +x /wait-for-services.sh

# Utilisation du script comme point d'entrée
CMD ["/wait-for-services.sh"]