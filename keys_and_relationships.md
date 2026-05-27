# Keys and Relationships

# Primary Keys

## students
Primary Key:
- student_id
Reason:
Each student must have a unique identifier.

## batches
Primary Key:
- batch_id
Reason:
Each batch should be uniquely identified.

## courses
Primary Key:
- course_id

## enrollments
Primary Key:
- enrollment_id

## problems
Primary Key:
- problem_id

## submissions
Primary Key:
- submission_id

## test_results
Primary Key:
- result_id

## attendance
Primary Key:
- attendance_id

## sessions
Primary Key:
- session_id


# Foreign Keys

## students
Foreign Key:
- batch_id references batches(batch_id)
Reason:
Each student belongs to one batch.

## enrollments
Foreign Keys:
- student_id references students(student_id)
- course_id references courses(course_id)
Reason:
Enrollment connects students and courses.

## submissions
Foreign Keys:
- student_id references students(student_id)
- problem_id references problems(problem_id)
Reason:
Each submission belongs to a student and a problem.

## test_results
Foreign Key:
- submission_id references submissions(submission_id)

## attendance
Foreign Keys:
- student_id references students(student_id)
- session_id references sessions(session_id)

## sessions
Foreign Key:
- batch_id references batches(batch_id)

# Composite Keys
Possible composite key:
- student_id + course_id in enrollments
Reason:
A student should not enroll in the same course multiple times.

# Candidate Keys
Examples:
- email in students
- batch_name in batches
These can uniquely identify records.

# Alternate Keys
Examples:
- email in students
Reason:
Primary key is student_id, but email can also uniquely identify a student.

# NOT NULL Constraints
The following columns should not allow NULL:
- student_id
- course_id
- batch_id
- submission_id
- problem_id
Reason:
Important identifiers should always contain values.

# UNIQUE Constraints
Columns that should be UNIQUE:
- email in students
- batch_name in batches
Reason:
Duplicate values should not exist.

# CHECK Constraints
Examples:

## attendance
CHECK attendance_status IN ('Present', 'Absent')

## problems
CHECK difficulty IN ('Easy', 'Medium', 'Hard')

Reason:
Only valid values should be stored.
