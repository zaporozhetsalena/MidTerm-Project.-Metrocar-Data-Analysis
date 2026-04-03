SELECT 
    EXTRACT(HOUR FROM request_ts) AS hour_of_day,
    COUNT(*) AS total_requests,
    COUNT(accept_ts) AS accepted_requests,
    COUNT(*) - COUNT(accept_ts) AS not_accepted,
    ROUND(
        COUNT(accept_ts) * 1.0 / COUNT(*), 
        2
    ) AS acceptance_rate
FROM ride_requests
GROUP BY hour_of_day
ORDER BY hour_of_day;