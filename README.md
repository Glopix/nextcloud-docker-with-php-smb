The same Docker image (and configuration) from [Nextcloud:apache](https://hub.docker.com/_/nextcloud), but with the php-smb extension installed.  
This way Nextcloud's "External Storage Support" App can be used with SMB shares.


Autobuilds/updates whenever the base Nextcloud image gets an update, thanks to [grandmaster/dockerhub-chainreactor](https://hub.docker.com/r/grandmaster/dockerhub-chainreactor)
