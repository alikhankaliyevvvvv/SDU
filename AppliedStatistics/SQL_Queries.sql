CREATE TABLE IF NOT EXISTS insurance(
	age INT,
	sex VARCHAR(10),
	bmi NUMERIC,
	children INT,
	smoker VARCHAR(10),
	region VARCHAR(50),
	charges NUMERIC
);

SELECT COUNT(*)
FROM insurance i;

SELECT COUNT(*), sex
FROM insurance i 
GROUP BY i.sex;

SELECT COUNT(*), smoker
FROM insurance i 
GROUP BY i.smoker;

SELECT COUNT(*), region
FROM insurance i 
GROUP BY i.region;

SELECT COUNT(*), bmi
FROM insurance i 
GROUP BY i.bmi;

SELECT MIN(i.age), i.smoker
FROM insurance i 
GROUP BY i.smoker;

SELECT MAX(i.age), i.smoker
FROM insurance i 
GROUP BY i.smoker;

SELECT AVG(i.age), i.smoker
FROM insurance i 
GROUP BY i.smoker;

SELECT AVG(i.charges), i.smoker
FROM insurance i 
GROUP BY i.smoker;

SELECT AVG(i.charges), i.age
FROM insurance i 
GROUP BY i.age
ORDER BY age ASC;

SELECT 
    age, 
    AVG(charges) AS avg_charges,
    ROUND(SUM(CASE WHEN smoker = 'yes' THEN 1 ELSE 0 END)::NUMERIC / COUNT(*) * 100, 2) AS smoker_percentage
FROM insurance
GROUP BY age
ORDER BY age ASC;

SELECT
	COUNT(*),
	CASE 
		WHEN bmi < 18.5 THEN 'Underweight'
		WHEN bmi BETWEEN 18.5 AND 25 THEN 'Healthy Weight'
		WHEN bmi BETWEEN 25 AND 30 THEN 'Overweight'
		ELSE 'Obesity'
	END AS bmi_groups,
	ROUND(SUM(CASE WHEN smoker = 'yes' THEN 1 ELSE 0 END)::NUMERIC / COUNT(*) * 100, 2) AS smoker_percentage
FROM insurance
GROUP BY bmi_groups;

SELECT 
    age, 
    sex, 
    charges,
    smoker,
    region,
    bmi,
    children,
    AVG(charges) OVER(PARTITION BY age) AS avg_charges_for_this_age,
    charges - AVG(charges) OVER(PARTITION BY age) AS difference_from_avg
FROM insurance
ORDER BY age ASC, charges DESC;