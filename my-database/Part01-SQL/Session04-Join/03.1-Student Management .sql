--------------------------------------- New data ----------------------------
USE StudentManagement

SELECT * FROM Major m
SELECT * FROM Student s

SELECT s.*, m.MajorName, m.Hotline
		FROM Student s, Major m
		WHERE s.MajorID = m.MajorID

SELECT s.*, m.MajorName, m.Hotline
		FROM Student s JOIN Major m
		ON s.MajorID = m.MajorID

-- 2. In ra thông tin của sv kèm info ngành. Chỉ quan tâm sv SE và IA
SELECT s.*, m.MajorName, m.Hotline
		FROM Student s JOIN Major m
		ON s.MajorID = m.MajorID
		WHERE m.MajorID = 'SE' OR  m.MajorID = 'IA'

SELECT s.*, m.MajorName, m.Hotline
	FROM Student s JOIN Major m
	ON s.MajorID = m.MajorID
	WHERE m.MajorID IN ('SE', 'IA')

SELECT s.*, m.MajorName, m.Hotline
		FROM Student s, Major m
		WHERE s.MajorID = m.MajorID AND m.MajorID IN ('SE', 'IA')

-- 3. In ra thông tin các sinh viên kèm các chuyên ngành, chuyên ngành nào chưa có sv cũng in ra.
SELECT s.*, m.MajorName, m.Hotline
	FROM Student s RIGHT JOIN Major m
	ON s.MajorID = m.MajorID

-- 4. Có bao nhiêu chuyên ngành
SELECT COUNT(*) AS [No Major] FROM Major
SELECT COUNT(MajorID) AS [No Major] FROM Major

-- 5. Mỗi chuyên ngành có bao nhiêu sinh viên

SELECT M.MajorID, MajorName,COUNT(StudentID) AS [No Students]
	FROM Major M LEFT JOIN Student S
	ON M.MajorID = S.MajorID
	GROUP BY M.MajorID, MajorName


-- 6. Chuyên ngành nào có từ 3 sinh viên trở lên
SELECT M.MajorID, MajorName,COUNT(StudentID) AS [No Students]
	FROM  Major M LEFT JOIN Student S
	ON M.MajorID = S.MajorID
	GROUP BY M.MajorID, MajorName
	HAVING COUNT(StudentID) >= 3

-- 7. Chuyên ngành nào ít sinh viên nhất
SELECT M.MajorID, MajorName,COUNT(StudentID) AS [No Students]
	FROM  Major M LEFT JOIN Student S
	ON M.MajorID = S.MajorID
	GROUP BY M.MajorID, MajorName
	HAVING COUNT(StudentID) <= ALL(SELECT COUNT(StudentID) AS [No Students]
									FROM Major M LEFT JOIN Student S
									ON M.MajorID = S.MajorID
									GROUP BY M.MajorID)

-- 8. Đếm sinh viên của chuyên ngành SE
SELECT COUNT(StudentID) 
	FROM Student 
	WHERE MajorID = 'SE' -- CÂU NÀY CHẠY NHANH NHÉ

SELECT MajorID, COUNT(StudentID) 
	FROM Student
	WHERE MajorID = 'SE'
	GROUP BY MajorID -- Chỉ còn lại một nhóm


