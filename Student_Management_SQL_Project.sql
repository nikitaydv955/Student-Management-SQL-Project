CREATE DATABASE student_db;
USE student_db;


SELECT * FROM students;

SELECT name , department FROM students;

SELECT DISTINCT  department FROM  students;

SELECT * FROM students
WHERE age > 20;

SELECT * FROM students
WHERE city = 'Mumbai';

SELECT * FROM students
WHERE marks > 80 ;

SELECT * FROM students
WHERE  name  LIKE 'A%';

SELECT * FROM students
WHERE age  BETWEEN 18 and 22;

SELECT * FROM students
WHERE department IN('IT', 'CS');

SELECT * FROM students
ORDER BY marks  DESC;

SELECT * FROM students
ORDER BY  marks DESC LIMIT 10;

SELECT * FROM students
WHERE attendance < 60;


SELECT * FROM students
WHERE  city <> 'Delhi';

SELECT * FROM students
WHERE fees_paid IS NULL;

SELECT * FROM students
WHERE name  LIKE '%a';

SELECT * FROM students
ORDER BY  department, marks DESC;

SELECT * FROM students
WHERE name  LIKE '%a';

SELECT * FROM students LIMIT 5;

SELECT COUNT(*) FROM students;

SELECT AVG(marks) FROM students;

SELECT MAX(marks) FROM students;

SELECT MIN(marks) FROM students;


SELECT MIN(attendance) FROM students;

SELECT SUM(fees_paid) FROM students;

SELECT department, COUNT(*) FROM students
GROUP BY department;

SELECT department, AVG(marks) FROM students
GROUP BY department;

SELECT department, COUNT(*) FROM students
GROUP BY   department HAVING  COUNT(*) > 50;

SELECT city, AVG(marks) FROM students
GROUP BY  city HAVING  AVG(marks) > 50;

SELECT department, MAX(marks) FROM students
GROUP BY   department;

SELECT *
FROM Students
ORDER BY name ASC;

SELECT * FROM students
WHERE city = 'Delhi';

SELECT DISTINCT marks
FROM students
ORDER BY marks DESC
LIMIT 1 OFFSET 1;

SELECT name, CASE
 WHEN marks >= 90 THEN 'A'
 WHEN marks >= 75 THEN 'B' 
 WHEN marks >= 60 THEN 'C' 
 ELSE 'D' 
 END AS grade
 FROM students;
 
 
 SELECT *
FROM students
WHERE fees_paid > (
    SELECT AVG(fees_paid)
    FROM students
);

SELECT * FROM students 
ORDER BY marks DESC LIMIT 3;

SELECT name, COUNT(*) AS total
FROM students
GROUP BY name
HAVING COUNT(*) > 1;

SELECT *
FROM students
WHERE admission_date >= CURDATE() - INTERVAL 30 DAY;

SELECT
    name,
    marks,
    CASE
        WHEN marks >= 90 THEN 'Excellent'
        WHEN marks >= 75 THEN 'Good'
        WHEN marks >= 60 THEN 'Average'
        ELSE 'Poor'
    END AS marks_category
FROM students;


SELECT department, AVG(marks) AS avg_marks
FROM students
GROUP BY department
ORDER BY avg_marks DESC
LIMIT 1;

SELECT * FROM students
ORDER BY admission_date DESC
LIMIT 1;

SELECT * FROM students
WHERE LENGTH(name) > 5;

SELECT
    name,
    IFNULL(fees_paid, 0) AS fees_paid
FROM students;

SELECT * FROM students
WHERE city LIKE 'M%';

SELECT * FROM students
WHERE marks % 2 = 0;

SELECT * FROM students WHERE marks > (SELECT AVG(marks) FROM students);

SELECT gender,COUNT(*) FROM students  GROUP BY gender;

SELECT name,
       marks,
       RANK() OVER (ORDER BY marks DESC) AS rank_no
FROM students;

SELECT name,
       marks,
       ROW_NUMBER() OVER (ORDER BY marks DESC) AS row_no
FROM students;

SELECT
    name,
    marks,
    DENSE_RANK() OVER (ORDER BY marks DESC) AS student_rank
FROM students;

SELECT name,
       marks,
       LAG(marks) OVER (ORDER BY marks DESC) AS previous_marks
FROM students;

SELECT name,
       marks,
       LEAD(marks) OVER (ORDER BY marks DESC) AS next_marks
FROM students;


SELECT name,
       marks,
       AVG(marks) OVER () AS average_marks
FROM students;

SELECT name,
       marks,
       SUM(marks) OVER () AS total_marks
FROM students;

SELECT name,
       department,
       marks,
       RANK() OVER (
           PARTITION BY department
           ORDER BY marks DESC
       ) AS dept_rank
FROM students;

SELECT
    name,
    COUNT(*) OVER() AS total_students
FROM students;