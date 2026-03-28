SELECT 
    platform,
    funnel_name,
    SUM(number_of_users) AS users
FROM funnel_analysis
GROUP BY platform, funnel_name
ORDER BY platform, funnel_name;