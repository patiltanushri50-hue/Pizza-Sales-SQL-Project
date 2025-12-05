-- Total quantity of each pizza
SELECT pt.name, SUM(od.quantity)
FROM order_details od
JOIN pizzas p ON od.pizza_id=p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id=pt.pizza_type_id
GROUP BY pt.name;

-- Category wise sales
SELECT pt.category, SUM(od.quantity)
FROM order_details od
JOIN pizzas p ON od.pizza_id=p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id=pt.pizza_type_id
GROUP BY pt.category;

-- Hour wise orders
SELECT HOUR(order_time), COUNT(order_id)
FROM orders
GROUP BY HOUR(order_time);

-- Average daily orders
SELECT ROUND(AVG(daily_total),2)
FROM (
  SELECT o.order_date, SUM(od.quantity) daily_total
  FROM orders o
  JOIN order_details od ON o.order_id=od.order_id
  GROUP BY o.order_date
) a;
