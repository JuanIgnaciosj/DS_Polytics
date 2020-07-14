Se generan dos archivos ETL:

ETLpolitics.cvs : Contiene los datos de la elecciones para realizar el análisis, considerando las columnas String: candidato, region_name, comuna_name.
Se consideran estas columnas, para poder relacionar el análisis referenciado directamente con la entidad relacionada.
Tiene los campos:
-comuna_datachile_id
-candidato_id
-votos_candidato
-electo
-year
-election_id
-candidato
-region_id
-region_name
-comuna_name


ETLpolitics_solo_id.cvs : Contiene los datos de las elecciones, pero sin campos String, solo contiene los ids respectivos de los candidatos, comunas y regiones .
Este ETL se usará en caso de que el primer ETL genere conflictos al procesar, eventualmente tiempos elevados de proceso, o algún conflicto con los nombres String.
Tiene los campos:
-comuna_datachile_id
-candidato_id
-votos_candidato
-electo
-year
-election_id
-region_id
