-- ============================================================
-- OLA RIDE BOOKING ANALYSIS
-- SQL ANALYSIS
-- ============================================================

USE ola_analysis;


-- ============================================================
-- 1. OVERALL BOOKING STATUS
-- Business Question:
-- What is the distribution of bookings by status?
-- ============================================================

SELECT
    `Booking Status`,
    COUNT(*) AS total_bookings,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM ola_bookings),
        2
    ) AS percentage
FROM ola_bookings
GROUP BY `Booking Status`
ORDER BY total_bookings DESC;


-- ============================================================
-- 2. SUCCESS RATE
-- Business Question:
-- What percentage of bookings were successfully completed?
-- ============================================================

SELECT
    COUNT(*) AS successful_bookings,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM ola_bookings),
        2
    ) AS success_percentage
FROM ola_bookings
WHERE `Booking Status` = 'Success';


-- ============================================================
-- 3. VEHICLE TYPE PERFORMANCE
-- Business Question:
-- How does each vehicle type perform in terms of rides,
-- revenue and average booking value?
-- ============================================================

SELECT
    `Vehicle Type`,
    COUNT(*) AS total_rides,
    ROUND(SUM(`Booking Value`), 2) AS total_revenue,
    ROUND(AVG(`Booking Value`), 2) AS average_booking_value
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Vehicle Type`
ORDER BY total_revenue DESC;


-- ============================================================
-- 4. AVERAGE RIDE DISTANCE BY VEHICLE TYPE
-- Business Question:
-- Which vehicle types have the longest average rides?
-- ============================================================

SELECT
    `Vehicle Type`,
    ROUND(AVG(`Ride Distance`), 2) AS average_ride_distance
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Vehicle Type`
ORDER BY average_ride_distance DESC;


-- ============================================================
-- 5. TOP PICKUP LOCATIONS
-- Business Question:
-- Which pickup locations generate the most successful rides?
-- ============================================================

SELECT
    `Pickup Location`,
    COUNT(*) AS successful_bookings
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Pickup Location`
ORDER BY successful_bookings DESC
LIMIT 10;


-- ============================================================
-- 6. CUSTOMER CANCELLATION REASONS
-- Business Question:
-- Why are customers cancelling rides?
-- ============================================================

SELECT
    `Reason for Cancelling by Customer`,
    COUNT(*) AS cancellation_count,
    ROUND(
        COUNT(*) * 100.0 /
        (
            SELECT COUNT(*)
            FROM ola_bookings
            WHERE `Booking Status` = 'Cancelled by Customer'
        ),
        2
    ) AS percentage
FROM ola_bookings
WHERE `Booking Status` = 'Cancelled by Customer'
GROUP BY `Reason for Cancelling by Customer`
ORDER BY cancellation_count DESC;


-- ============================================================
-- 7. DRIVER CANCELLATION REASONS
-- Business Question:
-- Why are drivers cancelling rides?
-- ============================================================

SELECT
    `Reason for Cancelling by Driver`,
    COUNT(*) AS cancellation_count,
    ROUND(
        COUNT(*) * 100.0 /
        (
            SELECT COUNT(*)
            FROM ola_bookings
            WHERE `Booking Status` = 'Cancelled by Driver'
        ),
        2
    ) AS percentage
FROM ola_bookings
WHERE `Booking Status` = 'Cancelled by Driver'
GROUP BY `Reason for Cancelling by Driver`
ORDER BY cancellation_count DESC;


-- ============================================================
-- 8. PAYMENT METHOD ANALYSIS
-- Business Question:
-- Which payment methods contribute the most revenue?
-- ============================================================

SELECT
    `Payment Method`,
    COUNT(*) AS total_transactions,
    ROUND(SUM(`Booking Value`), 2) AS total_revenue,
    ROUND(AVG(`Booking Value`), 2) AS average_transaction_value
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Payment Method`
ORDER BY total_revenue DESC;


-- ============================================================
-- 9. CUSTOMER RATING BY VEHICLE TYPE
-- Business Question:
-- Which vehicle types receive the highest customer ratings?
-- ============================================================

SELECT
    `Vehicle Type`,
    ROUND(AVG(`Customer Rating`), 2) AS average_customer_rating,
    COUNT(`Customer Rating`) AS rating_count
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Vehicle Type`
ORDER BY average_customer_rating DESC;


-- ============================================================
-- 10. DRIVER RATING BY VEHICLE TYPE
-- Business Question:
-- How do driver ratings vary across vehicle types?
-- ============================================================

SELECT
    `Vehicle Type`,
    ROUND(AVG(`Driver Ratings`), 2) AS average_driver_rating,
    COUNT(`Driver Ratings`) AS rating_count
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Vehicle Type`
ORDER BY average_driver_rating DESC;


-- ============================================================
-- 11. VEHICLE TYPE VS BOOKING STATUS
-- Business Question:
-- How are successful rides and cancellations distributed
-- across vehicle types?
-- ============================================================

SELECT
    `Vehicle Type`,
    `Booking Status`,
    COUNT(*) AS booking_count
FROM ola_bookings
GROUP BY
    `Vehicle Type`,
    `Booking Status`
ORDER BY
    `Vehicle Type`,
    booking_count DESC;


-- ============================================================
-- 12. REVENUE CONTRIBUTION BY VEHICLE TYPE
-- Business Question:
-- What percentage of total revenue comes from each
-- vehicle type?
-- ============================================================

SELECT
    `Vehicle Type`,
    ROUND(SUM(`Booking Value`), 2) AS vehicle_revenue,
    ROUND(
        SUM(`Booking Value`) * 100.0 /
        (
            SELECT SUM(`Booking Value`)
            FROM ola_bookings
            WHERE `Booking Status` = 'Success'
        ),
        2
    ) AS revenue_percentage
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Vehicle Type`
ORDER BY revenue_percentage DESC;


-- ============================================================
-- 13. AVERAGE BOOKING VALUE BY VEHICLE TYPE
-- Business Question:
-- Which vehicle types have the highest average booking value?
-- ============================================================

SELECT
    `Vehicle Type`,
    ROUND(AVG(`Booking Value`), 2) AS average_booking_value
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Vehicle Type`
ORDER BY average_booking_value DESC;


-- ============================================================
-- 14. BOOKINGS BY HOUR
-- Business Question:
-- What hours have the highest number of successful rides?
-- ============================================================

SELECT
    HOUR(`Time`) AS booking_hour,
    COUNT(*) AS successful_bookings,
    ROUND(SUM(`Booking Value`), 2) AS total_revenue
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY HOUR(`Time`)
ORDER BY successful_bookings DESC;


-- ============================================================
-- 15. BOOKINGS BY DAY OF WEEK
-- Business Question:
-- Which days generate the most successful rides?
-- ============================================================

SELECT
    DAYNAME(`Date`) AS day_of_week,
    COUNT(*) AS successful_bookings,
    ROUND(SUM(`Booking Value`), 2) AS total_revenue,
    ROUND(AVG(`Booking Value`), 2) AS average_booking_value
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY DAYOFWEEK(`Date`), DAYNAME(`Date`)
ORDER BY DAYOFWEEK(`Date`);


-- ============================================================
-- 16. TOP VEHICLE TYPES BY REVENUE
-- Business Question:
-- Which vehicle types are the strongest revenue generators?
-- ============================================================

SELECT
    `Vehicle Type`,
    ROUND(SUM(`Booking Value`), 2) AS total_revenue
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Vehicle Type`
ORDER BY total_revenue DESC
LIMIT 5;


-- ============================================================
-- 17. OVERALL REVENUE AND RIDE KPIs
-- Business Question:
-- What are the major business-level KPIs?
-- ============================================================

SELECT
    COUNT(*) AS successful_rides,
    ROUND(SUM(`Booking Value`), 2) AS total_revenue,
    ROUND(AVG(`Booking Value`), 2) AS average_booking_value,
    ROUND(AVG(`Ride Distance`), 2) AS average_ride_distance,
    ROUND(AVG(`Customer Rating`), 2) AS average_customer_rating,
    ROUND(AVG(`Driver Ratings`), 2) AS average_driver_rating
FROM ola_bookings
WHERE `Booking Status` = 'Success';

