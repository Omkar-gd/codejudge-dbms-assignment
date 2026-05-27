# Schema Explanation

## Overview
This database is designed for the CodeJudge platform.  
The system manages students, courses, contests, problems, submissions, attendance, and test results.

The raw CSV data was analyzed and converted into a relational database structure.


# Main Tables

## Students
Stores information about students.
Important columns:
- student_id
- student_name
- email
- batch_id

Primary Key:
- student_id
Foreign Key:
- batch_id references batches


## Batches
Stores batch information.
Important columns:
- batch_id
- batch_name

Primary Key:
- batch_id


## Courses
Stores course information.
Important columns:
- course_id
- course_name

Primary Key:
- course_id


## Enrollments
Connects students and courses.
Important columns:
- enrollment_id
- student_id
- course_id

Primary Key:
- enrollment_id
Foreign Keys:
- student_id references students
- course_id references courses


## Problems
Stores coding problems.
Important columns:
- problem_id
- title
- difficulty

Primary Key:
- problem_id


## Submissions
Stores student submissions.
Important columns:
- submission_id
- student_id
- problem_id
- submitted_at
- status

Primary Key:
- submission_id
Foreign Keys:
- student_id references students
- problem_id references problems


## Test Results
Stores execution results of submissions.
Important columns:
- result_id
- submission_id
- passed

Primary Key:
- result_id
Foreign Key:
- submission_id references submissions


## Attendance
Stores attendance records.
Important columns:
- attendance_id
- student_id
- session_id
- attendance_status

Primary Key:
- attendance_id
Foreign Keys:
- student_id references students
- session_id references sessions


## Sessions
Stores class session details.
Important columns:
- session_id
- session_date
- batch_id

Primary Key:
- session_id
Foreign Key:
- batch_id references batches


# Relationships
- One batch can contain many students.
- One student can enroll in many courses.
- One course can have many students.
- One student can make many submissions.
- One problem can have many submissions.
- One submission can have many test results.


# Normalization
The schema is approximately normalized up to 3NF:
- duplicate data reduced
- repeating groups removed
- dependencies separated into proper tables
