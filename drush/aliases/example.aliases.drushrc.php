<?php

/**
 * @file
 * Default drush aliases.drushrc.php file.
 */

/**
 * These are the default configuration so that
 * everyone can just overwrite the different settings.
 */

$aliases['local'] = array(
 'uri' => 'example.l',
 'root' => str_replace('drush/aliases', 'docroot', dirname(__FILE__)),
);

$aliases['dev'] = array(
  'uri' => 'dev.example.com',
  'root' => '/www/dev.example.com/docroot',
  'remote-host' => 'example.com',
  'remote-user' => 'user',
);

$aliases['test'] = array(
  'uri' => 'test.example.com',
  'root' => '/www/test.example.com/docroot',
  'remote-host' => 'example.com',
  'remote-user' => 'user',
);

$aliases['live'] = array(
  'uri' => 'example.com',
  'root' => '/www/example.com/docroot',
  'remote-host' => 'example.com',
  'remote-user' => 'user',
);
