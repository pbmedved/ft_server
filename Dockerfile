#/* ************************************************************************** */
#/*                                                                            */
#/*                                                        :::      ::::::::   */
#/*   Dockerfile                                         :+:      :+:    :+:   */
#/*                                                    +:+ +:+         +:+     */
#/*   By: iadrien <marvin@42.fr>                     +#+  +:+       +#+        */
#/*                                                +#+#+#+#+#+   +#+           */
#/*   Created: 2020/08/16 10:56:14 by iadrien           #+#    #+#             */
#/*   Updated: 2020/10/13 16:31:53 by iadrien          ###   ########.fr       */
#/*                                                                            */
#/* ************************************************************************** */

FROM debian:buster
MAINTAINER Boris Medvedev <iadrien@student.21-school.ru>

COPY srcs/nginx_ai_off.conf ./
COPY srcs/nginx_ai_on.conf ./
COPY srcs/config.inc.php ./
COPY srcs/wp-config.php ./
COPY srcs/new_db.sh ./
COPY srcs/start.sh ./
COPY srcs/ai_switch.sh ./

RUN apt update; apt upgrade
RUN apt install -y nginx sudo mariadb-server php-fpm php-mysql php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip wget libnss3-tools sudo nano


RUN mkdir -p /var/www/mysite/; mkdir -p /var/www/mysite/phpmyadmin
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz; mv wordpress/ /var/www/mysite/wordpress; rm latest.tar.gz
RUN cp wp-config.php /var/www/mysite/wordpress/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz
RUN tar -xzvf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/mysite/phpmyadmin
RUN cp config.inc.php /var/www/mysite/phpmyadmin/
RUN cp nginx_ai_on.conf /etc/nginx/sites-available/mysite

RUN ln -s /etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/

RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64;mv mkcert-v1.1.2-linux-amd64 mkcert; chmod +x mkcert; cp mkcert /usr/local/bin/
RUN mkcert -install; mkcert mysite www.mysite mysite 127.0.0.1 ::1; mkdir -p /root/mkcert; mv mysite+4.pem /root/mkcert/; mv mysite+4-key.pem /root/mkcert/;

RUN chown -R www-data:www-data /var/www/*; chmod -R 755 /var/www/*;
RUN bash ./new_db.sh
CMD ./start.sh



EXPOSE 80 443
