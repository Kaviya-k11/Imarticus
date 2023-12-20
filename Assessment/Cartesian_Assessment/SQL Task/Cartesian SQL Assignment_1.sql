CREATE DATABASE cartesian_task1;

USE cartesian_task1;

CREATE  TABLE produt(bill_total int,Product_Id int);

INSERT INTO product (bill_total, Product_Id) SELECT sum(`Bill Amount`),Product_Id FROM purchasehistory 

WHERE Bill_Date >= max(Bill_Date) - INTERVAL 30 day GROUP BY Product_Id ;

CREATE TABLE product1(bill_total int,Product_Id int,Cat_Id int);

INSERT INTO product1 (bill_total, Product_Id, Cat_Id) 

SELECT DISTINCT output.bill_total,output.Product_Id,productcatelogue.Cat_Id 

FROM productcatelogue inner join output on productcatelogue.Product_Id=output.Product_Id ORDER BY bill_total desc;


CREATE TABLE product2(bill_total int,Product_Id int,Cat_Id int,Sno int);

INSERT INTO product2 (bill_total, Product_Id, Cat_Id,Sno) SELECT bill_total, Product_Id,Cat_Id,ROW_NUMBER() OVER (PARTITION BY Cat_Id Order by bill_total DESC) AS Sno# FROM output1;

SELECT Cat_Id,Product_Id,Sno AS Trending FROM product2 WHERE Sno<=2;