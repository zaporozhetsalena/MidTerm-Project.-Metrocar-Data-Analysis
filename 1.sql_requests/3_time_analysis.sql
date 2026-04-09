SELECT 
    EXTRACT(HOUR FROM rr.request_ts) AS hour_of_day,
    COUNT(*) AS total_requests,
    COUNT(rr.accept_ts) AS accepted_requests,
    COUNT(*) - COUNT(rr.accept_ts) AS not_accepted,
    ROUND(
        COUNT(rr.accept_ts) * 1.0 / COUNT(*), 
        2
    ) AS acceptance_rate,
--Revenue
    SUM(
        CASE 
            WHEN t.charge_status = 'Approved' 
            THEN t.purchase_amount_usd 
            ELSE 0 
        END
    ) AS revenue
FROM ride_requests rr
LEFT JOIN transactions t 
    ON rr.ride_id = t.ride_id
GROUP BY hour_of_day
ORDER BY hour_of_day;