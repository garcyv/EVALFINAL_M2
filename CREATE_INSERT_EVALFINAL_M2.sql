-- Generado por Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   en:        2020-12-04 14:16:06 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g


CREATE TABLE usuario (
    rutusuario           NUMBER(9) NOT NULL,
    usrnombre            VARCHAR2(60) NOT NULL,
    usrapellido          VARCHAR2(60) NOT NULL,
    usrfechanacimiento   DATE
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( rutusuario );

CREATE TABLE profesional (
    rutpro           NUMBER(9) NOT NULL,
    pronombres       VARCHAR2(30) NOT NULL,
    proapellidos     VARCHAR2(50) NOT NULL,
    protelefono      VARCHAR2(20) NOT NULL,
    protitulo        VARCHAR2(30) NOT NULL,
    proproyecto      VARCHAR2(100) NOT NULL,
    usuario_rutusuario number(9) not null
);

ALTER TABLE profesional ADD CONSTRAINT profesional_pk PRIMARY KEY ( rutpro );
ALTER TABLE profesional
    ADD CONSTRAINT profesional_usuario_fk FOREIGN KEY ( usuario_rutusuario )
        REFERENCES usuario ( rutusuario );
        
CREATE TABLE asesorias (
    idasesoria                   NUMBER(9) NOT NULL,
    asefecha                     DATE,
    asemotivo                    VARCHAR2(150) NOT NULL,
    profesional_rutpro           NUMBER(9) NOT NULL
);

ALTER TABLE asesorias ADD CONSTRAINT asesorias_pk PRIMARY KEY ( idasesoria ); 

ALTER TABLE asesorias
    ADD CONSTRAINT asesorias_profesional_fk FOREIGN KEY ( profesional_rutpro )
        REFERENCES profesional ( rutpro );
        
CREATE TABLE actividades (
    idactividad            NUMBER(9) NOT NULL,
    actplazodias           NUMBER(9) NOT NULL,
    actitulo               VARCHAR2(150) NOT NULL,
    actdescripcion         VARCHAR2(100) NOT NULL,
    asesorias_idasesoria   NUMBER(9) NOT NULL
);

ALTER TABLE actividades ADD CONSTRAINT actividades_pk PRIMARY KEY ( idactividad );

ALTER TABLE actividades
    ADD CONSTRAINT actividades_asesorias_fk FOREIGN KEY ( asesorias_idasesoria )
        REFERENCES asesorias ( idasesoria );
        
CREATE TABLE administrativo (
    rutadm               NUMBER(9) NOT NULL,
    admnombres          VARCHAR2(30) NOT NULL,
    admapellidos        VARCHAR2(50) NOT NULL,
    admcorreo           VARCHAR2(20) NOT NULL,
    admarea             VARCHAR2(30) NOT NULL,
    usuario_rutusuario number(9) not null
);

ALTER TABLE administrativo ADD CONSTRAINT administrativo_pk PRIMARY KEY ( rutadm );

ALTER TABLE administrativo
    ADD CONSTRAINT administrativo_usuario_fk FOREIGN KEY ( usuario_rutusuario )
        REFERENCES usuario ( rutusuario );
        
        
CREATE TABLE cliente (
    rutcliente           NUMBER(9) NOT NULL,
    clinombres           VARCHAR2(30) NOT NULL,
    cliapellidos         VARCHAR2(50) NOT NULL,
    clitelefono          VARCHAR2(20) NOT NULL,
    cliafp               VARCHAR2(30),
    clisistemasalud      NUMBER(2),
    clidireccion         VARCHAR2(100) NOT NULL,
    clicomuna            VARCHAR2(50) NOT NULL,
    cliedad              NUMBER(3) NOT NULL,
    usuario_rutusuario   NUMBER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( rutcliente );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_usuario_fk FOREIGN KEY ( usuario_rutusuario )
        REFERENCES usuario ( rutusuario );

CREATE TABLE accidente (
    idaccidente          NUMBER(9) NOT NULL,
    accifecha            DATE,
    accihora             DATE NOT NULL,
    accilugar            VARCHAR2(150) NOT NULL,
    acciorigen           VARCHAR2(100) NOT NULL,
    acciconsecuencias    VARCHAR2(100),
    cliente_rutcliente   NUMBER(9) NOT NULL
);

ALTER TABLE accidente ADD CONSTRAINT accidente_pk PRIMARY KEY ( idaccidente );

ALTER TABLE accidente
    ADD CONSTRAINT accidente_cliente_fk FOREIGN KEY ( cliente_rutcliente )
        REFERENCES cliente ( rutcliente );

CREATE TABLE capacitacion (
    idcapacitacion       NUMBER(9) NOT NULL,
    capfecha             DATE NOT NULL,
    caphora              DATE,
    caplugar             VARCHAR2(100) NOT NULL,
    capduracion          NUMBER(4),
    cliente_rutcliente   NUMBER(9) NOT NULL
);

ALTER TABLE capacitacion ADD CONSTRAINT capacitacion_pk PRIMARY KEY ( idcapacitacion );

ALTER TABLE capacitacion
    ADD CONSTRAINT capacitacion_cliente_fk FOREIGN KEY ( cliente_rutcliente )
        REFERENCES cliente ( rutcliente );

CREATE TABLE asistentes (
    idasistente                   NUMBER(9) NOT NULL,
    asistnombrecompleto           VARCHAR2(100) NOT NULL,
    asistedad                     NUMBER(3) NOT NULL,
    asistcorreo                   VARCHAR2(70),
    asisttelefono                 VARCHAR2(20),
    capacitacion_idcapacitacion   NUMBER(9)
);

ALTER TABLE asistentes ADD CONSTRAINT asistentes_pk PRIMARY KEY ( idasistente );

ALTER TABLE asistentes
    ADD CONSTRAINT asistentes_capacitacion_fk FOREIGN KEY ( capacitacion_idcapacitacion )
        REFERENCES capacitacion ( idcapacitacion );
        
CREATE TABLE visita (
    idvisita             NUMBER(9),
    visfecha             DATE NOT NULL,
    vishora              DATE,
    vislugar             VARCHAR2(50) NOT NULL,
    viscomentarios       VARCHAR2(250) NOT NULL,
    cliente_rutcliente   NUMBER(9) NOT NULL
);

ALTER TABLE visita ADD CONSTRAINT visita_pk PRIMARY KEY ( idvisita );

ALTER TABLE visita
    ADD CONSTRAINT visita_cliente_fk FOREIGN KEY ( cliente_rutcliente )
        REFERENCES cliente ( rutcliente );

CREATE TABLE chequeos (
    idchequeo          INTEGER NOT NULL,
    nombrechequeo      VARCHAR2(60),
    estadochequeo      CHAR(1),
    observaciones      VARCHAR2(100),
    visita_idvisita   NUMBER NOT NULL
);

ALTER TABLE chequeos ADD CONSTRAINT chequeos_pk PRIMARY KEY ( idchequeo );

ALTER TABLE chequeos
    ADD CONSTRAINT chequeos_visita_fk FOREIGN KEY ( visita_idvisita )
        REFERENCES visita ( idvisita );


CREATE TABLE pagos (
    idpago               NUMERIC(9)    NOT NULL,
    pagfecha             DATE,
    pagmonto             NUMBER(9) NOT NULL,
    pagmes               NUMBER(2) NOT NULL,
    paganio              NUMBER(4) NOT NULL,
    cliente_rutcliente   NUMBER(9) NOT NULL
);

ALTER TABLE pagos ADD CONSTRAINT pagos_pk PRIMARY KEY ( idpago );

ALTER TABLE pagos
    ADD CONSTRAINT pagos_cliente_fk FOREIGN KEY ( cliente_rutcliente )
        REFERENCES cliente ( rutcliente );

CREATE SEQUENCE SEQ_USUARIO_RUTUSUARIO START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE SEQ_VISITA_IDVISITA START WITH 1 NOCACHE ORDER;


-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             2
-- ALTER TABLE                             23
select * from usuario;
insert into usuario values(12500500,'Maria Juana','Figueroa','10/12/1980');
insert into usuario values(13500500,'Jose Manuel','Rojas','10/12/1988');
insert into usuario values(14500500,'Camilo','Sesto','10/12/1990');

insert into usuario values(18500500,'Ana','Torroja','10/12/1999');
insert into usuario values(19500500,'Juan','Gabriel','10/12/1990');
insert into usuario values(20500500,'Chaquira','Fuentes','10/12/1980');

insert into usuario values(10500500,'carlos','Torroja','10/12/1999');
insert into usuario values(11500500,'Miguel','Gabriel','10/12/1990');
insert into usuario values(9500500,'Fabiola','Fuentes','10/12/1980');

insert into administrativo values(15500500,'Julio','Iglesias','julioigle@gmail.com','Artista',12500500);
insert into administrativo values(16500500,'Augosto','Rojas','augustoro@gmail.com','Marketing',13500500);
insert into administrativo values(17500500,'Gabriela','Rainieri','gabri200@gmail.com','Finanzas',14500500);
select * from administrativo;

insert into profesional values(15600500,'Joselyn','Poblete','5699888877','Contador','Android',18500500);
insert into profesional values(16500500,'Augosto','Rojas','5699888877','Diseñador','Proyecto2',19500500);
insert into profesional values(17500500,'Gabriela','Rainieri','5699888877','Secretaria','Proyecto3',20500500);
select * from profesional;

insert into asesorias values(1,'01/12/2019','necesidad empresa',15600500);
insert into asesorias values(2,'01/01/2020','contable',15600500);
insert into asesorias values(3,'01/03/2020','auditoria',15600500);
select * from asesorias;

insert into actividades values(1,10,'planificacion','planifica paso 1',1);
insert into actividades values(2,10,'ejecucion','ejecuta paso 1',1);
insert into actividades values(3,10,'planificacion','planifica paso 1',2);
select * from actividades;

  INSERT INTO cliente VALUES (121245234,'Antonia','Aranda','991111111', 'AFP1', 1, 'Calle Los Aromos #123',       'SANTIAGO',23,10500500); 
  INSERT INTO cliente VALUES (224567656,'Bernarda','Barros','992222222','AFP2', 2, 'Pasaje Manuel Balmaceda #456','MAIPU',   34,11500500); 
  INSERT INTO cliente VALUES (152343212,'Carlos','Costa','993333333',   'AFP1', 1, 'Avenida Simón Bolivar #789',  'SANTIAGO',43,9500500); 

select * from cliente;

INSERT INTO ACCIDENTE VALUES(1, '01/12/2020','12/12/2020','EMPRESA DEL ACCIDENTADO', 'POR PAVO', 'MURIO',152343212);

  INSERT INTO ACCIDENTE VALUES(2, '02/12/2020','12/12/2020','EMPRESA DEL ACCIDENTADO', 'POR PAVO', 'MURIO',121245234);
  INSERT INTO ACCIDENTE VALUES(3, '03/12/2020','12/12/2020','EMPRESA DEL ACCIDENTADO', 'POR PAVO', 'MURIO',121245234);
  INSERT INTO ACCIDENTE VALUES(4, '01/12/2020','12/12/2020','EMPRESA DEL ACCIDENTADO', 'POR PAVO', 'MURIO',224567656);
  INSERT INTO ACCIDENTE VALUES(5, '10/12/2020','12/12/2020','EMPRESA DEL ACCIDENTADO', 'POR PAVO', 'MURIO',224567656);
  INSERT INTO ACCIDENTE VALUES(6, '30/12/2020','12/12/2020','EMPRESA DEL ACCIDENTADO', 'POR PAVO', 'MURIO',152343212);
  INSERT INTO ACCIDENTE VALUES(7, '31/12/2020','12/12/2020','EMPRESA DEL ACCIDENTADO', 'POR PAVO', 'MURIO',152343212);

