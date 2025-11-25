#!/bin/bash

# TODO: create script to edit both certbot and nginx
# netfirms.com

# add ssl certs here
sudo letsencrypt \
  -d esos.logiz.cloud \
  -d vaxilife.kinsenas.com \
  -d app.kinsenas.com \
  -d sms.mecomactan.com \
  -d bill.inquiry.mecomactan.com \
  -d bill.gcp.mecomactan.com \
  -d gmeco.eztechsoft.com \
  -d bill.meco.logiz.cloud \
  -d inquiry.mecomactan.com \
  --nginx
