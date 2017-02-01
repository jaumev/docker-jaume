FROM library/debian
MAINTAINER jaume.v <holaemieza@xtec.cat>

RUN apt-get update && \
        apt-get install -y apache2  &&\

apt-get clean && apt-get autoclean && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /var/www/html/* && \

echo "<Directory /var/www>" >> /etc/apache2/sites-available/000-d$
echo "  AllowOverride All" >> /etc/apache2/sites-available/000-de$
echo "  Options -Indexes +FollowSymLinks" >> /etc/apache2/sites-a$
echo "</Directory>" >> /etc/apache2/sites-available/000-default.c$
sed -i "/<\/VirtualHost>/d" /etc/apache2/sites-available/000-defa$
echo "</VirtualHost>" >> /etc/apache2/sites-available/000-default$


ADD index.html  /var/www/html/

EXPOSE 80

VOLUME ["/tmp/vol1"]
CMD ["apachectl","-D","FOREGROUND"]
