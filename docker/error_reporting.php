<?php
/**
 * Config file for the production container: log errors, do not show them to visitors.
 * Anax falls back to its development config (display everything) when this file is missing.
 * Deprecations are hidden: Anax 2.5 creates dynamic properties, which PHP 8.2+ reports.
 */
error_reporting(E_ALL & ~E_DEPRECATED);
ini_set('display_errors', 0);
ini_set('log_errors', 1);
