SELECT user_id, room_no
FROM (
    SELECT user_id, room_no,
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY booking_date DESC) as rn
    FROM bookings
) t
WHERE rn = 1;


SELECT b.booking_id,
       SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%m', b.booking_date) = '11'
  AND strftime('%Y', b.booking_date) = '2021'
GROUP BY b.booking_id;


SELECT bill_id,
       SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%m', bill_date) = '10'
GROUP BY bill_id
HAVING bill_amount > 1000;


SELECT *
FROM (
    SELECT 
        strftime('%m', bc.bill_date) AS month,
        i.item_name,
        SUM(bc.item_quantity) AS total_qty,

        RANK() OVER (
            PARTITION BY strftime('%m', bc.bill_date) 
            ORDER BY SUM(bc.item_quantity) DESC
        ) AS rnk_desc,

        RANK() OVER (
            PARTITION BY strftime('%m', bc.bill_date) 
            ORDER BY SUM(bc.item_quantity) ASC
        ) AS rnk_asc

    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    GROUP BY month, i.item_name
) t
WHERE rnk_desc = 1 OR rnk_asc = 1;



SELECT *
FROM (
    SELECT 
        strftime('%m', bc.bill_date) AS month,
        bc.bill_id,
        SUM(bc.item_quantity * i.item_rate) AS total_amount,

        RANK() OVER (
            PARTITION BY strftime('%m', bc.bill_date) 
            ORDER BY SUM(bc.item_quantity * i.item_rate) DESC
        ) AS rnk

    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    GROUP BY month, bc.bill_id
) t
WHERE rnk = 2;