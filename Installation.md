# Installation #

  1. copy all files from trunk/www to your document root
  1. copy configuration.php-dist to configuration.php and fill out appropriate details. (There is no configuration.php file. Usually when trying to run without this Joomla will try to find the installation folder attempting to do fresh install. So, just copy configuration.php-dist to configuration.php, then edit the file and fill in the settings (like hostname, db user/password/name, physical folder structure, etc))
  1. Create the following folders by hand. They are not added to source because the content of these folders are just temporary files that will vary from server to server:
    * www/cache
    * www/logs
    * www/tmp
  1. The www/administrator has not been added under source control as the folder is very large and nothing in that folder is changed from the original distribution. Hence it is recommended to download the original Joomla distribution and simply copy the www/administrator folder from there.

For database, please use the latest database dump found at the following location:

  * db/

Use the latest remote file. The naming format of this file is: bdnews24\_year.mo.da\_remote.sql. For example:

  * bdnews24\_2009.06.06\_remote.sql

In case the date is different, please use the one with the latest date.