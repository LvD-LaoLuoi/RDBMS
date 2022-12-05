USE Northwind

---------------------------------------------
-- LÍ THUYẾT
-- CÚ PHÁP MỞ RỘNG CỦA SELECT:
	-- KHI CẦN LỌC DỮ LIỆU TRONG 1 ĐOẠN CHO TRƯỚC THAY VÌ DÙNG >= AND <=
	-- TA CÓ THỂ DÙNG MỆNH ĐỀ BETWEEN, IN ĐỂ THAY THẾ
	-- CÚ PHÁP:
		-- BETWEEN VALUE-1 AND VALUE-2 : CÁC VALUE TRONG MỘT KHOẢNG NẰM GIỮA HAI GIÁ TRỊ VALUE-1 AND VALUE-2
		-- IN (value-1, value-2, ...): LIỆT KÊ CÁC VALUE
---------------------------------------------

-- 1.Liệt kê danh sách nhân viên sinh trong năm 1960 - 1970
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960 AND YEAR(BirthDate) <= 1970 ORDER BY BirthDate DESC

SELECT * FROM Employees WHERE YEAR(BirthDate) BETWEEN 1960 AND 1970 ORDER BY BirthDate DESC

-- 2. Liệt kê các đơn hàng có trọng lượng từ 100 - 500
SELECT * FROM Orders WHERE Freight BETWEEN 100 AND 500

-- 3. Liệt kê các đơn hàng gửi tới UK, USA, France
SELECT * FROM Orders WHERE ShipCountry = 'USA' OR ShipCountry = 'UK' OR ShipCountry = 'France'

SELECT * FROM Orders WHERE ShipCountry IN ('USA', 'UK', 'France')

-- 4. Đơn hàng nào không gửi gới UK, USA, France
SELECT * FROM Orders WHERE NOT ShipCountry IN ('USA', 'UK', 'France')

-- 5. Liệt kê các đơn hàng trong năm 1996 loại trừ các tháng 6, 7, 8, 9
SELECT * FROM Orders WHERE YEAR(OrderDate) = 1996 AND MONTH(OrderDate) NOT IN (6, 7, 8, 9) ORDER BY OrderDate

-- NOTE: Chỉ khi liệt kê giá trị thì mới nên dùng IN

