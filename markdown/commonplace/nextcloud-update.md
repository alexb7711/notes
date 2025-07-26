- =ssh alex@192.168.86.43=
- =docker exec -it mariadb bash=
- =mariadb -p nextcloud= (=ab1qazxsw2!QAZXSW@=)

#+begin_src php
  'dbname' => 'nextcloud',
  'dbhost' => 'mariadb:3306',
  'dbuser' => 'nextcloud_user',
  'dbpassword' => 'ab1qazxsw2!QAZXSW@',
  'auth.bruteforce.protection.enabled' => false,
#+end_src


#+begin_src php
  version: '2'

services:

  - Network: mariadb
  - Link to mariadb in settings after creation of docker image

  nextcloud:
    container_name: nextcloud
    restart: unless-stopped
    image: nextcloud:latest
    ports:
      - 8082:80
    volumes:
      - /volume1/docker/nextcloud/apps:/var/www/html/apps
      - /volume1/docker/nextcloud/config:/var/www/html/config
      - /volume1/docker/nextcloud/data:/var/www/html/data
    depends_on:
      - mariadb

  mariadb:
    container_name: mariadb
    restart: unless-stopped
    image: mariadb
    environment:
      MYSQL_ROOT_PASSWORD: abab1qazxsw2!QAZXSW@
      MYSQL_DATABASE: nextcloud
      MYSQL_USER: nextcloud_user
      MYSQL_PASSWORD: ab1qazxsw2!QAZXSW@
    volumes:
      - /volume1/docker/mariadb:/var/lib/mysql
#+end_src

sudo docker exec --user www-data -it nextcloud php occ app:disable related_resources
sudo docker exec -it nextcloud php occ upgrade

sudo docker exec -u 1026 -it nextcloud php occ upgrade
sudo docker exec -it mariadb bash

* Reinstealling Nextcloud
database user: nextcloud_user
database password: ab1qazxsw2!QAZXSW@
database name: nextcloud
database host: mariadb

* Permissions
config: SYSTEM -> read & write
data: SYSTEM -> read & write
apps: users -> read & write
