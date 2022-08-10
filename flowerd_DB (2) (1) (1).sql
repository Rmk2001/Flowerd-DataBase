CREATE SCHEMA `flowerd` ;

CREATE TABLE Department (
dep_code        VARCHAR(10),
dep_name        VARCHAR(20),
CONSTRAINT Department_PK PRIMARY KEY (dep_code,dep_name)
);

CREATE TABLE DepartmentLocation (
dep_code        VARCHAR(10),
dep_location    varchar(30),
CONSTRAINT DepartmentLocation_PK PRIMARY KEY (dep_code,dep_location),
CONSTRAINT DepartmentLocation_FK FOREIGN KEY (dep_code) REFERENCES Department(dep_code)ON DELETE CASCADE

);


CREATE TABLE Employee(
e_id          VARCHAR(10),
fname         VARCHAR(15),
lname         VARCHAR(15),
e_gander      VARCHAR(10),
e_salary      INT,
e_emile       VARCHAR(30),
dep_code      VARCHAR(10),
CONSTRAINT Employee_PK PRIMARY KEY (e_id),
CONSTRAINT Employee_FK FOREIGN KEY (dep_code) REFERENCES Department(dep_code)ON DELETE CASCADE
);

CREATE TABLE Product(
p_id           VARCHAR(10),
p_flowers      VARCHAR(20),
p_price        INT,
dep_code       VARCHAR(10),
CONSTRAINT Product_PK PRIMARY KEY (p_id),
CONSTRAINT Product_FK FOREIGN KEY (dep_code) REFERENCES Department(dep_code)ON DELETE CASCADE
);

CREATE TABLE client_info (
fname         VARCHAR(15),
lname         VARCHAR(15),
c_id          VARCHAR(10),
city          VARCHAR(10),
CONSTRAINT Client_PK PRIMARY KEY (c_id,city)
);

CREATE TABLE ClientAddress(
city          VARCHAR(10),
zipcode       INT(6),
street        VARCHAR(10),
CONSTRAINT Client_PK PRIMARY KEY (city)
);

CREATE TABLE OrderOnline(
order_code    VARCHAR(10),
order_pay     INT,
o_new         VARCHAR(5),
shipped       VARCHAR(5),
hold          VARCHAR(5),
derived       VARCHAR(5),
e_id          VARCHAR(10),
c_id          VARCHAR(10),
CONSTRAINT OrderOnline_PK PRIMARY KEY (order_code),
CONSTRAINT OrderOnline_FK1 FOREIGN KEY (e_id) REFERENCES Employee(e_id)    ON DELETE CASCADE,
CONSTRAINT OrderOnline_FK2 FOREIGN KEY (c_id) REFERENCES client_info(c_id) ON DELETE CASCADE
);

CREATE TABLE productANDorder (
  order_code      VARCHAR(10) NOT NULL,
  p_id             VARCHAR(10) NOT NULL,
 CONSTRAINT productANDorder_FK1 FOREIGN KEY (order_code) REFERENCES OrderOnline(order_code)ON DELETE CASCADE,
CONSTRAINT  productANDorder_FK2 FOREIGN KEY (p_id) REFERENCES Product(p_id)ON DELETE CASCADE
);

CREATE TABLE  schedulee (
  DataShipment       VARCHAR(10) NOT NULL,
  DataDelivery       VARCHAR(10) ,
  order_code          VARCHAR(10),
  CONSTRAINT schedulee_PK PRIMARY KEY (DataShipment),
   CONSTRAINT schedulee_FK1 FOREIGN KEY (order_code) REFERENCES OrderOnline(order_code)ON DELETE CASCADE
  );
  
  CREATE TABLE  WorksON (
   order_code          VARCHAR(10)NOT NULL,
   e_id                VARCHAR(10)NOT NULL,
  CONSTRAINT WorksON_FK1 FOREIGN KEY (order_code) REFERENCES OrderOnline(order_code)ON DELETE CASCADE,
  CONSTRAINT WorksON_FK2 FOREIGN KEY (e_id) REFERENCES Employee(e_id)ON DELETE CASCADE
  );
  
  CREATE TABLE  ClientNumber (
  c_id           VARCHAR(10)NOT NULL,
  c_number      VARCHAR(20)NOT NULL,
CONSTRAINT ClientNumber_FK1 FOREIGN KEY (c_id) REFERENCES client_info(c_id)ON DELETE CASCADE,
 CONSTRAINT ClientNumber_PK PRIMARY KEY (c_number)
 );
 
 CREATE TABLE  payment (
 pay_code         VARCHAR(10)NOT NULL,
 Amount           VARCHAR(10),
 pay_type         VARCHAR(10),
 c_id             VARCHAR(10)NOT NULL,
 CONSTRAINT payment_PK PRIMARY KEY (pay_code),
 CONSTRAINT payment_FK1 FOREIGN KEY (c_id) REFERENCES client_info(c_id)ON DELETE CASCADE
 );

 INSERT INTO Department
VALUES (102,'DEP1');
 INSERT INTO Department
VALUES (105,'DEP2');
 INSERT INTO Department
VALUES (109,'DEP3');
 INSERT INTO Department
VALUES (112,'DEP4');
 INSERT INTO Department
VALUES (131,'DEP5');

SELECT*
FROM department;

INSERT INTO DepartmentLocation
VALUES (102,'street3');
INSERT INTO DepartmentLocation
VALUES (105,'street7');
INSERT INTO DepartmentLocation
VALUES (109,'street5');
 INSERT INTO DepartmentLocation
VALUES (112,'street3');
 INSERT INTO DepartmentLocation
VALUES (131,'street3');

SELECT*
FROM departmentlocation;


INSERT INTO Employee
VALUES ('E1942','Mohammed','omar','male',250,'mohomar@hotmail.com',102);
INSERT INTO Employee
VALUES ('E2356','norah','ali','female',300,'noraali@hotmail.com',105);
INSERT INTO Employee
VALUES ('E6732','sami','bader','male',350,'samibader@hotmail.com',109);
INSERT INTO Employee
VALUES ('E2938','sarah','abdullah','female',250,'sarahabdul@hotmail.com',112);
INSERT INTO Employee
VALUES ('E1098','fahad','saleh','male',300,'fahadsaleh@hotmail.com',131);

SELECT*
FROM employee;

INSERT INTO Product
VALUES ('P087','aster',200,102);
INSERT INTO Product
VALUES ('P234','daisy',250,105);
INSERT INTO Product
VALUES ('P324','Rose',300,109);
INSERT INTO Product
VALUES ('P123','Tulip',350,112);
INSERT INTO Product
VALUES ('P746','Lily',400,131);
INSERT INTO Product
VALUES ('P063','lotus (red)',150,102);
INSERT INTO Product
VALUES ('P047','lotus (blue)',150,102);

SELECT*
FROM product;

INSERT INTO client_info
VALUES ('ahmed','yousef','C345','makkah');
INSERT INTO client_info
VALUES ('faisal','hamad','C765','riyadh');
INSERT INTO client_info
VALUES ('reem','anas','C123','jeddah');
INSERT INTO client_info
VALUES ('majed','ayman','C546','makkah');
INSERT INTO client_info
VALUES ('dana','mohammed','C098','Qassim');

SELECT*
FROM client_info;

INSERT INTO ClientAddress
VALUES ('makkah',675466,'street6');
INSERT INTO ClientAddress
VALUES ('riyadh',24567,'street1');
INSERT INTO ClientAddress
VALUES ('jeddah',23566,'street9');
INSERT INTO ClientAddress
VALUES ('taif',23676,'street0');
INSERT INTO ClientAddress
VALUES ('Qassim',250677,'street4');

SELECT*
FROM ClientAddress;

INSERT INTO `flowerd`.`OrderOnline` (`order_code`, `order_pay`, `o_new`, `e_id`, `c_id`)
 VALUES ('O76564', '321', 'Check', 'E1098', 'C098');
INSERT INTO `flowerd`.`OrderOnline` (`order_code`, `order_pay`, `shipped`, `e_id`, `c_id`) 
VALUES ('O63829', '654', 'Check', 'E1942', 'C123');
INSERT INTO `flowerd`.`OrderOnline` (`order_code`, `order_pay`, `hold`, `e_id`, `c_id`) 
VALUES ('O62538', '289', 'Check', 'E2356', 'C345');
INSERT INTO `flowerd`.`OrderOnline` (`order_code`, `order_pay`, `derived`, `e_id`, `c_id`) 
VALUES ('O98937', '378', 'Check', 'E2938', 'C546');
INSERT INTO `flowerd`.`OrderOnline` (`order_code`, `order_pay`, `hold`, `e_id`, `c_id`) 
VALUES ('O28398', '198', 'Check', 'E6732', 'C765');

SELECT*
FROM OrderOnline;

INSERT INTO schedulee 
VALUES ('14NOV2021', '30NOV2021', 'O28398');
INSERT INTO schedulee
 VALUES ('20DEC2021', '30DEC2021', 'O62538');
INSERT INTO schedulee
VALUES ('2JAN2022', '23JAN2022', 'O63829');
INSERT INTO schedulee
 VALUES ('22NOV2021', '2DEC2021', 'O76564');
INSERT INTO schedulee
 VALUES ('30NOV2021', '10DEC2021', 'O98937');
 
 SELECT*
FROM schedulee;

INSERT INTO ClientNumber
 VALUES ('C765', '+9665332125678');
INSERT INTO ClientNumber
 VALUES ('C345', '+966345654345');
INSERT INTO ClientNumber
VALUES ('C123', '+966502354327');
INSERT INTO ClientNumber
VALUES ('C098', '+9665376845629');
INSERT INTO ClientNumber
VALUES ('C546', '+96650231267894');

SELECT*
FROM ClientNumber;



INSERT INTO payment 
VALUES ('Q3432', '500', 'Visa', 'C765');
INSERT INTO payment
VALUES ('Q4576', '900', 'Visa', 'C345');
INSERT INTO payment
 VALUES ('Q8723', '799', 'Visa', 'C123');
INSERT INTO payment
VALUES ('Q1289', '400', 'Visa', 'C098');
INSERT INTO payment
VALUES ('Q2365', '432', 'Cash', 'C546');

SELECT*
FROM payment;

INSERT INTO WorksON
VALUES ('O28398','E6732');
INSERT INTO WorksON
VALUES ('O62538','E2356');
INSERT INTO WorksON
VALUES ('O63829','E1942');
INSERT INTO WorksON
VALUES ('O76564','E1098');
INSERT INTO WorksON
VALUES ('O98937','E2938');

SELECT*
FROM WorksON;

INSERT INTO productANDorder
VALUES ('O28398','P087');
INSERT INTO productANDorder
VALUES ('O62538','P123');
INSERT INTO productANDorder
VALUES ('O63829','P234');
INSERT INTO productANDorder
VALUES ('O76564','P324');
INSERT INTO productANDorder
VALUES ('O98937','P746');

SELECT*
FROM productANDorder;

-- Giving employees 10% of their salary if the salary is less than 300 
UPDATE employee 
SET e_salary = (e_salary * 1.1)
WHERE e_salary < 300;
SELECT *
FROM employee;  

-- A 5% tax is added to all products
UPDATE product 
SET  p_price= (p_price * 1.05);
SELECT*
FROM product;

-- Delete client id of "C546"
DELETE FROM client_info 
WHERE c_id = 'C546';
SELECT *
FROM client_info;


-- Delete Deparment code of "109"
DELETE FROM  department
WHERE dep_code = '109';
SELECT *
FROM department;

-- List the product ID and price of the product which have a price between $300.00 and $400.00.
SELECT p_id,p_price
FROM product
WHERE p_price BETWEEN 300 AND 400;

-- List all details of all client info, with first in descending order of client id, and then in ascending order of city
SELECT *
FROM client_info
ORDER BY c_id DESC,city;

-- the total number of employee in each department and the sum of their salary 
select dep_code,count(e_id) as count ,SUM(e_salary) AS SumSalary
from employee
group by dep_code
order by dep_code ;

-- For each gender type employee, find the total the number of employees and the sum of their salary.
select e_gander,count(e_id) as count ,SUM(e_salary) AS SumSalary
from employee
group by e_gander
HAVING  count(e_id)>1;

-- List the product IDs of products which prices are greater than the average prices, and show their prices
select p_id,p_price
from product
where p_price > (select avg(p_price) from product);


-- We have listed employee IDs, names, department name, department code, order results by employee IDs (ASC), Department name (ASC), and department code (DESC).
SELECT e_id,fname,lname,dep_name,E.dep_code
FROM employee E, department D
WHERE E.dep_code=D.dep_code
ORDER BY e_id ASC ,dep_name ASC,E.dep_code DESC;

SELECT *
FROM orderonline
WHERE shipped IS NULL ;

SELECT *
FROM orderonline
WHERE o_new IS NULL AND hold IS NOT NULL ;
                
UPDATE product
SET  p_price = 250
WHERE  p_ID = 'P234';


SELECT fname , lname 
FROM client_info 
WHERE c_id IN ( SELECT c_id
                FROM OrderOnline 
                WHERE c_id = 'C123' ) ;
                
SELECT fname , lname 
FROM employee 
WHERE e_id IN ( SELECT e_id
                FROM workson 
                WHERE order_code = 'O62538' ) ;     
			
			
SELECT SUM(order_pay) AS sum_pay 
FROM OrderOnline
WHERE  e_id IN ( SELECT e_id
                 FROM employee
			     WHERE  dep_code IN ( SELECT dep_code
									FROM Department
									WHERE dep_name = 'DEP1'  ) ) ;
                                    
SELECT SUM(order_pay)/12 AS sum_pay 
FROM OrderOnline
WHERE  order_code IN ( SELECT order_code
                 FROM productandorder
			     WHERE  p_id IN ( SELECT p_id
									FROM product
									WHERE dep_code = 112  ) ) ;

SELECT *
FROM product 
GROUP BY dep_code 
HAVING p_price > 350 ; 

SELECT SUM(p_price) AS priceSum ,dep_code
FROM  Product
GROUP BY dep_code 
HAVING dep_code > 100 ;
								
SELECT c.c_id , fname , lname , order_code , order_pay , o_new , shipped , hold , derived
FROM client_info c , OrderOnline o
WHERE c.c_id = o.c_id
ORDER BY c.c_id ASC ;

SELECT p.p_id, p_flowers, p_price , o.order_code , order_pay , o_new , shipped , hold , derived
FROM productandorder pao , OrderOnline o , product p
WHERE  p.p_id =  pao.p_id and o.order_code = pao.order_code
ORDER BY p.p_id , o.order_code DESC ;
