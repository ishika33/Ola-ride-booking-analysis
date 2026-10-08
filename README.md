
# OLA Ride Booking Analysis

## Project Overview

This project analyzes 50,000+ OLA ride-booking records from Bengaluru using MySQL to identify patterns in ride demand, revenue, cancellations, vehicle performance and customer ratings.

The analysis focuses on extracting business insights from booking and operational data using SQL.

## Dataset

The dataset contains 50,000 OLA ride-booking records with information including:

- Booking date and time
- Booking status
- Vehicle type
- Pickup and drop locations
- Ride distance
- Booking value
- Payment method
- Customer and driver ratings
- Customer cancellation reasons
- Driver cancellation reasons
- Incomplete ride information

## Business Questions

The analysis answers questions such as:

1. What is the distribution of bookings by status?
2. What percentage of bookings are successful?
3. Which vehicle types generate the most revenue?
4. Which vehicle types have the highest average booking value?
5. Which pickup locations have the highest number of successful rides?
6. Why do customers cancel rides?
7. Why do drivers cancel rides?
8. Which payment methods contribute the most revenue?
9. How do customer ratings vary across vehicle types?
10. How do driver ratings vary across vehicle types?
11. How are booking statuses distributed across vehicle types?
12. What percentage of total revenue comes from each vehicle type?
13. What are the busiest booking hours?
14. Which days generate the most successful rides?

## SQL Techniques Used

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `COUNT()`
- `SUM()`
- `AVG()`
- `ROUND()`
- `LIMIT`
- Subqueries
- Conditional filtering
- Aggregation and KPI analysis

## Key Analysis Areas

### Booking Performance
Analysis of successful, cancelled and incomplete bookings.

### Revenue Analysis
Comparison of revenue and average booking value across vehicle types and payment methods.

### Cancellation Analysis
Identification of major customer and driver cancellation reasons.

### Vehicle Analysis
Comparison of ride volume, revenue, ride distance and ratings across vehicle categories.

### Location Analysis
Identification of pickup locations generating the highest number of successful rides.

### Rating Analysis
Comparison of customer and driver ratings across vehicle types.

## Repository Structure

```text
ola-ride-booking-analysis/
│
├── README.md
│
└── sql/
    └── ola_analysis.sql
