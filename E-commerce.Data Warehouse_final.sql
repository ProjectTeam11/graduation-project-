CREATE DATABASE Depi_Project;
GO
USE Depi_Project;
GO
-----------------------------------------------
CREATE TABLE Customer (
    Customer_Key INT IDENTITY(1,1) PRIMARY KEY, 
    Customer_ID INT,   
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Churn BIT
);
---------------------------------------------------

CREATE TABLE Product (
    Product_ID INT IDENTITY(1,1) PRIMARY KEY,
    Product_Category VARCHAR(100),
    Product_Price DECIMAL(10,2)
);
--------------------------------------------
CREATE TABLE Purchase (
    Purchase_ID INT IDENTITY(1,1) PRIMARY KEY,
    Cust_Key INT FOREIGN KEY REFERENCES Customer(Customer_Key),
    Purchase_Date DATE,
    Payment_Method VARCHAR(50)
);
--------------------------------------------
CREATE TABLE Purchase_Details (
    Purc_ID INT FOREIGN KEY REFERENCES Purchase(Purchase_ID),
    Prod_ID INT FOREIGN KEY REFERENCES Product(Product_ID),
    Quantity INT,
    Total_Amount DECIMAL(10,2),
    Returns BIT,
    PRIMARY KEY (Purc_ID, Prod_ID)
);
----------------------------------------------------
DROP TABLE IF EXISTS Staging_Purchases;

CREATE TABLE Staging_Purchases (
    Customer_ID INT,
    Purchase_Date DATE,
    Product_Category VARCHAR(100),
    Product_Price DECIMAL(10,2),
    Quantity INT,
    Total_Purchase_Amount DECIMAL(10,2),
    Payment_Method VARCHAR(50),
    Customer_Age INT,
    Returns FLOAT,
    Customer_Name VARCHAR(100),
    Gender VARCHAR(10),
    Churn BIT
);
---------------------------------------
DROP TABLE IF EXISTS Staging_Purchases;

CREATE TABLE Staging_Purchases (
    Customer_ID INT,
    Purchase_Date DATE,
    Product_Category VARCHAR(100),
    Product_Price DECIMAL(10,2),
    Quantity INT,
    Total_Purchase_Amount DECIMAL(10,2),
    Payment_Method VARCHAR(50),
    Customer_Age INT,
    Returns FLOAT,
    Customer_Name VARCHAR(100),
    Gender VARCHAR(10),
    Churn BIT
);
---------------------------
INSERT INTO Staging_Purchases (
    Customer_ID,
    Purchase_Date,
    Product_Category,
    Product_Price,
    Quantity,
    Total_Purchase_Amount,
    Payment_Method,
    Customer_Age,
    Returns,
    Customer_Name,
    Gender,
    Churn
)
SELECT
    [Customer_ID],
    [Purchase_Date],
    [Product_Category],
    [Product_Price],
    Quantity,
    [Total_Purchase_Amount],
    [Payment_Method],
    [Customer_Age],
    Returns,
    Customer_Name,
    Gender,
    Churn
FROM [dbo].[E-commerce];
------------------------------------------

UPDATE Staging_Purchases
SET Returns = CASE WHEN Returns >= 0.5 THEN 1 ELSE 0 END;

ALTER TABLE Staging_Purchases
ALTER COLUMN Returns BIT;
--------------------------------
INSERT INTO Customer (Customer_ID, Name, Age, Gender, Churn)
SELECT DISTINCT
    Customer_ID,
    Customer_Name,
    Customer_Age,
    Gender,
    Churn
FROM Staging_Purchases;
--------------------------------------
INSERT INTO Product (Product_Category, Product_Price)
SELECT DISTINCT
    Product_Category,
    Product_Price
FROM Staging_Purchases;
-------------------------------------
INSERT INTO Purchase (Cust_Key, Purchase_Date, Payment_Method)
SELECT DISTINCT
    c.Customer_Key,
    s.Purchase_Date,
    s.Payment_Method
FROM Staging_Purchases s
JOIN Customer c
    ON s.Customer_ID = c.Customer_ID;
------------------------------------------
INSERT INTO Purchase_Details (Purc_ID, Prod_ID, Quantity, Total_Amount, Returns)
SELECT
    p.Purchase_ID,
    pr.Product_ID,
    s.Quantity,
    s.Total_Purchase_Amount,
    s.Returns
FROM Staging_Purchases s
JOIN Customer c
    ON s.Customer_ID = c.Customer_ID
JOIN Purchase p
    ON p.Cust_Key = c.Customer_Key
   AND p.Purchase_Date = s.Purchase_Date
   AND p.Payment_Method = s.Payment_Method
JOIN Product pr
    ON pr.Product_Category = s.Product_Category
   AND pr.Product_Price = s.Product_Price;
---------------------------------------------------
SELECT 'Staging' AS area, COUNT(*) AS cnt FROM Staging_Purchases
UNION ALL SELECT 'Customer', COUNT(*) FROM Customer
UNION ALL SELECT 'Product', COUNT(*) FROM Product
UNION ALL SELECT 'Purchase', COUNT(*) FROM Purchase
UNION ALL SELECT 'Purchase_Details', COUNT(*) FROM Purchase_Details;
---------------------------------------------
SELECT TOP 20 * FROM Purchase_Details;
