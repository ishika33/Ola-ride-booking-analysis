-- OLA Ride Booking Analysis
-- Query 1: Overall Booking Status

SELECT
    `Booking Status`,
    COUNT(*) AS total_bookings
FROM ola_bookings
GROUP BY `Booking Status`
ORDER BY total_bookings DESC;

-- Query 2: Successful Bookings

SELECT
    COUNT(*) AS successful_bookings,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ola_bookings),
        2
    ) AS success_percentage
FROM ola_bookings
WHERE `Booking Status` = 'Success';

-- Query 3: Average Ride Distance by Vehicle Type

SELECT
    `Vehicle Type`,
    ROUND(AVG(`Ride Distance`), 2) AS average_ride_distance
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Vehicle Type`
ORDER BY average_ride_distance DESC;

-- Query 4: Revenue by Vehicle Type

SELECT
    `Vehicle Type`,
    COUNT(*) AS total_rides,
    SUM(`Booking Value`) AS total_revenue,
    ROUND(AVG(`Booking Value`), 2) AS average_booking_value
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Vehicle Type`
ORDER BY total_revenue DESC;

-- Query 5: Top Pickup Locations

SELECT
    `Pickup Location`,
    COUNT(*) AS successful_bookings
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Pickup Location`
ORDER BY successful_bookings DESC
LIMIT 10;

-- Query 6: Customer Cancellation Reasons

SELECT
    `Reason for cancelling by Customer`,
    COUNT(*) AS cancellation_count
FROM ola_bookings
WHERE `Booking Status` = 'Canceled by Customer'
GROUP BY `Reason for cancelling by Customer`
ORDER BY cancellation_count DESC;

-- Query 7: Driver Cancellation Reasons

SELECT
    `Driver Cancellation Reason`,
    COUNT(*) AS cancellation_count
FROM ola_bookings
WHERE `Booking Status` = 'Canceled by Driver'
GROUP BY `Driver Cancellation Reason`
ORDER BY cancellation_count DESC;

-- Query 8: Revenue by Payment Method

SELECT
    `Payment Method`,
    COUNT(*) AS total_transactions,
    SUM(`Booking Value`) AS total_revenue,
    ROUND(AVG(`Booking Value`), 2) AS average_transaction_value
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Payment Method`
ORDER BY total_revenue DESC;

-- Query 9: Average Customer Rating by Vehicle Type

SELECT
    `Vehicle Type`,
    ROUND(AVG(`Customer Rating`), 2) AS average_customer_rating,
    COUNT(`Customer Rating`) AS rating_count
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Vehicle Type`
ORDER BY average_customer_rating DESC;

-- Query 10: Booking Status by Vehicle Type

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

-- Query 11: Top Vehicle Types by Average Booking Value

SELECT
    `Vehicle Type`,
    ROUND(AVG(`Booking Value`), 2) AS average_booking_value
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Vehicle Type`
ORDER BY average_booking_value DESC
LIMIT 5;

-- Query 12: Revenue Contribution by Vehicle Type

SELECT
    `Vehicle Type`,
    SUM(`Booking Value`) AS vehicle_revenue,
    ROUND(
        SUM(`Booking Value`) * 100.0 /
        (SELECT SUM(`Booking Value`)
         FROM ola_bookings
         WHERE `Booking Status` = 'Success'),
        2
    ) AS revenue_percentage
FROM ola_bookings
WHERE `Booking Status` = 'Success'
GROUP BY `Vehicle Type`
ORDER BY revenue_percentage DESC;

