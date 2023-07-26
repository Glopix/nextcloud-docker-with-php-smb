FROM nextcloud:apache

# install PHP-SMB-Client
RUN apt-get update && apt-get install -y php-smbclient --no-install-recommends
#RUN CGO_CFLAGS  := $(shell getconf LFS_CFLAGS)  && \
#    export CGO_CFLAGS  && \
#    pecl install smbclient && docker-php-ext-enable smbclient

#install supervisor for cron-jobs
RUN apt-get install -y supervisor \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /var/log/supervisord /var/run/supervisord

COPY supervisord.conf /

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]
