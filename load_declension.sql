/* Declinaciones */
INSERT INTO Declinacion_sustantivo VALUES('primera');
INSERT INTO Declinacion_sustantivo VALUES('segunda');
INSERT INTO Declinacion_sustantivo VALUES('tercera');
INSERT INTO Declinacion_sustantivo VALUES('cuarta');
INSERT INTO Declinacion_sustantivo VALUES('quinta');
INSERT INTO Declinacion_sustantivo VALUES('sexta');
INSERT INTO Declinacion_sustantivo VALUES('septima');

/* Sufijos */
INSERT INTO sufijo_sustantivo VALUES('nominativo','singular','');
INSERT INTO sufijo_sustantivo VALUES('acusativo','singular','');
INSERT INTO sufijo_sustantivo VALUES('dativo','singular','');
INSERT INTO sufijo_sustantivo VALUES('genitivo','singular','');
INSERT INTO sufijo_sustantivo VALUES('nominativo','plural','');
INSERT INTO sufijo_sustantivo VALUES('acusativo','plural','');
INSERT INTO sufijo_sustantivo VALUES('dativo','plural','');
INSERT INTO sufijo_sustantivo VALUES('genitivo','plural','');

INSERT INTO sufijo_sustantivo VALUES('dativo','singular','se');
INSERT INTO sufijo_sustantivo VALUES('genitivo','singular','ses');
INSERT INTO sufijo_sustantivo VALUES('nominativo','plural','se');
INSERT INTO sufijo_sustantivo VALUES('acusativo','plural','se');
INSERT INTO sufijo_sustantivo VALUES('dativo','plural','sen');
INSERT INTO sufijo_sustantivo VALUES('genitivo','plural','se');

INSERT INTO sufijo_sustantivo VALUES('acusativo','singular','en');
INSERT INTO sufijo_sustantivo VALUES('dativo','singular','en');
INSERT INTO sufijo_sustantivo VALUES('genitivo','singular','en');
INSERT INTO sufijo_sustantivo VALUES('nominativo','plural','en');
INSERT INTO sufijo_sustantivo VALUES('acusativo','plural','en');
INSERT INTO sufijo_sustantivo VALUES('dativo','plural','en');
INSERT INTO sufijo_sustantivo VALUES('genitivo','plural','en');

INSERT INTO sufijo_sustantivo VALUES('genitivo','singular','s');
INSERT INTO sufijo_sustantivo VALUES('nominativo','plural','s');
INSERT INTO sufijo_sustantivo VALUES('acusativo','plural','s');
INSERT INTO sufijo_sustantivo VALUES('dativo','plural','s');
INSERT INTO sufijo_sustantivo VALUES('genitivo','plural','s');

INSERT INTO sufijo_sustantivo VALUES('dativo','singular','e');
INSERT INTO sufijo_sustantivo VALUES('genitivo','singular','es');
INSERT INTO sufijo_sustantivo VALUES('nominativo','plural','e');
INSERT INTO sufijo_sustantivo VALUES('acusativo','plural','e');
INSERT INTO sufijo_sustantivo VALUES('genitivo','plural','e');

INSERT INTO sufijo_sustantivo VALUES('dativo','plural','n');


/* Declinacion_sustantivo 'primera': -/en. Sustantivos femeninos con n en el plural. La palabra no se modifica. Ejemplo: Blume */
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('primera','nominativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('primera','acusativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('primera','dativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('primera','genitivo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('primera','nominativo','plural','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('primera','acusativo','plural','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('primera','dativo','plural','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('primera','genitivo','plural','');

/* R_sufijo_sustantivo_declinacion 'segunda': (e)s/e, doblando ese. Sustantivos que acaban en s. Ejemplo: Bus */
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('segunda','nominativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('segunda','acusativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('segunda','dativo','singular','se');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('segunda','genitivo','singular','ses');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('segunda','nominativo','plural','se');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('segunda','acusativo','plural','se');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('segunda','dativo','plural','sen');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('segunda','genitivo','plural','se');

/* R_sufijo_sustantivo_declinacion 'tercera': en/en. Ejemplo: Herr */
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('tercera','nominativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('tercera','acusativo','singular','en');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('tercera','dativo','singular','en');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('tercera','genitivo','singular','en');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('tercera','nominativo','plural','en');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('tercera','acusativo','plural','en');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('tercera','dativo','plural','en');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('tercera','genitivo','plural','en');

/* R_sufijo_sustantivo_declinacion 'cuarta': s/s. Ejemplo: Hotel */
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('cuarta','nominativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('cuarta','acusativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('cuarta','dativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('cuarta','genitivo','singular','s');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('cuarta','nominativo','plural','s');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('cuarta','acusativo','plural','s');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('cuarta','dativo','plural','s');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('cuarta','genitivo','plural','s');

/* R_sufijo_sustantivo_declinacion 'quinta': (e)s/e. Ejemplo: Saft */
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('quinta','nominativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('quinta','acusativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('quinta','dativo','singular','e');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('quinta','genitivo','singular','es');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('quinta','nominativo','plural','e');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('quinta','acusativo','plural','e');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('quinta','dativo','plural','en');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('quinta','genitivo','plural','e');

/* R_sufijo_sustantivo_declinacion 'sexta'. Ejemplo: Telefon*/ 
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('sexta','nominativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('sexta','acusativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('sexta','dativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('sexta','genitivo','singular','s');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('sexta','nominativo','plural','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('sexta','acusativo','plural','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('sexta','dativo','plural','n');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('sexta','genitivo','plural','');

/* R_sufijo_sustantivo_declinacion 'septima': s/-. Ejemplo: Krankenwagen */
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('septima','nominativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('septima','acusativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('septima','dativo','singular','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('septima','genitivo','singular','s');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('septima','nominativo','plural','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('septima','acusativo','plural','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('septima','dativo','plural','');
INSERT INTO R_sufijo_sustantivo_declinacion VALUES('septima','genitivo','plural','');

