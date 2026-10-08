-- OLA Ride Booking Analysis
-- Query 1: Overall Booking Status

SELECT
    `Booking Status`,
    COUNT(*) AS total_bookings
FROM ola_bookings
GROUP BY `Booking Status`
ORDER BY total_bookings DESC;
