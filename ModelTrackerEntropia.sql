﻿--CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
--SELECT md5(random()::text || clock_timestamp()::text)::uuid

--CREATE EXTENSION "pgcrypto";
--SELECT gen_random_uuid()

/*
    *********************************** Model Data Tracker ***********************************
*/

DROP TABLE IF EXISTS  Usuario_Rol CASCADE;
DROP TABLE IF EXISTS  Rol CASCADE;
DROP TABLE IF EXISTS  Usuario CASCADE;
DROP TABLE IF EXISTS  Vehiculo CASCADE;
DROP TABLE IF EXISTS  TipoVehiculo CASCADE;


/*
    *********************************** Tabla TipoVehiculo ***********************************
*/

CREATE TABLE TipoVehiculo (
  Codigo_id 	UUID DEFAULT gen_random_uuid(),
  Nombre    	VARCHAR NULL,
  Create_at 	TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  Update_at 	TIMESTAMP,
  PRIMARY KEY (Codigo_id)
);


/*
    *********************************** Tabla Vehiculo ***********************************
*/

CREATE TABLE Vehiculo (
  Codigo_id 		  UUID DEFAULT gen_random_uuid(),
  Placa		          VARCHAR(100) NOT NULL UNIQUE,
  Marca	                  VARCHAR(100) NOT NULL,
  Modelo                  VARCHAR(100) NOT NULL,
  CodigoInterno           VARCHAR(100) NOT NULL,
  Descripcion 		  TEXT         NULL,
  Estado     		  BOOLEAN DEFAULT false,
  TipoVehiculo_id         UUID      NULL,
  Create_at               TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  Update_at               TIMESTAMP,
  PRIMARY KEY (Codigo_id),
  CONSTRAINT fk_vehiculo_tipovehiculo FOREIGN KEY (TipoVehiculo_id) REFERENCES TipoVehiculo (Codigo_id) ON DELETE CASCADE
);

/*
    *********************************** Tabla Usuario ***********************************
*/

CREATE TABLE Usuario (
  Codigo_id 		  UUID DEFAULT gen_random_uuid(),
  Email                   VARCHAR(100) NULL UNIQUE,
  Password   		  VARCHAR(100) NOT NULL,
  Password_decrip         VARCHAR(100) NULL,
  Estado     		  BOOLEAN DEFAULT false,
  Persona_id	 	  UUID      NOT NULL,
  Create_at  		  TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  Update_at  		  TIMESTAMP,
  PRIMARY KEY (Codigo_id),
  CONSTRAINT fk_usuario_persona FOREIGN KEY (Persona_id) REFERENCES Persona (Codigo_id) ON DELETE CASCADE
);

/*
    *********************************** Tabla Rol ***********************************
*/

CREATE TABLE Rol (
  Codigo_id   UUID DEFAULT gen_random_uuid(),
  Nombre      VARCHAR(200) NOT NULL,
  Estado      BOOLEAN   DEFAULT FALSE,
  Descripcion TEXT         NULL,
  Create_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  Update_at   TIMESTAMP,
  PRIMARY KEY (Codigo_id)
);


/*
    *********************************** Tabla usuario_rol ***********************************
*/

CREATE TABLE Usuario_Rol (
  Usuario_id      UUID NOT NULL,
  Rol_id          UUID NOT NULL,
  Fcaducidad 	  TIMESTAMP,
  Create_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  Update_at TIMESTAMP,
  PRIMARY KEY (Usuario_id, Rol_id),
  CONSTRAINT fk_user_rol_users FOREIGN KEY (Usuario_id) REFERENCES Usuario (Codigo_id) ON DELETE CASCADE ,
  CONSTRAINT fk_user_rol_rol FOREIGN KEY (Rol_id) REFERENCES Rol (Codigo_id) ON DELETE CASCADE
);