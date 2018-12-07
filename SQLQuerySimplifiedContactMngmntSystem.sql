CREATE DATABASE SimplifiedContactManagementSystem

USE SimplifiedContactManagementSystem

CREATE TABLE Contacts(ContactId INT IDENTITY(1,1) PRIMARY KEY,
ContactName VARCHAR(40),Location VARCHAR(40))

INSERT INTO Contacts VALUES('Pournami','Kozhencherry'),
('Reshma','Chengannur'),('Jincy','Kollam') 

SELECT * FROM Contacts

