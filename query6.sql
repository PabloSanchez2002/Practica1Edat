SELECT f.flight_no, avg (f.actual_arrival - f.scheduled_arrival) AS Retraso
FROM flights f WHERE f.actual_arrival IS NOT NULL
GROUP BY f.flight_no
ORDER BY Retraso DESC 