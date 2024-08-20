--USE store--
--use the command "USE 'database_name'" to switch to a different database--
--use the command "SHOW DATABASES" to list all the databases--
--use the command "SHOW TABLES" to list all the tables in the current database--
--use the command "DESCRIBE table_name" to view the structure of a table--
--use the command "SELECT * FROM table_name" to view the contents of a table--
-- ^ beginning
-- $ end
-- | logical or
-- [A-F] range from A to F

SELECT
FROM
WHERE
JOIN
ORDER BY

--------------------------------------------------------------------------------
--use the command "USE 'database_name'" to switch to a different database--

    USE store;

--------------------------------------------------------------------------------
--select all the columns from the customers table--

SELECT * FROM store.customers;

--------------------------------------------------------------------------------
--select the first_name, last_name, address, points, points + 10 * 100, points + 10 * 100 as sample_points, and points as 'point system' from the customers table--

SELECT 
	first_name, 
    last_name, 
    address, 
    points,
    points + 10 * 100,
    (points + 10) * 100 AS sample_points,
    points AS 'point system' 
FROM store.customers

--------------------------------------------------------------------------------
--update the state column in the customers table to 'VA '--


UPDATE `store`.`customers` SET `state` = 'VA'   WHERE (`customer_id` = '1');

--------------------------------------------------------------------------------
--select the distinct states from the customers table--

SELECT DISTINCT state FROM store.customers; --this selects DISTINCT/UNIQUE states
--------------------------------------------------------------------------------
--select all the customers with points greater than 3000--

    
    SELECT * FROM store.customers 
    WHERE points > 3000

--------------------------------------------------------------------------------
--select all the customers in the store database with state equal to 'VA'--

    USE store;
    
    SELECT * FROM customers 
    WHERE state = 'VA'

--------------------------------------------
--select all the customers in the store database with points not equal to 3000--

    
    SELECT * FROM store.customers
    WHERE points != 3000

--------------------------------------------
--select all the customers in the store database with state not equal to 'VA'--

    
    SELECT * FROM store.customers
    WHERE state != 'VA'

--------------------------------------------------------------------------------
--total points for all customers in the customers table--

SELECT sum(customers.points) AS 'Total Points' FROM customers

--------------------------------------------------------------------------------
 --select all the customers in the store database with birth_date greater than 1990-01-01 or points less than 1000--

USE st  ore;

SELECT * FROM customers     WHERE birth_date > '1990-01-01' OR points < 1000

--------------------------------------------------------------------------------
--select all the customers in the store database with birth_date greater than 1990-01-01 or points less than 1000 and state = 'VA'--

USE store;
    
    SELECT * FROM customers 
    WHERE birth_date > '1990-01-01' OR points < 1000 AND state = 'VA'

----------------------------    
----------------------------------------------------
--SELECT * FROM order_items     WHERE order_id = 6 AND quantity * unit_price > 30--
USE sql_store;
SELECT *
FRO M 
	
    order_items
    WHERE
	order_id = 6 AND quantity * unit_price > 30

------------------------    
--------------------------------------------------------
--SELECT ALL FROM PRODUCTS  WHERE QUANTITY IN(EQUAL) STOCK IS IN (49, 38, 72)--
    
    SELECT * FROM store.products
    WHERE quantity_in_stock IN (49, 38, 72)

--------------------------------------------------------------------------------
--selects all the customers in the store database with points between 2000 and 3000--
    
    SELECT * FROM sql_store.customers
    WHERE points >= 2000 AND points <= 3000
--the sane output as above
    
    SELECT * FROM sql_store.customers
    WHERE points BETWEEN 2000 AND 3000

-------------------------------------------------------------------------------
--selects all the customers in the store database with birth_date between 1990 and 2000--
    
    SELECT * FROM store.customers
    WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01'

-------------------------------------------------------------------------------
--selects all the customers in the store database with last_name that starts with 'b'--
    
    SELECT * FROM store.customers
    WHERE last_name LIKE 'b%'

-------------------------------------------------------------------------------
--selects all the customers in the store database with last_name that starts with 'brush'--
    
    SELECT * FROM store.customers
    WHERE last_name LIKE 'brush%'

-------------------------------------------------------------------------------
--selects all the customers in the store database with last_name that has at least one 'b'--
    
    SELECT * FROM store.customers
    WHERE last_name LIKE '%B%'

---------------------------------------
--selects all the customers in the store database with last_name that has at least one 'b'--
    
    SELECT * FROM store.customers
    WHERE last_name REGEXP 'b'
--outputs the same as above
-------------------------------------------------------------------------------
--selects all the customers in the store database with last_name that DOENST HAVE at character/letter 'b'--     

-------------------------------------------------------------------------------
--selects all the customers in the store database with last_name that ends with 'y'--
    
    SELECT * FROM store.customers
    WHERE last_name LIKE '%y'

-------------------------------------------------------------------------------
--selects all the customers in the store database with last_name that has atleaset '5' characters/lettters before ending with 'y'-- 
    
    SELECT * FROM store.customers
    WHERE last_name LIKE '_____y'
--output:boagey, Naseby, Rumgay
-------------------------------------------------------------------------------
--selects all the customers in the store database with last_name that starts with 'B' and has atleaset '4' characters/lettters after 'B' before ending with 'y'-- 
    
    SELECT * FROM store.customers
    WHERE last_name LIKE 'b____y'
--output:boagey
-------------------------------------------------------------------------------
--selects all the customers in the store database with last_name that ends with '9'--
    
    SELECT * FROM store.customers
    WHERE phone LIKE '%9'

-------------------------------------------------------------------------------
--selects all the customers in the store database with last_name that Does not end with '9'--
    
    SELECT * FROM store.customers
    WHERE phone NOT LIKE '%9'

-------------------------------------------------------------------------------
--selects all the customers in the store database with address that has 'trail' 
    
    SELECT * FROM store.customers
    WHERE address LIKE '%trail%'
--output:14187 Commercial Trail, Trail 3520 Ohio

----------------------------------------
--selects all the customers in the store database with address that has 'trail' using REGEXP
    
    SELECT * FROM store.customers
    WHERE last_name REGEXP 'trail'
--outputs the same as above

-------------------------------------------------------------------------------
--selects all the customers in the store database with address that has 'trail' or 'avenue' in it--
    
    SELECT * FROM store.customers
    WHERE address LIKE '%trail%' OR
	  address LIKE '%avenue%'
--output:14187 Commercial Trail, Trail 3520 Ohio, 68 Lawn Avenue--

----------------------------------------
--selects all the customers in the store database with address that has 'trail' or 'avenue' in it using REGEXP--
    
    SELECT * FROM store.customers
    WHERE address REGEXP 'trail|avenue' 
--the output is the same as above: 
--output:14187 Commercial Trail, Trail 3520 Ohio, 68 Lawn Avenue--

----------------------------------------
--selects all the customers in the store database with address that has 'trail' or 'avenue' or 'sage' in it using REGEXP--
    
    SELECT * FROM store.customers
    WHERE address REGEXP 'trail|avenue|sage' 
--the output is the same as above but with 'sage' added to the list:
--output:14187 Commercial Trail, Trail 3520 Ohio, 68 Lawn Avenue, Sage Terrace--

----------------------------------------
--selects all the customers in the store database with address that STARTS with 'trail' or ATLEAST HAS 'avenue' or 'sage' in it using REGEXP--
    
    SELECT * FROM store.customers
    WHERE address REGEXP '^trail|avenue|sage' 
--output: Trail 3520 Ohio, Sage Terrace, 68 Lawn Avenue-- 

----------------------------------------
--selects all the customers in the store database with address that ENDS with 'trail' or ATLEAST HAS 'avenue' or 'sage' in it using REGEXP--
    
    SELECT * FROM store.customers
    WHERE address REGEXP 'trail$|avenue|sage' 
--output:  14187 Commercial Trail, Trail 3520 Ohio, 68 Lawn Avenue, Sage Terrace--

-------------------------------------------------------------------------------
--selects all the customers in the store database with address that ENDS with 'trail' using REGEXP
    
    SELECT * FROM store.customers
    WHERE last_name REGEXP 'trail$'

-------------------------------------------------------------------------------
--selects all the customers in the store database with last_name that STARTS with 'brush' using REGEXP
    
    SELECT * FROM store.customers
    WHERE last_name REGEXP '^brush'
--output:brushfield

-------------------------------------------------------------------------------
--selects all the customers in the store database with last_name that has 'se' or 'de' or 'ge' in it using REGEXP
	
    SELECT * FROM store.customers
    WHERE last_name REGEXP '[sdg]e' --se, de, ge--
--output: Boagey,Roseburgh,Twiddell, Naseby

----------------------------------------
--selects all the customers in the store database with last_name that has 'eb' or 'ey' in it using REGEXP

	SELECT * FROM store.customers
	WHERE last_name REGEXP 'e[by]' ---eb, ey--
--output:MacCaffrey, Boagey, Roseburgh, Betchley, Naseby

---------------------------------------
--selects all the customers in the store database with last_name that has 'ae' or 'be' or 'ce' or 'de' or 'fe' in it using REGEXP
	SELECT * FROM store.customers
	WHERE last_name REGEXP '[abcedf]e'
--output: Betchley, Twiddell

--------------------------------------
--selects all the customers in the store database with last_name that has 'ae' or 'be' or 'ce' or 'de' or 'fe' in it using REGEXP
	SELECT * FROM store.customers
	WHERE last_name REGEXP '[a-f]e'
--the same as the output above
--output: Betchley, Twiddell

---------------------------------------------------------------------------------------
--selects all the customers in the store database with 'phone' that is 'NULL'

    SELECT * FROM store.customers
    WHERE
	    phone IS NULL

---------------------------------------------------------------------------------------
--selects all the customers in the store database with 'phone' that is 'NOT NULL'

    SELECT * FROM store.customers
    WHERE
	    phone IS NOT NULL

---------------------------------------------------------------------------------------
--selects all the orders in the store database with 'order_date' that is less than 'shipped_date'(ALREADY SHIPPED)

    SELECT * FROM store.orders
    WHERE order_date < shipped_date

-------------------------------------------
--selects all the orders in the store database with 'order_date' that is less than 'shipped_date'(HAS NOT YET BEEN SHIPPED)

    SELECT * FROM store.orders
    WHERE shipped_date IS NULL

---------------------------------------------------------------------------------------
--this selects all customers in the store database and orders them by 'first_name' in ASCENDING order

    SELECT * FROM store.customers
    ORDER BY first_name
 
-------------------------------------------
--this selects all customers in the store database and orders them by 'first_name' in DESCENDING

    SELECT * FROM store.customers
    ORDER BY first_name DESC

-------------------------------------------
--this selects all customers in the store database and orders them in ASCENDING ORDER by prioritizing 'state' and then 'first_name'

    SELECT * FROM store.customers
    ORDER BY state, first_name
--output:  firsrt_name      ----------  state
--        __________________________________ 
--          Ramoloa         ----------  CA
--          Freddi          ----------  C0
--          Ambur           ----------  FL
--          Thacher         ----------  FL
--          Babara          ----------  VA
--          Ines            ----------  VA

---------------------------------------------
--this selects all customers in the store database and orders them in DESCENDING ORDER by prioritizing 'state' and then 'first_name'

    SELECT * FROM store.customers
    ORDER BY state DESC, first_name DESC
--output:  firsrt_name        ----------  state
--        __________________________________ 
--          Ines              ----------  VA
--          Babara            ----------  VA
--          Thacher           ----------  FL
--          Ambur             ----------  FL
--          Freddi            ----------  CO
--          Ramoloa           ----------  CA

---------------------------------------------
--this selects all customers in the store database and orders them in DESCENDING ORDER by prioritizing 'state' and then ORDERS BY 'first_name' in ASCENDING order

    SELECT * FROM store.customers
    ORDER BY state DESC, first_name
--output:  firsrt_name        ----------  state
--        __________________________________ 
--          Babara            ----------  VA
--          Ines              ----------  VA
--          Ambur             ----------  FL
--          Thacher           ----------  FL
--          Freddi            ----------  CO
--          Ramoloa           ----------  CA

---------------------------------------------------------------------------------------
--his selects all from the order_items table and chooses only order_id that is 2 and ORDERS BY 'unit_price * quantity' in ASCENDING order

    SELECT * FROM sql_store.order_items
    WHERE order_id = 2
    ORDER BY unit_price * quantity
--output: 
--order_id	product_id	quantity	unit_price
--  2	        6       	2	        2.94
--  2     	    4       	4	        1.66
--  2	        1       	2	        9.10

---------------------------------------------------------------------------------------
-- ORDER BY -- This selects all from the order_items table and chooses only order_id that is 2 and ORDERS BY 'unit_price * quantity' in ASCENDING order

    SELECT * FROM sql_store.order_items
    WHERE order_id = 2
    ORDER BY unit_price * quantity
--output: 
--order_id	product_id	quantity	unit_price
--  2	        6       	2	        2.94
--  2     	    4       	4	        1.66
--  2	        1       	2	        9.10

---------------------------------------------------------------------------------------
-- ORDER BY -- This selects all from the order_items table and chooses only order_id that is 2 and ORDERS BY 'unit_price * quantity' in DESCENDING order with the total_price column

    SELECT *, (quantity * unit_price) AS 'total_price' 
    FROM sql_store.order_items
    WHERE order_id = 2
    ORDER BY (quantity * unit_price) DESC
-- output: order_id  product_id	 quantity	unit_price	total_price
--           ___________________________________________________________
--            2	        1	         2	      9.10	        18.20
--            2	        4	         4	      1.66       	6.64
--            2      	6	         2	      2.94	        5.88

-----------------------------------------------------------------------------------------
--LIMIT -- selects the first 3 customers in the store database

    SELECT * FROM store.customers
    LIMIT 3

-----------------------------------------------------------------------------------------
-- LIMITS and SKIPS the first 3 customers and selects the next 3 customers in the store database

    SELECT * FROM store.customers
    LIMIT 3, 3

-----------------------------------------------------------------------------------------
--LIMTIS the customers to the top 3 customers in points

    SELECT * FROM store.customers
    ORDER BY points DESC
    LIMIT 3, 3

-----------------------------------------------------------------------------------------
-- INNER JOIN --this joins the orders table with the customers table and orders table and selects all the columns and ONLY PRINTS if 'cutomers.cutomer_id = orders.cutomer_id'

    SELECT * FROM store.orders
    JOIN sql_store.customers
    	ON sql_store.customers.customer_id = store.orders.customer_id
--output: same as above
--note: 'INNER JOIN' = 'JOIN' -------------------  'INNER JOIN' is the default JOIN type
--note: you only need to prefix(path/ex.sql_store.customer.customer_id[database.table.column])if not the same DATABASE or not using the same DATABASE
--note: if the error says "Unknown column 'orders.customer_id' in 'on clause'", then you need to use the full path to the table
--note: if the error says ambiguous, then you need to use the full path to the table

-----------------------------------
-- INNER JOIN -----this joins the order_items table with the products table from the same database 'store' and selects all the columns and ONLY OUTPUTS if the 'order_id is the same as the product_id'
    
    SELECT * FROM store.order_items
    JOIN store.products 
    	ON store.order_items.order_id = store.products.product_id

-----------------------------------
-- INNER JOIN ----- this is the same as the above query but with shorter syntax

    SELECT * FROM store.order_items oi
    JOIN store.products p 
	    ON oi.order_id = p.product_id

---------------------------------------------------------------------------------------
-- INNER JOIN --this joins the order_items table with the products table in the same database 'store' and selects all the columns and ONLY OUTPUTS if the 'product_id is the same as the product_id'
    USE store;
    SELECT order_id, oi.product_id, quantity , oi.unit_price
    FROM order_items oi
    JOIN products p 
        ON oi.product_id = p.product_id

---------------------------------------------------------------------------------------
--JOINING ACCROSS DATABASES -- this joins the order_items table(sql_store database) and products table(sql_inventory database) while selecting all the columns

    USE sql_store;
    SELECT * FROM order_items oi 
    JOIN sql_inventory.products 
--output: 180 rows

---------------------------------------------------------------------------------------
-- JOINIG ACCROSS DATABASES -- this joins the order_items table(sql_store database) and products table(sql_inventory database) while selecting all the columns and ONLY OUTPUTS if the 'product_id is the same as the product_id'

    USE sql_store;
    SELECT * FROM order_items oi 
    JOIN sql_inventory.products p
	    ON oi.product_id = p.product_id
--output: 18 rows

-------------------------------------------
-- SELF JOIN -- If each employee has a manager who is also listed as an employee in the same table, you can use a self join to find out who manages whom and also who reports to whom

    USE sql_hr;
    SELECT * FROM employees e
    JOIN employees m
	    ON e.reports_to = m.employee_id	
--output: this will output all the employees in the hr database and their managers
-- note: when using self joins, you need to use the alias and prefix

-------------------------------------------
-- SELF JOIN -- same as above but with shorter syntax only outputting the employee_id and first_name of both employee and their respective manager

    USE sql_hr;
    SELECT 
	    e.employee_id,
        e.first_name,
        m.first_name AS Manager
    FROM employees e
    JOIN employees m
    	ON e.reports_to = m.employee_id
--outout: employee_id	first_name	manager
--___________________________________________________________
--            33391	      D'arcy	Yovonnda
--            37851	      Sayer     Yovonnda
--            40448	      Mindy	    Yovonnda

---------------------------------------------------------------------------------------
-- JOINING MULTIPLE TABLES --this selects all the columns from the "orders table, customers table and order_statuses table" -- JOINING MULTIPLE TABLES --

SELECT 
	*
FROM sql_store.orders o
JOIN sql_store.customers c
	ON c.customer_id = o.customer_id
JOIN sql_store.order_statuses os
	ON os.order_status_id = o.status

--------------------------------------
-- JOINING MULTIPLE TABLES -- same output as above, but with shorter syntax
 
	order_id, 
    o.order_date, 
    c.customer_id, 
    c.first_name, 
    os.name AS 'order status', 
    o.shipped_date,
    o.shipper_id
FROM sql_store.orders o
JOIN sql_store.customers c
	ON c.customer_id = o.customer_id
JOIN sql_store.order_statuses os
	ON os.order_status_id = o.status

------------------------------------------------------------------------------------------
-- COMPOUND JOIN CONDITIONS -- A compound join condition is when you specify more than one condition in the ON clause to determine how rows from two tables should be joined.
-- The query is combining rows from the order_items and order_item_notes tables where the order ID and product ID match in both tables.
--This helps you see details about an ordered item alongside any notes or special instructions related to that item.

SELECT * FROM sql_store.order_items oi
JOIN sql_store.order_item_notes oin
	ON oi.order_id = oin.order_id
    AND oi.product_id = oin.product_id

------------------------------------------------------------------------------------------
-- IMPLIICINT JOIN SYNTAX

-- this is the ORIGINAL SYNTAX --   
SELECT * 
FROM sql_store.orders o
JOIN sql_store.customers c
	ON o.customer_id = c.customer_id

-- this is the IMPLICINT JOIN SYNTAX --
 SELECT * 
FROM 
	sql_store.orders o,
	sql_store.customers c
WHERE
	o.customer_id = c.customer_id
--note: dont use this

---------------------------------------------------------------------------------------
-- OUTER JOIN -- [LEFT JOIN | RIFHT JOIN] = [LEFT OUTER JOIN | RIGHT OUTER JOIN]
--INNER JOIN: Only rows where the join condition is met in both tables.
--LEFT JOIN: All rows from the left table, with matched rows from the right table and NULL for unmatched rows in the right table.
--RIGHT JOIN: All rows from the right table, with matched rows from the left table and NULL for unmatched rows in the left table.
--note: basically theyre just like INNER JOINS but outputs the selected part even if the condition is not met, they just differ in how to handle unmatch rows

--WIHTOUT LEFT JOIN --WIHTOUT LEFT JOIN --WIHTOUT LEFT JOIN --WIHTOUT LEFT JOIN --WIHTOUT LEFT JOIN --WIHTOUT LEFT JOIN --WIHTOUT LEFT JOIN --WIHTOUT LEFT JOIN --WIHTOUT LEFT JOIN 

SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM 
	sql_store.customers c
LEFT JOIN sql_store.orders o
	ON o.customer_id = c.customer_id
ORDER BY c.customer_id
-- output:
-- customer_id first_name order_id
--    2	          Ines     	4
--    2           Ines   	7
--    5	          Clemmie	5
--    5	          Clemmie	8
--    6	          Elka	    1
--    6           Elka   	10
--    7	          Ilene    	2
--   8	          Thacher	3
--   10	          Levy	    6
--   10  	      Levy    	9

--WITH LEFT JOIN --WITH LEFT JOIN --WITH LEFT JOIN --WITH LEFT JOIN --WITH LEFT JOIN --WITH LEFT JOIN --WITH LEFT JOIN --WITH LEFT JOIN --WITH LEFT JOIN --WITH LEFT JOIN --WITH LEFT JOIN --WITH LEFT JOIN 

SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM 
	sql_store.customers c
LEFT JOIN sql_store.orders o
	ON o.customer_id = c.customer_id
ORDER BY c.customer_id
-- output:
--  customer_id    first_name     order_id
--     1	          Babara	
--     2	          Ines       	4
--     2	          Ines       	7
--     3	          Freddi	
--     4	          Ambur	
--     5	          Clemmie      	5
--     5              Clemmie    	8
--     6           	  Elka       	1
--     6   	          Elka      	10
--     7           	  Ilene      	2
--     8         	  Thacher    	3
--     9              Romola	
--     10	          Levy       	6
--     10             Levy       	9
-- this prints everything wether 'o.customer_id = c.customer_id' is true or not

--WITH RIGHT JOIN --WITH RIGHT JOIN --WITH RIGHT JOIN --WITH RIGHT JOIN --WITH RIGHT JOIN --WITH RIGHT JOIN --WITH RIGHT JOIN --WITH RIGHT JOIN --WITH RIGHT JOIN --WITH RIGHT JOIN --WITH RIGHT JOIN

SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM 
	sql_store.customers c
RIGHT JOIN sql_store.orders o
	ON o.customer_id = c.customer_id
ORDER BY c.customer_id
-- output:
-- customer_id first_name order_id
--    2	          Ines     	4
--    2           Ines   	7
--    5	          Clemmie	5
--    5	          Clemmie	8
--    6	          Elka	    1
--    6           Elka   	10
--    7	          Ilene    	2
--   8	          Thacher	3
--   10	          Levy	    6
--   10  	      Levy    	9
--note: the same output as above 'WITHTOUT LEFT JOIN' but with the 'RIGHT JOIN' keyword UNLESS YOU SWAP THE FROM=sql_store.customers AND JOIN=sql_store.orders THEN the output will be different

---------------------------------------------------------------------------------------
--OUTER JOINS BETWEEN MULTIPLE TABLES WITH ORDER BY--

SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM 
	sql_store.customers c
LEFT JOIN sql_store.orders o
	ON o.customer_id = c.customer_id
LEFT JOIN sql_store.shippers sid
	ON sid.shipper_id = o.shipper_id  
ORDER BY c.customer_id
--output:
1	Babara	
2	Ines	4
2	Ines	7
3	Freddi	
4	Ambur	
5	Clemmie	5
5	Clemmie	8
6	Elka	1
6	Elka	10
7	Ilene	2
8	Thacher	3
9	Romola	
10	Levy	6
10	Levy	9	













EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE 
EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE EXCERCISE 

1.  get the customers whose firstname are ELKA or AMBUR
    get the customers whose lastname ends with EY or ON
    get the customers whose lastname starts with MY or SE
    get the customers whose lastname contains B followed by R or U

my_answer
SELECT * FROM store.customers
WHERE
	first_name REGEXP 'ELKA|AMBUR' OR
	last_name REGEXP '[e]y' OR
    last_name REGEXP '[o]n' OR
    last_name REGEXP 'm[y]' OR
    last_name REGEXP 's[e]' OR
    last_name REGEXP 'b[ru]'

shorter_answer
SELECT * FROM store.customers
WHERE
	first_name REGEXP 'ELKA|AMBUR' OR
    last_name REGEXP 'ey|on|se|my|b[ru]'


