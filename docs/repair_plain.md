## Data Integrity Audit and Repair Plan

# Duplicate data check 
SELECT email, COUNT(*) 
FROM students 
GROUP BY email
HAVING COUNT(*) > 1;
--This query checks for duplicate student emails

# Missing foreign key check 
SELECT * 
FROM emrollments 
WHERE student_id NOT IN (
    SELECT student_id FROM students
);
--THis query checks for invalid student references in the enrollment table 

# Repair paln 
 -identiy duplicate or invalid records 
 -verify data before making changes 
 -use transactions before update or delete operations 
 -maintain backup copies of original data 

# safe repair example 
BEGIN TRANSACTION;
DELETE FROM students
WHERE student_id= 100;
ROLLBACK;
