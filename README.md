Proyecto: Naguarabit API

*Resumen Stack usado:
Mysql/MariaDB
Laravel
PHP 

Detalles del entorno desarrollo:
WAMPP Server:
Apache/2.4.41 (Win64) OpenSSL/1.1.1c PHP/7.4.0
Versión del cliente de base de datos: libmysql - mysqlnd 7.4.0
extensión PHP: mysqliDocumentación curlDocumentación mbstringDocumentación

PHP version: 7.4
Laravel version: 8.83.26
Database: 10.3.20-MariaDB - mariadb.org binary distribution
User: root@localhost


*Requerimientos:
PHP version: 7.4 o superior
Composer
Mysql


*Pasos para montar el aplicativo:

1. clonar repositorio:
https://github.com/gabdevpy/naguarabit_api

2. descargar y restaurar backup de base datos proporcionado via email:
carpeta bdbackup/production_naguarab_backend__2022-11-18_13-32-50

Otra opción es usar el archivo del repositorio:
database/backup/for_api_production_naguarab_backend_2022-11-18_13-32-50

3. modificar el archivo .env si hace falta ajustar parametros conexion bd acorde al servidor/entorno.
Ejemplo: C:\wamp64\www\naguarabit-backend\env
DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=new_naguarabit
DB_USERNAME=root
DB_PASSWORD=

4. ejecutar:
composer install
php artisan optimize:clear
php artisan migrate
php artisan jwt:secret
composer dump-autoload
php artisan serve


PROBAR EL API
El archivo route_list_api.txt contiene el listado de endpoints.
Las que expongo listas para pruebas son:
Bank: 5 endpoints
...TODO. agregar tomar de insomina

Country: 1 endpoint
...TODO. agregar tomar de insomina
