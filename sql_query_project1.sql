-- CREATION of a DATABASE --
CREATE DATABASE projects;


-- Creation of Table --
CREATE TABLE project1
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantiy	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );



-- Data Cleaning --
SELECT * FROM project1
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    

-- Data Exploration--
-- How many sales do we have? --
SELECT COUNT(*) as total_sale 
FROM project1; 


-- How many uniuque customers we have ?
SELECT COUNT(DISTINCT customer_id) as total_sale 
FROM project1;


-- Data Analysis & Business Key Problems & Answers--

 -- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT *
FROM projects1
WHERE sale_date = '2022-11-05';


-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT 
  *
FROM project1
WHERE 
    category = 'Clothing'
    AND sale_date between '22-11-01' and '22-11-30'
    and quantiy >= 4;


-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
    category,
    SUM(total_sale) as net_sale
FROM project1
GROUP BY category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT category,avg(age)
FROM project1
where category = 'Beauty';


-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT * FROM project1
WHERE total_sale > 1000;


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT sum(total_sale) AS total_sales,gender , category
FROM project1
GROUP BY gender,category;


-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_monthly_sale
FROM project1
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY year, avg_monthly_sale desc;


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM project1
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT 
    category,    
    COUNT(DISTINCT customer_id) as no_of_unique_customers
FROM project1
GROUP BY category;



-- End of project