﻿USE Northwind
-- Chọn để chơi với thùng chứa data nào đó
-- Tại 1 thời điểm chơi với 1 thùng chứa data

SELECT * FROM Customers

SELECT * FROM Employees

------------------------------------------------------------
-- LÍ THUYẾT
-- 1. DBE cung cấp câu lệnh SELECT dùng để in ra dữ liệu có trong table và kết quả hiện thị luôn là 1 table.

------------------------------------------------------------
-- 1. Hôm nay ngày bao nhiêu??
SELECT GETDATE()

SELECT GETDATE() AS [Hôm nay là ngày]

-- 2. Hôm nay là tháng mấy
SELECT MONTH(GETDATE()) AS [Bây giờ là tháng mấy?]

-- 3. Trị tuyệt đối của -5 là mấy?
SELECT ABS(-5) AS [Trị tuyệt đối của -5 là mấy?]

-- 4. 5 + 5 là mấy?
SELECT 5 + 5 AS [5 + 5 là mấy?]

-- 5. In ra tên của mình
SELECT N'Lê Văn Dũng' AS [My fullname is]

-- 6. Tính tuổi
SELECT YEAR(GETDATE()) - 1991 AS [Tuổi]