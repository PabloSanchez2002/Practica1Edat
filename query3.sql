SELECT a.airport_code,
       Count(b.boarding_no) AS boarding_number
FROM   airports_data a
       JOIN flights f
         ON a.airport_code = f.arrival_airport
       JOIN ticket_flights tf
         ON f.flight_id = tf.flight_id
       JOIN boarding_passes b
         ON b.ticket_no = tf.ticket_no
WHERE  f.status = 'Arrived'
GROUP  BY a.airport_code
ORDER  BY boarding_number ASC;  
