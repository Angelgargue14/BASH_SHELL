/home/despliegue/scripts_produccion/despliegue/listar_Procesos_desincronizados.sh
=================================
Guía de shell-script (bash) 
=================================

====================
¿Qué es un script?
====================

Es un archivo que contiene código escrito en determinado lenguaje de
programación que el sistema usa para determinada tarea. No es necesario que
tenga una entrada externa ni interfaz gráfica, pero sí que provoque una salida
de datos procesados (por más de que el usuario no los vea).

El lenguaje usado por Bash está definido por su propio intérprete y combina la
sintaxis de otros Shells, como el Korn Shell (ksh) o el C Shell (csh). Muchos de
los comandos que usualmente se usan en la consola también pueden usarse en los
scripts, salvo aquellos que pertenecen estrictamente a una distribución en
particular.

=======================
Estructura de un script
=======================

Para empezar debemos contar con un editor de texto, los archivos que guardamos
con extensión .sh podrán ser ejecutados (o interpretados) por la consola siempre
y cuando la primera línea sea la siguiente:

#!/bin/bash

Esto le dice al sistema que deberá usar la consola para ejecutar el archivo.
Además, el carácter

# Permite escribir comentarios.

echo // muestra un mensaje en pantalla, en este caso el típico "Hola Mundo". Si
lo guardamos y ejecutamos con la consola veremos el resultado.

Bash (y otros shells) permiten programar scripts --Bash (Bourne again shell) es
un programa informático cuya función consiste en interpretar órdenes.

Está basado en la shell de Unix.

Script o programa shell: Fichero de texto conteniendo comandos externos e
internos que se ejecutan línea por línea, el programa puede contener, además de
comandos variables, constructores lógicos (if...then, AND, OR, etc.) y lazos
(while, for, etc.) funciones comentarios.

======================
Ejecución de un script
======================

Los scripts deben empezar por el simbolo #! seguido del programa a usar para
interpretar el script:

#!/bin/bash // Script de bash
#!/bin/sh // Script de shell
#!/usr/bin/perl // Script de perl

#Ejemplo de programa en bash para imprimir valores de variables
#!/bin/bash
VAL=10
VAL2=20
echo $VAL
echo $VAL2

Guardamos el script, ejemplo: prueba.sh, no es necesario ponerle
la extensión ya que la cabecera del script especifíca que programa
lo interpretará

Ejecución:

sh prueba.sh // Ejecutar un programa con bash.

bash prueba.sh // Ejecutar un programa con bash.

./script.sh // Otra manera de ejecutar el script.

sh prueba // Ejecutar un programa con bash, script guardado sin extension.

===========
Comentarios
===========

#!/bin/bash
#Comentario de varias lineas
<<COMMENT1
comentario 1
comentario 2
comentario 3
echo -e "linea 1 \n"
echo "Linea 2"
COMMENT1

#!/bin/bash
#Comentario de varias lineas
: '
Solo para comentar cadenas, no variables ni expresiones ni condicionales.
'
============================
-------COMANDO TEST---------
============================

----------------------
Operadores numericas
----------------------
-eq igual que
-ne desigual que
-lt menor que
-le menor o igual
-gt mayor que
-ge mayor o igual
----------------------
------------------------
Operaciones con archivos
------------------------
-a la ruta existe en el sistema de archivos y es un archivo.
-b la ruta es un archivo de bloque especial
-c la ruta es un archivo de caracteres especiales
-d la ruta es un directorio o carpeta
-e la ruta existe en el sistema de archivos
-f la ruta existe y es un archivo regular
-g la ruta tiene el permiso del SGID
-h la ruta es un enlace simbólico
-L la ruta es un enlace simbólico (como -h)
-k la ruta tiene el permiso de sticky
-p la ruta es un archivo pipe
-r la ruta es legible por el usuario actual
-s la ruta existe y no está vacia
-S la ruta es un archivo socket
-t la ruta está abierta en un terminal
-u la ruta tiene el permiso SUID
-w la ruta es escribible por el usuario actual
-x la ruta es ejecutable por el usuario actual
-O la ruta es propiedad del usuario actual
-G la ruta pertenece al grupo del usuario actual
-N la ruta ha sido modificada desde la última vez que se accedió
"$VAR1" -nt "$VAR2" la ruta VAR1 es más nueva que la ruta VAR2, según sus fechas de modificación
"$VAR1" -ot "$VAR2" la ruta en el VAR1 es más antigua que la VAR2
"$VAR1" -ef "$VAR2" la expresión evalua a TRUE si $VAR1 es un enlace duro (hardlink) con VAR2

-------------------------
Operaciones con variables
-------------------------
-z "$TXT" Evalua si la cariable TXT está vacía (Tamaño cero)
-n "$TXT" o test "$TXT" Evalúa si la variable no está vacía
"$TXT1" = "$TXT2" O "$TXT1" == "$TXT2" Evalúa si son iguales
"$TXT1" != "$TXT2" Evalúa si la variable TXT1 y TXT2 no son iguales..
"$TXT1" < "$TXT2" Evalúa si TXT1 esta antes que TXT2, en orden alfabético.
"$TXT1" > "$TXT2" Evalúa si TXT1 esta después que TXT2, en orden alfabético.
[Se recomienda usar comillas dobles al usar variales en el comando test "$VAR1"]
-----------------------------------------------------------------------------------------------------


==============
Salto de línea
==============

#!/bin/bash
#Salto de línea
echo -e "linea 1 \n"
echo "Linea 2"

=========
Funciones
=========

#Llamado de una Funcion
#!/bin/bash
a='Estaba la pájara pinta'
function Imprimir {
    local a='sentada en un verde limón.'
    echo $a
}
echo $a
Imprimir
#echo $a

-----------------------

#Usando una funcion, y viendo el funcionamiento de variables locales y globales.
#!/bin/bash
HOLA=Hola_global	
function hola {
    local HOLA=Mundo_local
    echo $HOLA
}
echo $HOLA
hola
echo $HOLA

======================
Pedir datos al usuario
======================

#!/bin/bash
#Capturar dato del teclado y asignarlo a una variable usando la funcion read.
#Pedir el dato al usuario
echo 'Introduzca un valor para la variable var:'
#Capturar el dato del teclado y guardarlo en la variable var
read var
#Imprimir el valor de la variable var
echo 'El valor de la variable var es' $var

-----------------------

#!/bin/bash
#Pedir varios datos y luego mostrarlos, ejemplo de concatenación
echo 'Introduzca el día con doble dígito:'
read dia
echo 'Introduzca el mes con doble dígito:'
read mes
echo 'Introduzca el anio con 4 dígitos:'
read anio
echo 'la fecha completa es:' $dia'-'$mes'-'$anio

-----------------------

#!/bin/bash
#Pedir datos al usuario para cambiar la fecha manualmente
echo 'Introduzca el día con doble dígito:'
read dia
echo 'Introduzca el mes con doble dígito:'
read mes
echo 'Introduzca el anio con 4 dígitos:'
read anio
sudo date --set $anio-$mes-$dia

-----------------------

#!/bin/bash
#Pedir datos al usuario para cambiar la hora manualmente
echo 'Introduzca la hora con doble dígito:'
read hora
echo 'Introduzca el minuto con doble dígito:'
read minuto
sudo date --set $hora:$minuto:00

=======================
Operaciones aritmeticas
=======================

#!/bin/sh
#Operaciones aritmeticas
num1=10
num2=5
suma=$((num1+num2))
echo $suma

num1=10
num2=5
resta=$((num1-num2))
echo $resta

num1=10
num2=5
multiplicacion=$((num1*num2))
echo $multiplicacion

num1=10
num2=5
division=$((num1/num2))
echo $division

===============
     FIND
===============
comando que se utiliza para filtrar archivos en Linux, la sintaxis es:
--$ find <Ruta> <opciones> <terminos de busqueda>

ejemplo: --$ find /mnt/1pro/agent/ -not -iname "*~" -type f > Backup1PRO.log

- name busca archivos distinguiendo entre mayúsculas y minusculas
- iname no distingue entre mayúsculas y minúsculas.
- path buca nombres de directorios
- not complemento para hacer lo contrario, es decir -not -iname (Los que no sean como este nombre)
- type se pone al final para decir el tipo que estamos buscando -type -f (fichero) type -d (directorio)

--BUSQUEDA POR Fecha
  - tiempo de acceso(-atime) - Fecha más reciente en que el archivo fue leído o escrito
  - tiempo de modificacion (-mtime) - Fechas más reciente en que se modificó el archivo
  - Hora de cambio (-ctime) - Fecha más reciente en que se actualizaran los metadatos del archivo.
  - Encontrar el más reciente (-newer)
  --$find / -atime 1
  --$find / -mtime +2
  --$find / -ctime -2
  --$find / -mmin -10
  --$find / -newer my-file

--BUSQUEDA POR Tamaño
  --$ find <directorio> -size <tamaño> <unidad de tamaño>
  unidades de tamaño:
    c bytes
    k kilobytes
    M megabytes
    G gigabytes
    b trozos de 512 bytes
  --$ find / -size 10G
  --$ find / -size +10M

--BUSQUEDA POR PROPIEDADES
  find / -user angel
  find / group development

--BUSQUEDA POR PERMISOS
 --$ find / perm 644
 --$ find / -perm -644
 con el guión se mostrarán los que al menos tengan esos PERMISOS

==============
    LOCATE
==============
Locate lee una o más bases de datos preparadas por updatedb y escribe nombres de archivos que coincidan
con al menos uno de ellos, los patronos a la salida estándar.
--$ locate archivo
el comando locate se actualiza una vez al día con lo cual no te mostrará archivos que se acaban de crear,
pero sí archivos que se acaban de eliminar, su base de datos puede actualizarse manualmente usando:
--$sudo updatedb

-OPCIONES
 -r buscar por nombre exacto del archivo
 -c contar el número de archivos
 -i ignorar distinción entre mayúsculas y minúsculas
 -e mostrar archivos existentes
 -p desactiva los errores durante la búsqueda
 --$ locate my-file n 10: limitar el número de resultados de búsqueda

 --$ locate -r my_file$

===========
If and Else
===========

#!/bin/bash
#Pedir un dato y compararlo con el condicional
echo 'Introduzca un número:'
read count
if [ $count -eq 100 ]
then
  echo "Count is 100"
fi

----------------------

#!/bin/bash
#Pedir un dato y compararlo con varios condicionales
echo 'Introduzca un número:'
read cuenta
if [ $cuenta -eq 100 ]
then
  echo "cuenta es 100"
elif [ $cuenta -gt 100 ]
then
  echo "cuenta es mayor que 100"
else
  echo "cuenta es menor que 100"
fi

================
== and && and or
================

#!/bin/bash
#Comparación de cadenas con if y else
echo 'Introduzca el usuario:'
read usuario
if [ $usuario == "admin" ]
then
  echo "Bienvenido"
else
  echo "Usuario incorrecto"
fi

----------------------

#!/bin/bash
#Comparación de cadenas con if y else
echo 'User:'
read user
echo 'Password:'
read pass
if [ $user == "admin" ] && [ $pass == 123456 ]
then
  echo "Welcome"
else
  echo "User or pass incorrect"
fi

----------------------

#!/bin/bash
# Uso de or
#Comparación de cadenas con if y else
echo 'User:'
read user
if [ $user == "admin" ] || [ $user == "admin1" ]
then
  echo "Welcome"
else
  echo "User or pass incorrect"
fi

----------------------

#!/bin/sh
#Pedir la edad para probar las comparaciones
echo "Please enter your age:"
read AGE
if [ "$AGE" -lt 20 ] || [ "$AGE" -ge 50 ]; then
  echo "Sorry, you are out of the age range."
elif [ "$AGE" -ge 20 ] && [ "$AGE" -lt 30 ]; then
  echo "You are in your 20s"
elif [ "$AGE" -ge 30 ] && [ "$AGE" -lt 40 ]; then
  echo "You are in your 30s"
elif [ "$AGE" -ge 40 ] && [ "$AGE" -lt 50 ]; then
  echo "You are in your 40s"
fi

=====
Cases
=====

#!/bin/sh
#Pide un número y revisa si existe el caso
echo "Enter a number between 1 and 10. "
read NUM
case $NUM in
  1) echo "one" ;;
  2) echo "two" ;;
  3) echo "three" ;;
  4) echo "four" ;;
  5) echo "five" ;;
  6) echo "six" ;;
  7) echo "seven" ;;
  8) echo "eight" ;;
  9) echo "nine" ;;
  10) echo "ten" ;;
  *) echo "INVALID NUMBER!" ;;
esac

------------------------

#!/bin/sh
#Probando elección de los usuarios
echo "¿Desea realizar una suma o una resta?"
echo "1 = Suma"
echo -e "2 = Resta"
echo "Introduzca su opción:"
read var

case $var in
  1) echo "Sumando" ;;
  2) echo "Restando" ;;
  *) echo "INVALID NUMBER!" ;;
esac

#!/bin/sh
#Probando elección de los usuarios, y usando operaciones aritmeticas
echo "¿Desea realizar una suma o una resta?"
echo "1 = Suma"
echo "2 = Resta"
echo "3 = Multiplicación"
echo "4 = Division"
echo "Introduzca su opción:"
read var

case $var in
  1)
    num1=10
    num2=5
    suma=$((num1+num2))
    echo $suma
    ;;
  2)
    num1=10
    num2=5
    resta=$((num1-num2))
    echo $resta
    ;;
  3)
    num1=10
    num2=5
    multiplicacion=$((num1*num2))
    echo $multiplicacion
    ;;
  4)
    num1=10
    num2=5
    division=$((num1/num2))
    echo $division
    ;;
  *)
    echo "INVALID NUMBER!"
    ;;
esac

==============
Otros ejemplos
==============

#A Simple Bash Example
#!/bin/bash  
echo "This is a shell script"  
ls -lah
echo "I am done running ls"  
SOMEVAR='text stuff'
echo "$SOMEVAR"

----------------------

#Ejemplo de programa en bash para ejecutar aplicaciones instaladas en el SO.
#!/bin/bash
#val=10
val='##### Abriendo Meld #####'
echo $val
/usr/bin/meld

----------------------

#Ejemplo de programa en bash que crea un fichero en el directorio en que se ejecuta.
#!/bin/bash
touch FFF.txt

# Ejemplo de programa en bash que crea un fichero en un directorio específico.
#!/bin/bash
touch /home/aosorio/FFF.txt

------------------------

#Crear una carpeta, entrar en la carpeta y crear un fichero dentro.
#!/bin/bash
mkdir proyecto &&
cd proyecto &&
touch FFF.txt

------------------------

#Comprimir un directorio con un script de bash.
#!/bin/bash
DIRS="proyecto"
tar -cvf backup.tar $DIRS

----------------------

#Abrir un fichero específico con el editor gedit
#!/bin/bash
gedit /home/user/try.txt
 
----------------------

#!/bin/bash
#Cambiar la fecha y/u hora manualmente
echo -e '\n#####################################################'
echo '# Script para cambiar la fecha y/u hora manualmente #'
echo -e '#####################################################\n'
echo "1 = Fecha"
echo "2 = Hora"
echo -e "\nIntroduzca su opción:"
read var

case $var in
  1)
    #Pedir datos al usuario para cambiar la fecha manualmente
    echo 'Introduzca el día con doble dígito:'
    read dia
    echo 'Introduzca el mes con doble dígito:'
    read mes
    echo 'Introduzca el anio con 4 dígitos:'
    read anio
    #echo -e "La fecha y hora es:"
    sudo date --set $anio-$mes-$dia
    echo -e "\n¡Listo!\n"
    ;;
  2)
    #Pedir datos al usuario para cambiar la hora manualmente
    echo 'Introduzca la hora con doble dígito:'
    read hora
    echo 'Introduzca el minuto con doble dígito:'
    read minuto
    #echo -e "La fecha y hora es:"
    sudo date --set $hora:$minuto:00
    echo -e "\n¡Listo!\n"
    ;;
  *)
    echo "¡Opción inválida!"
    ;;
esac
============
BUCLES WHILE
============
PARA LEER FICHEROS LINEA A LINEA:
while read -r line
do
  echo "$line" #muestra linea a linea del fichero fichero.txt
done < fichero.txt
============
BUCLES FOR
============
for NUM in 1 1 2 3 5 8 13
do
echo -n "$NUM is "
if [ $(( $NUM % 2 )) -ne 0 ]
then
echo "odd."
else
echo "even."
fi
done

otro ejemplo:

for ((i=0; i<=10; i++))
do 
echo $i; 
done

=====================
        DIFF
=====================
Comando usado para comparar si dos archivos son iguales, es decir tienen el mismo contenido.

--$diff <opciones> archivo1 archivo2

----MEJORES OPCIONES
   -s: informa si los archivos son iguales o no, es decir, escribe estos ficheros son identicos o estos ficheros no lo son es muy util para rehusar luego con un grep
   -q: solo muestra los archivos que no son iguales
   -y: separa como en dos columnas para ver nosotros de un viztazo los cambios. muy util.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

=======================
---------SED----------
========================
Sed es una herramienta cuyo uso principal es buscar y reemplazar un texto.  En otras palabras, permite buscar cadenas de texto, palabras o patrones de palabras
y reemplazarlos por el texto que queramos.  También permite insertar y elminar texto de un documento:

SINTAXIS
----------------------------------------------------------------------------------------------------------------------------------------------------------------
--$ sed 's/texto_a_buscar/texto_a_reemplazar' <fichero_a_reemplazar >fichero_nuevo

- sed: Parte del comando que llama a Sed.
- ' ': dentro de las comillas se introduce el texto a buscar.
- / / /: Las barras inclinadas también se conocen como delimitadores.  Dentro del primer delimitador incluimos la cedena de texto a buscar y dentro del segundo
la cadena de texto que reemplaza a la que estamos buscando.
- 's/texto_a_buscar/texto_a_reemplazar/': s indica que queremos buscar y reemplazar. La parte del comando texto_a_buscar tiene que ser reemplazada una palabra,
letra, cadena de caracteres o expresión regular que defina las partes de texto que queremos reemplazar.  En texto_a_reemplazar tenemos que poner el texto que 
reemplazará el texto que queremos modificar.
- <fichero_a_reemplazar: es nombre del fichero en que se buscan las partes de texto a modificar.
- >fichero_nuevo: Es un nuevo fichero que se generará con el texto reemplazado.
----------------------------------------------------------------------------------------------------------------------------------------------------------------|
EJEMPLOS:
---------

--$ SED S 
Imaginemos que tenemos el siguiente texto en un fichero llamado sedexamples:
"Para que libreOffice..."

Queremos cambiar la letra O por la o, lo hacemos así:

--$ sed 's/O/o' <sedexamples >sedexamplesnew

y ahora sedexamplesnew contiene:
"Para que libreoffice..."

development@ESMADLX22PROC1DEV:~/spcrm/process/backoffice/afol$ echo "hola y adios" | sed "s/^.* //"
adios
development@ESMADLX22PROC1DEV:~/spcrm/process/backoffice/afol$ echo "hola y adios2" | sed "s/^.* adios//"
2
development@ESMADLX22PROC1DEV:~/spcrm/process/backoffice/afol$ echo "hola y adios2" | sed "s/adi.*$//"
hola y

----------------------------------------

====================
        Rsync
====================

El comando rsync de Linux tranfiere y sincroniza archivos o directorios de manera eficiente entre una máquina local, un servidor remoto o cualquiera de estos.

SINTAXIS
---------
rsync [optional modifiers] [SRC] [DEST]

[optional modifiers] - Acciones a realizar
[SRC] - Directorio de origen
[DEST] - Directorio o la máquina de destino

Ejemplo:
--$ rsync original/* duplicado/

COMANDOS MÁS COMUNES DE Rsync
-----------------------------
--$ rsync -a # Habilita el modo de archivos
--$ rsync -v # Brinda salida visual que muestra el progreso del proceso
--$ rsync -h # Genera formato legible para humanos
--$ rsync -z # Comprime los datos del archivo durante la transferencia
--$ rsync -r # copia los datos de forma recursiva es decir con subdirectorios --$rsync -r /original/ duplicado/ "Este comando también comprobará los subdirectorios
--$ rstbc -P # añadira una barra de progreso
--$ rsync --files-from=lista #hace el rsync de archivos de la lista que le pasas
----------------------------------------------------------------------------------------------------------------------------------------------------------------------


#!/bin/bash
<<COMMENT1
Script para descargar un archivo del servidor remoto con wget
en una ruta específicada, además pide el último octeto de la ip y
descomprime el archvivo descargado.
COMMENT1

#Pedir el último octeto de la ip
echo 'Último octeto de 192.168.0.?:'
read oct

# Navegar hasta la ruta donde se va a descargar el fichero.
cd /home/user/tmp/

# Descargar con wget el fichero.
wget -c 192.168.0.$oct/share/x.zip

# Descomprimir el archivo descarcago en la ruta especificada.
unzip /home/aosorio/tmp/x.zip

# Imprimir por pantalla que finalizó la descarga
echo -e '\n¡Descarga finalizada, el fichero fue descomprimido!\n'

-----

#!/bin/bash
# Ejemplo de como colorear los prints en bash.
# List colors
# No Color | 0m
# Black | 0;30
# Dark Gray | 1;30
# Red | 0;31
# Light Red | 1;31
# Green |0;32
# Light Green | 1;32
# Brown/Orange | 0;33
# Yellow | 1;33
# Blue | 0;34
# Light Blue | 1;34
# Purple | 0;35
# Light Purple | 1;35
# Cyan | 0;36
# Light Cyan | 1;36
# Light Gray | 0;37
# White | 1;37
NOCOLOR='\033[0m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
echo 'my text solo'
printf "${YELLOW}xxxx \n"
printf "${BLUE}yyyy \n"
printf "${RED}zzzz \n${NOCOLOR}"
printf "my text solo \n"

-----

#!/bin/bash
#Script para re generar una base de datos sqlite en Laravel.

rm -rf /home/aosorio/Proyectos/my_project/database/database.sqlite

echo "--- Eliminada la base de datos actual ---"

touch /home/aosorio/Proyectos/my_project/database/database.sqlite

echo "--- Creada la base de datos database.sqlite ---"

cd Proyectos/my_project &&

php artisan migrate

echo " --- Realizadas migraciones a la base de datos ---"

php artisan db:seed

echo "--- Guardados datos en la base de datos ---"

echo "--- Listo!!! ---"

====================
        sort
====================
--> El comando sort ordena las líneas de texto de forma útil. esta sencilla herramienta puede ayudarte a ordenar
rápidamente la información desde la línea de comandos.

sort [opciones] <archivo>

  -  Cuando se utiliza la ordenación sin ninguna opción, se aplican las reglas por defecto.  Es útil entender 
     las reglas por defecto para evitar resultados inesperados.
  -  Cuando se utiliza la ordenación, los datos originales están a salvo.  Los resultados de su entrada se muestran 
     sólo en la línea de comandos.  Sin embargo, puedes especificar la salida a un archivo separado si lo desea.
  -  Sort fue originalmente diseñado para ser usado con caracteres ASCII.  diferentes codificaciones, pueden producir 
     resultados inesperados.

------> REGLAS POR DEFECTO
  -  números > letras
  -  minúsculas > mayúsculas

------> EJEMPLOS ÚTILES
  - Ordenar alfabéticamente:
    --$ sort filename.txt
  - Ordenar por valor numérico:
    --$ sort numeros.txt -n
  - Orden inverso:
    --$ sort filename.txt -r
  - Ordenación aleatoria:
    --$ sort filename.txt -R
  - Ordenar por meses:
    --$ sort filename -M
  - Ordenar una columna específica:
    --$ sort filename.txt -k 2
  - Ordenar y eliminar duplicados_
    --$ sort filename.txt -u
  - Ignorar mayúsculas y minúsculas al ordenar
    --$ sort filename.txt -f

====================
        uniq
====================

comando que permite borrar o mostrar las líneas repetidas de un archivo o bien provenientes de la entrada estándar

 - Eliminar líneas repetidas
--$ uniq file.txt
 - Recuento del número de repeticiones
--$ uniq -c file.txt
 - Repetir solo las líneas repetidas
--$ uniq -D file.txt
 - Imprimir solo las líneas no repetidas
--$ uniq -u file.txt

Si las líneas repetidas no están juntas no lo coge, primero hay que ordenar el documento, para esto tenemos el siguiente
comando sort

