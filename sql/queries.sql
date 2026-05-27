--Q1)
SELECT COUNT(*) AS total_students
FROM students;

--Q2)
SELECT COUNT(*) AS total_courses
FROM courses;

--Q3)
SELECT student.id, COUNT(*) AS total_submissions
FROM submissions 
GROUP BY student_id
ORDER BY total_submissions DESC;



---------------------------------------------------------------------
------------ QUESTION 2) SQL QUERY IMPLEMENTATION -------------------
---------------------------------------------------------------------


-- Q1)
-- List all active students with student ID, name, email, batch, and admission date
SELECT 
    student_id,
    student_name,
    email,
    batch_id,
    admission_date
FROM students
WHERE status = 'Active';

-- Q2)
-- Find students whose email is missing or appears invalid
SELECT 
    student_id,
    student_name,
    email
FROM students
WHERE email IS NULL
   OR email NOT LIKE '%@%.%';

-- Q3)
-- List all problems with difficulty level Easy or Medium
SELECT 
    problem_id,
    problem_title,
    difficulty_level
FROM problems
WHERE difficulty_level IN ('Easy', 'Medium');

-- Q4)
-- Display the latest 20 submissions based on submission timestamp
SELECT 
    submission_id,
    student_id,
    problem_id,
    submission_timestamp,
    status
FROM submissions
ORDER BY submission_timestamp DESC
LIMIT 20;

-- Q5)
-- Count total submissions made by each student
SELECT 
    student_id,
    COUNT(submission_id) AS total_submissions
FROM submissions
GROUP BY student_id
ORDER BY total_submissions DESC;

-- Q6)
-- Calculate average score for each problem
SELECT 
    problem_id,
    AVG(score) AS average_score
FROM submissions
GROUP BY problem_id
ORDER BY average_score DESC;

-- Q7)
-- Find students who made more than 5 submissions
SELECT 
    student_id,
    COUNT(submission_id) AS total_submissions
FROM submissions
GROUP BY student_id
HAVING COUNT(submission_id) > 5
ORDER BY total_submissions DESC;

-- Q8)
-- Display contest names along with total number of problems in each contest
SELECT 
    contest_id,
    COUNT(problem_id) AS total_problems
FROM contest_problems
GROUP BY contest_id
ORDER BY total_problems DESC;

-- Q9)
-- Find the highest score achieved for each problem
SELECT 
    problem_id,
    MAX(score) AS highest_score
FROM submissions
GROUP BY problem_id
ORDER BY highest_score DESC;

--Q10)
-- Show attendance count for each student
SELECT 
    student_id,
    COUNT(attendance_id) AS attendance_count
FROM attendance
GROUP BY student_id
ORDER BY attendance_count DESC;

