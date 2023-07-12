TRUNCATE TABLE LAB03_PLATES 

DECLARE @I AS INT=0
WHILE @I<100000
BEGIN
	DECLARE @PLATE AS VARCHAR(20)
	DECLARE @CARID AS INT=1
	DECLARE @CITYID AS INT=1
	DECLARE @LETTER1 AS VARCHAR(1)='A'
	DECLARE @LETTER2 AS VARCHAR(1)='B'
	DECLARE @NUMBER AS INT=1499
	DECLARE @RANDID AS INT
	SET @CARID =1+(RAND()*6537)
	--SET @CITYID =1+(RAND()*80)
	SET @RANDID =1+(RAND()*21)
	SELECT @LETTER1=LETTER FROM LAB03_LETTERS WHERE ID=@RANDID 
	SET @RANDID =1+(RAND()*21)
	SELECT @LETTER2=LETTER FROM LAB03_LETTERS WHERE ID=@RANDID 
	SET @NUMBER =1+(RAND()*9999)

	SET @RANDID=RAND()*10337
	SELECT @CITYID =ID  FROM LAB03_CITIES WHERE @RANDID BETWEEN RANDOMBEG AND RANDOMEND

	SET @PLATE =REPLICATE('0',2-LEN(@CITYID)) +CONVERT(VARCHAR,@CITYID)

	SET @PLATE =@PLATE+@LETTER1+@LETTER2
	SET @PLATE =@PLATE+REPLICATE('0',4-LEN(@NUMBER)) +CONVERT(VARCHAR,@NUMBER)
	INSERT INTO LAB03_PLATES(PLATE,CARID) VALUES (@PLATE,@CARID)

SET @I=@I+1 
END
SELECT LEFT(PLATE,2),COUNT(P.ID) FROM LAB03_PLATES P
JOIN LAB03_CARMODELS C ON C.ID=P.CARID
GROUP BY LEFT(PLATE,2)
ORDER BY 2 DESC 

 