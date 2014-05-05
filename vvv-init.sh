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
	wp core config --allow-root --quiet --dbname="sitename" --dbuser=wp --dbpass=wp --dbhost="localhost" <<PHP
define( 'WP_DEBUG', true );
PHP
	wp core install --allow-root --quiet --url=sitename.dev --title="SITE_NAME" --admin_user="mattbanks" --admin_password="password" --admin_email="matt@collectivthkg.com"

	# Update options
	wp option update --allow-root --quiet blogdescription ''
	wp option update --allow-root --quiet start_of_week 0
	wp option update --allow-root --quiet timezone_string 'America/New_York'
	wp option update --allow-root --quiet permalink_structure '/%postname%/'

	# Delete unneeded default themes and plugins
	wp theme delete --allow-root --quiet twentytwelve
	wp theme delete --allow-root --quiet twentythirteen
	wp plugin delete --allow-root --quiet hello

	# Get plugins
	wp plugin install wordpress-seo --activate
	wp plugin install google-analytics-for-wordpress --activate
	wp plugin install pods --activate

	# Clone WordPress Starter Theme
	cd wp-content/themes
	git clone git@github.com:mattbanks/WordPress-Starter-Theme.git sitename > /dev/null 2>&1
	cd sitename
	rm -rf .git README.md CHANGELOG.md CONTRIBUTING.md

	# Setup new git repo for theme
	git init > /dev/null 2>&1
	git add . > /dev/null 2>&1
	git commit . -m "initial commit" > /dev/null 2>&1

	# Install node/grunt packages
	npm install > /dev/null 2>&1

	# Run grunt sass to trigger style.css compilation
	grunt sass

	# Activate theme
	wp theme activate sitename

fi

# The Vagrant site setup script will restart Nginx for us

echo "SITE_NAME site now installed";
