SELECT COUNT(*) AS total_students
FROM students;

SELECT COUNT(*) AS total_courses
FROM courses;

SELECT student.id, COUNT(*) AS total_submissions
FROM submissions 
GROUP BY student_id
ORDER BY total_submissions DESC;
