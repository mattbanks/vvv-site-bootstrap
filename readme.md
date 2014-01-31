# VVV Site Bootstrap

Bootstrap a new site in VVV using WP CLI and MySQL.

To get started:

1. Clone this repo or download into the `www` directory of VVV as `www/sitename`
2. Do a find/replace for `sitename` and replace with the site slug text
3. Do a find/replace for `SITE_NAME` and replace with the full name of the site
4. Configure any site-specific options or any PHP code to run after install in `wpsetup.php`
4. If your Vagrant box is running, from the Vagrant directory run `vagrant halt`
5. Run `vagrant up --provision`

Visit http://sitename.dev (replace sitename with your site slug)

Note: This repo is setup with my personal username and email of choice. Make sure to change them before using for your own development.
