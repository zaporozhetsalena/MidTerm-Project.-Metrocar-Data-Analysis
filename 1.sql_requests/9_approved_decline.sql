SELECT 
    charge_status,
    COUNT(*) AS total_transactions,
    ROUND(COUNT(*) * 1.0 / SUM(COUNT(*)) OVER (), 2) AS share
FROM transactions
GROUP BY charge_status;