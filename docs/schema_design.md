# Schema Design

## Tables Used
1. students
2. courses
3. enrollments
4. submissions
5. attendance
6. contests
7. problems

## Primary Keys
- students → student_id
- courses → course_id
- submissions → submission_id
- contests → contest_id
- problems → problem_id

## Foreign Keys
- submissions.student_id references students.student_id
- submissions.problem_id references problems.problem_id
- enrollments.student_id references students.student_id
- enrollments.course_id references courses.course_id

## Normalization
The database tables are organized to reduce data redundancy.

### First Normal Form (1NF)
Each column contains atomic values.

### Second Normal Form (2NF)
Non-key attributes depend on the full primary key.

### Third Normal Form (3NF)
No transitive dependency exists between columns.