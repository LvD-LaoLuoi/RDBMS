CREATE  DATABASE DBDESIGN_ONETABLE
-- DDL 
-- CREATE DÙNG ĐỂ TẠO CẤU TRÚC LƯU TRỮ/ DÀN KHUNG CHỨA DATA
-- TƯƠNG TỰ NHƯ XÂY DỰNG PHÒNG CHƯA ĐỒ
-- 1 DATABASE CHỨA NHIỀU TABLE

USE DBDESIGN_ONETABLE

-- Tạo table lưu trữ hồ sơ sv: msv, tên, dob. địa chỉ
-- Tạo một table để lưu trữ sinh viên
-- 1 sv là 1 đối tượng or 1 entity

CREATE TABLE Student
(
	StudentID char(8),
	LastName nvarchar(40), --tại sao không gộp fullname cho rồi??
	FirstName nvarchar(10), -- Lưu kí tự Unicode tiếng việt
	DOB datetime,
	Address nvarchar(50)
)

-- Thao tác trên Data trong table
SELECT * FROM Student

--Đưa data vào table
INSERT INTO Student VALUES('SE01', N'Lê', N'Hoài', '2021-02-12', N'Hà Nội, Việt Nam')
-- Một số cột chưa nhập có thể bỏ trống value nếu được cho phép
INSERT INTO Student VALUES('SE02', N'Nguyễn', N'Thu', '2021-03-22', NULL)

-- Tui chỉ muốn lưu một vài cột, không đủ số cột thì sao
INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE03', N'Đinh', N'Hiền')

-- Tuy nhiên nếu cả row đều null vẫn đc chấp nhận
INSERT INTO Student(StudentID, LastName, FirstName) VALUES(NULL, NULL, NULL)

-- Tuy nhiên điều này thì rất nguy hiểm cho dữ liệu, do đó mỗi columns cần có rằng buộc/ constraint
-- Đặc biệt là cột StudentID cũng chưa được constraint
-- Do đó rằng buộc ở các columns là cực kì quan trọng đảm bảo tính nhất quán, rằng buộc và hợp lý của data

SELECT * FROM Student

-- Gài các rằng buộc vào table để không có các dữ liệu bất thường

CREATE TABLE StudentV2
(
	StudentID char(8) PRIMARY KEY,
	LastName nvarchar(40) NOT NULL, --tại sao không gộp fullname cho rồi??
	FirstName nvarchar(10) NOT NULL, -- Lưu kí tự Unicode tiếng việt
	DOB datetime,
	Address nvarchar(50)
)

SELECT * FROM StudentV2

INSERT INTO StudentV2 VALUES('FE01', N'Hoài', N'Thu', '2021-02-12', N'Hà Nội')