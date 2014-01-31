# Init script for SITE_NAME

echo "Commencing SITE_NAME"

# Make a database, if we don't already have one
echo "Creating database (if it's not already there)"
mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS sitename"
mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON sitename.* TO wp@localhost IDENTIFIED BY 'wp';"

# Download WordPress
if [ ! -d htdocs ]
then
	echo "Installing WordPress using WP CLI"
	mkdir htdocs
	cd htdocs
	wp core download --allow-root
	wp core config --allow-root --dbname="sitename" --dbuser=wp --dbpass=wp --dbhost="localhost"
	wp core install --allow-root --url=sitename.dev --title="SITE_NAME" --admin_user=mattbanks --admin_password=password --admin_email=matt@kernelcreativemedia.com
	cd ..
fi

# The Vagrant site setup script will restart Nginx for us

echo "SITE_NAME site now installed";