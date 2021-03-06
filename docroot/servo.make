core = 7.x
api = 2

defaults[projects][subdir] = "contrib"

projects[] = drupal

; Modules
projects[] = ctools
projects[] = entity
projects[] = htmlpurifier
projects[] = libraries
projects[] = views
projects[] = jquery_update
projects[] = magic
projects[] = navbar
projects[] = ckeditor
projects[] = linkit

; Themes
projects[] = adminimal_theme
projects[] = aurora

# projects[windup][type] = theme
# projects[windup][download][type] = git
# projects[windup][download][url] = git://github.com/Lullabot/windup

; Libraries
libraries[backbone][download][type] = "get"
libraries[backbone][download][url] = "https://github.com/jashkenas/backbone/archive/1.0.0.tar.gz"
libraries[backbone][directory_name] = "backbone"
libraries[backbone][type] = "library"

libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://ckeditor.com/builder/download/59e42ded39d15435b1cfe6f296422af6"
libraries[ckeditor][directory_name] = "ckeditor"
libraries[ckeditor][type] = "library"

libraries[htmlpurifier][download][type] = "get"
libraries[htmlpurifier][download][url] = "http://htmlpurifier.org/releases/htmlpurifier-4.6.0.tar.gz"
libraries[htmlpurifier][directory_name] = "htmlpurifier"
libraries[htmlpurifier][type] = "library"

libraries[modernizr][download][type] = "get"
libraries[modernizr][download][url] = "https://github.com/Modernizr/Modernizr/archive/v2.8.3.tar.gz"
libraries[modernizr][directory_name] = "modernizr"
libraries[modernizr][type] = "library"

libraries[underscore][download][type] = "get"
libraries[underscore][download][url] = "https://github.com/jashkenas/underscore/archive/1.7.0.tar.gz"
libraries[underscore][directory_name] = "underscore"
libraries[underscore][type] = "library"

