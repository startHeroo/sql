SET Language Turkish
SELECT 
	YEAR(DATE_) YEAR_,
	MONTH(DATE_) MONTH_,
	DATENAME(MONTH,DATE_) MONTHNAME_,
	SUM(TOTALPRICE) TOTALSALE
FROM LAB06
WHERE DATEPART(DAY,DATE_) BETWEEN 10 AND 15
GROUP BY YEAR(DATE_), MONTH(DATE_) ,
DATENAME(MONTH,DATE_)
ORDER BY 1,2
 