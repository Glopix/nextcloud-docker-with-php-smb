FROM nextcloud:apache

# install PHP-SMB-Client
RUN apt-get update && apt-get install -y smbclient cifs-utils libsmbclient-dev php-dev make --no-install-recommends
RUN pecl install smbclient
RUN docker-php-ext-enable smbclient

#install supervisor for cron-jobs
RUN apt-get install -y supervisor \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /var/log/supervisord /var/run/supervisord

COPY supervisord.conf /

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]
