USE Northwind
------------------------------------------------------------
-- LÍ THUYẾT
-- CÚ PHÁP MỞ RỘNG LỆNH SELECT
	-- Sắp xếp dữ liệu/sort theo tiêu chí  và mặc định thì sort tăng dần.
	-- SELECT .... FROM <NAME TABLE> ORDER BY <NAME TABLE SORT> <TYPE SORT>
	-- Tăng dần với: ASCENDING/ASC
	-- Giảm dần: DESCENDING/DESC

------------------------------------------------------------

-- 1. In ra danh sách nhân viên
SELECT * FROM Employees

-- 2. In ra ds nv tăng dần theo năm sinh
SELECT * FROM Employees ORDER BY BirthDate ASC
SELECT * FROM Employees ORDER BY BirthDate -- Mặc định tăng dần

-- 3. In ra ds nv giảm dần theo năm sinh
SELECT * FROM Employees ORDER BY BirthDate DESC

-- 4. Tính tiền chi tiết mua hàng
SELECT * FROM [Order Details]
SELECT *, UnitPrice * Quantity * (1 - Discount) AS [Totals] FROM [Order Details]

-- 5. Tính tiền chi tiết mua hàng và sắp xếp tăng, giảm dần
SELECT * FROM [Order Details]
SELECT *, UnitPrice * Quantity * (1 - Discount) AS [Totals] FROM [Order Details] ORDER BY [Totals] ASC
SELECT *, UnitPrice * Quantity * (1 - Discount) AS [Totals] FROM [Order Details] ORDER BY [Totals] DESC

-- 6. In ra danh sách nhân viên giảm dần theo tuổi
SELECT * FROM Employees
SELECT EmployeeID, FirstName + ' ' + LastName AS [Full Name], YEAR(GETDATE()) - YEAR(BirthDate) AS [Age], 
		Address FROM Employees ORDER BY [Age] DESC



