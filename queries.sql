-- Artists and shows performed in
SELECT ARTIST.ArtistName, SHOW.ShowName FROM ARTIST 
JOIN SHOW_ARTISTS ON ARTIST.ArtistID = SHOW_ARTISTS.ARTISTID
JOIN SHOW ON SHOW.ShowID = SHOW_ARTISTS.ShowID GROUP BY ARTIST.ArtistName, SHOW.ShowName;

--Artists with the most performances
SELECT ARTIST.ArtistNAME, COUNT(SHOW_ARTISTS.ShowID) AS Performances FROM ARTIST
JOIN SHOW_ARTISTS ON ARTIST.ArtistID = SHOW_ARTISTS.ArtistID GROUP BY ARTIST.ArtistName
HAVING COUNT(SHOW_ARTISTS.ShowID) =(SELECT MAX(Performances) FROM (SELECT COUNT(SHOW_ARTISTS.ShowID)
AS Performances FROM SHOW_ARTISTS GROUP BY SHOW_ARTISTS.ArtistID) AS COUNTS);

--Venue where artists have or will perform at
SELECT ARTIST.ArtistName, VENUE.VenueName, SHOW.ShowName FROM ARTIST
JOIN SHOW_ARTISTS ON ARTIST.ArtistID = SHOW_ARTISTS.ArtistID 
JOIN SHOW ON SHOW.ShowID = SHOW_ARTISTS.ShowID 
JOIN VENUE ON VENUE.VenueID = SHOW.VenueID;

--The district that has produced the most performing artists.
SELECT ARTIST.District, COUNT(SHOW_ARTISTS.ShowID) AS Performances FROM ARTIST
JOIN SHOW_ARTISTS ON ARTIST.ArtistID = SHOW_ARTISTS.ArtistID GROUP BY ARTIST.District
HAVING COUNT(SHOW_ARTISTS.ShowID) =(SELECT MAX(Performances) FROM (SELECT Artist.District, COUNT(SHOW_ARTISTS.ShowID)
AS Performances FROM ARTIST JOIN SHOW_ARTISTS ON ARTIST.ArtistID = SHOW_ARTISTS.ArtistID
GROUP BY ARTIST.District) AS COUNTS);

--Highest-paid show an artist has performed in (show name, venue, date, and price.
SELECT SHOW.ShowName, SHOW.StartDate, SHOW.EndDate, SHOW.Price, VENUE.VenueName
FROM SHOW JOIN VENUE ON SHOW.VenueID = VENUE.VenueID ORDER BY SHOW.Price DESC LIMIT 1;

--Query 1: Highest-paid show an artist performed in
SELECT a.ArtistName, s.ShowName, v.VenueName, s.StartDate, s.Price
FROM ARTIST a
JOIN SHOW_ARTISTS sa ON a.ArtistID = sa.ArtistID
JOIN SHOW s ON sa.ShowID = s.ShowID
JOIN VENUE v ON s.VenueID = v.VenueID
WHERE s.Price = (SELECT MAX(Price) FROM SHOW);

--Query 2: District that produced the most performing artists
SELECT District, ArtistCount
FROM (SELECT District, COUNT(ArtistID) AS ArtistCount
FROM ARTIST
GROUP BY District) AS DistrictStats
WHERE ArtistCount = (SELECT MAX(CountPerDistrict) 
FROM (SELECT COUNT(ArtistID) AS CountPerDistrict 
FROM ARTIST 
GROUP BY District) AS MaxSub
);
