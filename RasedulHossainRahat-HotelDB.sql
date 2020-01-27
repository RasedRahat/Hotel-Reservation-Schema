DROP DATABASE IF EXISTS Hotel;
CREATE DATABASE Hotel;
USE Hotel;

CREATE TABLE RoomType(
	RoomTypeId INT PRIMARY KEY AUTO_INCREMENT,
    RoomTypeName VARCHAR(10) NOT NULL,
    Price DECIMAL(6,2) NOT NULL,
    StandardOccupancy INT NOT NULL,
    MaxOccupancy INT NOT NULL,
    ExtraPersonRate DECIMAL NOT NULL
);
CREATE TABLE RoomTypeRate(
	RateId INT PRIMARY KEY AUTO_INCREMENT,
    RoomTypeId INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    DifferenceInRate DECIMAL (6,2) NOT NULL,
    DifferenceInRateType VARCHAR(30) NOT NULL,
    FOREIGN KEY fk_RoomTypeRate_RoomType(RoomTypeId)
		REFERENCES RoomType(RoomTypeID)
);

CREATE TABLE Room(
	RoomId INT PRIMARY KEY AUTO_INCREMENT,
    RoomTypeId INT NOT NULL, 
    AdaAccessible BOOLEAN NOT NULL,
    FOREIGN KEY fk_Room_RoomType(RoomTypeId)
		REFERENCES RoomType(RoomTypeID)
);

CREATE TABLE Amenities(
	AmenitiesId INT PRIMARY KEY AUTO_INCREMENT,
    AmenitiesName VARCHAR(30) NOT NULL,
    BasePrice DECIMAL(6,2) NOT NULL
);

CREATE TABLE RoomAmenities(
	RoomId INT NOT NULL,
    AmenitiesId INT NOT NULL,
	PRIMARY KEY(RoomId, AmenitiesId),
    FOREIGN KEY fk_RoomAmenities_Room(RoomId)
		REFERENCES Room(RoomId),
	FOREIGN KEY fk_RoomAmenities_AmenitiesId(AmenitiesId)
		REFERENCES Amenities(AmenitiesId)
);

CREATE TABLE Guest(
	GuestId INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Address VARCHAR(30) NOT NULL,
    City VARCHAR(30) NOT NULL,
    State VARCHAR(30) NOT NULL,
    Zip VARCHAR(30)NOT NULL,
    PhoneNumber VARCHAR(30) NOT NULL
);

CREATE TABLE Reservation(
	ReservationId INT PRIMARY KEY AUTO_INCREMENT,
    GuestId INT NOT NULL,  
    FOREIGN KEY fk_Reservation_Guest(GuestId)
		REFERENCES Guest(GuestId)
);

CREATE TABLE RoomReservation(
	ReservationId INT NOT NULL,
    RoomId INT NOT NULL,
    PRIMARY KEY pk_RoomReservation(ReservationId, RoomId),
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    AdultNumber INT NOT NULL,
    ChildrenNumber INT NOT NULL,
    FOREIGN KEY fk_RoomReservation_Reservation(ReservationId)
		REFERENCES Reservation(ReservationId),
	FOREIGN KEY fk_RoomReservation_Room(RoomId)
		REFERENCES Room(RoomId)
);