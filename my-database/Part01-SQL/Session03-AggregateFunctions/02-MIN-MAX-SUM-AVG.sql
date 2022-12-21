USE Northwind

----------------------------------------------------------
-- LÍ THUYẾT
-- DB ENGINE hỗ trợ 1 loạt nhóm hàng thao tác trên nhóm dòng và cột, gom data và tính toán
-- Nhóm hàm gom nhóm gọi là: Aggregate Function includes: COUNT(), SUM(), MIN(), MAX(), AVG()

-- CÚ PHÁP CHUẨN: SELECT <COLUMNS> <AGGREGATE FUNCTIONS> FROM <TABLE>

-- CÚ PHÁP MỞ RỘNG: 
	-- SELECT <COLUMNS> <AGGREGATE FUNCTIONS> FROM <TABLE>...WHERE ...GROUP BY
	-- SELECT <COLUMNS> <AGGREGATE FUNCTIONS> FROM <TABLE>...WHERE ...GROUP BY...HAVING

-----------------------------------------------------------

-- 1. Liệt kê danh sách nhân viên
SELECT * FROM Employees

-- 2. Năm sinh nào bé nhất
SELECT MIN(BirthDate) FROM Employees
SELECT MAX(BirthDate) FROM Employees

-- 3. Ai sinh năm bé nhất và in ra info
SELECT * FROM Employees WHERE BirthDate <= ALL(SELECT BirthDate FROM Employees)

SELECT * FROM Employees WHERE BirthDate = (SELECT MIN(BirthDate) FROM Employees)

-- 4. Trong các đơn hàng, đơn hàng nào có trọng lượng nặng nhất
SELECT * FROM Orders WHERE Freight >= ALL(SELECT Freight FROM Orders)

SELECT * FROM Orders WHERE Freight = (SELECT MAX(Freight) FROM Orders)

-- 5. Tính tổng cộng khối lượng của tất cả các đơn hàng
SELECT * FROM Orders
SELECT SUM(Freight) AS [Freight in total] FROM Orders

-- 6. Trung bình các đơn hàng nặng bao nhiêu
SELECT AVG(Freight) AS [Avg of total] FROM Orders

-- 7. Liệt kê các đơn hàng có trọng lượng nặng hơn trọng lượng trung bình
SELECT * FROM Orders WHERE Freight > (SELECT AVG(Freight) FROM Orders)

-- 8. Có bao nhiêu đơn hàng có trọng lượng nặng hơn trọng lương trung bình
SELECT COUNT(Freight) AS [No Freight greater than AVG] FROM Orders WHERE Freight > (SELECT AVG(Freight) FROM Orders)

SELECT COUNT(*) FROM (SELECT * FROM Orders WHERE Freight > (SELECT AVG(Freight) FROM Orders)) AS [AVG]