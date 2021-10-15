SELECT b.book_ref, f.flight_id

FROM bookings b JOIN tickets t ON b.book_ref = t.book_ref JOIN ticket_flights tf ON tf.ticket_no = t.ticket_no 
	JOIN flights f ON f.flight_id = tf.flight_id LEFT JOIN boarding_passes bp ON bp.ticket_no = tf.ticket_no
	
	WHERE bp.ticket_no IS NULL
	ORDER BY b.book_ref, f.flight_id
