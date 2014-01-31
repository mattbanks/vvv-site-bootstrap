<?php

/**
 * Require WordPress
 */
require_once ( 'htdocs/wp-load.php' );
require_once ( 'htdocs/wp-admin/includes/upgrade.php' );
require_once ( 'htdocs/wp-includes/wp-db.php' );

/**
 * Define options and other site-specific code/features
 *
 * See Codex for list of options
 * http://codex.wordpress.org/Option_Reference
 */
update_option( 'blogdescription', '' );
update_option( 'start_of_week', 0 );
update_option( 'timezone_string', 'America/New_York' );
update_option( 'permalink_structure', '/%postname%/' );
