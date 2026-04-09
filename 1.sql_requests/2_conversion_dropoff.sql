SELECT funnel_step,
	   funnel_name,
	   COUNT(*) AS rows_s,
	   SUM(number_of_users) AS users,
	   SUM(number_of_rides) AS rides
FROM funnel_analysis
GROUP BY 1, 2
ORDER BY 1