USE Northwind

---------------------------------------------
-- LÍ THUYẾT
-- Cú pháp chuẩn  của lệnh SELECT: SELECT * FROM <TABLE> WHERE ...
	-- WHERE COLUMNS = VALUE OR MỆNH ĐỀ SELECT TRẢ VỀ MỘT CELL/VALUE
	SELECT * FROM Employees WHERE City = (SELECT City FROM Employees WHERE LastName = 'King' AND FirstName = 'Robert')
	-- WHERE COLUMNS LIKE PATTERN
	-- WHERE COLUMNS BETWEEN RANGE
	-- WHERE COLUMNS IN (VALUE-1, VALUE-2...)
---------------------------------------------

-- 1. In ra danh sách nhân viên
SELECT * FROM Employees

-- 2. Liệt kê các nhân viên ở London
SELECT * FROM Employees WHERE City = 'London'

-- 3. Liệt kê các nhân viên cùng quê với King Robert
SELECT * FROM Employees WHERE City = (SELECT City FROM Employees WHERE LastName = 'King' AND FirstName = 'Robert') AND FirstName <> 'Robert'

-- 4. Liệt kê tất cả các đơn hàng
SELECT * FROM Orders ORDER BY Freight DESC

-- 4.1 Liệt kê tất cả đơn hàng có trọng lượng lớn hơn 252kg
SELECT * FROM Orders WHERE Freight > 252 ORDER BY Freight DESC

-- 4.2 Liệt kê tất cả đơn hàng có trọng lượng lớn hơn trọng lượng của đơn hàng 10555
SELECT * FROM Orders WHERE Freight > (SELECT Freight FROM Orders WHERE OrderID = 10555)

-- Bài tập về nhà:

-- 1. Liệt kê danh sách các công ty vận chuyển hàng\
SELECT * FROM Shippers
-- 2. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận có mã số là 1
SELECT * FROM Orders WHERE ShipVia = 1 -- 249 rows
-- 3. Liệt kê danh sách các đơn hàng được vận chuyển bởi cty giao vận có tên là Speedy Express
SELECT * FROM Orders WHERE ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express') -- 249 rows
-- 4. Liệt kê danh sách các đơn hàng được vận chuyển bởi cty giao vận có tên là Speedy Express và trọng lượng từ 50 - 100 pound
SELECT * FROM Orders 
		WHERE ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express')
		AND Freight BETWEEN 50 AND 100 -- 50 rows


-- 5. Liệt kê các mặt hàng cùng chủng loại với mặt hàng Filo Mix
SELECT * FROM Products WHERE CategoryID = (SELECT CategoryID FROM Products WHERE ProductName = 'Filo Mix') -- 7 rows
-- 6. Liệt kê các nhân viên trẻ tuổi hơn hoặc bằng Janet
SELECT EmployeeID, LastName, FirstName, Title, BirthDate, YEAR(BirthDate) FROM Employees
WHERE YEAR(BirthDate) >= (SELECT YEAR(BirthDate) FROM Employees WHERE FirstName = 'Janet') AND FirstName <> 'Janet' -- 2 rows


