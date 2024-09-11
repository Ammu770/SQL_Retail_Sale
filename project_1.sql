SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05'



SELECT *
FROM retail_sales
WHERE category = 'Clothing'
AND TO_CHAR(sale_date,'yyy-MM') ='2022-11'
AND quantity>=10


SELECT category, 
SUM(total_sale) AS net_sale,
COUNT (*) as total_orders
FROM retail_sales
GROUP BY 1


SELECT ROUND(Avg (age),2)
FROM retail_sales
WHERE category = 'Beauty'





SELECT category,gender, COUNT(*) as total_trans
FROM retail_sales
GROUP BY category , gender
ORDER BY 1


SELECT * FROM
(
SELECT 
      EXTRACT(YEAR FROM sale_date) as year,
      EXTRACT(MONTH FROM sale_date) as year,
      AVG(tOtal_sale) as avg_sale,
      RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale)DESC) as rank
      FROM retail_sales
       GROUP BY 1,2
	   ) as t1
	   WHERE rank = 1



SELECT customer_id,
sum(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5


SELECT 
category,
COUNT(DISTINCT customer_id) as cnt_unique
FROM retail_sales
GROUP BY 1



WITH hourly_sale
AS
(
SELECT *,
    CASE 
	     WHEN EXTRACT(HOUR FROM sale_time) <12 THEN 'Morning'
		 WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'AFERTNOON'
		 ELSE 'EVENING'
    END as shift
FROM retail_sales	
)
SELECT
  shift,
  COUNT(*) as total_orders
FROM hourly_sale
GROUP BY shift





