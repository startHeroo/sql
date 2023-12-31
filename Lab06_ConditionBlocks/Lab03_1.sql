 
--1.16095532346930783707184
DECLARE @FEMALESALE AS FLOAT
DECLARE @MALESALE AS FLOAT
DECLARE @RATIO AS FLOAT
SELECT @FEMALESALE=SUM(TOTALPRICE) FROM LAB03 WHERE CUSTOMERGENDER='K'
SELECT @MALESALE=SUM(TOTALPRICE) FROM LAB03 WHERE CUSTOMERGENDER='E'
SET @RATIO =@FEMALESALE/@MALESALE

SELECT @FEMALESALE,@MALESALE,@RATIO

SELECT DISTINCT CITY ,
(SELECT SUM(TOTALPRICE) FROM LAB03 WHERE CUSTOMERGENDER='K' AND CITY=S.CITY) FEMALESALE,
(SELECT SUM(TOTALPRICE) FROM LAB03 WHERE CUSTOMERGENDER='E' AND CITY=S.CITY) MALESALE,

(SELECT SUM(TOTALPRICE) FROM LAB03 WHERE CUSTOMERGENDER='K' AND CITY=S.CITY)/
(SELECT SUM(TOTALPRICE) FROM LAB03 WHERE CUSTOMERGENDER='E' AND CITY=S.CITY)  RATIO,
CASE 
	WHEN (SELECT SUM(TOTALPRICE) FROM LAB03 WHERE CUSTOMERGENDER='K' AND CITY=S.CITY)/
(SELECT SUM(TOTALPRICE) FROM LAB03 WHERE CUSTOMERGENDER='E' AND CITY=S.CITY)>@RATIO THEN 'ORTALAMADAN Y�KSEK'
ELSE 'ORTALAMADAN D���K'
END AS STATUS_

FROM LAB03 S
ORDER BY 1
 
 