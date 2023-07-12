CREATE FUNCTION DBO.GETCURRENTTEAM(@PLAYERID AS INT)
RETURNS VARCHAR(100)
AS
BEGIN
DECLARE @RESULT AS VARCHAR(100)
SELECT TOP 1 @RESULT=TEAM 
FROM LAB_MATCH_PLAYER
WHERE PLAYERID=@PLAYERID 
ORDER BY DATE_ DESC 

RETURN @RESULT 
END

CREATE FUNCTION DBO.GETTEAMCOUNT(@PLAYERID AS INT)
RETURNS INT
AS
BEGIN
DECLARE @RESULT AS INT
SELECT @RESULT=COUNT(DISTINCT TEAM) FROM LAB_MATCH_PLAYER
WHERE PLAYERID=@PLAYERID
RETURN @RESULT
END

CREATE FUNCTION DBO.GETMATCHCOUNT(@PLAYERID AS INT)
RETURNS INT
AS
BEGIN
DECLARE @RESULT AS INT
SELECT @RESULT=COUNT(*) FROM LAB_MATCH_PLAYER
WHERE PLAYERID=@PLAYERID
RETURN @RESULT
END

CREATE FUNCTION DBO.GETPLAYINGYEAR(@PLAYERID AS INT)
RETURNS INT
AS
BEGIN
DECLARE @RESULT AS INT
SELECT @RESULT=DATEDIFF(YEAR,MIN(DATE_),MAX(DATE_)) FROM LAB_MATCH_PLAYER
WHERE PLAYERID=@PLAYERID
RETURN @RESULT
END

/*
Her bir futbolcunun 
-Mevcut oynad��� tak�m�
-Ka� farkl� tak�mda oynad���n�
-Toplam ka� ma� yapt���n�
-Ka� y�ld�r futbol oynad���n� 
getiren fonksiyonlar� yaz�n�z.
*/

SELECT PLAYER_API_ID,PLAYER_NAME,
DBO.GETCURRENTTEAM(PLAYER_API_ID) CURRENTTEAM,
DBO.GETTEAMCOUNT(PLAYER_API_ID) TEAMCOUNT,
DBO.GETMATCHCOUNT(PLAYER_API_ID) MATCHCOUNT,
DBO.GETPLAYINGYEAR(PLAYER_API_ID) PLAYINGYEAR
FROM LAB_PLAYER WHERE PLAYER_NAME LIKE '%MESS�%'

 