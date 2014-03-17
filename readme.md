# VVV Site Bootstrap

Bootstrap a new site in [VVV](https://github.com/Varying-Vagrant-Vagrants/VVV) using [WP-CLI](http://wp-cli.org), PHP and MySQL.

To get started:

1. Clone this repo or download into the `www` directory of VVV as `www/sitename`
2. Do a find/replace for `sitename` and replace with the site slug text
3. Do a find/replace for `SITE_NAME` and replace with the full name of the site
4. Configure any site-specific options with `wp-cli` commands in  `vvv-init.sh`
5. If your Vagrant box is running, from the Vagrant directory run `vagrant halt`
6. Run `vagrant up --provision`

Visit http://sitename.dev (replace sitename with your site slug)

Note: This repo is setup with my personal username and email of choice. Make sure to change them before using for your own development.
