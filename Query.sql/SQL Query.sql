
---Creating the customer table
CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(50),
    age INT,
    gender VARCHAR(10)    
);

--- Inserting sample data into the customer table

INSERT INTO customer (cust_id, cust_name, city, age, gender)
VALUES
(1, 'Saleem', 'Pattoki', 20, 'Male'),
(2, 'Sara', 'Lahore', 25, 'Female'),
(3, 'Ahmed', 'Karachi', 30, 'Male'),
(4, 'Zainab', 'Islamabad', 28, 'Female'),
(5, 'Ali', 'Rawalpindi', 35, 'Male'),
(6, 'Fatima', 'Faisalabad', 22, 'Female'),
(7, 'Bilal', 'Multan', 40, 'Male'),
(8, 'Ayesha', 'Sialkot', 26, 'Female'),
(9, 'Imran', 'Lahore', 33, 'Male'),
(10, 'Mariam', 'Quetta', 27, 'Female'),
(11, 'Usman', 'Karachi', 24, 'Male'),
(12, 'Nida', 'Sargodha', 29, 'Female'),
(13, 'Tariq', 'Peshawar', 32, 'Male'),
(14, 'Noor', 'Lahore', 23, 'Female'),
(15, 'Rashid', 'Gujranwala', 38, 'Male');

---Selecting all records from the customer table

SELECT * FROM customer


---Updating the city of the customer

UPDATE customer
SET city = 'Faisalabad'
WHERE cust_id = 12;

---Selecting all records from the customer table
SELECT * FROM customer


---Deleting the customer 
DELETE FROM customer
WHERE cust_id = 3;

---Selecting all records from the customer table
SELECT * FROM customer



---Creating the payment table
CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    cust_id INT,
    payment_type VARCHAR(10),
    amount DECIMAL(10, 2),
    product_id INT
);

---Inserting data into the payment table

INSERT INTO payment (payment_id, cust_id, payment_type, amount, product_id)
VALUES
(1, 1, 'Credit', 1500.00, 101),
(2, 2, 'Debit', 2500.00, 102),
(3, 3, 'Credit', 1200.00, 103),
(4, 4, 'Debit', 2200.00, 104),
(5, 5, 'Credit', 1800.00, 105),
(6, 6, 'Debit', 2700.00, 106),
(7, 7, 'Credit', 1600.00, 107),
(8, 8, 'Debit', 2000.00, 108),
(9, 9, 'Credit', 2100.00, 109),
(10, 10, 'Debit', 2300.00, 110),
(11, 11, 'Credit', 1400.00, 111),
(12, 12, 'Debit', 2500.00, 112),
(13, 13, 'Credit', 1900.00, 113),
(14, 14, 'Debit', 2800.00, 114),
(15, 15, 'Credit', 2000.00, 115),
(16, 1, 'Debit', 1500.00, 116),
(17, 2, 'Credit', 2200.00, 117),
(18, 3, 'Debit', 1800.00, 118),
(19, 4, 'Credit', 2400.00, 119),
(20, 5, 'Debit', 2100.00, 120);

---Selecting all records from payment table 

SELECT * FROM payment



---Question: Show all customers aged above 30 ?
SELECT * FROM customer
WHERE age > 30;


---Question: Count the total number of customers from each city?
SELECT city, COUNT(cust_id) AS total_customers
FROM customer
GROUP BY city;


---Question: Calculate the total payments made by each customer?
SELECT c.cust_name, SUM(p.amount) AS total_payments
FROM customer c
INNER JOIN payment p ON c.cust_id = p.cust_id
GROUP BY c.cust_name;




---Question:Find the average payment amount for each customer?
SELECT c.cust_name, AVG(p.amount) AS avg_payment
FROM customer c
INNER JOIN payment p ON c.cust_id = p.cust_id
GROUP BY c.cust_name;


---Question:List the products with the highest total sales?
SELECT p.product_id, SUM(p.amount) AS total_sales
FROM payment p
GROUP BY p.product_id
ORDER BY total_sales DESC
LIMIT 1;




---Question:Retrieve the most recent payment for each customer?
SELECT p.cust_id, p.payment_date, p.amount
FROM payment p
WHERE p.payment_date = (
    SELECT MAX(payment_date)
    FROM payment
    WHERE cust_id = p.cust_id
);




---Question:Show the total amount spent by customers in a given city?
SELECT c.city, SUM(p.amount) AS total_spent
FROM customer c
INNER JOIN payment p ON c.cust_id = p.cust_id
WHERE c.city = 'Lahore'
GROUP BY c.city;




---Question:Find the number of payments for each type (Credit/Debit)?
SELECT payment_type, COUNT(payment_id) AS total_payments
FROM payment
GROUP BY payment_type;



---Question:Retrieve the top 3 customers who made the highest payments?
SELECT c.cust_name, SUM(p.amount) AS total_payment
FROM customer c
INNER JOIN payment p ON c.cust_id = p.cust_id
GROUP BY c.cust_name
ORDER BY total_payment DESC
LIMIT 3;





