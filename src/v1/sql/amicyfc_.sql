
-----------------------------------------------------------------------------
-- cliente
-----------------------------------------------------------------------------
DROP TABLE cliente CASCADE;


CREATE TABLE cliente
(
                                    clidcliente serial,
                                    clnombre varchar (50) default '' NOT NULL,
                                    clnif varchar (20) default '' NOT NULL,
                                    cldireccion varchar (50) default '',
                                      -- REFERENCES localidad (loidlocalidad)
    clidlocalidad integer default -1 NOT NULL,
                                    clcp varchar (5) default '',
                                    cltelefono varchar (10) default '',
                                    clfax varchar (10) default '',
                                    clemail varchar (75) default '',
                                    clfechaalta varchar (8) default '',
                                    clmovil varchar (10) default '',
    PRIMARY KEY (clidcliente)
);


-----------------------------------------------------------------------------
-- instalacion
-----------------------------------------------------------------------------
DROP TABLE instalacion CASCADE;


CREATE TABLE instalacion
(
                                    inidinstalacion serial,
                                      -- REFERENCES cliente (clidcliente)
    inidcliente integer default -1 NOT NULL,
                                    innombre varchar (50) default '' NOT NULL,
                                    infechaalta varchar (8) default '',
                                    incontacto varchar (50) default '' NOT NULL,
                                    incontactotelefono varchar (10) default '',
                                    intecnico varchar (50) default '' NOT NULL,
                                    intecnicotelefono varchar (10) default '',
                                    inadministrador varchar (50) default '' NOT NULL,
                                    inadministradortelefono varchar (10) default '',
                                    innumeroregistro varchar (50) default '' NOT NULL,
                                    inproyecto integer default -1 NOT NULL,
                                    inimporte numeric (9,2) default 0 NOT NULL,
                                    infechacontrato varchar (8) default '',
                                    inaniosvigencia integer default 1 NOT NULL,
    PRIMARY KEY (inidinstalacion)
);


-----------------------------------------------------------------------------
-- localidad
-----------------------------------------------------------------------------
DROP TABLE localidad CASCADE;


CREATE TABLE localidad
(
                                    loidlocalidad serial,
                                      -- REFERENCES provincia (pvidprovincia)
    loidprovincia integer default -1 NOT NULL,
                                    lonombre varchar (75) default '' NOT NULL,
    PRIMARY KEY (loidlocalidad)
);


-----------------------------------------------------------------------------
-- maquina
-----------------------------------------------------------------------------
DROP TABLE maquina CASCADE;


CREATE TABLE maquina
(
                                    maidmaquina serial,
                                      -- REFERENCES instalacion (inidinstalacion)
    maidinstalacion integer default -1 NOT NULL,
                                      -- REFERENCES protocolo (pridprotocolo)
    maidprotocolo integer default -1 NOT NULL,
                                    manombre varchar (50) default '' NOT NULL,
                                    mafechaalta varchar (8) default '',
                                    mafechagarantia varchar (8) default '',
    PRIMARY KEY (maidmaquina)
);


-----------------------------------------------------------------------------
-- mantenimiento
-----------------------------------------------------------------------------
DROP TABLE mantenimiento CASCADE;


CREATE TABLE mantenimiento
(
                                    mnidmantenimiento serial,
                                      -- REFERENCES maquina (maidmaquina)
    mnidmaquina integer default -1 NOT NULL,
                                      -- REFERENCES perfil (peidperfil)
    mnidperfil integer default -1 NOT NULL,
                                      -- REFERENCES kilometraje (kmidkilometraje)
    mnidkilometraje integer default -1 NOT NULL,
                                    mnfecha varchar (8) default '' NOT NULL,
                                    mnfrecuencia integer default 0 NOT NULL,
                                    mnhoras numeric (9,2) default 0,
                                    mnkm numeric (9,2) default 0,
                                    mnimporte numeric (9,2) default 0,
                                    mndescuento numeric (9,2) default 0,
    PRIMARY KEY (mnidmantenimiento)
);


-----------------------------------------------------------------------------
-- maquina_caracteristicas
-----------------------------------------------------------------------------
DROP TABLE maquina_caracteristicas CASCADE;


CREATE TABLE maquina_caracteristicas
(
                                    mcidmaquinacaracteristicas serial,
                                      -- REFERENCES maquina (maidmaquina)
    mcidmaquina integer default -1 NOT NULL,
                                      -- REFERENCES protocolo_caracteristicas (pcidprotocolocaracteristicas)
    mcidprotocolocaracteristicas integer default -1 NOT NULL,
                                    mcvalor varchar (20) default '' NOT NULL,
    PRIMARY KEY (mcidmaquinacaracteristicas)
);


-----------------------------------------------------------------------------
-- maquina_mantenimientos
-----------------------------------------------------------------------------
DROP TABLE maquina_mantenimientos CASCADE;


CREATE TABLE maquina_mantenimientos
(
                                    mmidmaquinamantenimientos serial,
                                      -- REFERENCES protocolo_mantenimientos (pmidprotocolomantenimientos)
    mmidprotocolomantenimientos integer default -1 NOT NULL,
                                      -- REFERENCES mantenimiento (mnidmantenimiento)
    mmidmantenimiento integer default -1 NOT NULL,
                                    mmvalor varchar (20) default '' NOT NULL,
    PRIMARY KEY (mmidmaquinamantenimientos)
);


-----------------------------------------------------------------------------
-- protocolo
-----------------------------------------------------------------------------
DROP TABLE protocolo CASCADE;


CREATE TABLE protocolo
(
                                    pridprotocolo serial,
                                    prnombre varchar (100) default '' NOT NULL,
                                    prvisible integer default 1 NOT NULL,
    PRIMARY KEY (pridprotocolo)
);


-----------------------------------------------------------------------------
-- protocolo_caracteristicas
-----------------------------------------------------------------------------
DROP TABLE protocolo_caracteristicas CASCADE;


CREATE TABLE protocolo_caracteristicas
(
                                    pcidprotocolocaracteristicas serial,
                                      -- REFERENCES protocolo (pridprotocolo)
    pcidprotocolo integer default -1 NOT NULL,
                                    pcnombre varchar (200) default '' NOT NULL,
                                    pctipo integer default 2 NOT NULL,
    PRIMARY KEY (pcidprotocolocaracteristicas)
);


-----------------------------------------------------------------------------
-- protocolo_mantenimientos
-----------------------------------------------------------------------------
DROP TABLE protocolo_mantenimientos CASCADE;


CREATE TABLE protocolo_mantenimientos
(
                                    pmidprotocolomantenimientos serial,
                                      -- REFERENCES protocolo (pridprotocolo)
    pmidprotocolo integer default -1 NOT NULL,
                                    pmnombre varchar (200) default '' NOT NULL,
                                    pmtipo integer default 2 NOT NULL,
                                    pmfrecuencia integer default 0 NOT NULL,
    PRIMARY KEY (pmidprotocolomantenimientos)
);


-----------------------------------------------------------------------------
-- provincia
-----------------------------------------------------------------------------
DROP TABLE provincia CASCADE;


CREATE TABLE provincia
(
                                    pvidprovincia serial,
                                    pvnombre varchar (75) default '' NOT NULL,
    PRIMARY KEY (pvidprovincia)
);


-----------------------------------------------------------------------------
-- correctivo
-----------------------------------------------------------------------------
DROP TABLE correctivo CASCADE;


CREATE TABLE correctivo
(
                                    coidcorrectivo serial,
                                      -- REFERENCES instalacion (inidinstalacion)
    coidinstalacion integer default -1 NOT NULL,
                                      -- REFERENCES perfil (peidperfil)
    coidperfil integer default -1 NOT NULL,
                                      -- REFERENCES kilometraje (kmidkilometraje)
    coidkilometraje integer default -1 NOT NULL,
                                    cofechaaceptacion varchar (8) default '' NOT NULL,
                                    cofechacierre varchar (8) default '',
                                    cofechafacturacion varchar (8) default '',
                                    coincidencia varchar (1000) default '' NOT NULL,
                                    cosolucion varchar (1000) default '' NOT NULL,
                                    cotiempoestimado numeric (9,2) default 0,
                                    cocontacto varchar (50) default '',
                                    cotecnico varchar (50) default '',
                                    cohoras numeric (9,2) default 0,
                                    cokm numeric (9,2) default 0,
                                    coimporte numeric (9,2) default 0,
                                    codescuento numeric (9,2) default 0,
                                    codisposicionservicio numeric (9,2) default 0,
    PRIMARY KEY (coidcorrectivo)
);


-----------------------------------------------------------------------------
-- perfil
-----------------------------------------------------------------------------
DROP TABLE perfil CASCADE;


CREATE TABLE perfil
(
                                    peidperfil serial,
                                    penombre varchar (75) default '' NOT NULL,
                                    pevalor numeric (9,2) default 0 NOT NULL,
    PRIMARY KEY (peidperfil)
);


-----------------------------------------------------------------------------
-- kilometraje
-----------------------------------------------------------------------------
DROP TABLE kilometraje CASCADE;


CREATE TABLE kilometraje
(
                                    kmidkilometraje serial,
                                    kmnombre varchar (75) default '' NOT NULL,
                                    kmvalor numeric (9,2) default 0 NOT NULL,
    PRIMARY KEY (kmidkilometraje)
);


-----------------------------------------------------------------------------
-- material
-----------------------------------------------------------------------------
DROP TABLE material CASCADE;


CREATE TABLE material
(
                                    mtidmaterial serial,
                                      -- REFERENCES correctivo (coidcorrectivo)
    mtidcorrectivo integer default -1 NOT NULL,
                                    mtconcepto varchar (75) default '' NOT NULL,
                                    mtunidades numeric (9,2) default 0 NOT NULL,
                                    mtdescuento numeric (9,2) default 0 NOT NULL,
                                    mtimporte numeric (9,2) default 0 NOT NULL,
    PRIMARY KEY (mtidmaterial)
);


-----------------------------------------------------------------------------
-- configuracion
-----------------------------------------------------------------------------
DROP TABLE configuracion CASCADE;


CREATE TABLE configuracion
(
                                    cnidconfiguracion serial,
                                    cnvalor integer default 0 NOT NULL,
                                    cntipocorrectivo integer default 0 NOT NULL,
                                    cncontrato integer default 0 NOT NULL,
    PRIMARY KEY (cnidconfiguracion)
);


----------------------------------------------------------------------
-- configuracion                                                      
----------------------------------------------------------------------

ALTER TABLE cliente
    ADD CONSTRAINT cliente_FK_1 FOREIGN KEY (clidlocalidad)
    REFERENCES localidad (loidlocalidad)
;

----------------------------------------------------------------------
-- cliente                                                      
----------------------------------------------------------------------

ALTER TABLE instalacion
    ADD CONSTRAINT instalacion_FK_1 FOREIGN KEY (inidcliente)
    REFERENCES cliente (clidcliente)
;

----------------------------------------------------------------------
-- instalacion                                                      
----------------------------------------------------------------------

ALTER TABLE localidad
    ADD CONSTRAINT localidad_FK_1 FOREIGN KEY (loidprovincia)
    REFERENCES provincia (pvidprovincia)
;

----------------------------------------------------------------------
-- localidad                                                      
----------------------------------------------------------------------

ALTER TABLE maquina
    ADD CONSTRAINT maquina_FK_1 FOREIGN KEY (maidprotocolo)
    REFERENCES protocolo (pridprotocolo)
;
ALTER TABLE maquina
    ADD CONSTRAINT maquina_FK_2 FOREIGN KEY (maidinstalacion)
    REFERENCES instalacion (inidinstalacion)
;

----------------------------------------------------------------------
-- maquina                                                      
----------------------------------------------------------------------

ALTER TABLE mantenimiento
    ADD CONSTRAINT mantenimiento_FK_1 FOREIGN KEY (mnidmaquina)
    REFERENCES maquina (maidmaquina)
;
ALTER TABLE mantenimiento
    ADD CONSTRAINT mantenimiento_FK_2 FOREIGN KEY (mnidperfil)
    REFERENCES perfil (peidperfil)
;
ALTER TABLE mantenimiento
    ADD CONSTRAINT mantenimiento_FK_3 FOREIGN KEY (mnidkilometraje)
    REFERENCES kilometraje (kmidkilometraje)
;

----------------------------------------------------------------------
-- mantenimiento                                                      
----------------------------------------------------------------------

ALTER TABLE maquina_caracteristicas
    ADD CONSTRAINT maquina_caracteristicas_FK_1 FOREIGN KEY (mcidprotocolocaracteristicas)
    REFERENCES protocolo_caracteristicas (pcidprotocolocaracteristicas)
;
ALTER TABLE maquina_caracteristicas
    ADD CONSTRAINT maquina_caracteristicas_FK_2 FOREIGN KEY (mcidmaquina)
    REFERENCES maquina (maidmaquina)
    ON UPDATE CASCADE
    ON DELETE CASCADE 
;

----------------------------------------------------------------------
-- maquina_caracteristicas                                                      
----------------------------------------------------------------------

ALTER TABLE maquina_mantenimientos
    ADD CONSTRAINT maquina_mantenimientos_FK_1 FOREIGN KEY (mmidmantenimiento)
    REFERENCES mantenimiento (mnidmantenimiento)
    ON UPDATE CASCADE
    ON DELETE CASCADE 
;
ALTER TABLE maquina_mantenimientos
    ADD CONSTRAINT maquina_mantenimientos_FK_2 FOREIGN KEY (mmidprotocolomantenimientos)
    REFERENCES protocolo_mantenimientos (pmidprotocolomantenimientos)
;

----------------------------------------------------------------------
-- maquina_mantenimientos                                                      
----------------------------------------------------------------------


----------------------------------------------------------------------
-- protocolo                                                      
----------------------------------------------------------------------

ALTER TABLE protocolo_caracteristicas
    ADD CONSTRAINT protocolo_caracteristicas_FK_1 FOREIGN KEY (pcidprotocolo)
    REFERENCES protocolo (pridprotocolo)
;

----------------------------------------------------------------------
-- protocolo_caracteristicas                                                      
----------------------------------------------------------------------

ALTER TABLE protocolo_mantenimientos
    ADD CONSTRAINT protocolo_mantenimientos_FK_1 FOREIGN KEY (pmidprotocolo)
    REFERENCES protocolo (pridprotocolo)
;

----------------------------------------------------------------------
-- protocolo_mantenimientos                                                      
----------------------------------------------------------------------


----------------------------------------------------------------------
-- provincia                                                      
----------------------------------------------------------------------

ALTER TABLE correctivo
    ADD CONSTRAINT correctivo_FK_1 FOREIGN KEY (coidinstalacion)
    REFERENCES instalacion (inidinstalacion)
;
ALTER TABLE correctivo
    ADD CONSTRAINT correctivo_FK_2 FOREIGN KEY (coidperfil)
    REFERENCES perfil (peidperfil)
;
ALTER TABLE correctivo
    ADD CONSTRAINT correctivo_FK_3 FOREIGN KEY (coidkilometraje)
    REFERENCES kilometraje (kmidkilometraje)
;

----------------------------------------------------------------------
-- correctivo                                                      
----------------------------------------------------------------------


----------------------------------------------------------------------
-- perfil                                                      
----------------------------------------------------------------------


----------------------------------------------------------------------
-- kilometraje                                                      
----------------------------------------------------------------------

ALTER TABLE material
    ADD CONSTRAINT material_FK_1 FOREIGN KEY (mtidcorrectivo)
    REFERENCES correctivo (coidcorrectivo)
    ON DELETE CASCADE 
;

----------------------------------------------------------------------
-- material                                                      
----------------------------------------------------------------------

