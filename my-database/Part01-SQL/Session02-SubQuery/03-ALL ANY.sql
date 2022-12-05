USE Northwind

---------------------------------------------
-- LÍ THUYẾT
-- Cú pháp chuẩn  của lệnh SELECT: SELECT * FROM <TABLE> WHERE ...
	-- WHERE <COLUMNS> > >= < <= ALL (1 SUB WITH VALUES)
	-- WHERE <COLUMNS> > >= < <= ANY (1 SUB WITH VALUES)

---------------------------------------------
-- THỰC HÀNH
-- TẠO 1 TABLE CÓ  1 CỘT TÊN LÀ NUMBR, CHỨA MỘT ĐÓNG DÒNG CÁC SỐ NGUYÊN

CREATE TABLE Num (
	Numbr int
)

SELECT * FROM Num
INSERT INTO Num VALUES(1)
INSERT INTO Num VALUES(4)
INSERT INTO Num VALUES(9)
INSERT INTO Num VALUES(11)
INSERT INTO Num VALUES(12)
INSERT INTO Num VALUES(15)
INSERT INTO Num VALUES(18)
INSERT INTO Num VALUES(8)

-- 1. In ra những số > 5
SELECT * FROM Num WHERE Numbr > 5

-- 2. In ra số lớn nhất trong các số đã nhập
SELECT * FROM Num WHERE Numbr >= ALL (SELECT * FROM Num)

-- 3. Số nhỏ nhất là số nào
SELECT * FROM Num WHERE Numbr <= ALL (SELECT * FROM Num)

-- 4. Nhân viên nào lớn tuổi nhất
SELECT * FROM Employees WHERE BirthDate <= ALL (SELECT BirthDate FROM Employees)

-- 5. Đơn hàng nào có trọng lượng nặng nhất
SELECT * FROM Orders WHERE Freight >= ALL (SELECT Freight FROM Orders)