--PART 3 : IMPORT VALIDATION

SELECT COUNT(*) AS total_students
FROM students;

SELECT COUNT(*) AS total_courses
FROM courses;

SELECT COUNT(*) AS total_submissions
FROM submissions;

SELECT email, COUNT(*) AS duplicate_count
FROM students
GROUP BY email 
HAVING COUNT(*) >1;

SELECT batch_name, COUNT(*) AS duplicate_count
FROM batches
GROUP BY batch_name
HAVING COUNT(*) >1;

SELECT * 
FROM submissions
WHERE student_id NOT IN (
    SELECT student_id FROM students
);

