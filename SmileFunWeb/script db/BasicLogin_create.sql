-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2015-06-24 10:32:22.908




-- tables
-- Table Login
CREATE TABLE Login (
    logId int    NOT NULL ,
    user char(50)    NOT NULL ,
    password varchar(50)    NOT NULL ,
    User_userId int    NOT NULL ,
    CONSTRAINT Login_pk PRIMARY KEY (logId)
);

-- Table User
CREATE TABLE User (
    userId int    NOT NULL ,
    firstName varchar(100)    NOT NULL ,
    lastName varchar(100)    NOT NULL ,
    email varchar(50)    NOT NULL ,
    CONSTRAINT User_pk PRIMARY KEY (userId)
);





-- foreign keys
-- Reference:  Login_User (table: Login)


ALTER TABLE Login ADD CONSTRAINT Login_User FOREIGN KEY Login_User (User_userId)
    REFERENCES User (userId);



-- End of file.

