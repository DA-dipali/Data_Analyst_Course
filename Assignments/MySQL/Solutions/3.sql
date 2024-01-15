use assignment;
select * from orders;

Delimiter $$                                                #1
CREATE DEFINER=`root`@`localhost` PROCEDURE `order_status`(in p_year INT, in p_month INT)
BEGIN
select orderNumber, orderDate, status from orders
where year(orderDate) = p_year AND month(orderDate) = p_month;
END $$
Delimiter ;

call assignment.order_status(2005, 6);                      #Execution

select * from payments;

Delimiter $$                                                #2a
CREATE DEFINER=`root`@`localhost` FUNCTION `customer_status`(cust_id INT) RETURNS char(22) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE Status CHAR(22);
DECLARE Total BIGINT;
SET Total = (select sum(amount) from Payments where customerNumber = cust_id);
IF Total < 25000 THEN SET Status = 'Silver';
ELSEIF Total BETWEEN 25000 AND 50000 THEN SET Status = 'Gold';
ELSEIF Total > 50000 THEN SET Status = 'Platinum';
END IF;
RETURN Status;
END$$
Delimiter ;

select * from customers;

select c.customerNumber, c.customerName, o.status from customers c        #2b
LEFT JOIN orders o USING (customerNumber);
###############################################################################################################
select * from movies;   #parent   -- id                                   #3
select * from rentals;    #child  -- movieid

/*
ON DELETE CASCADE : used in MySQL to delete the rows from the child table automatically,
					when the rows from the parent table are deleted.
                    
DELETE ROWS FROM RENTALS --> AFTER DELETE OF ROWS FROM MOVIES

*/

Delimiter $$
CREATE DEFINER=`root`@`localhost` TRIGGER `movies_AFTER_DELETE` AFTER DELETE ON `movies` FOR EACH ROW BEGIN
DELETE FROM  rentals
WHERE movieid 
NOT IN (SELECT DISTINCT id FROM movies);
END$$
Delimiter ;

DELETE FROM movies WHERE id=2;

/*
ON UPDATE CASCADE : when an update occurs on the referenced column from the parent table , 
                    it must automatically update the matching rows in the child table 
                    with the new value.
                    
UPDATE ROWS WITH NEW VALUE FROM RENTALS --> AFTER UPDATE ON COLUMN FROM MOVIES

*/

UPDATE movies SET id = 12 WHERE id = 5;
UPDATE movies SET id = 5 WHERE id = 12;
UPDATE movies SET id = 14 WHERE id = 10;

Delimiter $$
CREATE DEFINER=`root`@`localhost` TRIGGER `movies_AFTER_UPDATE` AFTER UPDATE ON `movies` FOR EACH ROW BEGIN
UPDATE rentals
SET movieid = new.id 
WHERE movieid = old.id;    
END $$
Delimiter ;
####################################################################################################################
select * from employee order by salary desc limit 3;                          #4

select * from employee;
select rank() over(order by salary desc) as rank_value, empid, concat(fname, lname), deptno, salary from employee;                 #5