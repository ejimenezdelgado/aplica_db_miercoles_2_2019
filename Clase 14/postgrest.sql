CREATE DATABASE red_social;

CREATE TABLE bitacora (
  id SERIAL NOT NULL,
  texto varchar(500) NOT NULL,
  CONSTRAINT pk_bitacora PRIMARY KEY (id)
);

CREATE TABLE comentarios (
  id SERIAL NOT NULL,
  texto varchar(300) NOT NULL,
  id_usuario int NOT NULL,
  fecha timestamp without time zone NOT NULL,
  CONSTRAINT pk_comentarios PRIMARY KEY (id)
);

CREATE TABLE invitaciones (
  id SERIAL NOT NULL,
  fecha timestamp without time zone NOT NULL,
  usuario_1 int NOT NULL,
  usuario_2 int NOT NULL,
  estado char(1) NULL DEFAULT ('P'),
  CONSTRAINT pk_invitaciones PRIMARY KEY (id)
);

CREATE TABLE relaciones (
  id SERIAL NOT NULL,
  usuario_1 int NOT NULL,
  usuario_2 int NOT NULL,
  CONSTRAINT pk_relaciones PRIMARY KEY (id)
);

CREATE TABLE sentimientos (
  id SERIAL NOT NULL,
  sentimiento BOOLEAN NOT NULL,
  id_usuario int NOT NULL,
  id_comentario int NOT NULL,
  CONSTRAINT pk_sentimientos PRIMARY KEY (id)
);

CREATE TABLE usuario (
  id SERIAL NOT NULL,
  nombre varchar(50) NOT NULL,
  email varchar(50) NOT NULL,
  numero_relaciones int NOT NULL DEFAULT (0),
  CONSTRAINT pk_usuario PRIMARY KEY (id)
);

/**********************************************************************************/

ALTER TABLE invitaciones ADD CONSTRAINT uk_invitaciones UNIQUE
(
usuario_1 ,
usuario_2 
);


ALTER TABLE relaciones ADD CONSTRAINT uk_relaciones UNIQUE
(
usuario_1 ,
usuario_2 
);

ALTER TABLE comentarios ADD CONSTRAINT fk_comentarios_usuario FOREIGN KEY (id_usuario)
REFERENCES usuario (id);

ALTER TABLE invitaciones ADD CONSTRAINT fk_invitaciones_usuario_1 FOREIGN KEY (usuario_1)
REFERENCES usuario (id);

ALTER TABLE invitaciones ADD CONSTRAINT fk_invitaciones_usuario_2 FOREIGN KEY (usuario_2)
REFERENCES usuario (id);

ALTER TABLE relaciones ADD CONSTRAINT fk_relaciones_usuario_1 FOREIGN KEY (usuario_1)
REFERENCES usuario (id);

ALTER TABLE relaciones ADD CONSTRAINT fk_relaciones_usuario_2 FOREIGN KEY (usuario_2)
REFERENCES usuario (id);

ALTER TABLE sentimientos ADD CONSTRAINT fk_sentimientos_comentarios FOREIGN KEY (id_comentario)
REFERENCES comentarios (id);

ALTER TABLE sentimientos ADD CONSTRAINT fk_sentimientos_usuario FOREIGN KEY (id_usuario)
REFERENCES usuario (id);

ALTER TABLE invitaciones ADD CONSTRAINT ck_invitaciones CHECK (estado = 'R' OR estado = 'A' OR estado = 'P');

/**********************************************************************************/

INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (1, 'Kennedy Cruz', 'dis.parturient@Utnecurna.ca', 4);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (2, 'Harper Bell', 'tellus.sem@maurissagittis.ca', 4);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (3, 'Ulysses Abbott', 'nascetur@suscipitnonummyFusce.edu', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (4, 'Rajah Oliver', 'aliquam.arcu@ac.org', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (5, 'Caleb Hernandez', 'Sed.dictum.Proin@malesuadavelvenenatis.org', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (6, 'Wallace Schultz', 'felis@vellectus.edu', 6);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (7, 'Clayton Guerra', 'adipiscing.ligula.Aenean@variuset.co.uk', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (8, 'Maxwell Wilson', 'sit.amet.risus@turpisAliquamadipiscing.co.uk', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (9, 'Jeremy Burton', 'eu@hendrerit.com', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (10, 'Cairo Cortez', 'non@auctorMaurisvel.co.uk', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (11, 'Tobias Bruce', 'orci@molestietortornibh.edu', 4);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (12, 'Amal Mcclure', 'a.feugiat@malesuadaaugue.edu', 3);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (13, 'Levi Carson', 'non.enim@Pellentesque.org', 3);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (14, 'Grant Mcfadden', 'sem.eget.massa@at.org', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (15, 'Allen Dickson', 'odio.auctor.vitae@orci.org', 4);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (16, 'Troy Fleming', 'Cras.convallis@dui.edu', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (17, 'Lee Chambers', 'ullamcorper@tellusloremeu.edu', 4);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (18, 'Clinton Frost', 'mauris@estmollisnon.ca', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (19, 'Francis Jimenez', 'luctus.vulputate.nisi@adipiscing.edu', 3);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (20, 'Carlos Richmond', 'Sed@lectussit.net', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (21, 'Louis Woodard', 'sagittis@Vivamus.net', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (22, 'David Taylor', 'placerat@Suspendisse.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (23, 'Kareem Terry', 'aliquet.odio.Etiam@sed.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (24, 'Travis Dillon', 'lobortis.quis.pede@Inlorem.edu', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (25, 'Howard Snow', 'dis.parturient.montes@massa.org', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (26, 'Austin Taylor', 'dolor.sit.amet@tellus.ca', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (27, 'Dieter Mcdowell', 'semper.dui@maurisidsapien.edu', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (28, 'Michael Nolan', 'sit@antelectusconvallis.com', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (29, 'Griffith Patrick', 'Nullam.vitae.diam@elit.co.uk', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (30, 'Sawyer Donaldson', 'ut@ataugue.net', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (31, 'Ir Oconnor', 'magna.tellus.faucibus@posuere.net', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (32, 'Malcolm Guy', 'adipiscing.lacus@Sedegetlacus.org', 3);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (33, 'Christian Quinn', 'libero.Donec@atiaculis.org', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (34, 'Kato Key', 'est.mauris@nibhDonec.co.uk', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (35, 'Reed Ratliff', 'a@sedest.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (36, 'Quinn Mccullough', 'orci.tincidunt.adipiscing@dolorelit.net', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (37, 'Dennis lden', 'Duis.dignissim.tempor@lectusjustoeu.ca', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (38, 'Isaac Conway', 'iaculis.quis@in.net', 3);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (39, 'Cairo Ball', 'dolor@volutpat.net', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (40, 'Mark Johnson', 'mus@nec.net', 3);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (41, 'Leroy Adkins', 'ipsum.Curabitur.consequat@cubiliaCurae.edu', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (42, 'Caleb Humphrey', 'Maecenas.malesuada@quistristiqueac.net', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (43, 'Eaton Hardin', 'Quisque@eumetusIn.ca', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (44, 'Cole Norton', 'mattis.ornare.lectus@bibendum.net', 3);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (45, 'Abraham Peters', 'ante.ipsum@pede.com', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (46, 'Walter Dalton', 'senectus.et.netus@purusmaurisa.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (47, 'Evan Clements', 'interdum.feugiat.Sed@placerat.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (48, 'Derek Anderson', 'ornare@quis.ca', 5);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (49, 'Howard Thornton', 'Nullam@Nunc.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (50, 'Eaton Daniel', 'consectetuer@eueratsemper.ca', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (51, 'Omar Ochoa', 'inceptos.hymenaeos@liberoProin.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (52, 'Nero Booker', 'nisi.nibh.lacinia@anteVivamusnon.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (53, 'Uriel Carney', 'est@leoVivamusnibh.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (54, 'Felix Koch', 'convallis.dolor@mattis.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (55, 'Wallace Buckner', 'eu.dui.Cum@Quisqueornare.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (56, 'Gage Booker', 'Maecenas@fringillaeuismodenim.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (57, 'Oleg Best', 'interdum@Maecenasornare.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (58, 'Wang Briggs', 'sociis.natoque@laoreetlibero.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (59, 'Roth Olson', 'ultricies.ornare.elit@Loremipsum.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (60, 'Ezekiel Pollard', 'mi.tempor@commodohendreritDonec.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (61, 'Gray Mcdowell', 'Curabitur.consequat.lectus@euismod.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (62, 'Ralph Spears', 'nisl.arcu.iaculis@CuraeDonectincidunt.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (63, 'Ross Harris', 'eget@luctusvulputate.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (64, 'Baker Hensley', 'ligula@urnaNuncquis.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (65, 'Ulric Jennings', 'et.risus@quisdiamPellentesque.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (66, 'Vladimir Chase', 'nascetur.ridiculus.mus@tellusfaucibusleo.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (67, 'Vaughan Luna', 'sed@acmetus.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (68, 'Hunter Morales', 'egestas.rhoncus@ornarelectusjusto.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (69, 'Nero Tucker', 'sed.hendrerit@Pellentesque.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (70, 'Xander Montoya', 'In@sit.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (71, 'Gage Carpenter', 'dictum.magna@vitaesodales.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (72, 'Charles Christensen', 'Curabitur@idmollis.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (73, 'Dolan Rutledge', 'Ut.tincidunt.orci@velit.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (74, 'Carter Juarez', 'luctus.ut.pellentesque@Phasellusataugue.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (75, 'Austin Wiley', 'interdum.Curabitur.dictum@egetvolutpat.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (76, 'Asher Reed', 'cursus@nonummyut.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (77, 'Eaton Cervantes', 'Nulla.eget@eu.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (78, 'Francis Carey', 'quis.arcu.vel@necanteMaecenas.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (79, 'Slade Beck', 'Fusce@sociis.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (80, 'Cameron Barr', 'euismod@eget.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (81, 'Jason Hartman', 'massa@vehicula.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (82, 'Garrett Palmer', 'ultricies.ligula.Nullam@dui.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (83, 'Kareem Malone', 'consequat.lectus@cursusdiam.net', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (84, 'Ali Harrington', 'Curabitur@ametultriciessem.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (85, 'Lyle Russell', 'nec@Donecegestas.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (86, 'Dean Galles', 'nulla.In@pharetrased.net', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (87, 'Kamal Russell', 'amet.luctus.vulputate@magnaa.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (88, 'Denton Sweeney', 'ornare.lectus@sem.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (89, 'Ciaran Cantrell', 'sed.sem@QuisquevariusNam.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (90, 'Hu George', 'orci.lobortis@sit.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (91, 'Colton Fulton', 'massa.Integer.vitae@enimEtiamimperdiet.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (92, 'Joshua Pearson', 'vel.nisl@atsemmolestie.net', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (93, 'Rogan Madden', 'fringilla.euismod.enim@rhoncus.net', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (94, 'Simon Lancaster', 'eleifend.non.dapibus@fringillaDonecfeugiat.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (95, 'Talon Mcmahon', 'arcu.eu@libero.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (96, 'Merritt Browning', 'lorem@nuncestmollis.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (97, 'Bruce Carpenter', 'non.dapibus.rutrum@loremvitae.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (98, 'Len Dean', 'Nunc.ut.erat@convallisestvitae.net', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (99, 'Kennan Blair', 'in@nuncest.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (100, 'Akeem Sheppard', 'sapien@tortor.net', 0);

INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (122, 1, 34);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (59, 1, 35);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (120, 1, 42);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (97, 1, 49);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (102, 2, 10);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (94, 2, 25);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (73, 2, 26);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (71, 2, 30);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (135, 3, 25);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (68, 3, 50);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (77, 4, 35);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (123, 4, 42);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (117, 5, 33);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (127, 6, 3);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (101, 6, 19);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (52, 6, 22);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (78, 6, 25);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (128, 6, 36);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (130, 6, 47);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (90, 7, 28);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (67, 7, 30);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (62, 8, 27);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (139, 8, 49);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (145, 9, 7);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (48, 9, 30);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (99, 10, 12);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (141, 11, 8);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (124, 11, 17);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (69, 11, 39);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (121, 11, 47);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (136, 12, 10);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (129, 12, 33);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (61, 12, 48);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (95, 13, 12);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (88, 13, 30);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (98, 13, 37);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (89, 14, 36);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (126, 15, 4);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (86, 15, 24);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (84, 15, 29);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (60, 15, 37);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (106, 16, 31);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (113, 16, 49);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (144, 17, 5);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (115, 17, 7);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (118, 17, 22);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (131, 17, 28);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (63, 18, 4);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (138, 19, 15);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (65, 19, 28);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (72, 19, 31);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (103, 20, 17);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (50, 20, 39);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (80, 21, 3);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (107, 21, 31);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (91, 24, 2);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (56, 25, 19);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (85, 26, 15);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (79, 26, 31);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (76, 27, 10);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (87, 27, 32);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (133, 28, 27);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (81, 29, 33);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (140, 29, 50);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (112, 30, 44);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (70, 31, 28);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (100, 32, 4);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (58, 32, 11);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (116, 32, 46);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (110, 33, 26);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (125, 33, 43);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (96, 34, 32);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (111, 34, 39);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (74, 37, 34);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (119, 38, 4);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (108, 38, 19);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (142, 38, 22);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (83, 39, 24);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (53, 40, 6);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (109, 40, 11);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (57, 40, 49);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (104, 41, 49);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (146, 42, 25);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (134, 42, 38);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (114, 43, 17);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (137, 43, 33);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (132, 44, 7);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (93, 44, 12);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (75, 44, 13);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (92, 45, 34);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (64, 48, 4);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (105, 48, 11);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (82, 48, 16);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (51, 48, 29);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (54, 48, 35);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (55, 50, 40);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (66, 50, 42);

INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (4, 'dis parturient montes, nascetur', 18, '2009-05-31');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (5, 'cursus et, magna. Praesent interdum ligula eu enim. Etiam', 38, '2014-09-11');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (6, 'non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed', 19, '2013-11-11');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (7, 'In faucibus. Morbi', 24, '2008-11-01');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (8, 'Vivamus non lorem vitae odio sagittis semper. Nam tempor diam', 100, '2009-01-02');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (9, 'eros.', 82, '2008-04-17');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (10, 'erat vitae risus. Duis a mi', 68, '2017-06-20');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (11, 'Nulla facilisis. Suspendisse', 83, '2016-09-02');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (12, 'Nam nulla', 96, '2014-10-16');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (13, 'enim mi tempor lorem, eget mollis lectus pede et risus.', 50, '2012-11-26');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (14, 'a sollicitudin orci sem eget massa. Suspendisse eleifend.', 72, '2017-03-13');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (15, 'mattis velit', 4, '2017-08-18');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (16, 'elit fermentum risus, at fringilla purus mauris a nunc. In', 50, '2012-06-09');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (17, 'vulputate velit eu sem. Pellentesque ut ipsum', 54, '2016-09-23');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (18, 'Nam tempor diam dictum', 81, '2017-12-24');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (19, 'conubia nostra,', 10, '2009-01-28');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (20, 'ac mattis velit justo nec ante. Maecenas', 34, '2009-10-10');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (21, 'ullamcorper. Duis cursus, diam at pretium aliquet, metus urna', 36, '2010-04-02');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (22, 'tincidunt tempus risus.', 66, '2010-09-25');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (23, 'auctor ullamcorper, nisl arcu iaculis enim, sit', 38, '2014-10-17');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (24, 'dui. Cras pellentesque. Sed dictum.', 76, '2014-02-25');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (25, 'elit.', 8, '2018-04-19');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (26, 'eu odio tristique pharetra. Quisque ac libero nec', 82, '2013-07-31');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (27, 'eu lacus. Quisque', 58, '2015-07-07');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (28, 'sit amet, consectetuer adipiscing elit. Aliquam auctor,', 85, '2009-11-05');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (29, 'ac turpis egestas. Fusce aliquet magna a', 77, '2017-11-18');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (30, 'tempus scelerisque, lorem ipsum sodales purus, in', 44, '2017-01-18');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (31, 'ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus.', 72, '2013-02-13');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (32, 'est, vitae sodales nisi', 61, '2010-08-22');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (33, 'sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget', 15, '2015-03-11');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (34, 'fames', 52, '2015-07-23');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (35, 'laoreet ipsum. Curabitur consequat, lectus sit', 20, '2018-04-21');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (36, 'sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra', 92, '2015-11-27');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (37, 'ullamcorper viverra. Maecenas', 7, '2010-02-28');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (38, 'Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu', 55, '2010-01-14');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (39, 'sed turpis nec', 34, '2010-03-08');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (40, 'vulputate velit', 72, '2011-03-31');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (41, 'erat. Etiam', 7, '2010-12-31');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (42, 'libero mauris, aliquam eu,', 49, '2013-02-10');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (43, 'Mauris nulla. Integer urna. Vivamus molestie dapibus ligula.', 92, '2016-06-09');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (44, 'lacus. Quisque', 97, '2010-03-04');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (45, 'ullamcorper. Duis cursus, diam at pretium', 18, '2013-11-07');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (46, 'Ut tincidunt orci quis lectus. Nullam suscipit, est ac', 97, '2011-01-22');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (47, 'Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 74, '2013-02-13');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (48, 'eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer', 98, '2015-06-18');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (49, 'augue', 83, '2009-05-08');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (50, 'Donec porttitor tellus', 80, '2010-06-28');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (51, 'tellus. Nunc lectus pede, ultrices a, auctor non,', 71, '2015-06-01');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (52, 'lectus, a sollicitudin', 3, '2010-10-31');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (53, 'non arcu. Vivamus sit amet risus. Donec egestas.', 7, '2016-01-27');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (54, 'turpis non enim.', 20, '2010-08-08');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (55, 'dui. Cum sociis natoque', 5, '2012-04-05');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (56, 'condimentum eget, volutpat ornare, facilisis', 100, '2018-03-31');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (57, 'malesuada. Integer id magna et', 60, '2009-03-22');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (58, 'magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim', 15, '2016-11-27');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (59, 'eleifend', 30, '2013-05-26');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (60, 'eu dui. Cum', 46, '2017-03-24');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (61, 'Mauris eu turpis. Nulla aliquet. Proin velit. Sed', 7, '2009-03-30');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (62, 'Phasellus fermentum convallis ligula. Donec luctus', 92, '2010-09-12');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (63, 'elit elit fermentum risus, at', 96, '2012-02-26');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (64, 'est, mollis non, cursus non, egestas a, dui.', 31, '2011-04-25');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (65, 'ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis', 88, '2011-04-22');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (66, 'Sed', 42, '2008-06-06');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (67, 'sit amet diam eu dolor egestas rhoncus. Proin nisl', 95, '2012-03-26');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (68, 'orci. Ut sagittis lobortis', 82, '2017-05-28');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (69, 'senectus', 66, '2013-03-21');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (70, 'a, malesuada id, erat. Etiam vestibulum', 97, '2013-11-24');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (71, 'Donec nibh enim, gravida sit amet, dapibus', 53, '2009-11-15');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (72, 'lorem vitae odio sagittis semper. Nam tempor diam dictum sapien.', 54, '2014-12-14');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (73, 'non enim commodo hendrerit. Donec porttitor tellus', 7, '2008-09-15');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (74, 'lacinia mattis. Integer eu lacus. Quisque imperdiet,', 54, '2016-10-07');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (75, 'ac nulla. In tincidunt congue turpis. In condimentum. Donec', 93, '2008-04-21');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (76, 'eu augue porttitor interdum. Sed auctor odio a purus.', 100, '2013-06-05');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (77, 'malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam', 51, '2015-05-31');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (78, 'metus urna convallis', 67, '2012-06-09');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (79, 'lobortis risus. In mi', 36, '2015-07-13');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (80, 'rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque', 28, '2013-09-07');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (81, 'hendrerit neque. In ornare sagittis felis. Donec tempor, est', 82, '2017-04-29');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (82, 'erat eget', 51, '2018-02-04');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (83, 'dictum magna. Ut tincidunt orci quis lectus. Nullam', 82, '2016-04-24');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (84, 'velit dui, semper et, lacinia', 47, '2015-09-04');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (85, 'cursus non,', 70, '2009-11-24');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (86, 'nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo', 23, '2017-11-05');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (87, 'lobortis tellus justo sit amet nulla. Donec non justo. Proin', 4, '2017-11-24');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (88, 'primis in faucibus', 88, '2011-05-02');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (89, 'dictum ultricies ligula. Nullam enim.', 47, '2010-06-02');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (90, 'magna tellus faucibus leo, in lobortis tellus', 19, '2012-09-26');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (91, 'ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt', 55, '2014-07-18');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (92, 'Cras dictum ultricies ligula. Nullam enim. Sed nulla ante,', 83, '2008-08-25');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (93, 'cursus, diam at pretium aliquet, metus', 90, '2009-03-23');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (94, 'mattis. Cras eget nisi dictum augue malesuada malesuada. Integer', 25, '2015-02-23');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (95, 'mi fringilla mi lacinia mattis.', 14, '2014-11-04');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (96, 'Fusce diam nunc, ullamcorper eu,', 32, '2008-09-30');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (97, 'lobortis risus.', 8, '2008-10-18');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (98, 'arcu imperdiet ullamcorper. Duis', 87, '2009-04-03');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (99, 'nonummy ultricies ornare, elit elit', 26, '2009-07-24');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (100, 'Cras eget nisi dictum', 57, '2011-05-06');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (101, 'egestas', 31, '2010-06-05');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (102, 'et risus. Quisque libero lacus, varius et, euismod et, commodo', 33, '2016-07-14');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (103, 'non, luctus sit amet, faucibus ut,', 6, '2011-10-09');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (104, 'cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices', 61, '2014-11-16');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (105, 'commodo at, libero.', 48, '2013-11-07');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (106, 'enim. Etiam gravida molestie arcu.', 96, '2012-04-20');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (107, 'massa rutrum magna. Cras', 32, '2009-08-31');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (108, 'luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc', 51, '2013-11-18');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (109, 'per conubia nostra,', 46, '2016-06-26');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (110, 'ac tellus.', 84, '2012-10-09');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (111, 'tincidunt', 98, '2015-10-16');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (112, 'id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque', 16, '2014-09-04');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (113, 'ultrices', 16, '2013-04-01');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (114, 'orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus', 67, '2016-09-19');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (115, 'Nunc pulvinar arcu et pede. Nunc sed orci', 99, '2012-03-25');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (116, 'velit justo nec ante. Maecenas mi felis,', 30, '2016-10-28');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (117, 'risus. Donec egestas. Duis ac arcu. Nunc mauris.', 18, '2015-11-20');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (118, 'purus.', 46, '2008-07-13');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (119, 'magna. Lorem ipsum', 9, '2015-07-30');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (120, 'in faucibus orci luctus et ultrices posuere', 62, '2009-02-19');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (121, 'convallis ligula. Donec luctus aliquet odio. Etiam', 74, '2017-01-29');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (122, 'nulla. Integer vulputate, risus a ultricies adipiscing,', 63, '2017-11-04');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (123, 'mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet,', 3, '2009-06-02');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (124, 'hendrerit consectetuer, cursus et, magna. Praesent', 73, '2013-02-16');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (125, 'metus. Aenean sed pede nec ante blandit viverra. Donec', 46, '2018-03-17');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (126, 'euismod', 65, '2008-11-02');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (127, 'amet, consectetuer adipiscing elit. Etiam', 42, '2017-12-26');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (128, 'aliquam eu, accumsan', 86, '2011-06-24');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (129, 'Nullam', 41, '2010-06-14');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (130, 'varius. Nam', 81, '2016-03-19');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (131, 'nisi. Aenean eget metus. In nec', 79, '2014-05-28');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (132, 'tellus lorem eu metus. In lorem. Donec elementum, lorem', 95, '2013-11-04');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (133, 'Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed', 24, '2009-03-02');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (134, 'elit. Etiam', 94, '2013-02-18');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (135, 'sociis', 59, '2010-10-03');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (136, 'dui, nec', 15, '2017-07-02');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (137, 'Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque', 34, '2012-09-17');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (138, 'leo, in lobortis tellus justo sit amet nulla. Donec non', 31, '2017-10-06');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (139, 'vestibulum lorem, sit', 31, '2018-03-03');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (140, 'tellus.', 28, '2009-03-30');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (141, 'rhoncus id, mollis nec,', 48, '2010-12-19');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (142, 'In', 74, '2014-03-29');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (143, 'Duis risus odio, auctor', 71, '2014-12-23');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (144, 'lorem. Donec elementum, lorem ut aliquam', 61, '2013-10-04');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (145, 'erat nonummy ultricies', 65, '2009-08-28');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (146, 'nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras', 95, '2016-04-27');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (147, 'in lobortis tellus justo sit amet nulla. Donec non', 66, '2009-02-16');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (148, 'nibh.', 99, '2013-12-01');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (149, 'risus, at fringilla purus', 21, '2015-08-10');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (150, 'pretium et, rutrum non, hendrerit id,', 61, '2016-11-21');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (151, 'tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris.', 59, '2010-06-16');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (152, 'libero. Proin mi. Aliquam', 85, '2008-06-21');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (153, 'pede et risus. Quisque libero lacus, varius et, euismod et,', 62, '2011-05-26');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (154, 'tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id,', 34, '2014-11-15');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (155, 'nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum', 45, '2017-06-06');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (156, 'natoque penatibus et magnis dis', 72, '2013-04-11');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (157, 'per inceptos', 15, '2018-03-02');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (158, 'Vestibulum ante ipsum primis', 79, '2017-11-18');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (159, 'commodo at, libero. Morbi accumsan laoreet ipsum.', 74, '2016-12-19');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (160, 'Nulla interdum. Curabitur', 68, '2016-11-29');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (161, 'Proin mi. Aliquam gravida mauris ut mi.', 35, '2016-03-23');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (162, 'adipiscing non, luctus sit amet, faucibus ut, nulla. Cras', 11, '2011-06-28');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (163, 'erat eget ipsum. Suspendisse sagittis.', 70, '2008-12-26');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (164, 'magna, malesuada vel, convallis in, cursus et,', 76, '2014-03-02');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (165, 'elit, dictum', 91, '2014-10-04');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (166, 'fringilla ornare', 81, '2009-11-27');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (167, 'arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida', 57, '2017-03-27');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (168, 'lacinia mattis.', 43, '2010-01-09');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (169, 'penatibus et', 17, '2015-02-02');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (170, 'aliquam adipiscing lacus. Ut nec', 72, '2017-01-06');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (171, 'dignissim pharetra.', 38, '2014-04-30');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (172, 'vulputate ullamcorper magna. Sed eu eros. Nam', 19, '2008-05-01');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (173, 'Aliquam nec enim. Nunc', 12, '2014-07-16');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (174, 'Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu', 71, '2009-01-01');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (175, 'Fusce mi lorem, vehicula et, rutrum eu,', 70, '2011-02-13');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (176, 'dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare,', 60, '2015-05-14');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (177, 'Pellentesque habitant morbi', 12, '2010-09-03');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (178, 'Nulla eu neque', 67, '2011-03-08');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (179, 'ipsum cursus', 94, '2013-03-12');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (180, 'cursus non,', 57, '2011-10-24');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (181, 'adipiscing', 87, '2009-08-19');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (182, 'sociis natoque penatibus et magnis', 58, '2012-01-24');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (183, 'libero. Integer in magna. Phasellus dolor elit,', 4, '2014-08-01');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (184, 'leo elementum sem, vitae aliquam eros', 61, '2018-01-03');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (185, 'Donec egestas.', 70, '2014-06-22');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (186, 'et tristique pellentesque, tellus sem mollis dui, in sodales', 31, '2010-10-25');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (187, 'hendrerit. Donec porttitor tellus non magna. Nam ligula elit,', 25, '2018-03-25');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (188, 'cursus', 89, '2014-12-03');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (189, 'velit. Sed malesuada augue', 33, '2013-07-13');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (190, 'placerat. Cras', 50, '2009-09-23');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (191, 'luctus aliquet odio. Etiam', 92, '2013-06-09');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (192, 'purus. Maecenas', 24, '2016-02-15');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (193, 'Morbi quis urna. Nunc quis arcu', 56, '2012-01-25');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (194, 'dictum magna. Ut tincidunt orci quis lectus.', 63, '2009-03-19');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (195, 'quis turpis vitae purus', 14, '2014-05-02');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (196, 'risus varius orci, in', 3, '2012-11-17');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (197, 'orci luctus et ultrices posuere cubilia Curae; Phasellus', 55, '2009-08-29');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (198, 'magnis dis parturient montes,', 81, '2018-03-21');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (199, 'magnis dis parturient montes,', 45, '2017-09-30');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (200, 'et magnis dis parturient', 45, '2015-04-08');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (201, 'dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae,', 99, '2009-12-04');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (202, 'Duis elementum,', 75, '2016-12-26');
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (203, 'augue', 32, '2009-05-13');

INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (1, '2015-08-07', 75, 84, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (2, '2017-04-20', 88, 61, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (3, '2011-06-15', 37, 5, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (4, '2017-05-23', 40, 94, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (5, '2012-01-14', 75, 67, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (6, '2009-11-23', 68, 2, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (7, '2008-01-19', 70, 46, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (8, '2012-05-03', 44, 93, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (9, '2008-10-15', 14, 7, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (10, '2013-10-31', 22, 1, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (11, '2013-04-09', 88, 6, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (12, '2011-01-18', 74, 54, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (13, '2014-09-10', 47, 15, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (14, '2009-11-27', 90, 22, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (15, '2014-02-12', 70, 80, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (16, '2008-03-26', 51, 56, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (17, '2015-06-18', 18, 78, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (18, '2013-12-15', 24, 31, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (19, '2009-06-29', 63, 53, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (20, '2016-09-23', 76, 45, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (21, '2012-03-31', 80, 59, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (22, '2012-05-11', 73, 57, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (23, '2017-09-18', 62, 85, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (24, '2015-09-13', 50, 70, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (25, '2015-02-26', 91, 31, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (26, '2012-02-25', 19, 22, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (27, '2010-10-25', 43, 64, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (28, '2017-08-12', 64, 77, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (29, '2009-01-09', 9, 15, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (30, '2008-11-01', 55, 84, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (31, '2015-07-15', 71, 69, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (32, '2009-03-13', 89, 15, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (33, '2014-11-16', 58, 15, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (34, '2010-09-20', 21, 83, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (35, '2015-02-06', 47, 96, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (36, '2017-01-23', 52, 96, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (37, '2008-07-03', 29, 8, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (38, '2015-01-19', 66, 19, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (39, '2008-12-08', 94, 84, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (40, '2016-01-02', 4, 58, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (41, '2015-02-23', 57, 66, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (42, '2018-01-01', 39, 32, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (43, '2012-01-02', 81, 78, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (44, '2012-08-15', 65, 82, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (45, '2016-03-26', 49, 73, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (46, '2014-11-17', 84, 77, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (47, '2016-03-28', 71, 53, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (48, '2009-01-29', 56, 23, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (49, '2012-07-04', 7, 85, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (50, '2017-05-22', 73, 20, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (51, '2008-05-30', 87, 65, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (52, '2009-09-17', 9, 16, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (53, '2008-07-01', 4, 83, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (54, '2015-01-02', 8, 90, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (55, '2015-11-24', 91, 88, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (56, '2015-07-19', 11, 93, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (57, '2009-07-29', 48, 42, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (58, '2015-06-06', 86, 49, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (60, '2017-05-06', 97, 7, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (61, '2011-05-02', 96, 6, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (62, '2011-02-12', 25, 20, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (63, '2014-04-25', 31, 37, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (64, '2010-07-12', 53, 84, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (65, '2013-04-07', 79, 46, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (66, '2011-11-07', 100, 84, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (67, '2017-01-20', 36, 22, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (68, '2010-09-10', 46, 77, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (69, '2017-01-28', 80, 75, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (70, '2008-08-27', 63, 46, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (71, '2010-06-17', 70, 53, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (72, '2010-03-12', 49, 89, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (73, '2016-05-18', 16, 10, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (74, '2016-07-01', 32, 84, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (75, '2010-10-18', 42, 61, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (76, '2014-04-12', 20, 27, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (77, '2010-01-11', 29, 42, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (78, '2014-12-30', 78, 23, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (79, '2013-06-12', 51, 7, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (80, '2016-02-01', 64, 74, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (81, '2009-08-18', 87, 14, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (82, '2017-08-03', 8, 4, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (83, '2013-06-22', 37, 8, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (84, '2013-09-04', 61, 8, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (85, '2017-08-16', 52, 70, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (86, '2009-02-23', 84, 45, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (87, '2014-10-23', 55, 37, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (88, '2014-02-26', 70, 81, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (89, '2008-12-26', 13, 2, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (90, '2009-02-10', 98, 18, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (91, '2017-02-03', 80, 2, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (92, '2015-04-26', 66, 42, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (93, '2014-11-13', 21, 49, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (94, '2017-03-26', 64, 94, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (95, '2010-06-15', 37, 74, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (96, '2016-07-26', 49, 81, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (97, '2015-04-08', 92, 43, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (98, '2008-01-19', 57, 34, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (99, '2009-05-23', 30, 24, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (100, '2010-02-07', 1, 34, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (101, '2008-09-04', 1, 35, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (102, '2010-01-01', 1, 42, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (103, '2013-01-18', 1, 49, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (104, '2010-05-09', 2, 10, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (105, '2010-01-21', 2, 25, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (106, '2011-10-31', 2, 26, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (107, '2013-02-01', 2, 30, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (108, '2009-10-19', 3, 25, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (109, '2011-01-13', 3, 50, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (110, '2012-04-24', 4, 35, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (111, '2008-06-04', 4, 42, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (112, '2010-02-21', 5, 33, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (113, '2016-04-02', 6, 3, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (114, '2016-06-12', 6, 19, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (115, '2014-02-07', 6, 22, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (116, '2017-01-28', 6, 25, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (117, '2010-01-24', 6, 36, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (118, '2011-07-23', 6, 47, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (119, '2013-11-08', 7, 28, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (120, '2015-09-04', 7, 30, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (121, '2014-02-14', 8, 27, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (122, '2010-06-18', 8, 49, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (123, '2014-05-04', 9, 7, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (124, '2017-09-03', 9, 30, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (125, '2015-11-30', 10, 12, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (126, '2010-09-24', 11, 8, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (127, '2010-08-16', 11, 17, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (128, '2011-08-04', 11, 39, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (129, '2015-03-12', 11, 47, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (130, '2009-05-13', 12, 10, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (131, '2010-05-31', 12, 33, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (132, '2009-09-04', 12, 48, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (133, '2009-03-26', 13, 12, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (134, '2010-04-01', 13, 30, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (135, '2008-01-26', 13, 37, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (136, '2017-05-15', 14, 36, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (137, '2017-06-10', 15, 4, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (138, '2016-04-05', 15, 24, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (139, '2016-07-06', 15, 29, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (140, '2011-07-07', 15, 37, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (141, '2014-04-07', 16, 31, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (142, '2014-08-26', 16, 49, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (143, '2012-05-25', 17, 5, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (144, '2015-09-28', 17, 7, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (145, '2017-05-11', 17, 22, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (146, '2009-02-07', 17, 28, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (147, '2014-08-18', 18, 4, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (148, '2008-07-07', 19, 15, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (149, '2014-01-03', 19, 28, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (150, '2010-12-07', 19, 31, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (151, '2010-09-12', 20, 17, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (152, '2014-11-07', 20, 39, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (153, '2013-08-10', 21, 3, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (154, '2013-11-24', 21, 31, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (155, '2009-08-26', 24, 2, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (156, '2008-10-30', 25, 19, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (157, '2012-06-10', 26, 15, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (158, '2017-09-23', 26, 31, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (159, '2014-09-19', 27, 10, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (160, '2017-03-18', 27, 32, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (161, '2011-08-01', 28, 27, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (162, '2009-11-20', 29, 33, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (163, '2010-02-23', 29, 50, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (164, '2015-09-20', 30, 44, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (165, '2008-12-06', 31, 28, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (166, '2011-09-05', 32, 4, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (167, '2016-04-28', 32, 11, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (168, '2009-12-08', 32, 46, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (169, '2009-02-14', 33, 26, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (170, '2010-09-18', 33, 43, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (171, '2011-03-04', 34, 32, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (172, '2015-02-14', 34, 39, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (173, '2011-09-24', 37, 34, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (174, '2014-10-16', 38, 4, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (175, '2017-11-27', 38, 19, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (176, '2008-07-22', 38, 22, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (177, '2008-03-07', 39, 24, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (178, '2014-03-09', 40, 6, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (179, '2014-10-26', 40, 11, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (180, '2014-01-09', 40, 49, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (181, '2012-04-23', 41, 49, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (182, '2011-03-25', 42, 25, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (183, '2011-12-05', 42, 38, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (184, '2016-05-22', 43, 17, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (185, '2010-06-28', 43, 33, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (186, '2016-12-04', 44, 7, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (187, '2012-03-16', 44, 12, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (188, '2015-04-19', 44, 13, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (189, '2010-11-23', 45, 34, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (190, '2014-05-26', 48, 4, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (191, '2012-06-02', 48, 11, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (192, '2014-03-02', 48, 16, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (193, '2015-09-03', 48, 29, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (194, '2015-07-25', 48, 35, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (195, '2017-05-12', 50, 40, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (196, '2012-03-11', 50, 42, 'A');
  
  insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (1,true,19,56);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (2,true,36,89);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (3,true,39,69);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (4,true,3,127);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (5,false,15,138);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (6,true,19,101);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (7,true,49,113);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (8,true,8,141);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (9,true,36,128);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (10,false,33,129);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (11,false,3,127);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (15,true,3,80);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (17,false,39,50);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (18,false,31,72);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (19,false,34,122);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (23,false,28,70);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (24,true,4,126);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (26,true,22,118);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (27,true,22,142);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (30,false,19,101);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (31,true,17,103);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (34,false,4,100);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (35,false,25,135);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (36,false,19,108);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (37,true,31,107);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (39,true,25,135);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (41,false,40,55);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (42,true,37,60);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (43,true,32,87);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (47,false,49,57);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (48,true,30,67);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (50,false,33,129);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (53,false,50,140);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (54,false,2,91);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (55,true,35,59);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (56,false,34,74);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (60,false,26,73);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (62,false,25,135);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (70,true,49,113);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (71,false,38,134);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (74,false,3,80);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (76,true,15,85);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (77,true,35,54);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (78,true,29,84);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (79,true,49,104);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (80,true,25,135);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (83,true,35,77);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (84,true,36,128);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (90,true,17,103);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (94,false,32,87);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (96,false,39,111);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (98,true,29,51);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (99,false,35,77);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (103,true,43,125);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (104,true,3,127);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (109,true,31,79);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (111,false,32,96);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (113,true,42,120);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (114,true,2,91);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (118,false,33,129);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (119,true,16,82);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (123,false,22,52);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (127,true,19,108);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (128,true,11,58);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (130,true,13,75);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (131,true,50,68);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (140,true,36,89);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (144,false,34,92);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (146,true,19,101);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (150,false,30,88);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (151,true,47,121);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (152,true,30,88);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (153,true,25,135);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (159,false,30,48);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (160,true,4,64);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (161,false,15,85);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (162,true,19,101);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (166,true,38,134);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (168,false,4,119);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (169,false,49,139);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (170,false,39,111);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (172,true,28,90);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (174,true,30,48);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (175,true,39,50);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (180,true,25,78);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (183,true,30,48);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (188,false,36,128);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (189,true,28,70);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (190,true,39,69);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (195,true,36,128);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (196,true,7,115);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (197,true,36,89);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (200,true,8,141);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (202,true,16,82);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (203,true,42,66);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (205,false,34,92);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (208,false,49,57);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (223,false,47,130);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (226,false,4,64);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (227,false,19,101);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (230,false,31,79);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (231,false,44,112);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (233,false,30,48);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (234,true,25,94);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (237,true,47,121);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (240,true,37,98);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (245,false,49,104);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (247,false,25,135);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (249,true,4,100);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (250,true,39,111);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (251,true,30,67);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (252,false,31,106);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (253,true,24,83);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (255,false,35,59);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (259,true,29,84);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (262,true,33,129);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (264,true,12,99);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (270,true,28,131);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (281,true,32,96);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (282,false,37,60);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (283,false,19,101);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (285,true,11,109);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (288,false,12,99);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (290,false,39,69);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (296,false,19,56);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (297,false,30,71);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (298,true,35,77);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (301,true,39,111);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (304,true,7,115);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (306,false,11,58);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (307,true,42,123);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (308,true,28,65);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (309,true,2,91);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (310,false,28,70);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (311,false,37,60);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (313,true,25,146);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (314,false,3,80);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (316,true,42,66);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (320,false,39,69);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (322,true,25,135);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (323,false,3,127);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (325,true,17,114);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (326,false,48,61);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (327,true,49,139);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (331,true,43,125);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (333,false,7,132);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (334,true,7,132);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (335,true,40,55);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (336,false,42,120);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (337,false,30,48);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (339,false,49,57);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (342,true,3,80);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (343,false,30,48);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (348,true,25,94);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (349,false,36,89);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (350,true,26,110);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (351,false,28,90);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (353,false,39,69);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (355,true,49,139);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (359,false,30,48);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (360,true,47,121);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (362,false,26,110);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (364,false,12,95);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (365,false,40,55);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (370,false,27,133);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (372,false,42,123);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (373,false,27,62);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (376,false,49,57);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (377,true,28,65);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (378,true,39,111);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (379,false,28,131);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (380,false,12,95);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (382,true,7,115);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (385,false,24,86);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (386,false,37,98);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (387,false,49,97);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (388,false,16,82);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (392,true,12,99);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (394,false,39,69);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (396,false,30,88);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (397,false,47,130);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (398,true,33,81);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (400,false,29,51);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (402,true,28,65);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (403,false,28,90);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (405,true,4,126);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (406,false,40,55);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (408,true,4,119);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (409,false,36,89);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (410,true,38,134);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (412,false,12,99);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (416,false,25,146);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (419,false,19,108);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (421,false,7,115);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (422,false,3,80);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (424,false,19,108);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (427,false,37,98);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (430,true,10,102);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (431,true,48,61);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (432,true,13,75);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (434,true,4,63);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (436,true,32,96);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (440,true,35,54);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (441,true,22,52);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (444,true,44,112);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (446,false,13,75);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (448,false,26,110);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (450,false,49,139);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (452,true,17,124);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (453,true,4,63);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (455,false,17,103);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (460,true,4,63);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (462,true,16,82);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (464,false,30,48);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (466,true,29,51);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (468,false,42,66);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (470,false,49,97);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (471,false,10,102);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (474,false,47,121);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (476,true,30,88);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (477,false,28,90);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (478,true,49,139);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (483,true,49,104);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (485,false,17,114);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (491,false,8,141);
insert into sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (494,false,37,98);

