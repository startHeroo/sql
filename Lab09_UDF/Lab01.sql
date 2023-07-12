CREATE FUNCTION DBO.GETAGE(@BIRTHDATE AS DATE)
RETURNS INT
AS
BEGIN
	DECLARE @RESULT AS INT
	SET @RESULT=DATEDIFF(YEAR,@BIRTHDATE,GETDATE())
	RETURN @RESULT 
END

SELECT *,
DBO.GETAGE(BIRTHDATE) AGE
FROM LAB_PLAYER