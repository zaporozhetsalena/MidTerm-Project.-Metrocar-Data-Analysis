SELECT 
    SUM(purchase_amount_usd) AS total_revenue
FROM transactions
WHERE charge_status = 'Approved';