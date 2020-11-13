#!/bin/bash

if grep "autoindex on" /etc/nginx/sites-available/mysite
then
	cp nginx_ai_off.conf /etc/nginx/sites-available/mysite; echo 'autoindex is off'
else
	cp nginx_ai_on.conf /etc/nginx/sites-available/mysite; echo 'autoindex is on'
fi
service nginx restart