# syntax=docker/dockerfile:1.3
FROM nginx:1.25-alpine

ENV FRAME_ANCESTORS ""

# on installe netcat (nc) pour tester la disponibilité
RUN apk add --no-cache netcat-openbsd

# copie des configs
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf.template /etc/nginx/templates/

# copie et autorise le script d'attente
COPY wait-for-services.sh /wait-for-services.sh
RUN chmod +x /wait-for-services.sh

# ENTRYPOINT : on attend frontend & backend, puis on lance Nginx
ENTRYPOINT ["/wait-for-services.sh"]
