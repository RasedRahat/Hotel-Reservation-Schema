USE Hotel;
-- 1. Write a query that returns a list of reservations that end in July 2023, 
-- including the name of the guest, the room number(s), and the reservation dates.
SELECT g.FirstName, g.LastName, rr.RoomId, rr.StartDate, rr.EndDate
FROM Guest g
INNER JOIN Reservation r ON g.GuestId = r.GuestId
INNER JOIN RoomReservation rr ON r.ReservationId = rr.ReservationId
WHERE rr.EndDate BETWEEN '2023-07-01' AND '2023-07-31';
-- 4 rows returned

-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, 
-- displaying the guest's name, the room number, and the dates of the reservation.
SELECT g.FirstName, g.LastName, rr.RoomId, rr.StartDate, rr.EndDate
FROM Guest g
INNER JOIN Reservation r ON g.GuestId = r.GuestId
INNER JOIN RoomReservation rr ON r.ReservationId = rr.ReservationId
INNER JOIN Room ro ON rr.RoomId = ro.RoomId
INNER JOIN RoomAmenities ra ON ro.RoomId = ra.RoomId
WHERE AmenitiesId = 4;
-- 11 rows returned

-- 3. Write a query that returns all the rooms reserved for a specific guest, 
-- including the guest's name, the room(s) reserved, the starting date of the reservation, 
-- and how many people were included in the reservation. 
-- (Choose a guest's name from the existing data.)
SELECT g.FirstName, g.LastName, rr.RoomId, rr.StartDate, rr.EndDate, (rr.AdultNumber + rr.ChildrenNumber) AS TotalGuest
FROM Guest g
INNER JOIN Reservation r ON g.GuestId = r.GuestId
INNER JOIN RoomReservation rr ON r.ReservationId = rr.ReservationId
WHERE g.FirstName = 'Rasedul Hossain';
-- Rasedul Hossain Rahat selected and it returned 2 rows

-- 4. Write a query that returns a list of rooms, reservation ID, 
-- and per-room cost for each reservation. The results should include all rooms, 
-- whether or not there is a reservation associated with the room.
-- ((Price +  * datediff(EndDate, StartDate)) + (SUM(BasePrice) + SUM(ExtraPersonRate))) AS TotalCost
SELECT r.RoomId, rr.StartDate, rr.EndDate,
(CASE
	WHEN rr.AdultNumber > rt.StandardOccupancy THEN 
    (SUM(BasePrice) + (SUM(ExtraPersonRate)*(rr.AdultNumber - rt.StandardOccupancy)) + Price) * datediff(EndDate, StartDate) 
    ELSE
    (SUM(BasePrice) + Price) * datediff(EndDate, StartDate) 
    END) A
FROM Room r
INNER JOIN RoomType rt ON r.RoomTypeId = rt.RoomTypeId
INNER JOIN RoomAmenities ra ON r.RoomId = ra.RoomId
INNER JOIN Amenities a ON ra.AmenitiesId = a.AmenitiesId
LEFT JOIN RoomReservation rr ON r.RoomId = rr.RoomId
GROUP BY rr.RoomId, rr.ReservationId
ORDER BY rr.StartDate;
-- 25 rows returned

-- 5. Write a query that returns all the rooms accommodating at least three guests and 
-- that are reserved on any date in April 2023.
SELECT RoomId, (AdultNumber + ChildrenNumber) AS TotalGuest
FROM RoomReservation
WHERE StartDate BETWEEN '2023-04-01' AND '2023-04-30' AND EndDate BETWEEN '2023-04-01' AND '2023-04-30'
GROUP BY TotalGuest
HAVING TotalGuest >= 3;
-- 0 rows returned.

-- 6. Write a query that returns a list of all guest names and the number of reservations 
-- per guest, sorted starting with the guest with the most reservations and then by the 
-- guest's last name.
SELECT g.FirstName, g.LastName, count(rr.ReservationId) ReservationPerGuest 
FROM Guest g
INNER JOIN Reservation r ON g.GuestId = r.GuestId
INNER JOIN RoomReservation rr ON r.ReservationId = rr.ReservationId
GROUP BY g.LastName
ORDER BY ReservationPerGuest DESC, g.LastName;
-- 11 rows returned.

-- 7. Write a query that displays the name, address, and phone number of a guest based on their 
-- phone number. (Choose a phone number from the existing data.
SELECT FirstName, LastName, Address, PhoneNumber
FROM Guest
WHERE PhoneNumber = '(563) 293-1928';
-- 1 rows returned. 