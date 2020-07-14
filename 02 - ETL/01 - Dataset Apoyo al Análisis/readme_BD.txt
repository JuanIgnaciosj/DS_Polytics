Se generan dos archivos para añadir a la base de datos

Población_H_M_T_2013.xlsx: Contiene los datos correspondientes a la proyección de crecimiento demografico clasificado por comuna, sexo y edad. Esta base luego será indexada
a la V1 del ETL.
Contiene los campos:
- comuna_name
- hombres
- mujeres
- total.


Población_H_M_T_2013.xlsx : Contiene los datos correspondientes a las estadísticas oficiales demograficas correspondientes al Censo del año 2017. 
Este se encuentra clasificado por comuna, sexo y edad. Esta base luego será indexada a la V1 del ETL.
Contiene los campos:
- comuna_name
- hombres
- mujeres
- total.


Ambas bases de datos se encuentran estandarizadas, con un mismo formato para su posterior adaptacion para realizar analisis a partir de ellas.
Estas adaptaciones consisten en:
 - Eliminar población no votante (toda la población menor a 18 años)
 - Eliminar población mayor de 80 años. (Dado que ambas estadisticas no contabilizan los mismos rangos de edad).

Los Archivos originales se pueden encontrar en 04-datos originales > 06-Datos Población.
