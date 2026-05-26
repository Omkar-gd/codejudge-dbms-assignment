# Query EXplanations 

#1) total students query  
SELECT COUNT(*) AS total_students
FROM students;
--This query counts the total number of students in students table

#2) total courses query 
SELECT COUNT(*) AS toatl_courses
FROM courses;
--This query counts the total number of courses available 

#3) Student submission count query 
SELECT student_id, COUNT(*) AS total_submission
FROM submissions
GROUP BY student_id
ORDER BY total_submissions DESC 
--This query shows how many submission each student has made, the results are sorted from highest submissions to lowest submisssions
