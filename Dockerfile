FROM nextcloud:apache

# install PHP-SMB-Client
RUN apt-get update && apt-get install -y smbclient libsmbclient-dev --no-install-recommends
RUN ln -s "/usr/include/$(dpkg-architecture --query DEB_BUILD_MULTIARCH)/gmp.h" /usr/include/gmp.h \
    && pecl install smbclient
RUN docker-php-ext-enable smbclient

#install supervisor for cron-jobs
RUN apt-get install -y supervisor \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /var/log/supervisord /var/run/supervisord

COPY supervisord.conf /

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]
