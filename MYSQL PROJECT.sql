USE sql_project_p2;
-- Q.1 Write an SQL query to retrieve all columns for sales made on '2022-11-05'

-- SELECT *
-- FROM retail_sales
-- WHERE sale_date = '2022-11-05'

-- Q.2 Write an SQL query to retrieve all transaction where the category is 'Clothing' 
-- and the quantity sold is more than 10 in the month of Nov-2022

-- SELECT *
-- FROM retail_sales
-- WHERE category = 'Clothing'
-- AND 
-- DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
-- AND 
-- quantiy >= 4

-- Q.3 W rite an SQL query to calculate the total sale (total_sale) for each category.
-- SELECT 
-- category,
-- SUM(total_sale) AS net_sale
-- FROM retail_sales
-- GROUP BY category
  
-- Q.4 Write an SQL query to fing the average age of customers who purchased items from the 
  -- 'Beauty' category.
  -- SELECT 
  -- AVG(age) AS average_age	
  -- FROM retail_sales
  -- WHERE category = 'Beauty' 
  
-- Q.5 Write an SQL query to find all transactions where the total sale is greater than 1000
  -- SELECT *
  -- FROM retail_sales
  -- WHERE total_sale > 1000
  
-- Q.6 Write an SQL query to find the total number of transactions (transactions_id) made by
  -- each gender in each category
  
  -- SELECT
	  -- category,
	  -- gender,
	  -- COUNT(*) AS total_trans
  -- FROM retail_sales
  -- GROUP BY category, gender
  
-- Q.7 Write an SQL query to calculate the average sale for each month. find out best selling month 
  -- in each year 
  -- SELECT 
	 -- EXTRACT(YEAR FROM sale_date) AS year,
	 -- EXTRACT(MONTH FROM sale_date) AS month,
	 -- SUM(total_sale) AS avg_sale,
     -- RANK() 
     -- OVER(
     -- PARTITION BY EXTRACT(YEAR FROM sale_date) 
     -- ORDER BY SUM(total_sale) DESC 
     -- ) AS rank
 -- FROM retail_sales
 -- GROUP BY 1, 2
 
-- Q.8 Write an SQL query to find the top 5 customers based on their highest total sales
-- SELECT
--  customer_id,
--  SUM(total_sale) AS total_sales
--  FROM retail_sales
--  GROUP BY 1
--  ORDER BY 2 DESC
--  LIMIT 5

-- Q.9 Write an SQL query to find number of unique customers who purchased  from each category
-- SELECT 
-- category,
-- COUNT(DISTINCT customer_id) AS unique_customer
-- FROM retail_sales
-- GROUP BY category

-- Q.9 Write an SQL query to creat each shift and number of orders (Example morning <= 12, afternoon
-- between 12 & 17, evening > 17)

WITH hourly_sale
AS
(
SELECT *,
    CASE
       WHEN HOUR(sale_time) < 12 THEN 'Morning'
       WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
       ELSE 'Evening'
	END as shift
FROM retail_sales
)
SELECT
    shift,
    COUNT(transactions_id) AS total_orders
FROM hourly_sale
GROUP BY shift
  
