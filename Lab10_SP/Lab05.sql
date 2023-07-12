ALTER PROC SP_SEARCH
@BEGDATE AS DATETIME,
@ENDDATE AS DATETIME,
@STRTOSEARCH AS VARCHAR(200)
AS
DECLARE @USERNAME AS VARCHAR(50)
DECLARE @PROCNAME AS VARCHAR(100)='SP_SEARCH'
DECLARE @PARAMETERS AS VARCHAR(250)
DECLARE @PBEGDATE AS DATETIME
DECLARE @PENDDATE AS DATETIME
DECLARE @DURATION AS INT

SET @USERNAME = SUSER_SNAME()
SET @PARAMETERS='@BEGDATE:'+CONVERT(VARCHAR,@BEGDATE,104)
SET @PARAMETERS=@PARAMETERS+' @ENDDATE:'+CONVERT(VARCHAR,@ENDDATE,104)
SET @PARAMETERS=@PARAMETERS+' @STRTOSEARCH:'+@STRTOSEARCH
SET @PBEGDATE =GETDATE()

SELECT * FROM LAB_STACKOVERFLOW
WHERE Text LIKE '%'+@STRTOSEARCH+'%'
AND CreationDate BETWEEN @BEGDATE AND @ENDDATE

SET @PENDDATE=GETDATE()
SET @DURATION=DATEDIFF(SECOND,@PBEGDATE,@PENDDATE)
 
INSERT INTO PROCEDURE_EXECUTION_LOG
(USERNAME_,PROCNAME,PARAMETERS,BEGDATE,ENDDATE,DURATION)
VALUES 
(@USERNAME,@PROCNAME,@PARAMETERS,@PBEGDATE,@PENDDATE,@DURATION)

EXEC SP_SEARCH @BEGDATE='20100101',@ENDDATE='20101231'
, @STRTOSEARCH='Microsoft SQL Server'

SELECT * FROM PROCEDURE_EXECUTION_LOG