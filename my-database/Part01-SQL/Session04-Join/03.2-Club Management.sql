USE ClubManagement

-- 1. Liệt kê thông tin sv đang theo học
SELECT * FROM Student

-- 2. Liệt kê sinh viên đang theo học kèm theo clb mà sinh viên tham gia

	-- OUTPUT 1: Mã sv, tên sv, mã clb
SELECT S.StudentID, CONCAT(S.LastName,' ',S.FirstName ) AS FullName, R.ClubID
	FROM Student S LEFT JOIN Registration R
	ON S.StudentID = R.StudentID

	-- OUTPUT 1: Mã sv, tên sv, mã clb, tên clb
SELECT S.StudentID, CONCAT(S.LastName,' ',S.FirstName ) AS FullName, R.ClubID, C.ClubName, R.JoinedDate
	FROM Student S LEFT JOIN Registration R
	ON S.StudentID = R.StudentID
	LEFT JOIN Club C
	ON R.ClubID = C.ClubID
-- Kiểu viết trên có thể lấy được cả 2 bên dữ liệu và đủ dù cho là NULL

-- còn với cách tiếp theo chỉ lấy đc các phần bằng nhau like inner join
SELECT S.StudentID, S.FirstName, R.ClubID, C.ClubName, R.JoinedDate
	FROM Student S, Registration R, Club C
	WHERE S.StudentID = R.StudentID AND C.ClubID = R.ClubID

-- BTVN
-- 1. Đếm số clb mà mỗi sv đã tham gia
-- 2. sinh viên SE1 tham gia mấy sinh viên
-- 3. SV nào tham gia nhiều câu lạc bộ nhất
-- 4. CLB Cộng đồng sinh viên Tình nguyện có những sv nào tham gia.
-- 5. Mỗi câu lạc bộ có bao nhiêu sv
-- 6. Câu lạc bộ nào đông member nhất
-- 7. Câu lạc bộ SiTi và CSC có bao nhiêu member
-- 8. Có tổng cộng bao nhiêu lượt sinh viên tham gia câu lạc bộ
