FROM mysql:8.0.33

# Set environment variables for MySQL configuration
ENV MYSQL_ROOT_PASSWORD = "vprodbpass"
ENV MYSQL_DATABASE="accounts"


# add initialization scripts
ADD db_backup.sql docker-entrypoint-initdb.d/db_backup.sql

# Expose MySQL default port
EXPOSE 3306

# Use the default command from the MySQL image
CMD ["mysqld"]