SELECT
  STRFTIME('%Y-%m', o.order_purchase_timestamp) AS year_month,
  COUNT(DISTINCT o.order_id) AS order_volume,
  ROUND(SUM(oi.price), 2) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY year_month
ORDER BY year_month;
