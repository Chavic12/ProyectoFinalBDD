DROP TABLE IF EXISTS spoken_languages;
DROP TABLE IF EXISTS production_countries;
DROP TABLE IF EXISTS production_companies;
DROP TABLE IF EXISTS worker;
DROP TABLE IF EXISTS credit;
DROP TABLE IF EXISTS movies_crew;
DROP TABLE IF EXISTS movies_production_companies;
DROP TABLE IF EXISTS movies_production_countries;
DROP TABLE IF EXISTS movies_spoken_languages;
DROP TABLE IF EXISTS movie;

-- Se hace una limpieza de datos, ya que el CSV que nos brindaron había unos caracteres especiales el cual no reconocía el IDE
-- También había un caso de la columna CREW, ya que existía JSON mal formados y por eso lo formateamos para que podamos extraer los JSON
DROP TABLE IF EXISTS movie_dataset_cleaned;
CREATE TABLE movie_dataset_cleaned AS
SELECT
	`index`, budget, genres, homepage, id, keywords, original_language, original_title, overview, popularity,
	 production_companies, production_countries, release_date, revenue, runtime, spoken_languages, `status`,
	 tagline, title, vote_average, vote_count,CONVERT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                            (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                                        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                                            REPLACE(REPLACE(cast,'\\u00e1','á'),'\\u00e5','å'),'\\u00e9','é'),
           '\\u00eb','ë'),'\\u00ed','í'),'\\u00e0','à'), '\\u00f1','ñ'),'\\u00f8','ø'),'\\u042','B'),
           '\\u0438','N'),'\\u044f','я'),'\\u0421','C'), '\\u043d','H'),'\\u0440','p'),'\\u0433','r'),
           '\\u044c','b'),'\\u067e','پ'),'\\u06cc','ی'), '\\u0645','م'),'\\u0627','ا'),'\\u0646','ن'),
           '\\u0646','ع'),'\\u062f','د'),'\\u00e8','è'), '\\u00f3','ó'),'\\u0160','Š'),'\\u0107','ć'),
           '\\u0107','ć'),'\\u00f6','ö'),'\\u00e4','ä'), '\\u00e4','ô'),'\\u00e4','ç'),'\\u0144','ń'),
           '\\u2019','’'),'\\u00fc','ü'),'\\u00c1','Á'), '\\u00ea','ê'),'\\u00ea','ê'),'\\u00e7','ç'),
           '\\u00dc','Ü'),'\\u0159','ř'),'\\u00d8','Ø'), '\\u00fa','ú'),'\\u010d','č'),'\\u010d','č'),
           '\\u00f0','ð'),'\\u0219','ș'),'\\u00d3','Ó'), '\\u0110','Đ'),'\\u0161','š'),'\\u0101','ā'),
           '\\u00c5','Å'),'\\u043b','л'),'\\u014c','Ō'), '\\u016b','ū'),'\\u014d','ō'),'\\u015b','ś'),
           '\\u00ef','ï'),'\\u021b','ț'),'\\u00c9b','ಛ'), '\\u00f4','ô'),'\\u0301','´'),'\\u00fb','û'),
           '\\u00fb','û'),'\\u1ed7','ỗ'),'\\u1ecb','ị'), '\\u1ea3','ả'),'\\u1ebf','ế'),'\\u015f','ş'),
           '\\u015ea','D'),'\\u017e','ž'),'\\u00c0','À'), '\\u0131','ı'),'\\u011f','ğ'),'\\u1ec1','ề'),
           '\\u0639','ع'),'\\u00ee','îع'),'\\u00e6','æ'), '\\u00c9','É'),'\\u00df','ß'),'\\u015ea','ᗪ')using utf8mb4) AS cast,
	CONVERT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	    (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	        (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	            REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE
	                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(crew,'\\\\', '\\'),
	        """", "'"),
	 		"', '", """, """),
	 		"': '", """: """),
	 		"': ", """: "),
	 		", '", ", """),
	 		"{'", "{"""), "\\t", ""),
	        '\\u00e9', 'é'),'\\u00e1', 'á'),'\\u00f1', 'ñ'),'\\u00c9', 'É'),
	        '\\u0159','ř'),'\\u00f4', 'ô'),'\\u00f3','ó'),'\\u00ed','í'),
            '\\u00d8','Ø'),'\\u00f8','ø'),'\\u00c5','Å'),'\\u00f6','ö'),
            '\\u0142','ɫ'),'\\u017','ž'),'\\u0161','š'),'\\u00e8','è'),
	        '\\u0144','ń'),'\\u00e7','ç'),'\\u00ef','ï'),'\\u0160','Š'),
	        '\\u00fc','ü'),'\\u00d3','Ó'),'\\u00fd','ý'),'\\u00cf','ï'),
            '\\u00e3','ã'),'\\u00ee','î'),'\\u00e2','â'),'\\u00e4','ä'),
            '\\u00e5','å'),'\\u00eb','ë'),'\\u00eb','ë'),'\\u00fa','ú'),
            '\\u00df','þ'),'\\u00f0','ð'),'\\u00c1','Á'),'\\u0107','ć'),
            '\\u015','𓍃'),'\\u0165','ť'),'\\u00ea','ê'),'\\u014c','Ō'),
            '\\u00c0','À'),'\\u2019','’'),'\\u00fb','û'),'\\u00e6','æ'),
            '\\u00fe','þ'),'\\u0141','Ł '),'\\u0411','Б'),'\\u043e','o'),
            '\\u0440','p'),'\\u0438','и'),'\\u0441','с'),'\\u0421','C'),
            '\\u0443','y'),'\\u0442','T'),'\\u0430','a'),'\\u0446','ц'),
            '\\u043a','k'),'\\u0439','й'),'\\u010d','č'),'\\u5f20','张 '),
            '\\u7acb','立'),'\\u00d6','Ö'),'\\u0441','с'),'\\u010c','Č'),
            '\\u00cd','Í'),'\\u00f5','õ'),'\\u00e0','à'),'\\u00f2','ò'),
            '\\u00d4','Ô'),'\\u011b','ě'),'\\u00de','Þ'),'\\u00ec','ì'),
            '\\u00da','Ú'),'\\u010e','Ď'),'\\u0433','r'),
	         """'", """"), "'""", """")using utf8mb4) AS Crew,
       CONVERT(REPLACE(REPLACE(REPLACE(REPLACE
	                (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(director,
           '\\u00e1','á'),'\\u00e4','ä'),'\\u00f3','ó'),
           '\\u00e9','é'),'\\u00d8','Ø'),'\\u00ed','í'),
           '\\u00e8','è'),'\\u00e7','ç'),'\\u00f4','ô'),
           '\\u0159','ř'),'\\u00f8','ø'),'\\u00c5','Å'),
           '\\u00f6','ö'),'\\u00e5','å'),'\\u00ef','ï'),
           '\\u00e6','æ'),'\\u00fb','û'),'\\u00c0','À'),
           '\\u00c1','Á'),'\\u00c9','É'),'\\u014c','Ō'),
           '\\u0161','š'),'\\u0142','ɫ'),'\\u0144','ń'),
           '\\u017','ž'),'\\u00f1','ñ')using utf8mb4) AS director
		FROM movie_dataset;

-- Se hace uso de un procedimiento para crear tablas temporales y extraer los JSON de las columnas de producion_countries
-- spoken_languages, crew, production_companies
-- Se aplica la primera forma normal(1FN) en donde todos los campos deben ser atómicos por el cual se extrae cada uno de
-- los JSON y creamos tablas temporales relacionales

DROP PROCEDURE IF EXISTS Jsons ;
DELIMITER //
CREATE PROCEDURE Jsons()
BEGIN
	DECLARE a INT Default 0 ;
	-- Creación de tablas temporales
	DROP TABLE IF EXISTS tmp_production_companies ;
	CREATE TABlE tmp_production_companies (id_movie INT, id_production_company INT, name_production_company VARCHAR (100) );
	DROP TABLE IF EXISTS tmp_production_countries ;
	CREATE TABlE tmp_production_countries (id_movie INT, iso_3166_1 VARCHAR (7), country VARCHAR (100) );
	DROP TABLE IF EXISTS tmp_spoken_languages;
	CREATE TABlE tmp_spoken_languages (id_movie INT, iso_639_1 VARCHAR (5), `language` VARCHAR (100) );
	DROP TABLE IF EXISTS tmp_crew ;
	CREATE TABlE tmp_crew(id_movie INT, id_crew INT, job VARCHAR (200), name VARCHAR (400), gender INT, credit_id VARCHAR (50), department VARCHAR (50) );
	DROP TABLE IF EXISTS tmp_genres;
	CREATE TABLE tmp_genres (id_movie INT,genre VARCHAR(100));
	DROP TABLE IF EXISTS tmp_cast;
	CREATE TABLE tmp_cast(id_movie INT, cast VARCHAR(100));
	DROP TABLE IF EXISTS tmp_movie_keyword;
	CREATE TABLE tmp_movie_keyword(id_movie INT, keyword VARCHAR(100));
  simple_loop: LOOP
        -- APLICACIÓN DE LA PRIMERA FORMA NORMAL
        -- Inserción de datos a las tablas temporales extrayéndolas de la columna production_companies el cual había un JSON
		INSERT INTO tmp_production_companies (id_movie, id_production_company, name_production_company)
		SELECT id as id_Movie,
			JSON_EXTRACT(CONVERT(production_companies using utf8mb4), CONCAT("$[",a,"].id")) AS id_production_company,
			JSON_EXTRACT(CONVERT(production_companies using utf8mb4), CONCAT("$[",a,"].name")) AS id_production_company
		FROM movie_dataset m ;
        -- Inserción de datos a las tablas temporales extrayéndolas de la columna production_countries el cual había un JSON
		INSERT INTO tmp_production_countries (id_movie, iso_3166_1, country)
		SELECT id,
			JSON_EXTRACT(production_countries, CONCAT('$[',a,'].iso_3166_1')) AS iso_3166_1,
			JSON_EXTRACT(production_countries , CONCAT('$[',a,'].name')) AS country
		FROM movie_dataset m ;
        -- Inserción de datos a las tablas temporales extrayéndolas de la columna production_countries el cual había un JSON
		INSERT INTO tmp_spoken_languages (id_movie, iso_639_1, `language`)
		SELECT id,
			JSON_EXTRACT(spoken_languages , CONCAT('$[',a,'].iso_639_1')) AS iso_639_1,
			JSON_EXTRACT(spoken_languages , CONCAT('$[',a,'].name')) AS language
		FROM movie_dataset m ;
		-- Inserción de datos a las tablas temporales extrayéndolas de la columna crew el cual había un JSON
		INSERT INTO tmp_crew (id_movie, id_crew, job, name, gender, credit_id, department)
		SELECT id as id_Movie,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].id")) AS id_crew,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].job")) AS job,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].name")) AS name,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].gender")) AS gender,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].credit_id")) AS credit_id,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].department")) AS department
		FROM movie_dataset_cleaned m;
		-- Inserción de datos a la tabla temporal movie_genre el cual era un campo multivaluado.
		INSERT INTO tmp_genres (id_movie, genre)
        SELECT * FROM (
			SELECT id as id_Movie,
				REPLACE(JSON_EXTRACT(CONCAT('["', REPLACE(REPLACE (genres, ' ', '","'), 'Science","Fiction', 'Science Fiction'), '"]'),
				    CONCAT("$[",a,"]")), """","") AS genre
			FROM movie_dataset_cleaned) t
        WHERE genre != "";
		-- Inserción de datos a la tabla temporal cast el cual era un campo multivaluado.
		INSERT INTO tmp_cast(id_movie, cast)
		SELECT id,
        REPLACE(JSON_EXTRACT(
		CONCAT ('["',
	   			IF(SpacesNumber >= 13, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ' ', -14), ' ', 2), '","'), '') ,
	   			IF(SpacesNumber >= 11, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ' ', -12), ' ', 2), '","'), '') ,
	   			IF(SpacesNumber >= 9, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ' ', -10), ' ', 2), '","'), '') ,
	   			IF(SpacesNumber >= 7, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ' ', -8), ' ', 2), '","'), '') ,
	   			IF(SpacesNumber >= 5, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ' ', -6), ' ', 2), '","'), '') ,
	   			IF(SpacesNumber >=3, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ' ', -4), ' ', 2), '","'), '') ,
        		IF(SpacesNumber >=1, CONCAT(SUBSTRING_INDEX(cast, ' ', -2), '"'), ''),
        ']'), CONCAT("$[",a,"]")),
        "=", "") AS CastJSon
		FROM (
		SELECT id, cast, LENGTH(cast) - LENGTH(REPLACE(cast, ' ', '')) AS SpacesNumber FROM (
		SELECT id,
		REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(cast, '"',''),' Jr.', '=Jr.'), ' Jr ', '=Jr '), '. ', '.='),
	    	' The ', ' The='), ' the ', ' the='), 'the=Cable Guy', 'the=Cable=Guy' ), 'Tupac Amaru Shakur', 'Tupac Amaru=Shakur')  AS cast
		FROM movie_dataset WHERE Cast <> '') t1) t2;
        -- Inserción de datos a la tabla temporal keyword el cual era un campo multivaluado.
		INSERT INTO tmp_movie_keyword
            SELECT id,
                REPLACE(JSON_EXTRACT(REPLACE(
                    CONCAT('["',
                        IF(SpacesNumber >= 13, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(keywords, ' ', -14), ' ', 2), '","'), '') ,
	   			        IF(SpacesNumber >= 11, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(keywords, ' ', -12), ' ', 2), '","'), '') ,
	   			        IF(SpacesNumber >= 9, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(keywords, ' ', -10), ' ', 2), '","'), '') ,
	   			        IF(SpacesNumber >= 7, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(keywords, ' ', -8), ' ', 2), '","'), '') ,
	   			        IF(SpacesNumber >= 5, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(keywords, ' ', -6), ' ', 2), '","'), '') ,
	   			        IF(SpacesNumber >=3, CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(keywords, ' ', -4), ' ', 2), '","'), '') ,
        		        IF(SpacesNumber >=1, CONCAT(SUBSTRING_INDEX(keywords, ' ', -2), '"'), ''),
                ']'),'["]','[]'), CONCAT("$[",a,"]")),
                "=", "") AS keywordJson
            FROM(
                Select id, keywords, LENGTH(keywords) - LENGTH(REPLACE(keywords, ' ', '')) AS SpacesNumber FROM (
                SELECT id,
                REPLACE(REPLACE(keywords, '"',''), 'marvel comic', 'marvel=comic') AS keywords
                FROM movie_dataset WHERE keywords <> '') t1) t2;
			SET a=a+1;
     	IF a=10 THEN
            LEAVE simple_loop;
      END IF;
   END LOOP simple_loop;
    DELETE FROM tmp_production_companies WHERE id_production_company IS NULL ;
	DELETE FROM tmp_production_countries WHERE iso_3166_1 IS NULL ;
	DELETE FROM tmp_spoken_languages WHERE iso_639_1 IS NULL ;
    DELETE FROM tmp_crew WHERE id_crew IS NULL ;
	DELETE FROM tmp_genres WHERE genre IS NULL;
	DELETE FROM tmp_cast WHERE cast is NULL;
	DELETE FROM tmp_movie_keyword WHERE keyword IS NULL;
END //
DELIMITER ;
Call Jsons();

-- CREACIÓN DE TABLAS

-- 1FN - Si cumple, ya que no tenemos campos multivaluados o compuestos.
-- 2FN - Si cumple, ya que no tenemos dependencias parciales
-- 3Fn - Si cumple, ya que no se tiene dependencia transitiva
-- En cada momento hay que verificar claves primarias:
-- PK(id)
CREATE TABLE movie AS
SELECT DISTINCT `index`, budget, homepage, id, original_language, original_title, overview, popularity, release_date, revenue, runtime, `status`,
	 tagline, title, vote_average, vote_count
FROM movie_dataset_cleaned ;
ALTER TABLE movie ADD PRIMARY KEY (id);

-- 1FN - Si cumple, ya que no tenemos campos multivaluados o compuestos.
-- 2FN - Si cumple, ya que no tenemos dependencias parciales
-- 3Fn - Si cumple, ya que no se tiene dependencia transitiva
-- En cada momento hay que verificar claves primarias:
-- PK(iso_639_1)

CREATE TABLE spoken_languages(
	iso_639_1 VARCHAR(5) NOT NULL,
	`language` VARCHAR(100),
	PRIMARY KEY(iso_639_1)
);

-- 1FN - Si cumple, ya que no tenemos campos multivaluados o compuestos.
-- 2FN - Si cumple, ya que no tenemos dependencias parciales
-- 3Fn - Si cumple, ya que no se tiene dependencia transitiva
-- En cada momento hay que verificar claves primarias:
-- PK(id_movie, genre)
-- FK(id_movie)
CREATE TABLE movie_genre(
    id_movie INT not null,
    genre VARCHAR(100),
    PRIMARY KEY (id_movie, genre),
    CONSTRAINT FK_id_movie5 FOREIGN KEY (id_movie) REFERENCES movie(id)

);

-- 1FN - Si cumple, ya que no tenemos campos multivaluados o compuestos.
-- 2FN - Si cumple, ya que no tenemos dependencias parciales
-- 3Fn - Si cumple, ya que no se tiene dependencia transitiva
-- En cada momento hay que verificar claves primarias:
-- PK(iso_3166_1)
CREATE TABLE production_countries(
	iso_3166_1 VARCHAR(5) NOT NULL,
	country VARCHAR (100),
	PRIMARY KEY(iso_3166_1)
);

-- 1FN - Si cumple, ya que no tenemos campos multivaluados o compuestos.
-- 2FN - Si cumple, ya que no tenemos dependencias parciales
-- 3Fn - Si cumple, ya que no se tiene dependencia transitiva
-- En cada momento hay que verificar claves primarias:
-- PK(id_production_company)
CREATE TABLE production_companies(
	id_production_company INT NOT NULL,
	name_production_company VARCHAR (100),
	PRIMARY KEY(id_production_company)
);

-- 1FN - Si cumple, ya que no tenemos campos multivaluados o compuestos.
-- 2FN - Si cumple, ya que no tenemos dependencias parciales
-- 3Fn - Si cumple, ya que no se tiene dependencia transitiva
-- En cada momento hay que verificar claves primarias:
-- PK(credit_id)
CREATE TABLE person(
	credit_id CHAR(100) NOT NULL,
	`name` VARCHAR(500),
	gender INT,
	PRIMARY KEY (credit_id)
);

-- 1FN - Si cumple, ya que no tenemos campos multivaluados o compuestos.
-- 2FN - Si cumple, ya que no tenemos dependencias parciales
-- 3Fn - Si cumple, ya que no se tiene dependencia transitiva
-- En cada momento hay que verificar claves primarias:
-- PK(id_Movie, id_production_company)
-- FK(id_Movie, id_production_company)
CREATE TABlE movie_production_companies (
	id_movie INT NOT NULL,
	id_production_company INT NOT NULL,
	PRIMARY KEY(id_Movie, id_production_company),
	CONSTRAINT FK_id_movie FOREIGN KEY(id_movie) REFERENCES movie(id),
	CONSTRAINT FK_id_production_company FOREIGN KEY(id_production_company) REFERENCES production_companies(id_production_company)
);

-- 1FN - Si cumple, ya que no tenemos campos multivaluados o compuestos.
-- 2FN - Si cumple, ya que no tenemos dependencias parciales
-- 3Fn - Si cumple, ya que no se tiene dependencia transitiva
-- En cada momento hay que verificar claves primarias:
-- PK(id_Movie, id_production_company)
-- FK(id_movie, iso_3166_1)
CREATE TABlE movie_production_countries (
	id_movie INT NOT NULL,
	iso_3166_1 VARCHAR (5) NOT NULL,
	PRIMARY KEY(id_movie, iso_3166_1),
	CONSTRAINT FK_id_movie2 FOREIGN KEY(id_movie) REFERENCES movie(id),
	CONSTRAINT FK_iso_3166_1 FOREIGN KEY(iso_3166_1) REFERENCES production_countries(iso_3166_1)
);

-- 1FN - Si cumple, ya que no tenemos campos multivaluados o compuestos.
-- 2FN - Si cumple, ya que no tenemos dependencias parciales
-- 3Fn - Si cumple, ya que no se tiene dependencia transitiva
-- En cada momento hay que verificar claves primarias:
-- PK(id_Movie, iso_639_1)
-- FK(id_movie, iso_639_1)
CREATE TABlE movie_spoken_languages (
	id_movie INT NOT NULL,
	iso_639_1 VARCHAR (5) NOT NULL,
	PRIMARY KEY(id_movie, iso_639_1),
	CONSTRAINT FK_id_movie3 FOREIGN KEY(id_movie) REFERENCES movie(id),
	CONSTRAINT FK_iso_639_1 FOREIGN KEY(iso_639_1) REFERENCES spoken_languages(iso_639_1)
);

-- 1FN - Si cumple, ya que no tenemos campos multivaluados o compuestos.
-- 2FN - Si cumple, ya que no tenemos dependencias parciales
-- 3Fn - Si cumple, ya que no se tiene dependencia transitiva
-- En cada momento hay que verificar claves primarias:
-- PK(id_movie, credit_id)
-- FK(id_movie, credit_id)
CREATE TABLE movie_crew (
	id_movie INT NOT NULL,
	credit_id CHAR(100) NOT NULL,
	id_crew INT,
	job VARCHAR(100),
	departament VARCHAR(100),
	PRIMARY KEY(id_movie, credit_id),
	CONSTRAINT FK_id_movie4 FOREIGN KEY (id_movie) REFERENCES movie(id),
	CONSTRAINT FK_credit_id FOREIGN KEY (credit_id) REFERENCES person(credit_id)
);

-- 1FN - Si cumple, ya que no tenemos campos multivaluados o compuestos.
-- 2FN - Si cumple, ya que no tenemos dependencias parciales
-- 3Fn - Si cumple, ya que no se tiene dependencia transitiva
-- En cada momento hay que verificar claves primarias:
-- PK(id_movie, keyword)
-- FK(id_movie)
CREATE TABLE movie_keyword(
    id_movie INT not null,
    keyword VARCHAR(100) NOT NULL ,
    PRIMARY KEY (id_movie, keyword),
    CONSTRAINT FK_id_movie6 FOREIGN KEY (id_movie) REFERENCES movie(id)
);

-- 1FN - Si cumple, ya que no tenemos campos multivaluados o compuestos.
-- 2FN - Si cumple, ya que no tenemos dependencias parciales
-- 3Fn - Si cumple, ya que no se tiene dependencia transitiva
-- En cada momento hay que verificar claves primarias:
-- PK(id_movie, cast)
-- FK(id_movie)
CREATE TABLE movie_cast(
    id_movie INT NOT NULL,
    cast VARCHAR(100),
    PRIMARY KEY (id_movie, cast),
    CONSTRAINT FK_id_movie7 FOREIGN KEY (id_movie) REFERENCES movie(id)
);

-- 1FN - Si cumple, ya que no tenemos campos multivaluados o compuestos.
-- 2FN - Si cumple, ya que no tenemos dependencias parciales
-- 3Fn - Si cumple, ya que no se tiene dependencia transitiva
-- En cada momento hay que verificar claves primarias:
-- PK(id_movie, credit_id)
-- FK(id_movie, credit_id)
CREATE TABLE movie_director(
    id_movie INTEGER NOT NULL,
	credit_id CHAR(100),
	PRIMARY KEY (id_movie, credit_id),
	CONSTRAINT FK_id_movie8 FOREIGN KEY (id_movie) REFERENCES movie(id),
	CONSTRAINT FK_credit_id2 FOREIGN KEY (credit_id) REFERENCES person(credit_id)
);

-- INSERCIÓN DE DATOS
-- De las tablas temporales que se creo en los procedimientos las utilizaremos para poblar a nuestro esquema de base de datos.
INSERT INTO production_countries(iso_3166_1, country)
SELECT DISTINCT iso_3166_1, country
FROM tmp_production_countries;

INSERT INTO movie_production_countries(id_movie, iso_3166_1)
SELECT DISTINCT id_movie, iso_3166_1
FROM tmp_production_countries;

INSERT INTO production_companies(id_production_company, name_production_company)
SELECT DISTINCT id_production_company, name_production_company
FROM tmp_production_companies;

INSERT INTO movie_production_companies(id_movie, id_production_company)
SELECT DISTINCT id_movie, id_production_company
FROM tmp_production_companies;

INSERT INTO spoken_languages(iso_639_1, `language`)
SELECT DISTINCT iso_639_1, `language`
FROM tmp_spoken_languages;

INSERT INTO movie_spoken_languages(id_movie, iso_639_1)
SELECT DISTINCT id_movie, iso_639_1
FROM tmp_spoken_languages;

INSERT INTO person(credit_id, name, gender)
SELECT DISTINCT credit_id, name, gender
FROM tmp_crew;

INSERT INTO movie_crew(id_movie, credit_id, id_crew, job, departament)
SELECT DISTINCT id_movie, credit_id, id_crew, job, department
FROM tmp_crew;

INSERT INTO movie_cast(id_movie, cast)
SELECT DISTINCT id_movie, cast
FROM tmp_cast;

INSERT INTO movie_genre(id_movie, genre)
SELECT DISTINCT id_movie, genre
FROM tmp_genres;

INSERT INTO movie_keyword(id_movie, keyword)
SELECT DISTINCT id_movie, keyword
FROM tmp_movie_keyword;

INSERT INTO movie_director(id_movie, credit_id)
SELECT DISTINCT m.id, c.credit_id
FROM movie_dataset m, person c
WHERE m.director = REPLACE(c.name, '"', '');


-- Se hace el borrado de las tablas temporales, ya que ya no se las necesita.
DROP TABLE IF EXISTS tmp_cast;
DROP TABLE IF EXISTS tmp_genres;
DROP TABLE IF EXISTS tmp_production_countries;
DROP TABLE IF EXISTS tmp_production_companies;
DROP TABLE IF EXISTS tmp_spoken_languages;
DROP TABLE IF EXISTS tmp_crew;
DROP TABLE IF EXISTS movie_dataset_cleaned;
DROP TABLE IF EXISTS tmp_spoken_languages;
DROP TABLE IF EXISTS tmp_movie_keyword;
DROP TABlE IF EXISTS movie_dataset_cleaned;