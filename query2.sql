SELECT 
	b.book_ref, b.total_amount, tf.amount, b.total_amount - tf.amount AS precio_reserva 

FROM
	bookings b JOIN tickets t ON t.book_ref = b.book_ref JOIN ticket_flights tf  ON tf.ticket_no = t.ticket_no
	
	ORDER BY (b.total_amount - tf.amount)