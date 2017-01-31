FROM library/debian
MAINTAINER jaume.v <holaemieza@xtec.cat>

RUN apt-get update && \
        apt-get install -y apache2  \
        php5 \
        libapache2-mod-php5 &&\

apt-get clean && apt-get autoclean && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /var/www/html/* && \

echo "<Directory /var/www>" >> /etc/apache2/sites-available/000-default.conf &$
echo "  AllowOverride All" >> /etc/apache2/sites-available/000-default.conf &&$
echo "  Options -Indexes +FollowSymLinks" >> /etc/apache2/sites-available/000-$
echo "</Directory>" >> /etc/apache2/sites-available/000-default.conf && \
sed -i "/<\/VirtualHost>/d" /etc/apache2/sites-available/000-default.conf && \
echo "</VirtualHost>" >> /etc/apache2/sites-available/000-default.conf


ADD run.sh /run.sh
ADD /var/www/html/index.html / /var/www/html/index.html
RUN chmod 755 /run.sh

EXPOSE 80

VOLUME ["/tmp/vol1"]

CMD ["/bin/bash","/run.sh"]
