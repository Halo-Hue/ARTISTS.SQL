-- Procedure 1
CREATE OR REPLACE PROCEDURE RegisterNewArtist(
artistName VARCHAR (45),
address VARCHAR (100),
yearsActive INT
)
LANGUAGE plpgsql
AS $$
BEGIN 
    IF artistName IS NULL OR TRIM(artistname) = '' THEN 
	RAISE EXCEPTION 'Please enter a valid Artist name.';
	END IF;
	IF address IS NULL OR TRIM(address) = '' THEN
	RAISE EXCEPTION 'Please enter an address.';
	END IF;
	INSERT INTO ARTIST(ArtistName, YearsActive, Address)
	VALUES (artistName, yearsActive, address);
END;
$$;
CALL RegisterNewArtist( 'Bool Var', 'Torkid St.', 7);
SELECT * FROM ARTIST;

--Procedure 2
CREATE OR REPLACE PROCEDURE SwapShowVenue(
n_show VARCHAR (100),
n_venue VARCHAR (100)
)
LANGUAGE plpgsql
AS $$
DECLARE
n_venueid INT;
BEGIN
  IF n_show IS NULL OR TRIM(n_show) = '' THEN
	RAISE EXCEPTION 'Show name cannot be empty.';
	END IF;
	IF n_venue IS NULL OR TRIM(n_venue) = '' THEN
	RAISE EXCEPTION 'Venue name cannot be empty.';
	END IF;

	SELECT VenueID INTO n_venueid 
	FROM VENUE 
	WHERE VenueName = n_venue;
	IF n_venueid IS NULL THEN 
	RAISE EXCEPTION 'Please enter a valid venue name.';
	END IF;

	UPDATE SHOW 
	SET VenueID = n_venueid
	WHERE ShowName = n_show;
	RAISE NOTICE 'Show "%" has been moved to Venue "%".', n_show, n_venue;
END;
$$;

CALL SwapShowVenue( 'La Traviata', 'Theodore Grand Bazaar');
