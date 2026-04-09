
SELECT sales_channel,
       SUM(amount) AS revenue
FROM clinic_sales
WHERE strftime('%Y', datetime) = '2021'
GROUP BY sales_channel;


SELECT uid,
       SUM(amount) AS total_spent
FROM clinic_sales
WHERE strftime('%Y', datetime) = '2021'
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;


WITH revenue AS (
    SELECT 
        strftime('%m', datetime) AS month,
        SUM(amount) AS revenue
    FROM clinic_sales
    GROUP BY month
),
expense AS (
    SELECT 
        strftime('%m', datetime) AS month,
        SUM(amount) AS expense
    FROM expenses
    GROUP BY month
)

SELECT 
    r.month,
    r.revenue,
    IFNULL(e.expense, 0) AS expense,
    (r.revenue - IFNULL(e.expense, 0)) AS profit,
    CASE 
        WHEN (r.revenue - IFNULL(e.expense, 0)) > 0 THEN 'Profitable'
        ELSE 'Not Profitable'
    END AS status
FROM revenue r
LEFT JOIN expense e ON r.month = e.month;


SELECT *
FROM (
    SELECT 
        c.city,
        cs.cid,
        SUM(cs.amount) AS revenue,
        RANK() OVER (PARTITION BY c.city ORDER BY SUM(cs.amount) DESC) AS rnk
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    WHERE strftime('%m', cs.datetime) = '05'
    GROUP BY c.city, cs.cid
) t
WHERE rnk = 1;




SELECT *
FROM (
    SELECT 
        c.state,
        cs.cid,
        SUM(cs.amount) AS revenue,
        RANK() OVER (PARTITION BY c.state ORDER BY SUM(cs.amount) ASC) AS rnk
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    WHERE strftime('%m', cs.datetime) = '05'
    GROUP BY c.state, cs.cid
) t
WHERE rnk = 2;