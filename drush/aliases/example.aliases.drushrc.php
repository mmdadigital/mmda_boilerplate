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
 'uri' => 'example.local',
 'root' => str_replace('drush/aliases', 'docroot', dirname(__FILE__)),
);

$aliases['dev'] = array(
  'uri' => 'dev.example.com',
  'root' => '/www/dev.example.com/docroot',
  'remote-host' => 'example.com',
  'remote-user' => 'user',
);

$aliases['stage'] = array(
  'uri' => 'stage.example.com',
  'root' => '/www/stage.example.com/docroot',
  'remote-host' => 'example.com',
  'remote-user' => 'user',
);

$aliases['live'] = array(
  'uri' => 'example.com',
  'root' => '/www/example.com/docroot',
  'remote-host' => 'example.com',
  'remote-user' => 'user',
);
