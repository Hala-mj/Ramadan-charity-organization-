create schema Ramadan_charity;
USE Ramadan_charity;

CREATE TABLE DONEE (
    DoneeID     INT(10)     UNIQUE     NOT NULL ,
    fName       VARCHAR(50),
    lName       VARCHAR(50),
    street      VARCHAR(100),
    city        VARCHAR(50),
    PhoneNo     VARCHAR(20),
    certificate VARCHAR(100),
    birthdate   DATE,
    CONSTRAINT DONEE_pk PRIMARY KEY (doneeID)
);

CREATE TABLE Driver (
    DriverNumber   INT(10)          NOT NULL,
    Name           VARCHAR(50),
    phonenumber       VARCHAR(20),
   DoneeID            INT     NOT NULL,
	CONSTRAINT Driver_pk PRIMARY KEY ( DriverNumber),
    CONSTRAINT Donee_FK FOREIGN KEY (DoneeID) REFERENCES Donee(DoneeID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DONOR (
    NationalID    INT(10)         UNIQUE    NOT NULL,
    fName         VARCHAR(50),
    lName         VARCHAR(50),
    phoneNo       VARCHAR(20),
    bankaccdata   VARCHAR(100),
    BasketNo      INT(10)         UNIQUE    NOT NULL,
	CONSTRAINT DONOR_pk PRIMARY KEY (nationalID),
    CONSTRAINT DONOR_FK1  FOREIGN KEY (BasketNo) REFERENCES RAMADN_BASKET(Basketnumber) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE DONETS (
DnationalID    INT(10)        NOT NULL,
DoneeID        INT(10)        NOT NULL,
CONSTRAINT DONETS_pk PRIMARY KEY (DnationalID ,DoneeID),
CONSTRAINT DONETS_FK1  FOREIGN KEY (DnationalID) REFERENCES DONOR(NationalID)ON DELETE CASCADE ON UPDATE CASCADE ,
CONSTRAINT DONETS_FK2  FOREIGN KEY (DoneeID) REFERENCES DONEE(DoneeID)ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DEPENDENT (
 DoneeID        INT(10)         NOT NULL,
 name           VARCHAR(50)   UNIQUE   NOT NULL,
 Gender         VARCHAR(10) CHECK(gender IN('F','M')),
Birthdate Date,
 CONSTRAINT DEPENDENT_pk PRIMARY KEY (DoneeID,name),
 CONSTRAINT DEPENDENT_FK1 FOREIGN KEY ( DoneeID ) REFERENCES DONEE(DoneeID)ON DELETE CASCADE ON UPDATE CASCADE
 );


CREATE TABLE RAMADN_BASKET(
Basketnumber   INT(20)  UNIQUE   NOT NULL,
price          INT(10),
foodsupply     VARCHAR(100),
DriverNo       INT(10),
doneeID        INT(10),
CONSTRAINT RAMADN_BASKET_pk PRIMARY KEY (Basketnumber),
CONSTRAINT RAMADN_BASKET_FK1 FOREIGN KEY (DriverNo) REFERENCES DRIVER(Drivernumber) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT RAMADN_BASKET_FK2 FOREIGN KEY (doneeID) REFERENCES  DONEE(DoneeID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE EMPLOYEES(
ID         INT(9)       NOT NULL   UNIQUE,
fName      VARCHAR(10)      NOT NULL,
lName      VARCHAR(10)  NOT NULL,
phoneNo    INT(10) ,
EMAIL      VARCHAR(50),
Birth_date INT(8),
CONSTRAINT EMPLOYEES_pk PRIMARY KEY (ID)
);

CREATE TABLE CHESKS_Basket(
Eid          INT(9)    NOT NULL,
BbasketNo    INT(10)   NOT NULL,
CONSTRAINT CHESKS_Basket_pk PRIMARY KEY (Eid,BbasketNo),
CONSTRAINT CHESKS_Basket_FK1  FOREIGN KEY (Eid) REFERENCES EMPLOYEES(ID)ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT CHESKS_Basket_FK2  FOREIGN KEY (BbasketNo) REFERENCES RAMADN_BASKET(Basketnumber)ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DEPARTMENT(
    DepartmentNo            INT (10)   NOT NULL  UNIQUE,
    DepartmentManager       INT(50),
    DriverNo                INT(10),
	CONSTRAINT DEPARTMENT_pk PRIMARY KEY ( DepartmentNo),
    CONSTRAINT DEPARTMENT_FK1 FOREIGN KEY (DriverNo) REFERENCES DRIVER(Drivernumber) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT DEPARTMENT_FK2 FOREIGN KEY (DepartmentManager) REFERENCES EMPLOYEES(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DEPT_LOCATIONS(
Dnumber           INT(20)     Not Null,
Dlocation         VARCHAR(50)     Not Null,
CONSTRAINT DEPT_LOCATIONS_pk PRIMARY KEY ( Dnumber, Dlocation),
CONSTRAINT DEPT_LOCATIONS_FK1 FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT (DepartmentNo)ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CHECKS_EMP (
EMPID     INT(9)  NOT NULL,
DoneeID   INT(9)  NOT NULL,
CONSTRAINT CHECKS_EMP_pk PRIMARY KEY ( EMPID, DoneeID),
CONSTRAINT CHECKS_EMP_FK1 FOREIGN KEY (EMPID) REFERENCES EMPLOYEES (ID)ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT CHECKS_EMP_FK2 FOREIGN KEY (DoneeID) REFERENCES DONEE(DoneeID)ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO DONEE (DoneeID, fName, lName, street, city, PhoneNo, certificate, birthdate)
VALUES
    (1, 'John', 'Doe', '123 Main St', 'New York', '555-1234', 'ABC123', '1990-05-15'),
    (2, 'Jane', 'Smith', '456 Elm St', 'Los Angeles', '555-5678', 'DEF456', '1988-09-20'),
    (3, 'Alice', 'Johnson', '789 Oak St', 'Chicago', '555-9101', 'GHI789', '1995-02-10'),
    (4, 'Bob', 'Williams', '321 Pine St', 'San Francisco', '555-1112', 'JKL012', '1992-11-30'),
    (5, 'Emily', 'Brown', '654 Maple St', 'Houston', '555-1314', 'MNO345', '1997-07-25');

INSERT INTO EMPLOYEES (ID, fName, lName, phoneNo, EMAIL, Birth_date)
VALUES
    (1, 'John', 'Doe', 555123456, 'john.doe@example.com', 19900101),
    (2, 'Jane', 'Smith', 555234567, 'jane.smith@example.com', 19890202),
    (3, 'Alice', 'Johnson', 555345678, 'alice.johnson@example.com', 19950303),
    (4, 'Bob', 'Williams', 555456789, 'bob.williams@example.com', 19921104),
    (5, 'Emily', 'Brown', 555567890, 'emily.brown@example.com', 19970705);
    
   INSERT INTO DONETS (DnationalID, DoneeID)
   VALUES 
   (111337692,1),
   (111337692,3),
   (872204195,2),
   (133356689,3),
   (222778822,4),
   (000076930,5);
   
 INSERT INTO DEPENDENT (DoneeID, name, Gender, BirthDate)
VALUES
(1, 'Ali', 'M', '2005-03-15'),
(1, 'Lucy', 'F', '2007-08-23'),
(2, 'Sufi', 'F', '2009-05-10'),
(3, 'Justin', 'M', '2011-11-02'),
(4, 'Shaima', 'F', '2014-09-18'),
(5, 'Tyler', 'M', '2016-06-07');
 
INSERT INTO DRIVER  (Drivernumber , name , phonenumber )
VALUES
(8,'ahmad',123),
(7,'moaad',33),
(6,'mohammed',987),
(5,'ali',100),
(4,'salah',202);


INSERT INTO RAMADN_BASKET (Basketnumber , price , foodsupply, DriverNo, doneeID )
VALUES
(101,111,'vegetables',8, 1),
(102,77,'milk',7,2),
(103,86,'fruits',6,3),
(104,445,'egg',5,4),
(105,90,'fish',4,5);

INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES
(01, 'New York'),
(02, 'Los Angeles'),
(03, 'Chicago'),
(04, 'San Francisco'),
(05, 'Houston');

INSERT INTO DONOR (NationalID, fName, lName, phoneNo, bankaccdata, BasketNo)
VALUES 
 (111337692, 'hala', 'jalal', 0567429053, 1111111111, 101),
 (872204195, 'shaima', 'Alsharif', 0576243954, 2222222222, 102),
 (133356689, 'reem', 'Alahmadi', 0570989537, 3333333333, 103),
 (222778822, 'remas', 'baroum', 0563243856, 4444444444, 104),
(000076930, 'layan', 'siam', 0548737219, 5555555555, 105);




INSERT INTO DEPARTMENT (DepartmentNo, DepartmentManager, DriverNo)
VALUES
(01, 1, 8),
(02, 2, 7),
(03, 3, 6),
(04, 4, 5),
(05, 5, 4);


INSERT INTO CHECKS EMP (EMPID , DoneeID)
VALUES
(1,1),  
(2,2),
(3,3),
(4,4),
(5,5);

INSERT INTO CHESKS_Basket ( EID , BbasketNo)
VALUES
(1, 101),
(1, 102),
(2, 104),
(3, 103),
(4, 103),
(5, 105);
select * from  RAMADN_BASKET ;

UPDATE DRIVER
SET Drivernumber = 10
WHERE Drivernumber = 8;
SELECT * 
FROM  DRIVER;



UPDATE DEPT_LOCATIONS
SET Dlocation = 'California'
WHERE Dnumber = 05;
SELECT * 
FROM  DEPT_LOCATIONS;

UPDATE EMPLOYEES
SET fName = 'sara'
WHERE ID = 5;
SELECT * 
FROM  EMPLOYEES;

UPDATE RAMADN_BASKET
SET price = price-50
where doneeID IN (SELECT doneeID
FROM DEPENDENT
GROUP BY doneeID
HAVING count(*)>);


DELETE FROM RAMADN_BASKET WHERE doneeID = 5;


select DoneeID, fName, lName, birthdate, TIMESTAMPDIFF(YEAR,birthdate,CURDATE()) AS AGE
FROM donee;


SELECT Basketnumber, price 
FROM ramadn_basket
WHERE price >= 70 AND price <= 100
UNION ALL
SELECT 'total', SUM(price) AS TotalPriceFrom70To100
FROM ramadn_basket
WHERE price >= 70 AND price <= 100;



 SELECT fName , lName, certificate 
 FROM donee 
 WHERE DoneeID IN (SELECT DoneeID FROM CHECKS_EMP WHERE certificate like '%1%');
 
 
SELECT d.fName, d.lName, d.donee ID, d.certificate, ce.EMPID
FROM Donee d 
JOIN CHECKS_EMP ce ON d.doneeID = ce. DoneeID 
GROUP BY d.fName, d.lName, d.doneeID, d.certificate, ce.EMPID 
ORDER BY d.fName ASC;



SELECT * FROM ramadan_charity.donor WHERE fName like '__s%';

SELECT Drivernumber , name , phonenumber
FROM   DRIVER
ORDER BY 1 DESC;


SELECT *
FROM EMPLOYEES   
ORDER BY  fName ASC ,  lName DESC;  

SELECT Drivernumber, name 
FROM DRIVER 
WHERE Drivernumber > 6 OR name = 'ahmad';

SELECT Basketnumber, price 
FROM rasadn_basket
union all 
SELECT 'avg', AVG(price) as priceavg
from ramadn_basket
order by Basketnumber desc;


SELECT d.DoneeID, d.fName, d.PhoneNo,
b.Basketnumber, b.price
FROM DONEE AS d
JOIN RAMADN_BASKET AS b
ON d.DoneeID = b.doneeID;

            