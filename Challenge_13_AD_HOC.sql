-- Business Request 1: City-Level Fare and Trip Summary Report
SELECT 
    c.city_name,
    COUNT(t.trip_id) AS total_trips,
    ROUND(SUM(t.fare_amount) / SUM(t.distance_travelled_km), 2) AS avg_fare_per_km,
    ROUND(AVG(t.fare_amount), 2) AS avg_fare_per_trip,
    ROUND( (COUNT(t.trip_id) * 100.0 / (SELECT COUNT(*) FROM trips_db.fact_trips)), 2) AS pct_contribution_to_total_trips
FROM trips_db.fact_trips t
JOIN trips_db.dim_city c 
    ON t.city_id = c.city_id
GROUP BY c.city_name
ORDER BY total_trips DESC;

-- Business Request 2: Monthly City-Level Trips Target Performance Report
SELECT 
    c.city_name,
    d.month_name,
    COUNT(t.trip_id) AS actual_trips,
    mt.total_target_trips AS target_trips,
    CASE 
        WHEN COUNT(t.trip_id) > mt.total_target_trips THEN 'Above Target'
        ELSE 'Below Target'
    END AS performance_status,
    ROUND(((COUNT(t.trip_id) - mt.total_target_trips) * 100.0 / mt.total_target_trips), 2) AS pct_difference
FROM trips_db.fact_trips t
JOIN trips_db.dim_city c ON t.city_id = c.city_id
JOIN trips_db.dim_date d ON t.date = d.date
JOIN targets_db.monthly_target_trips mt 
    ON d.start_of_month = mt.month AND t.city_id = mt.city_id
GROUP BY c.city_name, d.month_name, mt.total_target_trips;

-- Business Request 3: City-Level Repeat Passenger Trip Frequency Report
SELECT 
    c.city_name,
    ROUND(100.0 * SUM(CASE WHEN r.trip_count = '2-Trips' THEN r.repeat_passenger_count ELSE 0 END) / SUM(r.repeat_passenger_count), 2) AS `2-Trips`,
    ROUND(100.0 * SUM(CASE WHEN r.trip_count = '3-Trips' THEN r.repeat_passenger_count ELSE 0 END) / SUM(r.repeat_passenger_count), 2) AS `3-Trips`,
    ROUND(100.0 * SUM(CASE WHEN r.trip_count = '4-Trips' THEN r.repeat_passenger_count ELSE 0 END) / SUM(r.repeat_passenger_count), 2) AS `4-Trips`,
    ROUND(100.0 * SUM(CASE WHEN r.trip_count = '5-Trips' THEN r.repeat_passenger_count ELSE 0 END) / SUM(r.repeat_passenger_count), 2) AS `5-Trips`,
    ROUND(100.0 * SUM(CASE WHEN r.trip_count = '6-Trips' THEN r.repeat_passenger_count ELSE 0 END) / SUM(r.repeat_passenger_count), 2) AS `6-Trips`,
    ROUND(100.0 * SUM(CASE WHEN r.trip_count = '7-Trips' THEN r.repeat_passenger_count ELSE 0 END) / SUM(r.repeat_passenger_count), 2) AS `7-Trips`,
    ROUND(100.0 * SUM(CASE WHEN r.trip_count = '8-Trips' THEN r.repeat_passenger_count ELSE 0 END) / SUM(r.repeat_passenger_count), 2) AS `8-Trips`,
    ROUND(100.0 * SUM(CASE WHEN r.trip_count = '9-Trips' THEN r.repeat_passenger_count ELSE 0 END) / SUM(r.repeat_passenger_count), 2) AS `9-Trips`,
    ROUND(100.0 * SUM(CASE WHEN r.trip_count = '10-Trips' THEN r.repeat_passenger_count ELSE 0 END) / SUM(r.repeat_passenger_count), 2) AS `10-Trips`
FROM trips_db.dim_repeat_trip_distribution r
JOIN trips_db.dim_city c ON r.city_id = c.city_id
GROUP BY c.city_name;
-- Business Request 4: Identify Cities with Highest and Lowest Total New Passengers
WITH city_new AS (
  SELECT c.city_name,
         SUM(f.new_passengers) AS total_new_passengers
  FROM trips_db.fact_passenger_summary f
  JOIN trips_db.dim_city c ON c.city_id = f.city_id
  GROUP BY c.city_name
),
ranked AS (
  SELECT city_name,
         total_new_passengers,
         ROW_NUMBER() OVER (ORDER BY total_new_passengers DESC) AS rn_desc,
         ROW_NUMBER() OVER (ORDER BY total_new_passengers ASC)  AS rn_asc
  FROM city_new
)
SELECT
  city_name,
  total_new_passengers,
  CASE
    WHEN rn_desc <= 3 THEN 'Top 3'
    WHEN rn_asc  <= 3 THEN 'Bottom 3'
  END AS city_category
FROM ranked
WHERE rn_desc <= 3 OR rn_asc <= 3;

-- Business Request – 6: Repeat Passenger Rate Analysis
WITH monthly_data AS (
    SELECT 
        c.city_name,
        f.month,
        f.total_passengers,
        f.repeat_passengers,
        ROUND(f.repeat_passengers * 100.0 / f.total_passengers, 2) AS monthly_repeat_passenger_rate
    FROM trips_db.fact_passenger_summary f
    JOIN trips_db.dim_city c ON f.city_id = c.city_id
),
overall_data AS (
    SELECT 
        city_name,
        SUM(total_passengers) AS total_passengers_all,
        SUM(repeat_passengers) AS repeat_passengers_all,
        ROUND(SUM(repeat_passengers) * 100.0 / SUM(total_passengers), 2) AS city_repeat_passenger_rate
    FROM monthly_data
    GROUP BY city_name
)
SELECT 
    m.city_name,
    m.month,
    m.total_passengers,
    m.repeat_passengers,
    m.monthly_repeat_passenger_rate,
    o.city_repeat_passenger_rate
FROM monthly_data m
JOIN overall_data o ON m.city_name = o.city_name
ORDER BY m.city_name, m.month;
