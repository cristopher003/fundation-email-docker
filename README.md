# fundation-email-docker   :tw-1f40b: 

## Descripción :tw-1f4c4:

Este es un repositorio que suple la necesidad de ejecutar el poyecto [Email Templates](https://get.foundation/emails/email-templates.html) de [fundation emails](https://get.foundation/emails.html) en un ambiente dockerizado.

Este consta de  dos archivos, un Dockerfile y un docker-compose.yml.

## Instalaciones necesarias :tw-1f4e2:

 - [Docker](https://www.docker.com/)

## Dockerfile :tw-1f4c3:
este archivo es imagen base con la cual se construirá el contendor, este consta de las configuraciones mínimas necesarias para la ejecución del proyecto:

 - debian:12.1 slim
 - python3
 - nodejs

## Configuración :tw-1f527:

 - una vez descargado el proyecto, se debe crear una carpeta, de preferencia que se llame **tarjetones**, en esta carpeta se deberán clonar los n repositorios de tarjenotes que se necesiten.
 
 - clonado el repositorio necesario, editar los siguientes archivos:
 En el archivo **Dockerfile**  en las lineas:

    ` COPY  ./tarjetones/fnbr-tarjetones-2021/package.json  package-lock.json*  ./`
    `COPY  ./tarjetones/fnbr-tarjetones-2021  .`

	Como se dijo previamente, si la carpeta creada la nombró tarjetones, cambiar solo el nombre del proyecto que desea ejecutar, en este caso cambiar ***fnbr-tarjetones-2021*** por el nombre del proyecto que se necesita.
	
	En le archivo **docker-compose.yml** la línea:
	
    `./tarjetones/fnbr-tarjetones-2021/:/app`
   
   al igual que en el archivo anterior editar en la ruta la parte ***fnbr-tarjetones-2021*** por el nombre del proyecto necesario.


**dentro del proyecto de tarjetones clonado:**

dada la naturaleza del proyecto, babel no reconoce los eventos que se lanzan al editar las plantillas y recargarlas en el navegador, para que esto suceda se necesita agregar las siguientes lineas en el archivo **gulpfile.babel.js**:

    function  watch() {
    gulp.watch('src/pages/**/*.html', {interval:  1000, usePolling:  true}).on('all', gulp.series(pages, inline, browser.reload));
    gulp.watch(['src/layouts/**/*', 'src/partials/**/*'],{interval:  1000, usePolling:  true}).on('all', gulp.series(resetPages, pages, inline, browser.reload));
    gulp.watch(['../scss/**/*.scss', 'src/assets/scss/**/*.scss'],{interval:  1000, usePolling:  true}).on('all', gulp.series(resetPages, sass, pages, inline, browser.reload));
    }

*Puede comentar las que ya están por defecto y agregar estas.*

## Ejecución :tw-1f680:

para la ejecución del contenedor y levantar le proyecto puede ejecutar el siguiente comando:

    docker-compose up -d --build 

Esto levantará el contenedor con la aplicación de tarjetones correspondiente en la ruta http://localhost:3002/

## Compilación :tw-23e9: 

por defecto el proyecto que se levanta en el contendor se ejecuta con un npm start, dada la necesidad de los archivos compilados, puede compilarlo con el siguiente comando:

  primero asegúrese de conocer el nombre o el id del contenedor que está corriendo su proyecto con:

    docker ps
luego ejecute el comando dentro del contendor correspondiente:

    docker exec <container-id or name> <command>
    ejemplo:
    docker exec tarjetones-local-app-1 npm run build

Esto compilará el proyecto y generara la carpeta de **dist** correspondiente. Adicionalmente se ejecutara en la ruta http://localhost:3003/.


[========]

# foundation-email-docker :tw-1f40b:

## Description :tw-1f4c4:

This is a repository that meets the need to run the [Email Templates](https://get.foundation/emails/email-templates.html) project of [foundation emails](https://get.foundation/emails.html ) in a dockerized environment.

It consists of two files, a Dockerfile and a docker-compose.yml.

## Required installations :tw-1f4e2:

  - [Docker](https://www.docker.com/)

## Dockerfile :tw-1f4c3:
This file is the base image with which the container will be built, it consists of the minimum configurations necessary for the execution of the project:

  - debian:12.1 slim
  -python3
  -nodejs

## Configuration :tw-1f527:

  - once the project has been downloaded, a folder must be created, preferably called **cards**, in this folder the n card repositories needed should be cloned.
 
  - cloned the necessary repository, edit the following files:
  In the file **Dockerfile** in the lines:

     ` COPY ./tarjetones/fnbr-tarjetones-2021/package.json package-lock.json* ./`
     `COPY ./cards/fnbr-cards-2021 .`

As previously said, if the created folder was named cards, change only the name of the project you want to execute, in this case change ***fnbr-cards-2021*** for the name of the project that is needed.

In the **docker-compose.yml** file the line:

     `./cards/fnbr-cards-2021/:/app`
   
    As in the previous file, edit the part ***fnbr-tarjetones-2021*** in the path for the name of the necessary project.


**within the cloned flyer project:**

Given the nature of the project, babel does not recognize the events that are launched when editing the templates and reloading them in the browser, for this to happen you need to add the following lines in the **gulpfile.babel.js** file:

     function watch() {
     gulp.watch('src/pages/**/*.html', {interval: 1000, usePolling: true}).on('all', gulp.series(pages, inline, browser.reload));
     gulp.watch(['src/layouts/**/*', 'src/partials/**/*'],{interval: 1000, usePolling: true}).on('all', gulp.series(resetPages , pages, inline, browser.reload));
     gulp.watch(['../scss/**/*.scss', 'src/assets/scss/**/*.scss'],{interval: 1000, usePolling: true}).on('all ', gulp.series(resetPages, sass, pages, inline, browser.reload));
     }

*You can comment on the ones that are already default and add these.*

## Execution :tw-1f680:

To run the container and build the project you can execute the following command:

     docker-compose up -d --build

This will raise the container with the corresponding card application at the path http://localhost:3002/

## Build :tw-23e9:

By default, the project that is built in the container is executed with an npm start, given the need for the compiled files, you can compile it with the following command:

   first make sure you know the name or id of the container your project is running with:

     docker ps
then run the command inside the corresponding container:

     docker exec <container-id or name> <command>
     example:
     docker exec cards-local-app-1 npm run build

This will compile the project and generate the corresponding **dist** folder. Additionally, it will be executed in the route http://localhost:3003/.

 

