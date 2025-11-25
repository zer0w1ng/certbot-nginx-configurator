#!/bin/bash

##################################
# CERTBOT_CREATE=test/certbot.sh
# NGINX_CONF=test/odoo17.conf

CERTBOT_CREATE=certbot.sh
NGINX_CONF=/etc/nginx/conf.d/odoo18.conf
#NGINX_CONF=/etc/nginx/sites-enabled/kinsenas17.conf

##################################

echo "NGINX CERTBOT CONFIGURATOR"
echo

if [[ $# -eq 0 ]] ; then
    echo 'Parameter: qualified.domain.name'
    exit 0
fi

# Tests
if [ "`ping -c 1 $1`" ]
then
    echo "Domain $1 is active."
else
    echo "Domain $1 not existing."
    exit 0
fi

# CERTBOT
DOMAIN_FOUND=$(grep -c $1 $CERTBOT_CREATE)
if [ $DOMAIN_FOUND -eq 0 ]
then
    echo "Adding domain $1 to certbot script..."
    ADD_CERT_LINE="\  -d $1 \\\\"
    sed -i "/sudo letsencrypt/a $ADD_CERT_LINE" $CERTBOT_CREATE
else
    echo "Domain existing in certbot script."
fi


# NGINX
DOMAIN_FOUND=$(grep -c $1 $NGINX_CONF)
echo
if [ $DOMAIN_FOUND -eq 0 ]
then
    echo "Adding domain $1 to nginx configuration..."
    sudo sed -i "/server_name/a \        $1" $NGINX_CONF
else
    echo "Domain existing in nginx configuration."
fi

# echo $ADD_CERT_LINE
# echo $DOMAIN_FOUND

