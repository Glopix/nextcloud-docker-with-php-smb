The same Docker image (and configuration) from [Nextcloud:apache](https://hub.docker.com/_/nextcloud), but with the php-smb extension installed.  
This way Nextcloud's "External Storage Support" App can be used with SMB shares.

<br />

NEW: Added supervisord to run cron-jobs inside of the container (for Background jobs in Nextcloud) <br />
based on https://github.com/nextcloud/docker/tree/master/.examples/dockerfiles/cron/apache

<br />

Autobuilds/updates whenever the base Nextcloud image gets an update, thanks to [lucacome/docker-image-update-checker](https://github.com/lucacome/docker-image-update-checker)
