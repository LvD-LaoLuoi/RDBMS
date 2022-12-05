USE Northwind

---------------------------------------------
-- LÍ THUYẾT
-- CÚ PHÁP MỞ RỘNG CỦA SELECT:
	-- WHERE: Dùng làm bộ lọc những dữ liệu thỏa mãn một điều kiện nào đó.
	-- CÚ PHÁP: 
		-- SELECT * FROM <Name Table> WHERE <Conditions>
		-- Conditions: Đối tượng, value, toán tử (operator) such as >, >=, <, <=, =, !=, <> 
		-- Với != and <> make the same sense, addition logic operators like AND OR NOT.
		-- For example: WHERE City = N'Bắc Giang', WHERE City = N'Bắc Giang' AND GPA >= 8

		-- Lọc liên quan tới value/cell thì liên quan tới data types
			-- number
			-- string: ''

---------------------------------------------

-- 1. In ra danh sách các khách hàng
SELECT * FROM Customers

-- 2. In ra danh sách khách hành tới từ ý
SELECT * FROM Customers WHERE Country = 'Italy'

-- 3. In ra danh sách khách hàng tới từ Mĩ
SELECT * FROM Customers WHERE Country = 'USA'

-- 4. In ra những khách hàng tới từ mỹ và ý
SELECT * FROM Customers WHERE Country = 'Italy' OR Country = 'USA'

-- SORT theo Ý hoặc Mỹ để dễ theo dõi
SELECT * FROM Customers WHERE Country = 'Italy' OR Country = 'USA' ORDER BY Country

-- 5. In ra khách hàng tới từ thủ đô Berlin của Đức
SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin'

-- 6. In ra thông tin của nhân viên
SELECT * FROM Employees

-- 7. In ra thông tin nhân viên từ năm 1960 trở lại
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960

-- 8. In ra thông tin nhân viên có tuổi từ 60 trở lên
SELECT * FROM Employees WHERE (YEAR(GETDATE()) - YEAR(BirthDate)) >= 60

-- 9. Những nhân viên nào ở London
SELECT * FROM Employees WHERE City = 'London'

-- 10. Những nhân viên không ở London
SELECT * FROM Employees WHERE City <> 'London'
SELECT * FROM Employees WHERE City != 'London'

-- Đảo mệnh đề
SELECT * FROM Employees WHERE NOT (City = 'London')

-- 11. In ra hồ sơ nhân viên có mã số là 1
SELECT * FROM Employees WHERE EmployeeID = 1

-- 12. Xem thông tin bên đơn hàng
SELECT * FROM Orders

-- 13. Xem thông tin bên đơn hàng có khối lượng giảm dần
SELECT * FROM Orders ORDER BY Freight DESC

-- 14. In thông tin bên đơn hàng sắp xếp giảm dần theo trọng lượng, trọng lượng >= 500 kg
SELECT * FROM Orders WHERE Freight >= 500 ORDER BY Freight DESC

-- 15. In thông tin bên đơn hàng sắp xếp giảm dần theo trọng lượng, trọng lượng [100, 500]
SELECT * FROM Orders WHERE (Freight >= 100 AND Freight <= 500) ORDER BY Freight DESC

-- 16. In thông tin bên đơn hàng sắp xếp giảm dần theo trọng lượng, trọng lượng [100, 500] và ship bởi cty giao vận sô 1
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 AND ShipVia = 1 ORDER BY Freight DESC

-- KHI TRONG MỆNH ĐỀ WHERE LẠI CÓ AND OR TRỘN VỚI NHAU, TA PHẢI XÀI THÊM () ĐỂ PHÂN TÁCH THỨ TỰ THỰC HIỆN CÁC MỆNH ĐỀ


-- 17. Liệt kê khách hàng tới từ Mỹ và Mexico
SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Mexico' ORDER BY Country DESC

-- 18. Liệt kê khách hàng không tới từ Mỹ và Mexico
SELECT * FROM Customers WHERE Country <> 'USA' AND Country <> 'Mexico'

-- 19. Liệt kê các nhân viên sinh ra trong đoạn [1960, 1970]
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960 AND YEAR(BirthDate) <= 1970 ORDER BY BirthDate

