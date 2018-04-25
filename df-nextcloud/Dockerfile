FROM	ubuntu:16.04

RUN 	echo -e "\nexport TERM=xterm" >> ~/.bashrc

ENV	TERM=xterm

COPY	./apache-entrypoint.sh /

RUN 	apt-get update && apt-get upgrade -y

RUN	apt-get install -y apache2 libapache2-mod-php7.0 libapache2-modsecurity \ 
		curl ca-certificates openssl wget bzip2 php7.0-gd php7.0-json php7.0-mysql php7.0-curl php7.0-mbstring \
		php7.0-intl php7.0-mcrypt php-imagick php7.0-xml php7.0-zip \
		php7.0-curl php-mime-type php7.0-bz2 php7.0-intl php7.0-mcrypt php-imagick php7.0-cli

RUN    apt-get purge -y --auto-remove

RUN    rm -rf /var/lib/apt/lists/*

RUN	chmod o+x /apache-entrypoint.sh

COPY	php.ini /etc/php/7.0/apache2/php.ini
RUN	chmod 644 /etc/php/7.0/apache2/php.ini

VOLUME  /etc/apache2/
VOLUME  /etc/letsencrypt/
VOLUME	/var/www/

EXPOSE 	80

ENTRYPOINT /apache-entrypoint.sh
