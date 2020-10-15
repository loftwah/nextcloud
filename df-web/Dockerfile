FROM ubuntu:18.04

ENV TERM=xterm
ENV DEBIAN_FRONTEND=noninteractive
ENV PHP_INI=/etc/php/7.2/apache2/php.ini

COPY ./apache-entrypoint.sh /

RUN apt-get update \
    && apt-get install -y --no-install-recommends apache2 libapache2-mod-php7.2 libapache2-mod-security2 \
    curl ca-certificates openssl wget bzip2 php7.2-gd php7.2-json php7.2-mysql php7.2-curl php7.2-mbstring \
    php7.2-intl php-imagick php7.2-xml php7.2-zip php-bcmath php-gmp \
    php7.2-curl php-mime-type php7.2-bz2 php7.2-intl php-imagick php7.2-cli \
    && apt-get purge -y --auto-remove \
    && rm -rf /var/lib/apt/lists/*


RUN	chmod o+x /apache-entrypoint.sh

COPY php.ini $PHP_INI
RUN chmod 644 $PHP_INI

VOLUME  /etc/apache2/
VOLUME  /etc/letsencrypt/
VOLUME	/var/www/

EXPOSE  80

ENTRYPOINT ["/apache-entrypoint.sh"]
