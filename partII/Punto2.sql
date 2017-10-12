-- 1. Create tables

CREATE TABLE CATEGORIES 
 (id INT NOT NULL, 
  name VARCHAR2(255) NULL, 
  season VARCHAR2(255) NULL, 
  CONSTRAINT PK_idCategories PRIMARY KEY (id),
  CONSTRAINT CK_season check (season in ('winter', 'summer', 'spring', 'autumn')));
  
CREATE TABLE PRODUCTS 
 (id INT NOT NULL, 
  name VARCHAR2(255) NULL, 
  reference VARCHAR2(255) NULL,
  price decimal(10,3) NOT NULL,
  category_id int NOT NULL,
  CONSTRAINT PK_idseason PRIMARY KEY (id),
  CONSTRAINT FK_category_product FOREIGN KEY(category_id) REFERENCES CATEGORIES(id),
  CONSTRAINT CK_price check (price > 0));
  
CREATE TABLE ANSWERS 
 (id INT NOT NULL, 
  number_of_question VARCHAR2(255) NULL, 
  answer VARCHAR2(255) NULL, 
  CONSTRAINT PK_idanswer PRIMARY KEY (id));
  
-- 2. Importar CSV

-- 3. Questions Based on the data answer the following questions and insert the answers in the "ANSWERS" table: (1.0)
--  1. How many references of winter shoes are in the inventory? (0.2)
SELECT COUNT(CATEGORY_ID) AS Quantity FROM PRODUCTS WHERE CATEGORY_ID IN (SELECT Id FROM CATEGORIES WHERE NAME = 'shoes' AND SEASON = 'winter');
--  2. How much does it cost the less expensive product of fitness gear category of summer season? (0.2)
SELECT MIN(PRICE) AS Price_Min FROM PRODUCTS WHERE CATEGORY_ID IN (SELECT Id FROM CATEGORIES WHERE NAME = 'fitness gear' AND SEASON = 'summer');
--  3. What is the reference of the product which has the maximum price of golf category? (0.2)
SELECT MAX(PRICE) AS Price_Max FROM PRODUCTS WHERE CATEGORY_ID IN (SELECT Id FROM CATEGORIES WHERE NAME = 'golf');
--  4. What is the name of the product which reference is 523C9788-FFA5-715C-1F2B-7AA8BC33C107 (0.2)
SELECT NAME FROM PRODUCTS WHERE REFERENCE = '523C9788-FFA5-715C-1F2B-7AA8BC33C107';
--  5. What is the name of the category which product with name "ligula consectetuer rhoncus." belongs to? (0.2)
SELECT NAME FROM CATEGORIES WHERE ID IN (SELECT CATEGORY_ID FROM PRODUCTS WHERE NAME LIKE '% consectetuer rhoncus%');

INSERT INTO ANSWERS VALUES(1, 'QUESTION 1', '29');
INSERT INTO ANSWERS VALUES(2, 'QUESTION 2', '3');
INSERT INTO ANSWERS VALUES(3, 'QUESTION 3', '971');
INSERT INTO ANSWERS VALUES(4, 'QUESTION 4', 'congue turpis. In');
INSERT INTO ANSWERS VALUES(5, 'QUESTION 5', 'running wear');


  