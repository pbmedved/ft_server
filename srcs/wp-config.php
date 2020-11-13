<?php
define('DB_NAME', 'wp_db');
define('DB_USER', 'wpuser');
define('DB_PASSWORD', 'pass');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
define('AUTH_KEY',         'unic1');
define('SECURE_AUTH_KEY',  'unic2');
define('LOGGED_IN_KEY',    'unic3');
define('NONCE_KEY',        'unic4');
define('AUTH_SALT',        'unic5');
define('SECURE_AUTH_SALT', 'unic6');
define('LOGGED_IN_SALT',   'unic7');
define('NONCE_SALT',       'unic8');
$table_prefix  = 'wp_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');