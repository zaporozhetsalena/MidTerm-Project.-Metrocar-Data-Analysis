SELECT 
    age_range,
    funnel_name,
    SUM(number_of_users) AS users
FROM funnel_analysis
GROUP BY age_range, funnel_name
ORDER BY age_range, funnel_name;