FROM	ubuntu:16.04

RUN 	echo -e "\nexport TERM=xterm" >> ~/.bashrc

ENV	TERM=xterm

COPY	./apache-entrypoint.sh /

RUN 	apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends --no-install-suggests wget bzip2

RUN	apt-get install -y --no-install-recommends --no-install-suggests apache2 libapache2-mod-php7.0 libapache2-modsecurity \ 
		php7.0-gd php7.0-json php7.0-mysql php7.0-curl php7.0-mbstring \
		php7.0-intl php7.0-mcrypt php-imagick php7.0-xml php7.0-zip \
		php7.0-curl php-mime-type php7.0-bz2 php7.0-intl php7.0-mcrypt php-imagick php7.0-cli

RUN    apt-get purge -y --auto-remove

RUN    rm -rf /var/lib/apt/lists/*

RUN	chmod o+x /apache-entrypoint.sh

VOLUME  /etc/apache2/
VOLUME  /etc/letsencrypt/
VOLUME	/var/www/

EXPOSE 	80

ENTRYPOINT /apache-entrypoint.sh
