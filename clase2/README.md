# Clase 2

## Temas de esta clase:
-   Extensión PostGIS.
-   Tablas de PostGIS: sistemas de referencia y columnas geométricas.
-   Tipos de geometrías.
-   Normativas de Open Geospatial Consortium (OGC).
-   Migración de datos espaciales: desde Qgis y pgAdmin.
-   SQL: comandos de actualización. Insertar, modificar y eliminar datos de una tabla.
-   SQL espacial: consulta de datos espaciales: superficie, longitud, SRID, tipo de geometría, cantidad de vértices y distancias.

## Referencias:
A lo largo del documento encontraremos íconos y recuadros que requieren de
una especial atención de los lectores:

> **ACTIVIDADES:** son consignas de actividades para realizar la práctica con
Qgis y pgAdmin acompañando la lectura. En la presente clase hay 5
actividades para resolver.

> **¡IMPORTANTE!:** Indica una actividad que no debe omitirse para poder
desarrollar correctamente la práctica de la clase.

## 1 Extensión PostGIS
PostGIS es un módulo que se añade al motor de bases de datos Postgres para
crear bases de datos espaciales que pueden ser utilizadas para trabajar con SIG. Este módulo fue creado por la empresa Refraction Research de Canadá, y fue puesto a disposición de la comunidad bajo la licencia pública general de GNU.

En el mundo de las bases de datos existen varios productos similares a
PostGIS, como la extensión Spatial de Oracle, o la extensión geográfica de MySQL, pero PostGIS demostró una amplia superioridad en el manejo de datos espaciales.
Esto se comprueba al ver que la mayoría de los nuevos productos de SIG incluyen la conexión a PostGIS (ArcGIS).

Además del soporte de datos geométricos (también datos
geográficos), PostGIS también añade numerosas funciones relacionadas con el
manejo de los datos espaciales, como el cálculo de distancia, superficie, perímetro,
reproyección, relaciones topológicas y procedimientos más avanzados de análisis
espacial.

Se pueden explorar estas funciones dentro de la base de datos espaciales que
hemos creado en la clase anterior “curso”. Dentro del esquema “public” abrimos el ícono denominado Funciones, y vemos que se despliegan casi 700 objetos.

![Funciones](images/1_funciones.png)

Cada uno de ellos es una función relacionada con el manejo de datos espaciales. Más adelante veremos como aprovechar este tipo de recursos.


## 2 Tablas de PostGIS: sistemas de referencia y columnas geométricas

En la clase pasada vimos como crear la base de datos *“curso”* y como agregar la extensión *PostGIS* a esa base. Al momento de agregar *PostGIS* a nuestra base se creó en ella una tabla llamada *“spatial_ref_sys”* dentro del esquema *"public"*. 

![Sistema de referencias](images/2_spatial_ref.png)

La tabla **spatial_ref_sys** es un repositorio de los sistemas de referencia más
utilizados en los Sistemas de Información Geográfica. 

> En la clase 2 del curso de [Introducción a los SIG](#) vemos que en el mundo existen diversas formas de proyectar la superficie terrestre sobre un plano, y numerosos modelos matemáticos que representan la forma de la tierra, y que combinados con los sistemas geodésicos de cada región del planeta, dan como resultado infinidad de sistemas de referencia.

Recordemos también que existen instituciones que se erigieron como autoridades en la recopilación y codificación de estos sistemas de referencia, y que entre ellos una de las codificaciones más habituales es la impuesta por la EPSG, la Autoridad del Petróleo de Europa.

![Fajas](images/3_fajas.png)

En esta tabla encontraremos un primer campo *"srid"* de tipo auto numérico en donde cada valor es único, y por lo tanto sirve para identificar unívocamente a cada registro.
Luego, aparece *"auth_name"* almacena el nombre de la autoridad a la que corresponde la codificación del SRID. En los SRID que usaremos en este curso, la autoridad es siempre la EPSG.
A continuación el campo *“auth_srid”* que como ya vemos se corresponde con el número identificador único de los sistemas de referencia. 

Finalmente se presentan dos campos en donde se describen los parámetros
que definen a cada uno de los sistemas de referencia, pero escritos según dos normas
diferentes. Una de ellas corresponde a la librería de sistemas de proyecciones **PROJ4**, la más utilizada en los SIG.

![Proj](images/4_proj.png)

Es altamente recomendable utilizar los sistemas de referencias y sus
codificaciones más difundidos en el mundo de los SIG. Pero puede darse el caso en que necesitemos agregar un sistema de referencia que no fue incluido por Postgres, o bien un sistema de referencia completamente nuevo generado para un proyecto en particular. En estos dos casos, solo tenemos que agregar un nuevo registro a la tabla
*“spatial_ref_sys”* con un SRID que no esté siendo utilizado.
Por ejemplo, el Gobierno de la Ciudad Autónoma de Buenos Aires utiliza un
sistema de referencia con las siguientes características:
Sistema de Coordenadas y Proyección: Gauss Krugger Buenos Aires
Datum: Campo Inchauspe; Esferoide: Internacional 1924; Proyección: Transversa Mercator; Falso Este: 100000; Falso Norte: 100000; Meridiano Central: -58.4627;
Latitud de Origen: -34.6297166; Unidad: Metros; Factor De Escala: 0.999998.

Por otra parte, cuando agregamos tablas con datos geometricos, PostGIS nos agrega una vista llamada *“geometry_columns”* y otra *"geography_columns"* para datos geográficos.

![Vistas](images/6_vistas.png)

Una vista es una tabla virtual en Postgres. Representa el resultado de una consulta a una o más tablas. Las vistas se utilizan para simplificar consultas complejas. En la proxima clase nos detendremos en las vistas con mas detalle, por ahora asumamos que una vista es como una tabla y que podemos consultar información de la misma manera.


La vista *"geometry_columns"* es empleada como un registro de
todas las columnas de tipo geometría que existen en la base de datos. Esto es muy útil para que los clientes de la base de datos espaciales (como Qgis, un servidor de mapas o una aplicación de mapas navegables) accedan rápidamente a los datos geográficos sin explorar toda la base; y además conozcan las características de esos sin tener que analizarlos.

La vista está compuesta por una primera columna que contiene un identificador
único automático de tipo numérico para cada registro. Luego presenta la columna
*“f_table_schema”* en donde se registra el nombre del esquema de la base de datos en donde al que pertenece la tabla.

![Geometry Columns](images/5_gc.png)

Luego se registra el nombre de la tabla en *“f_table_name”*, y el nombre del
campo que contiene la geometría: *“f_geometry_column”*.
Hasta aquí vemos que con esos datos, por ejemplo un SIG de escritorio nos
podría traer sólo esas tablas para poder visualizarlas como capas, en lugar de traernos todas. A continuación vemos una imagen de Qgis.

![Qgis](images/7_qgis.png)

A continuación veremos el resto de los campos que registran algunas
características muy importantes de cada campo geométrico.

El campo *“srid”* almacena el número correspondiente con el sistema de
referencia en que se encuentran proyectados los datos. El campo *“coord_dimension”* es en
donde se figura si la geometría corresponde a una representación en 2 o 3
dimensiones. Finalmente, el campo *“type”* indica el tipo de geometría que
hay en ese campo. De este último hablaremos más adelante en esta misma clase.


Cabe aclarar que una misma tabla puede poseer más de un campo con
geometrías. Por ejemplo, puede ser que por economía de los recursos de
procesamiento, decidamos almacenar la capa de usos del suelo de la Provincia de
Santa Fe con el SRID 4326 (en geográficas) y también en 22185 (en faja 5). Para
tener estos dos datos, no hace falta crear dos tablas diferentes, sino una misma tabla
con dos campos geométrico. Veremos más adelante que se le puede agregar un
disparador para que la actualización de un dato en cualquiera de los dos campos
impacte en el otro.
En ese caso el registro en la tabla geometry_columns quedaría de esta manera:

![Otro Geom](images/8_geom2.png)


## 3 Tipos de geometría

![]()

![]()

![]()

![]()

![]()

![]()

![]()

