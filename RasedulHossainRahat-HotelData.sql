USE Hotel;
INSERT INTO Guest(FirstName, LastName, Address, City, State, Zip, PhoneNumber) VALUES
	('Rasedul Hossain', 'Rahat', '2022 Dayton Avenue', 'St.Paul', 'MN', '52101', '(563) 293-1928'),
    ('Mack', 'Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '(291) 553-0508'),
	('Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654', '(478) 277-9632'),
	('Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '(308) 494-0198'),
    ('Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096	', '(214) 730-0298'),
	('Aurore', 'Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '(377) 507-0974'),
	('Zachery', 'Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', '80003', '(814) 485-2615'),
	('Jeremiah', 'Pendergrass', '70 Oakwood St.', 'Zion', 'IL', '60099', '(279) 491-0960'),
	('Walter', 'Holaway', '7556 Arrowhead St.', 'Cumberland	', 'RI', '02864', '(446) 396-6785'),
	('Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '(834) 727-1001'),
	('Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA', '22015', '(446) 351-6860'),
    ('Joleen', 'Tison', '87 Queen St.', 'Drexel Hill', 'PA', '19026', '(231) 893-2755');
   
INSERT INTO Amenities(AmenitiesName, BasePrice) VALUES
	('Microwave', 0.00),
    ('Oven', 0.00),
    ('Refrigerator', 0.00),
    ('Jacuzzi', 25.00);
    
INSERT INTO Roomtype(RoomTypeName, Price, StandardOccupancy, MaxOccupancy, ExtraPersonRate) VALUES
    ('Single', 149.99, 2, 2, 0.00),
    ('Double', 174.99, 2, 4, 10.00),
    ('Suite', 399.99, 3, 8, 20.00);
    
INSERT INTO Room(RoomId, RoomTypeId, AdaAccessible) VALUES
	(201, 2, FALSE),
    (202, 2, TRUE),
    (203, 2, FALSE),
    (204, 2, TRUE),
    (205, 1, FALSE),
    (206, 1, TRUE),
    (207, 1, FALSE),
    (208, 1, TRUE),
    (301, 2, FALSE),
    (302, 2, TRUE),
    (303, 2, FALSE),
    (304, 2, TRUE),
    (305, 1, FALSE),
    (306, 1, TRUE),
    (307, 1, FALSE),
    (308, 1, TRUE),
    (401, 3, TRUE),
    (402, 3, TRUE);
    
INSERT INTO Reservation(GuestId) VALUES
	(2),
    (3),
    (4),
    (5),
    (1),
    (6),
    (7),
    (8),
    (9),
    (10),
    (11),
    (12),
    (12),
    (6),
    (1),
    (9),
    (10),
    (3),
    (3),
    (2),
    (5),
    (4),
    (2),
    (2),
    (11);
    
INSERT INTO RoomReservation(ReservationId, RoomId, StartDate, EndDate, AdultNumber, ChildrenNumber) VALUES
	(1, 308, '2023-02-02', '2023-02-04', 1, 0),
    (2, 203, '2023-02-05', '2023-02-10', 2, 1),
    (3, 305, '2023-02-22', '2023-02-24', 2, 0),
    (4, 201, '2023-03-06', '2023-03-07', 2, 2),
    (5, 307, '2023-03-17', '2023-03-20', 1, 1),
    (6, 302, '2023-03-18', '2023-03-23', 3, 0),
    (7, 202, '2023-03-29', '2023-03-31', 2, 2),
    (8, 304, '2023-03-31', '2023-04-05', 2, 0),
    (9, 301, '2023-04-09', '2023-04-13', 1, 0),
    (10, 207, '2023-04-23', '2023-04-24', 1, 1),
    (11, 401, '2023-05-30', '2023-06-02', 2, 4),
    (12, 206, '2023-06-10', '2023-06-14', 2, 0),
    (13, 208, '2023-06-10', '2023-06-14', 1, 0),
    (14, 304, '2023-06-17', '2023-06-18', 3, 0),
    (15, 205, '2023-06-28', '2023-07-02', 2, 0),
    (16, 204, '2023-07-13', '2023-07-14', 3, 1),
    (17, 401, '2023-07-18', '2023-07-21', 4, 2),
    (18, 303, '2023-07-28', '2023-07-29', 2, 1),
    (19, 305, '2023-08-30', '2023-09-01', 1, 0),
    (20, 208, '2023-09-16', '2023-09-17', 2, 0),
    (21, 203, '2023-09-13', '2023-09-15', 2, 2),
    (22, 401, '2023-11-22', '2023-11-25', 2, 2),
    (23, 206, '2023-11-22', '2023-11-25', 2, 0),
    (24, 301, '2023-11-22', '2023-11-25', 2, 2),
    (25, 302, '2023-12-24', '2023-12-28', 2, 0);
    
INSERT INTO RoomTypeRate(RoomTypeId, StartDate, EndDate, DifferenceInRate, DifferenceInRateType) VALUES
	(1, '2019-09-05', '2019-09-07', 150.00, 'Amount'),
    (2, '2019-09-05', '2019-09-07', 250.00, 'Amount'),
    (3, '2019-09-05', '2019-09-07', 350.00, 'Amount');
    
INSERT INTO RoomAmenities(RoomId, AmenitiesId) VALUES 
	(201, 1),
    (201, 4),
    (202, 3),
    (203, 1),
    (203, 4),
    (204, 3),
    (205, 1),
    (205, 3),
    (205, 4),
    (206, 1),
    (206, 3),
    (207, 1),
    (207, 3),
    (207, 4),
    (208, 1),
    (208, 3),
    (301, 1),
    (301, 4),
    (302, 3),
    (303, 1),
    (303, 4),
    (304, 3),
    (305, 1),
    (305, 3),
    (305, 4),
    (306, 1),
    (306, 3),
    (307, 1),
    (307, 3),
    (307, 4),
    (308, 1),
    (308, 3),
    (401, 1),
    (401, 3),
    (401, 2),
    (402, 1),
    (402, 3),
    (402, 2);
        
DELETE FROM RoomReservation
WHERE ReservationId = 8;

DELETE FROM Reservation
WHERE GuestId = 8;

DELETE FROM Guest
WHERE GuestId = 8;

SELECT *
FROM Guest;


