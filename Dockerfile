FROM linuxconfig/lamp
MAINTAINER Lubos Rendek <web@linuxconfig.org>

# Install prerequisites
RUN apt-get update
RUN apt-get install -y wget unzip

# Download and unzip Concrete5 
RUN wget -O /tmp/kimai.zip https://github.com/kimai/kimai/releases/download/0.9.3/kimai_0.9.3.zip
RUN rm -fr /var/www/html/*
RUN unzip /tmp/kimai.zip  -d /var/www/html/


# Create database
RUN service mysql start; mysqladmin -uadmin -ppass create kimai

# Update file ownership
RUN chown -R www-data.www-data /var/www/html

# Allow ports
EXPOSE 80

CMD ["supervisord"]

