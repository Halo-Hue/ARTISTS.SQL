--Function 1

CREATE OR REPLACE FUNCTION ArtistLoyaltyRank(
artist_id INT
)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
activeYears INT;
A_name VARCHAR(100);
BEGIN
    SELECT YearsActive, ArtistName INTO activeYears, A_name
	  FROM ARTIST
    WHERE artist_id = ArtistID;
	  IF activeYears >= 5 THEN
	  RETURN  A_name || ' Veteran';
	  ELSE 
	  RETURN A_name || ' Beginner';
	  END IF;
END;
$$;
SELECT ArtistLoyaltyRank(1)
SELECT * FROM ARTIST


-- 2. GetArtistShowCount: Returns total shows for an artist Name.
CREATE OR REPLACE FUNCTION GetArtistShowCount(p_ArtistName VARCHAR) 
RETURNS INT AS $$
DECLARE
    v_Count INT;
BEGIN
    SELECT COUNT(sa.ShowID) INTO v_Count
    FROM SHOW_ARTISTS sa
    JOIN ARTIST a ON sa.ArtistID = a.ArtistID
    WHERE a.ArtistName = p_ArtistName;
    
    RETURN v_Count;
END;
$$ LANGUAGE plpgsql;



-- Trigger Function
CREATE OR REPLACE FUNCTION log_price_change()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.Price <> NEW.Price THEN
        INSERT INTO PRICE_HISTORY (ShowID, OldPrice, NewPrice)
        VALUES (OLD.ShowID, OLD.Price, NEW.Price);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create Trigger
CREATE TRIGGER AuditPriceChange
AFTER UPDATE ON SHOW
FOR EACH ROW
EXECUTE FUNCTION log_price_change();


