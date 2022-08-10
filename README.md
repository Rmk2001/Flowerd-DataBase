# Flowerd-DataBase


i will provide you with a
database for the process of ordering flowers and
roses from different parts ofthe world online without
waiting fortheplanting season in your city


i built a "Floward" database that sells differentflowers from different countries that are all
assembled in production lines, Each production has: (p_id, p_price, p_Fname)


The departments are the ones who controlthe product and the stores ofthe product by ●
providing it, importing it, selling it and all that. And the departments has: (Dep_code,
Dep_name, Dep_location)


client sends an order for the product and Each order has :(OrderCode, Pay_order Ordar_status) ●
The order is related to the product, so when the customer chooses the product, the order is
created directly.


Each order is submitted by exactly one client,and Each order has a clearly defined schedule ●
created only for the order Includes shipping date and delivery date.


Payment is made by the client after ordering the product Payment identification ( ●
Pay_code,amount, Pay_type)


The identifier for a clientis: (C_name, C_id,C_addres,C_number) ●
The data links the payment operations with what was previously requested to confirm the order.


The company has more than 200 employees. Employee identification is : ●
(E_id, E_name, E_gender, E_salary, E_emile). Each employee works for a particular
Some employees also work on online orders sent by the client, and some of،department
them manage the orders


![FlowerdDB](C:\Users\رؤوم\OneDrive\الصور.JPG)
