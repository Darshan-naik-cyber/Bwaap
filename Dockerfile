# Use an official PHP image as a base image
FROM php:7.4-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Clone bWAPP from the GitHub repository
RUN apt-get update && \
    apt-get install -y git && \
    git clone https://github.com/lmoroz/bWAPP.git .

# Enable Apache modules and configure bWAPP
RUN a2enmod rewrite
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf
COPY config.inc.php /var/www/html/admin/config.inc.php

# Expose port 80
EXPOSE 80

# Start Apache when the container runs
CMD ["apache2-foreground"]

