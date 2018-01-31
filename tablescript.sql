DROP TABLE OrderLine CASCADE CONSTRAINTS;
DROP TABLE Orders CASCADE CONSTRAINTS;
DROP TABLE FoodItems CASCADE CONSTRAINTS;
DROP SEQUENCE Prices_FoodItemTypeID_SEQ;
DROP TABLE Prices CASCADE CONSTRAINTS;
DROP TABLE Members CASCADE CONSTRAINTS;
DROP TABLE Position CASCADE CONSTRAINTS;
DROP TABLE Campus CASCADE CONSTRAINTS;

-- Campus
CREATE TABLE Campus (
    CampusID          varchar2(5) PRIMARY KEY,
    CampusName        varchar2(100),
    Street            varchar2(100),
    City              varchar2(100),
    State             varchar2(100),
    Zip               varchar2(100),
    Phone             varchar2(100),
    CampusDiscount    decimal (2,2)
);

-- Position
CREATE TABLE Position (
    PositionID        varchar2(5) PRIMARY KEY,
    Position          varchar2(100),
    YearlyMembershipFee  decimal (7,2)
);


-- Members
CREATE TABLE Members (
    MemberID          varchar2(5) PRIMARY KEY,
    LastName          varchar2(100),
    FirstName         varchar2(100),
    CampusAddress     varchar2(100),
    CampusPhone       varchar2(100),
    CampusID          varchar2(5) REFERENCES Campus,
    PositionID        varchar2(5) REFERENCES Position,
    ContractDuration  INTEGER
);
                       
-- Sequence
CREATE SEQUENCE Prices_FoodItemTypeID_SEQ
    START WITH 1
        INCREMENT BY 1
        NOCACHE
        NOCYCLE;

-- Prices
CREATE TABLE Prices (
    FoodItemTypeID    varchar2(5) PRIMARY KEY,
        MealType          varchar2(100),
        MealPrice         decimal(7,2)
);

-- Food Items
CREATE TABLE FoodItems (
    FoodItemID      varchar2(5) PRIMARY KEY ,
    FoodItemName    varchar2(100),
    FoodItemTypeID  varchar2(5) REFERENCES Prices
);

-- Orders
CREATE TABLE Orders (
    OrderID      varchar2(5) PRIMARY KEY ,
    MemberID     varchar2(5) REFERENCES Members,
    OrderDate    varchar2(25)
);


-- Order Line
CREATE TABLE OrderLine (
    OrderID      varchar2(5) REFERENCES Orders,
    FoodItemsID  varchar2(5) REFERENCES FoodItems(FoodItemID),
    Quantity     INTEGER,
PRIMARY KEY (OrderID, FoodItemsID)
);
     
---------- STEP 2 ------
-- Campus
INSERT INTO Campus 
VALUES ('1', 'IUPUI', '425 University Blvd.','Indianapolis', 'IN', '46202', '317-274-4591',.08 );

INSERT INTO Campus 
VALUES ('2', 'Indiana University', '107 S. Indiana Ave.','Bloomington', 'IN', '47405', '812-855-4848',.07 );

INSERT INTO Campus
VALUES ('3', 'Purdue University', '475 Stadium Mall Drive','West Lafayette', 'IN', '47907', '765-494-1776',.06 );

-- Position
INSERT INTO Position
VALUES ('1', 'Lecturer', 1050.50);

INSERT INTO Position
VALUES ('2', 'Associate Professor', 900.50);

INSERT INTO Position
VALUES ('3', 'Assistant Professor', 875.50);

INSERT INTO Position
VALUES ('4', 'Professor', 700.75);

INSERT INTO Position
VALUES ('5', 'Full Professor', 500.50);

-- Members
INSERT INTO Members
VALUES ('1', 'Ellen', 'Monk', '009 Purnell', '812-123-1234', '2', '5', 12);

INSERT INTO Members
VALUES ('2', 'Joe', 'Brady', '008 Statford Hall', '765-234-2345', '3', '2', 10);

INSERT INTO Members
VALUES ('3', 'Dave', 'Davidson', '007 Purnell', '812-345-3456', '2', '3', 10);

INSERT INTO Members
VALUES ('4', 'Sebastian', 'Cole', '210 Rutherford Hall', '765-234-2345', '3', '5', 10);

INSERT INTO Members
VALUES ('5', 'Michael', 'Doo', '66C Peobody', '812-548-8956', '2', '1', 10);

INSERT INTO Members
VALUES ('6', 'Jerome', 'Clark', 'SL 220', '317-274-9766', '1', '1', 12);

INSERT INTO Members
VALUES ('7', 'Bob', 'House', 'ET 329', '317-278-9098', '1', '4', 10);

INSERT INTO Members
VALUES ('8', 'Bridget', 'Stanley', 'SI 234', '317-274-5678', '1', '1', 12);

INSERT INTO Members
VALUES ('9', 'Bradley', 'Wilson', '334 Statford Hall', '765-258-2567', '3', '2', 10);


-- Prices
INSERT INTO Prices
VALUES (Prices_FoodItemTypeID_SEQ.NEXTVAL, 'Beer/Wine', 5.50);

INSERT INTO Prices
VALUES (Prices_FoodItemTypeID_SEQ.NEXTVAL, 'Dessert', 2.75);

INSERT INTO Prices
VALUES (Prices_FoodItemTypeID_SEQ.NEXTVAL, 'Dinner', 15.50);

INSERT INTO Prices
VALUES (Prices_FoodItemTypeID_SEQ.NEXTVAL, 'Soft Drink', 2.50);

INSERT INTO Prices
VALUES (Prices_FoodItemTypeID_SEQ.NEXTVAL, 'Lunch', 7.25);


-- FoodItems
INSERT INTO FoodItems
VALUES ('10001', 'Lager', '1');

INSERT INTO FoodItems
VALUES ('10002', 'Red Wine', '1');

INSERT INTO FoodItems
VALUES ('10003', 'White Wine', '1');

INSERT INTO FoodItems
VALUES ('10004', 'Coke', '4');

INSERT INTO FoodItems
VALUES ('10005', 'Coffee', '4');

INSERT INTO FoodItems
VALUES ('10006', 'Chicken a la King', '3');

INSERT INTO FoodItems
VALUES ('10007', 'Rib Steak', '3');

INSERT INTO FoodItems
VALUES ('10008', 'Fish and Chips', '3');

INSERT INTO FoodItems
VALUES ('10009', 'Veggie Delight', '3');

INSERT INTO FoodItems
VALUES ('10010', 'Chocolate Mousse', '2');

INSERT INTO FoodItems
VALUES ('10011', 'Carrot Cake', '2');

INSERT INTO FoodItems
VALUES ('10012', 'Fruit Cup', '2');

INSERT INTO FoodItems
VALUES ('10013', 'Fish and Chips', '5');

INSERT INTO FoodItems
VALUES ('10014', 'Angus and Chips', '5');

INSERT INTO FoodItems
VALUES ('10015', 'Cobb Salad', '5');


-- Orders
INSERT INTO Orders
VALUES ( '1', '9', 'March 5, 2005' );

INSERT INTO Orders
VALUES ( '2', '8', 'March 5, 2005' );

INSERT INTO Orders
VALUES ( '3', '7', 'March 5, 2005' );

INSERT INTO Orders
VALUES ( '4', '6', 'March 7, 2005' );

INSERT INTO Orders
VALUES ( '5', '5', 'March 7, 2005' );

INSERT INTO Orders
VALUES ( '6', '4', 'March 10, 2005' );

INSERT INTO Orders
VALUES ( '7', '3', 'March 11, 2005' );

INSERT INTO Orders
VALUES ( '8', '2', 'March 12, 2005' );

INSERT INTO Orders
VALUES ( '9', '1', 'March 13, 2005' );

-- OrderLine
INSERT INTO OrderLine
VALUES ( '1', '10001', 1 );

INSERT INTO OrderLine
VALUES ( '1', '10006', 1 );

INSERT INTO OrderLine
VALUES ( '1', '10012', 1 );

INSERT INTO OrderLine
VALUES ( '2', '10004', 2 );

INSERT INTO OrderLine
VALUES ( '2', '10013', 1 );

INSERT INTO OrderLine
VALUES ( '2', '10014', 1 );

INSERT INTO OrderLine
VALUES ( '3', '10005', 1 );

INSERT INTO OrderLine
VALUES ( '3', '10011', 1 );

INSERT INTO OrderLine
VALUES ( '4', '10005', 2 );

INSERT INTO OrderLine
VALUES ( '4', '10004', 2 );

INSERT INTO OrderLine
VALUES ( '4', '10006', 1 );

INSERT INTO OrderLine
VALUES ( '4', '10007', 1 );

INSERT INTO OrderLine
VALUES ( '4', '10010', 2 );

INSERT INTO OrderLine
VALUES ( '5', '10003', 1 );

INSERT INTO OrderLine
VALUES ( '6', '10002', 2 );

INSERT INTO OrderLine
VALUES ( '7', '10005', 2 );

INSERT INTO OrderLine
VALUES ( '8', '10005', 1 );

INSERT INTO OrderLine
VALUES ( '8', '10011', 1 );

INSERT INTO OrderLine
VALUES ( '9', '10001', 1 );