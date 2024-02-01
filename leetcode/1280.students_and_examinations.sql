-- 1번 풀이
WITH Q AS(

SELECT *
FROM STUDENTS
CROSS JOIN SUBJECTS
)


SELECT Q.student_id, Q.student_name, Q.subject_name, 
COUNT(CASE WHEN Q.subject_name = exam.subject_name THEN 1 END) AS attended_exams
FROM Q
LEFT JOIN Examinations exam ON Q.student_id = exam.student_id
GROUP BY 1,2,3
ORDER BY 1,2
  
-- 2번 풀이 

SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.student_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY 1,2,3
ORDER BY 1,2
