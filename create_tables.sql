CREATE DOMAIN Tipo_palabra TEXT
CHECK (VALUE IN ('sustantivo','adjetivo','determinante','adjetivo posesivo','pronombre','preposicion','verbo','conjuncion','adverbio','interjeccion'));

CREATE DOMAIN Genero TEXT
CHECK (VALUE IN ('masculino','femenino','neutro','general'));

CREATE DOMAIN Numero TEXT
CHECK (VALUE IN ('singular','plural'));

CREATE DOMAIN Genero_Numero TEXT
CHECK (VALUE IN ('masculino','femenino','neutro','plural'));

CREATE DOMAIN Persona TEXT
CHECK (VALUE IN ('primera','segunda','tercera'));

CREATE DOMAIN Tipo_pronombre TEXT
CHECK (VALUE IN ('personal','reflexivo','relativo'));

CREATE DOMAIN Tipo_conjuncion TEXT
CHECK (VALUE IN ('coordinante','subordinante'));

CREATE DOMAIN Tipo_verbo TEXT
CHECK (VALUE IN ('regular','irregular'));

CREATE DOMAIN auxiliar TEXT
CHECK (VALUE IN ('haben','sein'));

CREATE DOMAIN caso TEXT
CHECK (VALUE IN ('nominativo','acusativo','dativo','genitivo'));

CREATE DOMAIN tipo_determinante TEXT
CHECK (VALUE IN ('determinado','indeterminado','posesivo','negativo','ninguno'));

CREATE DOMAIN tiempo TEXT
CHECK (VALUE IN ('presente','preterito simple','preterito perfecto'));



CREATE TABLE Casillero (
	numero_casillero SERIAL PRIMARY KEY
);

CREATE TABLE Palabra (
	Aleman TEXT PRIMARY KEY,
	Imagen TEXT NULL,
	Espanyol TEXT NOT NULL,
	Tipo Tipo_palabra NOT NULL DEFAULT('sustantivo'),
	Pronunciacion TEXT NULL,
	Numero_casillero INTEGER DEFAULT (1) NOT NULL REFERENCES Casillero ON DELETE RESTRICT
);

CREATE TABLE Declinacion_adjetivo (
	Nombre_declinacion TEXT PRIMARY KEY
);

CREATE TABLE Sufijo_adjetivo (
	Genero_sustantivo Genero NULL,
	Tipo_articulo Tipo_determinante NULL,
	Caso Caso,
	Numero Numero,
	Terminacion TEXT NOT NULL,
	Nombre_declinacion TEXT REFERENCES Declinacion_adjetivo ON DELETE CASCADE,
	PRIMARY KEY (Genero_sustantivo, Tipo_articulo, Caso, Numero)
);

CREATE TABLE Determinante (
	Aleman TEXT PRIMARY KEY REFERENCES Palabra ON DELETE CASCADE,
	Tipo_determinante Tipo_determinante NOT NULL DEFAULT ('determinado'),
	Imagen TEXT NULL,
	Espanyol TEXT NOT NULL,
	Tipo Tipo_palabra NOT NULL DEFAULT('determinante'),
	Pronunciacion TEXT NULL
);

CREATE OR REPLACE FUNCTION herencia_palabra() RETURNS TRIGGER AS '
BEGIN
	INSERT INTO Palabra (Aleman,Imagen,Espanyol,Tipo,Pronunciacion,numero_casillero)
	VALUES (NEW.Aleman, NEW.Imagen, NEW.Espanyol, NEW.Tipo, NEW.Pronunciacion,DEFAULT);
	RETURN NEW;
END;' LANGUAGE 'plpgsql' WITH (isstrict);

CREATE TRIGGER trigger_herencia_determinante
BEFORE INSERT ON Determinante
FOR EACH ROW EXECUTE PROCEDURE herencia_palabra();


CREATE TABLE Adjetivo_posesivo (
	Aleman TEXT PRIMARY KEY REFERENCES Determinante ON DELETE CASCADE,
	Persona_poseedora Persona NULL,
	Genero_poseido Genero NULL,
	Numero_poseido Numero NULL,
	Tipo_determinante Tipo_determinante NOT NULL DEFAULT ('determinado'),
	Imagen TEXT NULL,
	Espanyol TEXT NOT NULL,
	Tipo Tipo_palabra NOT NULL DEFAULT('adjetivo posesivo'),
	Pronunciacion TEXT NULL
);

CREATE OR REPLACE FUNCTION herencia_determinante() RETURNS TRIGGER AS '
BEGIN
	INSERT INTO Determinante (Aleman,Tipo_determinante,Imagen,Espanyol,Tipo,Pronunciacion)
	VALUES (NEW.Aleman, NEW.Tipo_determinante,NEW.Imagen, NEW.Espanyol, NEW.Tipo, NEW.Pronunciacion);
	RETURN NEW;
END;' LANGUAGE 'plpgsql' WITH (isstrict);


CREATE TRIGGER herencia_adjetivo_posesivo
BEFORE INSERT ON Adjetivo_posesivo
FOR EACH ROW EXECUTE PROCEDURE herencia_determinante();


CREATE TABLE Declinacion_determinante (
	Caso Caso,
	Genero_numero Genero_numero,
	Palabra_declinada TEXT,
	PRIMARY KEY(Caso,Genero_numero,Palabra_declinada),
	Aleman TEXT NOT NULL REFERENCES Determinante
);

CREATE TABLE Declinacion_sustantivo (
	Nombre_declinacion TEXT	PRIMARY KEY
);

CREATE TABLE Sufijo_sustantivo (
	Caso Caso,
	Numero Numero,
	Terminacion TEXT,
	PRIMARY KEY (Caso, Numero, terminacion)
);



CREATE TABLE Sustantivo (
	Aleman TEXT PRIMARY KEY REFERENCES Palabra ON DELETE CASCADE,
	Raiz_singular TEXT NOT NULL,
	Raiz_plural TEXT NOT NULL,
	Genero Genero NOT NULL DEFAULT ('masculino'),
	Imagen TEXT NULL,
	Espanyol TEXT NOT NULL,
	Tipo Tipo_palabra NOT NULL DEFAULT('sustantivo'),
	Pronunciacion TEXT NULL,
	Nombre_declinacion TEXT REFERENCES Declinacion_sustantivo
);

CREATE TABLE R_sufijo_sustantivo_declinacion(
	Nombre_declinacion TEXT REFERENCES Declinacion_sustantivo,
	Caso Caso NOT NULL,
	Numero Numero NOT NULL,
	Terminacion TEXT,
	FOREIGN KEY (caso, numero,terminacion) REFERENCES sufijo_sustantivo,
	PRIMARY KEY (Nombre_declinacion, caso, numero,terminacion)
);


CREATE TRIGGER herencia_sustantivo
BEFORE INSERT ON Sustantivo
FOR EACH ROW EXECUTE PROCEDURE herencia_palabra();

CREATE TABLE Adjetivo (
	Aleman TEXT PRIMARY KEY REFERENCES Palabra ON DELETE CASCADE,
	Raiz TEXT NOT NULL,
	Genero_sustantivo Genero,
	Tipo_articulo Tipo_determinante,
	Imagen TEXT NULL,
	Espanyol TEXT NOT NULL,
	Tipo Tipo_palabra NOT NULL DEFAULT('adjetivo'),
	Pronunciacion TEXT NULL,
	Nombre_declinacion TEXT NULL REFERENCES Declinacion_adjetivo ON DELETE SET NULL
);

CREATE TRIGGER herencia_adjetivo
BEFORE INSERT ON Adjetivo
FOR EACH ROW EXECUTE PROCEDURE herencia_palabra();


CREATE TABLE Pronombre (
	Aleman TEXT PRIMARY KEY REFERENCES Palabra ON DELETE CASCADE,
	Caso Caso NOT NULL DEFAULT ('nominativo'),
	Persona Persona NULL,
	Genero Genero NULL,
	Numero Numero NULL,
	Tipo_pronombre Tipo_pronombre NOT NULL DEFAULT ('personal'),
	Imagen TEXT NULL,
	Espanyol TEXT NOT NULL,
	Tipo Tipo_palabra NOT NULL DEFAULT('pronombre'),
	Pronunciacion TEXT NULL

);

CREATE TRIGGER herencia_pronombre
BEFORE INSERT ON Pronombre
FOR EACH ROW EXECUTE PROCEDURE herencia_palabra();

CREATE TABLE Preposicion (
	Aleman TEXT PRIMARY KEY REFERENCES Palabra ON DELETE CASCADE,
	Caso Caso NOT NULL DEFAULT ('nominativo'),
	Imagen TEXT NULL,
	Espanyol TEXT NOT NULL,
	Tipo Tipo_palabra NOT NULL DEFAULT('preposicion'),
	Pronunciacion TEXT NULL

);

CREATE TRIGGER herencia_preposicion
BEFORE INSERT ON Preposicion
FOR EACH ROW EXECUTE PROCEDURE herencia_palabra();

CREATE TABLE Verbo (
	Aleman TEXT PRIMARY KEY REFERENCES Palabra ON DELETE CASCADE,
	Tipo_verbo Tipo_verbo NOT NULL DEFAULT ('regular'),
	Auxiliar Auxiliar NOT NULL DEFAULT ('haben'),
	Participio TEXT NOT NULL,
	Imagen TEXT NULL,
	Espanyol TEXT NOT NULL,
	Tipo Tipo_palabra NOT NULL DEFAULT('verbo'),
	Pronunciacion TEXT NULL
);

CREATE TRIGGER herencia_verbo
BEFORE INSERT ON Verbo
FOR EACH ROW EXECUTE PROCEDURE herencia_palabra();

CREATE TABLE Conjugacion_regular (
	Nombre_conjugacion TEXT PRIMARY KEY
);

CREATE OR REPLACE FUNCTION herencia_verbo() RETURNS TRIGGER AS '
BEGIN
	INSERT INTO Verbo (Aleman,Tipo_verbo,Auxiliar,Participio,Imagen,Espanyol,Tipo,Pronunciacion)
	VALUES (NEW.Aleman, NEW.Tipo_verbo, NEW.Auxiliar,NEW.Participio,NEW.Imagen, NEW.Espanyol, NEW.Tipo, NEW.Pronunciacion);
	RETURN NEW;
END;' LANGUAGE 'plpgsql' WITH (isstrict);

CREATE TABLE Verbo_regular(
	Aleman TEXT PRIMARY KEY REFERENCES Verbo ON DELETE CASCADE,
	Raiz TEXT NOT NULL,
	Tipo_verbo Tipo_verbo NOT NULL DEFAULT ('regular'),
	Auxiliar Auxiliar NOT NULL DEFAULT ('haben'),
	Participio TEXT NOT NULL,
	Imagen TEXT NULL,
	Espanyol TEXT NOT NULL,
	Tipo Tipo_palabra NOT NULL DEFAULT('verbo'),
	Pronunciacion TEXT NULL,
	Nombre_conjugacion TEXT NULL REFERENCES Conjugacion_regular ON DELETE SET NULL
);

CREATE TRIGGER herencia_verbo_regular
BEFORE INSERT ON Verbo_regular
FOR EACH ROW EXECUTE PROCEDURE herencia_verbo();

CREATE TABLE Verbo_irregular(
	Aleman TEXT PRIMARY KEY REFERENCES Verbo ON DELETE CASCADE,
	Tipo_verbo Tipo_verbo NOT NULL DEFAULT ('irregular'),
	Auxiliar Auxiliar NOT NULL DEFAULT ('haben'),
	Participio TEXT NOT NULL,
	Imagen TEXT NULL,
	Espanyol TEXT NOT NULL,
	Tipo Tipo_palabra NOT NULL DEFAULT('verbo'),
	Pronunciacion TEXT NULL
);

CREATE TRIGGER herencia_verbo_irregular
BEFORE INSERT ON Verbo_irregular
FOR EACH ROW EXECUTE PROCEDURE herencia_verbo();

CREATE TABLE Desinencia (
	Nombre_conjugacion TEXT REFERENCES Conjugacion_regular ON DELETE CASCADE,
	Persona Persona ,
	Numero Numero ,
	Tiempo Tiempo, 
	Terminacion TEXT,
	PRIMARY KEY (Persona, numero, tiempo,terminacion)
);

CREATE TABLE Conjugacion_irregular (
	Persona Persona,
	Numero Numero,
	Tiempo Tiempo,
	Palabra_conjugada TEXT,
	Aleman TEXT REFERENCES Verbo_irregular,
	PRIMARY KEY (Persona,Numero,Tiempo,Palabra_conjugada)
);


CREATE TABLE Conjuncion (
	Aleman TEXT PRIMARY KEY REFERENCES Palabra ON DELETE CASCADE,
	Tipo_conjuncion Tipo_conjuncion NOT NULL DEFAULT ('coordinante'),
	Imagen TEXT NULL,
	Espanyol TEXT NOT NULL,
	Tipo Tipo_palabra NOT NULL DEFAULT('conjuncion'),
	Pronunciacion TEXT NULL
);

CREATE TRIGGER herencia_conjuncion
BEFORE INSERT ON Conjuncion
FOR EACH ROW EXECUTE PROCEDURE herencia_palabra();

CREATE TABLE Adverbio (
	Aleman TEXT PRIMARY KEY REFERENCES Palabra ON DELETE CASCADE,
	Imagen TEXT NULL,
	Espanyol TEXT NOT NULL,
	Tipo Tipo_palabra NOT NULL DEFAULT('adverbio'),
	Pronunciacion TEXT NULL
);

CREATE TRIGGER herencia_adverbio
BEFORE INSERT ON Adverbio
FOR EACH ROW EXECUTE PROCEDURE herencia_palabra();

CREATE TABLE Interjeccion (
	Aleman TEXT PRIMARY KEY REFERENCES Palabra ON DELETE CASCADE,
	Imagen TEXT NULL,
	Espanyol TEXT NOT NULL,
	Tipo Tipo_palabra NOT NULL DEFAULT('interjeccion'),
	Pronunciacion TEXT NULL
);

CREATE TRIGGER herencia_interjeccion
BEFORE INSERT ON Interjeccion
FOR EACH ROW EXECUTE PROCEDURE herencia_palabra();
