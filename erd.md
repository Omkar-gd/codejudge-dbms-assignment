# ERD (Entity Relationship Diagram)
## Tables and Relationships

### batches
- batch_id (PK)
- batch_name

Relationship:
- One batch can contain many students.


### students
- student_id (PK)
- batch_id (FK)

Relationship:
- Many students belong to one batch.
- One student can have many submissions.
- One student can enroll in many courses.


### courses
- course_id (PK)

Relationship:
- One course can contain many students.


### enrollments
- enrollment_id (PK)
- student_id (FK)
- course_id (FK)

Relationship:
- Connects students and courses.


### problems
- problem_id (PK)

Relationship:
- One problem can have many submissions.


### submissions
- submission_id (PK)
- student_id (FK)
- problem_id (FK)

Relationship:
- Belongs to one student and one problem.
- Can contain multiple test results.


### test_results
- result_id (PK)
- submission_id (FK)

Relationship:
- Multiple test results belong to one submission.


### sessions
- session_id (PK)
- batch_id (FK)

Relationship:
- One batch can contain multiple sessions.


### attendance
- attendance_id (PK)
- student_id (FK)
- session_id (FK)

Relationship:
- Stores attendance for each student session.


# Relationship Summary
- batches → students = One to Many
- students → submissions = One to Many
- problems → submissions = One to Many
- students ↔ courses = Many to Many
- submissions → test_results = One to Many
- batches → sessions = One to Many
- sessions → attendance = One to Many
