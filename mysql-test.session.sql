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


--This selects all from the order_items table and chooses only order_id that is 2 and ORDERS BY 'unit_price * quantity' in ASCENDING order

SELECT * FROM sql_store.order_items
WHERE order_id = 2
ORDER BY unit_price * quantity
--output: 
--order_id	product_id	quantity	unit_price
--  2	        6       	2	        2.94
--  2     	    4       	4	        1.66
--  2	        1       	2	        9.10

---------------------------------------------------------------------------------------
--This selects all from the order_items table and chooses only order_id that is 2 and ORDERS BY 'unit_price * quantity' in DESCENDING order with the total_price column

SELECT *, (quantity * unit_price) AS 'total_price' 
FROM sql_store.order_items
WHERE order_id = 2
ORDER BY (quantity * unit_price) DESC
-- output: order_id  product_id	 quantity	unit_price	total_price
--           ___________________________________________________________
--            2	        1	         2	      9.10	        18.20
--            2	        4	         4	      1.66       	6.64
--            2      	6	         2	      2.94	        5.88







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


