SELECT 
    curr.funnel_step,
    curr.funnel_name,
    curr.users,
    prev.users AS previous_stage_users,
    ROUND(curr.users * 1.0 / prev.users, 2) AS conversion_rate,
    ROUND(1 - (curr.users * 1.0 / prev.users), 2) AS drop_off_rate
FROM (
    SELECT 
        funnel_step,
        funnel_name,
        SUM(number_of_users) AS users
    FROM funnel_analysis
    GROUP BY funnel_step, funnel_name
) curr
LEFT JOIN (
    SELECT 
        funnel_step,
        SUM(number_of_users) AS users
    FROM funnel_analysis
    GROUP BY funnel_step
) prev
ON curr.funnel_step = prev.funnel_step + 1

ORDER BY curr.funnel_step;