SELECT 
CITY,SUM(TOTALPRICE) TOTALSALE,
(
SELECT SUM(TOTALPRICE) FROM LAB08 
	WHERE CITY=L.CITY 
	AND YEAR(DATE_)=YEAR(GETDATE()) AND MONTH(DATE_)=MONTH(GETDATE())-1
) TOTALSALE_PREVMONTH
FROM LAB08 L
WHERE YEAR(DATE_)=YEAR(GETDATE()) AND MONTH(DATE_)=MONTH(GETDATE())
GROUP BY CITY
ORDER BY 1 
  
