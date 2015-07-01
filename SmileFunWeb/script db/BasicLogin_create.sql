-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2015-06-30 16:10:49.167




-- tables
-- Table Amigo
CREATE TABLE Amigo (
    amigoId int    NOT NULL  AUTO_INCREMENT,
    userHost int    NOT NULL ,
    userGuest int    NOT NULL ,
    CONSTRAINT Amigo_pk PRIMARY KEY (amigoId)
);

-- Table Foto
CREATE TABLE Foto (
    fotoId int    NOT NULL  AUTO_INCREMENT,
    url varchar(200)    NOT NULL ,
    puntuacion int    NOT NULL ,
    User_userId int    NOT NULL ,
    CONSTRAINT Foto_pk PRIMARY KEY (fotoId)
);

-- Table Login
CREATE TABLE Login (
    logId int    NOT NULL  AUTO_INCREMENT,
    user char(50)    NOT NULL ,
    password varchar(50)    NOT NULL ,
    User_userId int    NOT NULL ,
    CONSTRAINT Login_pk PRIMARY KEY (logId)
);

-- Table Puntuacion
CREATE TABLE Puntuacion (
    puntoId int    NOT NULL  AUTO_INCREMENT,
    fecha date    NOT NULL ,
    Foto_fotoId int    NOT NULL ,
    User_userId int    NOT NULL ,
    CONSTRAINT Puntuacion_pk PRIMARY KEY (puntoId)
);

-- Table Usuario
CREATE TABLE Usuario (
    userId int    NOT NULL  AUTO_INCREMENT,
    firstName varchar(100)    NOT NULL ,
    lastName varchar(100)    NOT NULL ,
    email varchar(50)    NOT NULL ,
    CONSTRAINT Usuario_pk PRIMARY KEY (userId)
);





-- foreign keys
-- Reference:  Foto_User (table: Foto)


ALTER TABLE Foto ADD CONSTRAINT Foto_User FOREIGN KEY Foto_User (User_userId)
    REFERENCES Usuario (userId);
-- Reference:  Login_User (table: Login)


ALTER TABLE Login ADD CONSTRAINT Login_User FOREIGN KEY Login_User (User_userId)
    REFERENCES Usuario (userId);
-- Reference:  Puntuacion_Foto (table: Puntuacion)


ALTER TABLE Puntuacion ADD CONSTRAINT Puntuacion_Foto FOREIGN KEY Puntuacion_Foto (Foto_fotoId)
    REFERENCES Foto (fotoId);
-- Reference:  Puntuacion_User (table: Puntuacion)


ALTER TABLE Puntuacion ADD CONSTRAINT Puntuacion_User FOREIGN KEY Puntuacion_User (User_userId)
    REFERENCES Usuario (userId);



-- End of file.

