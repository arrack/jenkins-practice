FROM jenkins/jenkins:lts

# need root to install things.
USER root
RUN mkdir -p /tmp/WEB-INF/plugins

RUN mkdir /var/lib/apt/lists/partial
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install --no-install-recommends --no-install-suggests -y \
    php7.0 php7.0-fpm php7.0-mysql php7.0-curl php7.0-gd php7.0-json php7.0-mcrypt \
    php7.0-xml php7.0 php7.0-apcu php7.0-cgi php7.0-cli php7.0-common php7.0-curl php7.0-gd \
    php7.0-geoip php7.0-gmp php7.0-imagick php7.0-imap php7.0-json php7.0-ldap php7.0-mcrypt \
    php7.0-memcache php7.0-memcached php7.0-mysql php7.0-readline php7.0-sqlite php7.0-xmlrpc \
    php7.0-xsl php7.0-mongodb php7.0-intl php7.0-zip php7.0-mbstring \
    php-codesniffer ant

RUN phpdismod opcache

# composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# phpunit
RUN wget https://phar.phpunit.de/phpunit-6.4.phar; chmod +x phpunit-6.4.phar; mv phpunit-6.4.phar /usr/local/bin/phpunit

RUN rm -rf /var/lib/apt/lists/*

#
USER jenkins
