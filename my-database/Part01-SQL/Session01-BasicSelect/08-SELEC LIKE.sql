USE Northwind

---------------------------------------------
-- LÍ THUYẾT
-- CÚ PHÁP MỞ RỘNG CỦA SELECT:
	-- Trong thực tế, có những lúc ta cần tìm các dữ liệu gần đúng như có chứa kí tự nào đó
	-- For example: 
		-- Liệt kê ai đó có tên bắt đầu bằng chữ 'A'
	-- Trường hợp tìm đúng thì ta dùng: =, còn trường hợp gần đúng ta dùng toán tử: LIKE
	-- Để sử dụng toán tử LIKE ta cần dấu % và _
	-- %: Đại diện cho 1 chuỗi bất kì nào đó hoặc không gì cả
	-- _: Đại diện cho 1 kí tự bất kì nào đó
	-- For example: 
		-- LIKE 'A%' thì kết quả gần đúng bao gồm 1 chuỗi bắt đầu với A, phần còn lại có thể là chuỗi bất kì
		-- LIKE 'A_'thì kết quả gần đúng là một chuỗi có 2 kí tự và có kí tự đầu tiên bắt đầu bằng 'A'

---------------------------------------------


-- 1. In ra danh sách nhân viên
SELECT * FROM Employees

-- 2. Nhân viên nào có tên bắt đầu chữ cái A
SELECT * FROM Employees WHERE FirstName LIKE 'A%'

-- 2.1 Nhân viên nào có tên bắt đầu bằng chữ A thì tạo Full Name
SELECT EmployeeID, FirstName + ' ' + LastName AS [Full Name], Title FROM Employees WHERE FirstName LIKE 'A%'
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS [Full Name], Title FROM Employees WHERE FirstName LIKE 'A%'

-- 3. Nhân viên có chữ A xuất hiện cuối cùng
SELECT * FROM Employees WHERE FirstName LIKE '%A'

-- 4. Nhân viên nào có 4 kí tự
SELECT * FROM Employees WHERE FirstName LIKE '____'

-- 5. Xem danh sách các sản phẩm
SELECT * FROM Products

-- 6. Những sản phẩm nào tên bắt đầu bằng Ch
SELECT * FROM Products WHERE ProductName LIKE 'Ch%'

-- 7.Những sản phẩm trong tên có từ cuối cùng là 5 kí tự
SELECT * FROM Products WHERE ProductName LIKE '_____' OR ProductName LIKE '% _____'
