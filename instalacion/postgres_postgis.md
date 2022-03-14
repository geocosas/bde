# Instructivo de instalación de PostgreSQL + PostGIS

## 1 - Descargar PostgreSQL

Al momento de escribir estas líneas, la versión mas reciente es PostgreSQL 14 y vamos a asumir PostGIS 3.1+ en adelante.

Descargar la versión acorde a su sistema (Windows, Linux, MacOS) desde el siguiente link [https://www.postgresql.org/download/](https://www.postgresql.org/download/)

## 2 - Ejecutar instalador

Para instalar el programa, en primer lugar hacemos doble clic sobre el
instalador descargado, y nos aparecerá la ventana de bienvenida, donde apretaremos
Siguiente.

![Instalando postgres](images/postgres/1_bienvenida_postgres.png)

Nos muestra donde se instalará el programa. Siguiente.

![Seleccionar ubicacion de instalacion](images/postgres/2_directorio_instalacion.png)

Nos muestra la ruta en donde se almacenarán los datos. Siguiente.

![Directorio de datos](images/postgres/3_directorio_datos.png)

Nos muestra los diferentes componentes que podemos agregar a la instalación.

Sugerimos seleccionar todos los componentes pero especialmente *Stack Builder* que nos facilitará la instalación de *PostGIS* (explicada unas líneas mas abajo).

![Seleccion de componentes](images/postgres/4_componentes.png)

Nos pide la contraseña del Super-Usuario de Postgres que es llamado
“postgres” y la misma contraseña para la cuenta de servicio de Windows que también
se denomina “postgres”.

En un primer momento, sugerimos colocar la palabra “postgres” como
contraseña. Es muy importante recordar siempre esta contraseña.

![Contraseña superusuario](images/postgres/4_password.png)

Nos muestra el puerto que se utilizará para acceder al motor de Postgres.

Mantenemos 5432.

![Configurando puerto](images/postgres/5_puerto.png)

En la Configuración Regional optamos por “Spanish, Argentina”.

![Configurando idioma](images/postgres/7_idioma.png)

El instalador nos muestra un resumen de la configuración utilizada para la instalación.

Cliqueamos Siguiente.

![Comenzar instalación](images/postgres/8_resumen.png)

El instalador nos avisa que está todo listo para iniciar la instalación.

Cliqueamos Siguiente.

![Comenzar instalación](images/postgres/9_instalar.png)

Aparecerá una barra de estado mostrando el avance de la instalación.

Esperamos hasta que se complete y nos de la posibilidad de seleccionar Siguiente.

![Barra de estado](images/postgres/10_estado.png)

### Stack builder

Una vez finalizada la instalación de PostgreSQL tenemos la opción de
lanzar la aplicación Stack Builder que nos ayudará a descargar e instalar las
herramientas adicionales. 
Activamos el checkbox y seleccionamos Terminar.

![Barra de estado](images/postgres/11_lanzar_stackbuilder.png)

## 3 - Instalar PostGIS utilizando el Stack builder

Una vez finalizada la instalación del motor de bases de datos, el mismo instalador
nos da la opción de lanzar la aplicación Stack Builder. Esta aplicación nos permite
seleccionar las herramientas adicionales de Postgres para descargarlas e instalarlas.

Se puede lanzar el Stack Builder a continuación de la instalación de Postgres, o
bien ejecutar Stack Builder desde Inicio, Todos los programas, PostgreSQL 14,
Aplication Stack Builder,
Stack Builder debe conectarse a Internet para poder descargar los instaladores.
En caso de no contar con conexión o permiso para acceder a Internet, será necesario
descargar los instaladores desde otra máquina y luego ejecutarlos

![lanzando stackbuilder](images/postgres/12_stackbuilder.png)

Luego, seleccionamos en Spatial Extensions la opción con la versión mas reciente de PostGIS 3.1+ for
PostgreSQL 14 y finalmente apretamos Next.

![seleccionar postgis](images/postgres/13_postgis.png)

La descarga empezará, y al finalizar nos aparecerá una ventana que nos
informa que podemos empezar la instalación. 

El checkbox de *Create spatial database* es opcional, si se selecciona esa opción se creará una base de datos con la extension de Postgis activada. Generalmente esta opción se deja deseleccionada y se agrega Postgis manualmente a la base de datos de nuestra preferencia utilizando la sentencia *CREATE EXTENSION postgis;*

Presionamos Next.

![seleccionar postgis](images/postgres/14_choose_components.png)

En Windows es probable que se muestren algunas ventanas de confirmación para finalizar la instalación de PostGIS:

![setear variable PROJ_LIB ](images/postgres/15_projlib.png)

Esto se debe a que para realizar operaciones que requieren transformaciones de ráster PostGIS utiliza los archivos epsj de GDAL.

![raster drivers ](images/postgres/16_raster_drivers.png)


Habilitar controladores para rasters. Seleccionando *Yes* se habilitarán los controladores mas comunes.

![raster drivers ](images/postgres/17_out_raster.png)

Para permitir el acceso a bandas ráster fuera de la base de datos



