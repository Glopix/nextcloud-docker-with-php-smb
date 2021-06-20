FROM nextcloud:apache

RUN apt-get update && apt-get install -y libsmbclient-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN pecl install smbclient && docker-php-ext-enable smbclient
