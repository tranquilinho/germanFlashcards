
/* Conjugaciones regulares */

INSERT INTO Conjugacion_regular VALUES ('regelm��ige Verben');

INSERT INTO desinencia VALUES ('regelm��ige Verben','primera','singular','presente','e');
INSERT INTO desinencia VALUES ('regelm��ige Verben','segunda','singular','presente','st');
INSERT INTO desinencia VALUES ('regelm��ige Verben','tercera','singular','presente','t');
INSERT INTO desinencia VALUES ('regelm��ige Verben','primera','plural','presente','en');
INSERT INTO desinencia VALUES ('regelm��ige Verben','segunda','plural','presente','t');
INSERT INTO desinencia VALUES ('regelm��ige Verben','tercera','plural','presente','en');

INSERT INTO desinencia VALUES ('regelm��ige Verben','primera','singular','preterito simple','te');
INSERT INTO desinencia VALUES ('regelm��ige Verben','segunda','singular','preterito simple','test');
INSERT INTO desinencia VALUES ('regelm��ige Verben','tercera','singular','preterito simple','te');
INSERT INTO desinencia VALUES ('regelm��ige Verben','primera','plural','preterito simple','ten');
INSERT INTO desinencia VALUES ('regelm��ige Verben','segunda','plural','preterito simple','tet');
INSERT INTO desinencia VALUES ('regelm��ige Verben','tercera','plural','preterito simple','ten');

/* Conjugaciones irregulares */

/* Heissen */
INSERT INTO Verbo_irregular VALUES ('heissen',DEFAULT,'haben','gehei�t',NULL,'llamarse',DEFAULT,'sounds/heissen.mp3');
INSERT INTO conjugacion_irregular VALUES ('primera','singular','presente','hei�e','heissen');
INSERT INTO conjugacion_irregular VALUES ('segunda','singular','presente','hei�t','heissen');
INSERT INTO conjugacion_irregular VALUES ('tercera','singular','presente','hei�t','heissen');
INSERT INTO conjugacion_irregular VALUES ('primera','plural','presente','hei�en','heissen');
INSERT INTO conjugacion_irregular VALUES ('segunda','plural','presente','hei�t','heissen');
INSERT INTO conjugacion_irregular VALUES ('tercera','plural','presente','hei�en','heissen');

INSERT INTO conjugacion_irregular VALUES ('primera','singular','preterito simple','hei�te','heissen');
INSERT INTO conjugacion_irregular VALUES ('segunda','singular','preterito simple','hei�test','heissen');
INSERT INTO conjugacion_irregular VALUES ('tercera','singular','preterito simple','hei�te','heissen');
INSERT INTO conjugacion_irregular VALUES ('primera','plural','preterito simple','hei�ten','heissen');
INSERT INTO conjugacion_irregular VALUES ('segunda','plural','preterito simple','hei�tet','heissen');
INSERT INTO conjugacion_irregular VALUES ('tercera','plural','preterito simple','hei�ten','heissen');


/* Gehen */
INSERT INTO Verbo_irregular VALUES ('gehen',DEFAULT,'sein','gegangen',NULL,'llamarse',DEFAULT,'sounds/gehen.mp3');
INSERT INTO conjugacion_irregular VALUES ('primera','singular','presente','gehe','gehen');
INSERT INTO conjugacion_irregular VALUES ('segunda','singular','presente','gehst','gehen');
INSERT INTO conjugacion_irregular VALUES ('tercera','singular','presente','geht','gehen');
INSERT INTO conjugacion_irregular VALUES ('primera','plural','presente','gehen','gehen');
INSERT INTO conjugacion_irregular VALUES ('segunda','plural','presente','geht','gehen');
INSERT INTO conjugacion_irregular VALUES ('tercera','plural','presente','gehen','gehen');

INSERT INTO conjugacion_irregular VALUES ('primera','singular','preterito simple','ging','gehen');
INSERT INTO conjugacion_irregular VALUES ('segunda','singular','preterito simple','gingst','gehen');
INSERT INTO conjugacion_irregular VALUES ('tercera','singular','preterito simple','gingt','gehen');
INSERT INTO conjugacion_irregular VALUES ('primera','plural','preterito simple','gingen','gehen');
INSERT INTO conjugacion_irregular VALUES ('segunda','plural','preterito simple','gingt','gehen');
INSERT INTO conjugacion_irregular VALUES ('tercera','plural','preterito simple','gingen','gehen');

/* Sein */

INSERT INTO Verbo_irregular VALUES ('sein',DEFAULT,'sein','gewesen',NULL,'ser',DEFAULT,'sounds/sein.mp3');

INSERT INTO conjugacion_irregular VALUES ('primera','singular','presente','bin','sein');
INSERT INTO conjugacion_irregular VALUES ('segunda','singular','presente','bist','sein');
INSERT INTO conjugacion_irregular VALUES ('tercera','singular','presente','ist','sein');
INSERT INTO conjugacion_irregular VALUES ('primera','plural','presente','sein','sein');
INSERT INTO conjugacion_irregular VALUES ('segunda','plural','presente','seid','sein');
INSERT INTO conjugacion_irregular VALUES ('tercera','plural','presente','sind','sein');

INSERT INTO conjugacion_irregular VALUES ('primera','singular','preterito simple','war','sein');
INSERT INTO conjugacion_irregular VALUES ('segunda','singular','preterito simple','warst','sein');
INSERT INTO conjugacion_irregular VALUES ('tercera','singular','preterito simple','war','sein');
INSERT INTO conjugacion_irregular VALUES ('primera','plural','preterito simple','waren','sein');
INSERT INTO conjugacion_irregular VALUES ('segunda','plural','preterito simple','wart','sein');
INSERT INTO conjugacion_irregular VALUES ('tercera','plural','preterito simple','waren','sein');

/* Haben  */ 

INSERT INTO Verbo_irregular VALUES ('haben',DEFAULT,'haben','gehabt',NULL,'tener',DEFAULT,'sounds/haben.mp3');

INSERT INTO conjugacion_irregular VALUES ('primera','singular','presente','habe','haben');
INSERT INTO conjugacion_irregular VALUES ('segunda','singular','presente','hast','haben');
INSERT INTO conjugacion_irregular VALUES ('tercera','singular','presente','hat','haben');
INSERT INTO conjugacion_irregular VALUES ('primera','plural','presente','haben','haben');
INSERT INTO conjugacion_irregular VALUES ('segunda','plural','presente','habt','haben');
INSERT INTO conjugacion_irregular VALUES ('tercera','plural','presente','haben','haben');

INSERT INTO conjugacion_irregular VALUES ('primera','singular','preterito simple','hatte','haben');
INSERT INTO conjugacion_irregular VALUES ('segunda','singular','preterito simple','hattest','haben');
INSERT INTO conjugacion_irregular VALUES ('tercera','singular','preterito simple','hatte','haben');
INSERT INTO conjugacion_irregular VALUES ('primera','plural','preterito simple','hatten','haben');
INSERT INTO conjugacion_irregular VALUES ('segunda','plural','preterito simple','hattet','haben');
INSERT INTO conjugacion_irregular VALUES ('tercera','plural','preterito simple','hatten','haben');


INSERT INTO Verbo_regular VALUES ('lachen','lach',DEFAULT,'haben','gelacht',NULL,'reirse',DEFAULT,'sounds/lachen.mp3','regelm��ige Verben');
INSERT INTO Verbo_regular VALUES ('sagen','sag',DEFAULT,'haben','gesacht',NULL,'decir',DEFAULT,'sounds/sagen.mp3','regelm��ige Verben');
INSERT INTO Verbo_regular VALUES ('weinen','wein',DEFAULT,'haben','geweint',NULL,'llorar',DEFAULT,'sounds/weinen.mp3','regelm��ige Verben');
INSERT INTO Verbo_regular VALUES ('lieben','lieb',DEFAULT,'haben','geliebt',NULL,'amar',DEFAULT,'sounds/lieben.mp3','regelm��ige Verben'); 
