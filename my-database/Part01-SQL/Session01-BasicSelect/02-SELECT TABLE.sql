USE Northwind
------------------------------------------------------------
-- LÍ THUYẾT
-- 1. DBE cung cấp câu lệnh SELECT dùng để in ra dữ liệu có trong table và kết quả hiện thị luôn là 1 table.
-- 2. Một DB là nơi chứa data (bán hàng, thư viện, qlsv...)
	-- DATA được lưu dưới dạng TABLE, tách thành nhiều TABLE (Nghệ thuật design db, NF)
	-- Lệnh SELECT để xem/in dữ liệu từ table, đồng thời cũng hiển thị dưới dạng table
	-- Cú pháp: 
				-- SELECT * FROM <Name Table> với Name Table là tên đại diện cho table muốn lấy
				-- SELECT Có thể dùng các hàm xử lí các cột để độ lại thông tin hiển thị FROM <Name Table>


	-- DATA trả về có cell có NULL thì cell đó chưa xác định được value
	-- For example: Bảng danh sách sv thi vấn đáp sẽ có tên, các thông tin xác minh, điểm, chữ kí thì khi chưa có kết quả ở colunms điểm sẽ là NULL vì chưa có kết quả hay xác định được


------------------------------------------------------------
-- 1. Xem thông tin của tất cả các khách hàng đang giao dịch với mình
SELECT * FROM Customers

INSERT INTO Customers(CustomerID, CompanyName, ContactName) VALUES('ALFKI', 'FPT University', 'Le van Dung')
-- Bị chửi vì trùng PK

INSERT INTO Customers(CustomerID, CompanyName, ContactName) VALUES('FPTU', 'FPT University', 'Le van Dung')
-- Ngon lành cành đào luôn


-- 2. Xem thông tin nhân viên
SELECT * FROM Employees

-- 3. Xem các sản phẩm có trong kho
SELECT * FROM Products

-- 4. Mua hàng, thì thông tin sẽ nằm ở table Order và OrderDetails
SELECT * FROM Orders

-- 5. Xem thông tin công ty giao hàng
SELECT * FROM Shippers

-- 6. Xem chi tiết thông tin order
SELECT * FROM Orders
SELECT * FROM [Order Details]

-- 7. In ra thông tin khách hàng, chỉ gồm cột Id, Companyname, ContactName, Country
SELECT CustomerID, CompanyName, ContactName, Country FROM Customers

-- 8. In ra thông tin nhân viên
	-- Tên người tách thành Last & First: dành cho mục tiêu sort theo tiêu chí tên, họ và In ra.
	-- Tên và cách gọi tên ở mỗi quốc gia là khác nhau do vậy tách First & Last name là từ điều kiện thực tế đi vào thiết kế dữ liệu trong data

SELECT EmployeeID, LastName, FirstName, Title, BirthDate FROM Employees

-- 9. In ra thông tin nhân viên với fullname and tính tuổi
SELECT EmployeeID, LastName + ' ' + FirstName AS [Full Name], Title, YEAR(GETDATE()) - YEAR(BirthDate) AS [Age] FROM Employees

-- 10. In ra thông tin chi tiết mua hàng
SELECT * FROM [Order Details]
SELECT *, UnitPrice * Quantity AS [Totals] FROM [Order Details]
SELECT *, UnitPrice * Quantity AS [Totals], UnitPrice * Quantity * (1 - Discount) AS [Totals after discount] FROM [Order Details]