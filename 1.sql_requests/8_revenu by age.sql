SELECT 
    COALESCE(s.age_range, 'Unknown') AS age_range,
    SUM(t.purchase_amount_usd) AS revenue
FROM transactions t
LEFT JOIN ride_requests rr ON t.ride_id = rr.ride_id
LEFT JOIN signups s ON rr.user_id = s.user_id
WHERE t.charge_status = 'Approved'
GROUP BY age_range
ORDER BY revenue DESC;