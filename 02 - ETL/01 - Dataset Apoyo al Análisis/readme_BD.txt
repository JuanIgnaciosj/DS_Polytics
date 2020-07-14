Se generan dos archivos para a�adir a la base de datos

Poblaci�n_H_M_T_2013.xlsx: Contiene los datos correspondientes a la proyecci�n de crecimiento demografico clasificado por comuna, sexo y edad. Esta base luego ser� indexada
a la V1 del ETL.
Contiene los campos:
- comuna_name
- hombres
- mujeres
- total.


Poblaci�n_H_M_T_2013.xlsx : Contiene los datos correspondientes a las estad�sticas oficiales demograficas correspondientes al Censo del a�o 2017. 
Este se encuentra clasificado por comuna, sexo y edad. Esta base luego ser� indexada a la V1 del ETL.
Contiene los campos:
- comuna_name
- hombres
- mujeres
- total.


Ambas bases de datos se encuentran estandarizadas, con un mismo formato para su posterior adaptacion para realizar analisis a partir de ellas.
Estas adaptaciones consisten en:
 - Eliminar poblaci�n no votante (toda la poblaci�n menor a 18 a�os)
 - Eliminar poblaci�n mayor de 80 a�os. (Dado que ambas estadisticas no contabilizan los mismos rangos de edad).

Los Archivos originales se pueden encontrar en 04-datos originales > 06-Datos Poblaci�n.
