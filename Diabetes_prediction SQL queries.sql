USE diabetes_prediction

# 1)

Select EmployeeName, Patient_id, age
From diabetes_prediction

# 2)

Select *
From diabetes_prediction
Where gender = "Female" and age > 40
order by age

# 3) 

select AVG(bmi) as Average_BMI
From diabetes_prediction

# 4)

Select *
From diabetes_prediction
order by blood_glucose_level desc

# 5)

Select *
From diabetes_prediction
where hypertension = 1 and diabetes = 1

# 6)

Select count(Patient_id)
From diabetes_prediction
where heart_disease = 1

# 7)

SELECT smoking_history, COUNT(*) AS count
FROM diabetes_prediction
GROUP BY smoking_history

# 8) 

Select Patient_id, bmi
FROM diabetes_prediction
where bmi > (select Avg(bmi) From diabetes_prediction)

# 9)

Select *
FROM diabetes_prediction
where HbA1c_level = (Select max(HbA1c_level) From diabetes_prediction)
Union
Select *
FROM diabetes_prediction
where HbA1c_level = (Select Min(HbA1c_level) From diabetes_prediction)

# 10)

SELECT Patient_id, TIMESTAMPDIFF(YEAR, age, CURDATE()) AS age_in_years
FROM diabetes_prediction

# 11)

Select EmployeeName, Patient_id, blood_glucose_level, RANK() OVER (Partition by gender order by blood_glucose_level) as glucose_level_rank
From diabetes_prediction

# 12)

UPDATE diabetes_prediction
SET smoking_history = 'Ex-smoker'
WHERE age > 50;

# 13)

INSERT INTO diabetes_prediction (EmployeeName, Patient_id, gender, age, hypertension, heart_disease, smoking_history, bmi, HbA1c_level, blood_glucose_level, diabetes)
VALUES 
('John Doe', 1, 'Male', 45, 1, 0, 'Past', 25.5, 6.2, 110, 0),
('Jane Smith', 2, 'Female', 55, 0, 1, 'Never', 28.0, 7.5, 150, 1);

# 14)

DELETE FROM diabetes_prediction
WHERE heart_disease = 'Yes';

# 15)

SELECT * 
FROM diabetes_prediction
WHERE hypertension = 1
AND Patient_id NOT IN (SELECT Patient_id FROM diabetes_prediction WHERE diabetes = 1);

# 16)

ALTER TABLE diabetes_prediction
ADD CONSTRAINT patient_id_unique UNIQUE (Patient_id);

# 17)

CREATE VIEW patient_info AS
SELECT Patient_id, age, bmi
FROM diabetes_prediction;

SELECT * FROM patient_info;






