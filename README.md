# WordPressDocker

Repositorio que trae una configuración de docker para levantar WordPress, PhpMyAdmin y mysql 8.1. La configuración docker esta especificada dentro de la carpeta .docker y utilizando docker-compose.yml.

## Indice

1. [Requirimientos](#requirimientos) 
2. [Empezemos](#empezemos) 
3. Agregar extensiones php (pendiente)
4. ¿Como subir a producción? (pendiente)

## Requirimientos
* Pensado en personas que usan linux. (Si tienes windows algunos pasos pueden cambiar pero en esencia es lo mismo).
* [Tener instalado Docker](https://docs.docker.com/engine/install/)
* [Tener instalado git](https://git-scm.com/downloads)
* Tener instalado make
	+ Depende de la distribución linux, facil instalación.
	+ En windows se puede, pero es mas pasos la instalación.

## Empezemos

1. Inicializar el entorno 

```
git clone https://github.com/OscarDevCPP/WordPressDocker.git &&
cd WordPressDocker &&
mkdir config database &&
cp .docker/.env.dist .docker/.env
```
El anterior comando clona el repositorio y crea la carpeta config dentro del proyecto, tambien crea una copia de las variables de entorno donde se puede configurar el usuario, nombre de base de datos, etc.

2. Configurar variables de entorno
Configurar el archivo ./docker/.env el cual tiene el siguiente contenido. 
Personalice segun sus necesidades, pero el APP_PATH no lo modifque ya que todo se rompe.

```bash
# Peligro: No cambiar el valor de APP_PATH
APP_PATH=../

# Variables personalizables:

# App Settings
APP_NAME=store-dev

# Dev Database Settings
DB_DATABASE=wordpressdb
DB_USER=developer
DB_PASSWORD=dev@wordpress24
DB_ROOT_PASSWORD=dev@wordpress24
```
3. Construir el proyecto
```
make rebuild
```
Por detras no es mas que llamar a docker compose build (ver Makefile)

4. Ejecutar todo
```
make run params=-d
```
Por detras no es mas que llamar a docker compose up -d (ver Makefile)

5. Listo!!, ahora hacer click en cualquiera de los siguientes:

* [PhpMyAdmin](http://localhost:8081)
* [WordPress](http://localhost:8080)