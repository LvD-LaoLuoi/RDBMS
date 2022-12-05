USE Northwind

---------------------------------------------
-- LÍ THUYẾT
-- Cú pháp chuẩn  của lệnh SELECT: SELECT * FROM <TABLE> WHERE ...
	-- WHERE COLUMNS = VALUE OR MỆNH ĐỀ SELECT TRẢ VỀ MỘT CELL/VALUE
	SELECT * FROM Employees WHERE City = (SELECT City FROM Employees WHERE LastName = 'King' AND FirstName = 'Robert')
	-- WHERE COLUMNS LIKE PATTERN
	-- WHERE COLUMNS BETWEEN RANGE
	-- WHERE COLUMNS IN (VALUE-1, VALUE-2...)
	-- For example: City IN ('London', 'Berlin', 'New York') thay bằng City = 'London' or City = 'Berlin' or City = 'New York'
	-- Nếu có 1 câu lệnh SQL mà trả về được 1 cột gồm nhiều dòng thì nó tương đương một tâp hợp các value
	-- Do đó có thể đưa tập hợp các value đó vào trong IN (...)
	-- Cú pháp: WHERE <COLUMNS> IN (SELECT * FROM ... WHERE...)

---------------------------------------------

-- 1. Liệt kê các nhóm hàng
SELECT * FROM Categories

-- 2. In ra các món hàng thuộc nhóm 1, 6, 8
SELECT * FROM Products WHERE CategoryID IN (1, 6, 8) --30rows

-- 3. In ra các món hàng thuộc nhóm bia/rượu, thịt hải sản
SELECT * FROM Products WHERE CategoryID IN (SELECT CategoryID FROM Categories WHERE CategoryName IN ('Beverages', 'Meat/Poultry', 'Seafood'))

-- 4. Nhân viên quê London phụ trách những đơn hàng nào
SELECT * FROM Employees
SELECT * FROM Orders WHERE EmployeeID IN (SELECT EmployeeID FROM Employees WHERE City = 'London')

-----------------------------------------------------------------------
-- BTVN

-- 1. Các nhà cung cấp đến từ Mỹ cung cấp những mặt hàng nào
SELECT * FROM Suppliers
SELECT * FROM Products WHERE SupplierID IN (SELECT SupplierID FROM Suppliers WHERE Country = 'USA') --12 ROWS

-- 2. Các nhà cung cấp đến từ Mỹ cung cấp những nhóm hàng nào
SELECT * FROM Categories WHERE CategoryID IN (SELECT CategoryID FROM Products WHERE SupplierID IN (SELECT SupplierID FROM Suppliers WHERE Country = 'USA')) -- 4 ROWS

-- 3. Các đơn hàng vận chuyển tới thành phố Sao Paulo được vận chuyển bởi những hãng nào
SELECT * FROM Orders WHERE ShipCity = 'Sao Paulo'
SELECT * FROM Shippers WHERE ShipperID IN (SELECT ShipVia FROM Orders WHERE ShipCity = 'Sao Paulo') -- 3 rows

-- 4. Khách hàng đến từ thành phố Berlin, London, Madrid có những đơn hàng nào
SELECT * FROM Orders
SELECT * FROM Orders WHERE ShipCity IN ('Berlin', 'London', 'Madrid') ORDER BY ShipCity -- 47 rows