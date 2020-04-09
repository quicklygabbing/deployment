# PHP Laravel Docker Compose

_Describes deployment process of PHP Laravel image with Nginx and PHP7.4-FPM._

External Address: 127.0.0.1:61080

Use $_SERVER['HTTP_HOST'] (as example with php_info() => $_SERVER['HTTP_HOST']=127.0.0.1:61080)

1. $ cd www
2. $ mkdir -p public
3. Copy to /public laravel project
4. Start docker: docker-compose up

