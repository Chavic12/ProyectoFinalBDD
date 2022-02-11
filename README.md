# ProyectoFinalBDD
Proyecto final base de datos
Universidad Técnica Particular de Loja
Ingeniería en Ciencias de la Computación
Materia: Fundamentos de Base de Datos - Octubre 2021 - Febrero 2022
Proyecto Final - Ciclo de vida de bases de datos relacionales normalizada
Estudiante: Xavier Alexander Chávez Saraguro | xachavez1@utpl.edu.ec
Link del proyecto en Github: 
https://github.com/XavierChavez916/ProyectoFinalBDD.git
Profesor: Nelson Piedra | http://investigacion.utpl.edu.ec/nopiedra
Fecha: Loja, 8 de febrero del 2022

## Explicación del proyecto:
Este proyecto fue elaborado por Xavier Chávez estudiante de tercer ciclo de la UTPL, con todos los conocimíentos adquiridos en la materia de Fundamentos de Bases de Datos, el objetivo principal de este trabajo es extraer todo los datos de un archivo CSV, que se nos entrego con una tabla universal de datos sobre movie_dataset (peliculas), aplicar el proceso de normalización, para luego subir lainformación referente a cada tabla con los datos del CSV. El presente trabajo se basa en el tipo de base de datos relacional debido a que es el más utilizado en la actualidad, el cual permite o da solución a problemas de base de datos utilizando un esquema basado en tablas, por medio del que nos resulta sencillo y fácil de comprender y utilizar para cualquier análisis o consulta de datos. Se desarrolla el estudio previo de la tabla universal del cual se procede a identificar cada dependencia funcional existente, y la determinación de cada campo, luego de esto se implementa la normalización en la tabla general siguiendo las tres primeras formas normales con el fin de eliminar redundancia en la información de los datos, optimizar almacenamiento del ordenador y eliminar dependencias funcionales que sean incoherentes, así para llegar a un único resultado, y proceder luego con el armado del esquema entidad – relación y modelo relacional. Una vez determinada cada campo, tabla, relación, normalización total es conveniente desarrollar la importación del CSV a MySQL en el gestor de base de datos en el que se está trabajando(DataGrip), y proseguir con la creación del DDL, DML y carga de datos.

## Datos de la cuenta github donde está cargada la data:
Usario de github: xavierchavez916

## Descripción de los diferentes archivos cargados

** Descripción de los archivos cargados al repositorio:
** ProyectoFinalBDD.pptx:
En este archivo se encuentra las diapositivas con nuestro modelo entidad-relación y con todo el proceso de normalización aplicando a la tabla universal propuesta para sacar una Base de Datos persistente. Y también de como fue la creación de tablas y la inserción de datos.

** ProyectoIntegrador.sql:
En este archivo está el código completo para realizar la creación de las tablas luego de haber aplicado el proceso de normaliación, también está la inserción, limpieza y correción de datos.
En el script practicamente está listo para ejecutar partiendo en que ya se cargo la tabla universal que contiene los datos del CSV, con este script ya se crearia todas las tablas de nuestro modelo al cual se llego con la normalización.