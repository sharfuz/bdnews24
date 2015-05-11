# How to Reset the Admin Password #

You may want to reset the admin password under 2 scenarios:

  * you have freshly installed Joomla from the source tree and your admin password should be different from the developers
  * you forgot your admin password and need to reset it

You need an md5 tool to generate the hashed password. For unix this should be built-in. For windows try:  http://www.fourmilab.ch/md5/

Read the documentation and generate your md5 password hash. For example, the password 'secret' in md5 hash would be '5ebe2294ecd0e0f08eab7690d2a6ee69' (without the quotes).

From the phpmyadmin web interface choose your database and follow the steps below:

  1. browse the table named jos\_users
  1. select the record ID 62 (in almost all Joomla installs) - in other words select the record where username=admin or any other username that you would like the password to be reset
  1. replace the field value for password with the md5 generated password hash that you created above


That's it. Now you should be able to login as admin with your new username / password.