#!/bin/bash

# TODO: create script to edit both certbot and nginx

# add ssl certs here
sudo letsencrypt \
  -d gmeco.eztechsoft.com \
  -d bill.meco.logiz.cloud \
  --nginx
