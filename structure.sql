CREATE TABLE ARTIST (
    ArtistID SERIAL PRIMARY KEY,
    ArtistName VARCHAR(45) NOT NULL,
    StageName VARCHAR(45),
    Genre VARCHAR(45),
    Address VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(120),
    District VARCHAR(120),
    YearsActive INT
);

CREATE TABLE VENUE (
    VenueID SERIAL PRIMARY KEY,
    VenueName VARCHAR(40) NOT NULL,
    Address VARCHAR(120) NOT NULL,
    Phone VARCHAR(20),
    District VARCHAR(120),
    Capacity INT NOT NULL
);

CREATE TABLE SHOW (
    ShowID SERIAL PRIMARY KEY,
    VenueID INT,
    ShowName VARCHAR(40) NOT NULL,
    StartDate DATE Not Null,
    EndDate DATE Not Null,
    Price INT Not Null,
    Description VARCHAR(120),
    FOREIGN KEY (VenueID) REFERENCES VENUE(VenueID)
);

CREATE TABLE SHOW_ARTISTS (
    ShowID INT,
    ArtistID INT,
    PerformanceRole VARCHAR(40) NOT NULL,
    PRIMARY KEY (ShowID, ArtistID),
    FOREIGN KEY (ShowID) REFERENCES SHOW(ShowID),
    FOREIGN KEY (ArtistID) REFERENCES ARTIST(ArtistID)
);



-- Artist DATA

INSERT INTO ARTIST (ArtistName, StageName, Genre, Address, Phone, Email, District, YearsActive) VALUES 
('Anna Marie', 'Voila', 'Opera', '123 TownsVille', '789-4532', 'AnnaMarieOfficial@gmail.com', 'Toledo', 2),
('John Martin', 'Collier', 'Theater', '243 BananaLake.', '654-1991', 'JM.Office@gmail.com', 'Cayo', 7),
('Sam Coffmann', 'Coffee', 'Theater', '244 BananaLake.', '698-1221', 'SamCoffee@gmail.com', 'Cayo', 1),
('Navier Ellie. Trovi', 'Queen', 'Theater', '999 WesternLake.', '654-9999', 'Navier2434@gmail.com', 'Cayo', 2),
('Wontario D. Melvin', 'Clown', 'Comedy', '465 TownVille.', '623-1276', 'OneAndAll@gmail.com', 'Toledo', 3),
('Hennie Winters', 'Kharina', 'Dance', '324 RoganaSt.', '856-3265', 'Tumaini@gmail.com', 'StannCreek', 4),
('Mark Fullburn', 'John Smith', 'Music', '22 BottleneckVille.', '264-2296', 'JS@gmail.com', 'Corozal', 10),
('Anna Croft', 'Carmellia', 'Music', '298 ModernSt.', '660-9456', 'BloomInWinter@gmail.com', 'Toledo', 5),
('Mercurio Van Astrea', 'Timmy', 'Comedy', '48 BottleneckVille.', '091-8543', 'ImmatureFun@gmail.com', 'Corozal', 2),
('Marianne Magentano', 'Sonata', 'Dance', '281 WesternLake.', '221-0054', 'JimmiePep@gmail.com', 'Cayo', 1);



--VENUE DATA

iNSERT INTO VENUE (VenueName, Address, Phone, District, Capacity) VALUES
('Saint Vermont', '182 Vermont St.', '555-0011', 'Stann Creek', 1000),
('Backlund Grand Theater', '152 Backlund St.', '811-0034', 'Backlund', 500),
('Planarcadia', '423 AHA St.', '613-1981', 'Cayo', 150),
('Light Steps', '432 MorningDew Avenue', '898-7171', 'Orange Walk', 600),
('Dewlight Park', '749 DewlightSt.', '614-9082', 'Cayo', 75),
('Theodore Grand Bazaar', '091 South-Henny St.', '888-5621', 'Stann Creek', 1500),
('Scarlet Academy Auditorium', '822 Ultima Avenue.', '622-2201', 'Toledo', 150),
('Tender Night', '212 Chicki St.', '212-0078', 'Corozal', 120),
('Beaming Church', '129 Camelot St.', '621-5497', 'Cayo', 225),
('Backlund Grand Church', '810 Backlund St.', '613-1452', 'Backlund', 610);

--SHOW DATA

INSERT INTO SHOW (VenueID, ShowName, StartDate, EndDate, Price, Description) VALUES
(1, 'La Traviata', '2020-11-12', '2020-12-12', 200, 'An evening of classical opera'),
(2, 'Hamlet', '2021-09-13', '2021-09-13', 25, 'Who does''nt know Hamlet?'),
(3, 'HeHe', '2021-09-13', '2021-09-13', 10, 'AHAHAHAHA!!'),
(4, 'Graceful Resonance In Flight', '2021-11-23', '2021-11-24', 350, 'Come! Release your shackles and soar with me!'),
(5, 'Show and Tell', '2021-11-13', '2021-11-13', 0, 'Show us what you''ve got!!'),
(6, 'From Ashes', '2021-09-25', '2021-09-30', 250, 'From ashes we return.'),
(7, 'Scarlets Talents', '2021-09-13', '2021-09-13', 10, 'Show and be praised for your talents.'),
(8, 'Moonlight Embrace', '2022-01-01', '2022-01-03', 50, 'Two days of peace to welcome the new year.'),
(9, 'Mass', '2026-02-08', '2026-02-08', 0, 'When you embrace and welcome the lord into your life, only then can you be free.'),
(10, 'Winter Gifts Day', '2021-05-19', '2021-05-19', 0, 'Praise the goddess, offer her your gifts, and find peace in slumber.');

--SHOW_ARTISTS DATA

INSERT INTO SHOW_ARTISTS (ShowID, ArtistID, PerformanceRole) VALUES
(1, 1, 'Lead'),
(2, 2, 'Hamlet'),
(2, 3, 'Claudius'),
(2, 4, 'Gertrude'),
(3, 5, 'Lead'),
(4, 6, 'Lead'),
(7, 5, 'Lead Comedian'),
(8, 6, 'Principal Dancer'),
(9, 7, 'Choir Leader'),
(10, 8, 'Guest Performer');

