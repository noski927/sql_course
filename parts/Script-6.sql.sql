select country, 
count(company_name) as cnt_customer 
from customers c
group by country
order by country 

SELECT 
    supplier_id, 
    COUNT(category_id) AS cnt_products
FROM 
    products p
GROUP BY 
    supplier_id
HAVING 
    COUNT(category_id) >= 5
ORDER BY 
    supplier_id DESC;
    
   
select min(unit_price) as min_price 
from products p
where category_id = 1

select 
order_id,
product_id,
(unit_price*quantity) as sum_orders 
from order_details od 
order by order_id desc
limit 5

select 
	sum(unit_price*quantity) as sum_order_10425
from order_details od 
where order_id = 10425



SELECT 
    supplier_id,
    MAX(unit_price) AS max_price
FROM 
    products p 
WHERE 
    supplier_id IN (1, 3, 5)
GROUP BY 
    supplier_id
ORDER BY 
    supplier_id ;
   

   
select  ship_country
from orders o 
group by ship_country 
having 
	count(ship_country) > 10
order by ship_country



 

WITH avg_unit_price AS (
    SELECT AVG(unit_price) AS avg_price
    FROM order_details od
)
SELECT 
    unit_price / avg_unit_price.avg_price AS a
FROM 
    products p
CROSS JOIN 
    avg_unit_price
WHERE 
    unit_price / avg_unit_price.avg_price > 1;
order by 



select * from order_details od 
where unit_price > (
    SELECT AVG(unit_price)
    FROM order_details od
)

---2.1 Соединения таблиц (JOIN)

--- step 13

select 
	order_id,
	order_date,
	ship_country,
	last_name 
from orders o
left join employees e on
o.employee_id = e.employee_id

--- step 14

select 
	product_id, 
	product_name, 
	category_name 
from products p
inner join categories c on
p.category_id = c.category_id 

--- step 15

select 
	p.product_id, 
	p.product_name, 
	c.category_name 
from products p
left join 
	categories c on
p.category_id = c.category_id 
order by product_id

--- step 16

select 
    p.product_name
from
    products p
left join
    categories c 
ON p.category_id = c.category_id
where c.category_name IS NULL;

--- 2.2 Подзапросы и обобщенные табличные выражения (CTE)

---step 11
select * from sales_1
union
select * from sales_2
union
select * from sales_3

--- step 12
select * from sales_1
union all
select * from sales_2
union all
select * from sales_3

--- 2.3 Подзапросы и обобщенные табличные выражения (CTE)

---step 3
select product_id, 
product_name, 
quantity_per_unit,
unit_price 
from products p 
where unit_price > (select avg(unit_price) from products)
and product_name LIKE 'S%'
order by product_id

--- step 4

\\product 
\\suppliers - country

SELECT 
    p.product_id, 
    p.product_name, 
    p.unit_price
FROM 
    products p
LEFT JOIN (
    SELECT 
        supplier_id, 
        country 
    FROM 
        suppliers s
    WHERE 
        country IN ('Norway', 'Italy')
) sub_query
ON 
    p.supplier_id = sub_query.supplier_id
order by unit_price desc;

--- step 5

SELECT 
    p.product_id, 
    p.product_name, 
    p.unit_price
FROM 
    products p     
where p.unit_price <= (select min(unit_price) from products p2) + 5
order by unit_price desc

--- step 6 

select 







	
