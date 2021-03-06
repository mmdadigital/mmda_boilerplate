# Servo
This is a fork of [Servo ](https://github.com/Lullabot/servo), but with the addition modules  .

## Install Profile Instructions
```
$ cd docroot
$ drush make servo.make
```

Then install Drupal, selecting the "Servo" profile. This will give you

* Responsive toolbar
* Adminimal admin theme
* CKEditor with a HTML Purifier based filter and Linkit
* Basic "Page" content type
* The Aurora starter theme

-

#Drupal Boilerplate#
-

Drupal boilerplate is not a module. Instead it just serves as a directory structure for
starting a new drupal site. The idea behind Drupal boilerplate came from working on so many
different sites which each follow their own development practice, directory structure,
deployment guidelines, etc...

Drupal boilerplate tries to simplify starting a new site by having the most common
directory structures and files already included and set up.

##Getting started##
You can start by [downloading](https://github.com/Lullabot/drupal-boilerplate/zipball/master)
this project. Once you download it you will find that every folder contains a readme.md file.
This readme.md file has been extensively documented to explain what belongs
in that specific directory.

Here's a breakdown for what each directory/file is used for. If you want to know more please
read the readme inside the specific directory.

* [docroot](https://github.com/Lullabot/drupal-boilerplate/tree/master/docroot)
 * Where your drupal root should start.
* [drush](https://github.com/Lullabot/drupal-boilerplate/tree/master/drush)
 * Contains project specific drush commands, aliases, and configurations.
* [results](https://github.com/Lullabot/drupal-boilerplate/tree/master/results)
 * This directory is just used to export test results to. A good example of this
   is when running drush test-run with the --xml option. You can export the xml
   to this directory for parsing by external tools.
* [scripts](https://github.com/Lullabot/drupal-boilerplate/tree/master/scripts)
 * A directory for project-specific scripts.
* [tests](https://github.com/Lullabot/drupal-boilerplate/tree/master/tests)
 * A directory for external tests. This is great for non drupal specific tests
 such as selenium, qunit, casperjs.
* [.gitignore](https://github.com/Lullabot/drupal-boilerplate/blob/master/.gitignore)
 * Contains the a list of the most common excluded files.

Built by Robots&trade;
