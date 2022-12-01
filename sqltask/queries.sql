INSERT INTO plane(MaxPassengersNumber, Name) VALUES
(250, 'AN-225 MRIYA'),
(500, 'BOIENG-7310'),
(150, 'AT-26');

INSERT INTO address(Country, City, Street, BuildingNumber) VALUES
('Ukraine', 'Kharkiv', 'Liudviga Svobody', '51B'),
('USA', 'Chicago', 'J.Bush', '25'),
('Turky', 'Stambul', 'Bashakshakir', '17');

INSERT INTO aeroport(Name, Code, Address_Id) VALUES
('Airport1', 'ARP1', '1'),
('Airport2', 'ARP2', '2'),
('Airport3', 'ARP3', '3');

INSERT INTO tickethistory(Id) VALUES
(1),
(2),
(3),
(4),
(5);

INSERT INTO passenger(Name, Surname, DateOfBirth, TicketHistory_Id) VALUES
('Mark', 'Jacobs', '1990-10-10', 1),
('May', 'Rudy', '1990-10-10', 2),
('Fill', 'Jones', '1990-10-10', 3),
('Ivan', 'Petrov', '1990-10-10', 4),
('Petro', 'Ivanov', '1990-10-10', 5);

INSERT INTO ticket(TicketHistory_Id, Passenger_Id) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO ticket_has_plane(Ticket_Id, Plane_Id) VALUES
(1, 1),
(1, 2),
(2, 3),
(4, 1);

INSERT INTO ticket_has_aeroport(Ticket_Id, Aeroport_Id, DepatureDate, ArrivalDate) VALUES
(1, 1, '2022-12-01', '2022-12-02'),
(1, 2, '2022-12-03', '2022-12-04'),
(2, 1, '2022-12-05', '2022-12-06'),
(3, 1, '2022-12-10', '2022-12-11'),
(1, 3, '2022-12-12', '2022-12-14'),
(2, 2, '2022-12-20', '2022-12-21');

SELECT * FROM ticket FULL JOIN passenger;

SELECT * FROM ticket ORDER BY Id DESC LIMIT 5;

SELECT COUNT(ticket.Id), passenger.Id FROM passenger JOIN ticket ON ticket.Passenger_Id = passenger.Id GROUP BY passenger.Id HAVING MAX(1) LIMIT 3;