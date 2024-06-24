show databases;

USE hotel_data;

/*1. Total Revenue by Year*/
SELECT 
    '2018' AS year, SUM(adr * (stays_in_weekend_nights + stays_in_week_nights)) AS total_revenue
FROM 
    hotel_data.bookings_2018
WHERE
    is_canceled = 0
UNION ALL
SELECT 
    '2019' AS year, SUM(adr * (stays_in_weekend_nights + stays_in_week_nights)) AS total_revenue
FROM 
    hotel_data.bookings_2019
WHERE
    is_canceled = 0
UNION ALL
SELECT 
    '2020' AS year, SUM(adr * (stays_in_weekend_nights + stays_in_week_nights)) AS total_revenue
FROM 
    hotel_data.bookings_2020
WHERE
    is_canceled = 0;
    
    
    /*2. Average Lead Time by Market Segment */
    SELECT 
    b.market_segment, AVG(b.lead_time) AS avg_lead_time
FROM 
    (SELECT * FROM hotel_data.bookings_2018
     UNION ALL
     SELECT * FROM hotel_data.bookings_2019
     UNION ALL
     SELECT * FROM hotel_data.bookings_2020) b
GROUP BY 
    b.market_segment;
    
    
    /*3. Cancelation Charge by Year */
    SELECT 
    '2018' AS year, (SUM(is_canceled) / COUNT(*)) * 100 AS cancellation_rate
FROM 
    hotel_data.bookings_2018
UNION ALL
SELECT 
    '2019' AS year, (SUM(is_canceled) / COUNT(*)) * 100 AS cancellation_rate
FROM 
    hotel_data.bookings_2019
UNION ALL
SELECT 
    '2020' AS year, (SUM(is_canceled) / COUNT(*)) * 100 AS cancellation_rate
FROM 
    hotel_data.bookings_2020;
    
   /* 4. Revenue by Meal Type */
    SELECT 
    b.meal, SUM(b.adr * (b.stays_in_weekend_nights + b.stays_in_week_nights)) AS total_revenue
FROM 
    (SELECT * FROM hotel_data.bookings_2018
     UNION ALL
     SELECT * FROM hotel_data.bookings_2019
     UNION ALL
     SELECT * FROM hotel_data.bookings_2020) b
GROUP BY 
    b.meal;
    
   /* 5. Average Daily Rate (ADR) by Year and Market Segment */
   SELECT 
    b.arrival_date_year, b.market_segment, AVG(b.adr) AS avg_adr
FROM 
    (SELECT * FROM hotel_data.bookings_2018
     UNION ALL
     SELECT * FROM hotel_data.bookings_2019
     UNION ALL
     SELECT * FROM hotel_data.bookings_2020) b
GROUP BY 
    b.arrival_date_year, b.market_segment;
    
    
    /* 6. Total Special Requests by Year`hotel_data.bookings_2020` */
    SELECT 
    '2018' AS year, SUM(total_of_special_requests) AS total_special_requests
FROM 
    hotel_data.bookings_2018
UNION ALL
SELECT 
    '2019' AS year, SUM(total_of_special_requests) AS total_special_requests
FROM 
    hotel_data.bookings_2019
UNION ALL
SELECT 
    '2020' AS year, SUM(total_of_special_requests) AS total_special_requests
FROM 
    hotel_data.bookings_2020;


/* 7. Discounted Revenue by Market Segment */
SELECT 
    b.market_segment, SUM(b.adr * (b.stays_in_weekend_nights + b.stays_in_week_nights) * (1 - m.Discount)) AS discounted_revenue
FROM 
    (SELECT * FROM hotel_data.bookings_2018
     UNION ALL
     SELECT * FROM hotel_data.bookings_2019
     UNION ALL
     SELECT * FROM hotel_data.bookings_2020) b
JOIN 
    hotel_data.market_segment m ON b.market_segment = m.market_segment
WHERE
    b.is_canceled = 0
GROUP BY 
    b.market_segment;

/* 8. Average Stay Duration by Year */
SELECT 
    '2018' AS year, AVG(stays_in_weekend_nights + stays_in_week_nights) AS avg_stay_duration
FROM 
    hotel_data.bookings_2018
UNION ALL
SELECT 
    '2019' AS year, AVG(stays_in_weekend_nights + stays_in_week_nights) AS avg_stay_duration
FROM 
    hotel_data.bookings_2019
UNION ALL
SELECT 
    '2020' AS year, AVG(stays_in_weekend_nights + stays_in_week_nights) AS avg_stay_duration
FROM 
    hotel_data.bookings_2020;

/* 9. Revenue from Repeated Guests */
SELECT 
    '2018' AS year, SUM(adr * (stays_in_weekend_nights + stays_in_week_nights)) AS repeated_guest_revenue
FROM 
    hotel_data.bookings_2018
WHERE 
    is_repeated_guest = 1 AND is_canceled = 0
UNION ALL
SELECT 
    '2019' AS year, SUM(adr &#8203;:citation[oaicite:0]{index=0}&#8203;
