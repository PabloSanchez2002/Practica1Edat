with aircraft_seats as (select count(s.seat_no) as seats_aircraft, a.aircraft_code
				from aircrafts_data a join seats s on a.aircraft_code = s.aircraft_code group by a.aircraft_code),

	flight_occupied_seats as (select f.aircraft_code, b.flight_id, count(b.seat_no) as flight_seats from ticket_flights ti join boarding_passes b on ti.flight_id = b.flight_id and b.ticket_no = ti.ticket_no join flights f on f.flight_id = ti.flight_id group by b.flight_id, f.aircraft_code),
	
	results as (select fo.flight_id, (ass.seats_aircraft - fo.flight_seats) as avalible_seats from aircraft_seats ass, flight_occupied_seats fo where ass.aircraft_code = fo.aircraft_code group by fo.flight_id, void_seats)
	
select flight_id, avalible_seats from results where avalible_seats = (select max(avalible_seats) from results);
