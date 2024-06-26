#!/bin/sh

sleep 10
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

# Créer le fichier de configuration wp-config.php
wp config create	--allow-root \
					--dbname=$db_name \
					--dbuser=$db_user \
					--dbpass=$db_pwd \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'

    # Installer WordPress
wp core install     --allow-root \
                    --url=$WP_URL \
                    --title="$WP_TITLE" \
                    --admin_user=$WP_ADMIN_USER \
                    --admin_password=$WP_ADMIN_PASSWORD \
                    --admin_email=$WP_ADMIN_EMAIL --path='/var/www/wordpress'

# Créer un utilisateur non administrateur
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

 # Créer un administrateur sans utiliser 'admin' ou 'administrator' dans le nom d'utilisateur
wp user create $WP_admin $WP_admin_email --role=administrator --user_pass=$WP_admin_pwd --allow-root

echo "WordPress has been set up with two users."
fi

if [ ! -d /run/php ]; then
    mkdir -p /run/php
fi
