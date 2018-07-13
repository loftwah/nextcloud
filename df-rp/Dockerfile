FROM nginx:1.13

RUN apt-get update && apt-get upgrade -y \
  && apt-get install -y --no-install-suggests nginx-extras curl \
  && apt-get purge -y --auto-remove \
  && rm -rf /var/lib/apt/lists/*

VOLUME /etc/letsencrypt/
VOLUME /etc/nginx/

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
