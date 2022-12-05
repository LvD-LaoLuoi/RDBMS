USE Northwind

---------------------------------------------
-- LÍ THUYẾT
-- CÚ PHÁP MỞ RỘNG CỦA SELECT:
	-- Trong thực tế, những dữ liệu chưa xác định thì mang giá trị là NULL.
	-- NULL là không có giá trị
	-- Do vậy, không thể so sánh giá trị với NULL
	-- Tuy nhiên, ta có thể sử dụng: IS NULL, IS NOT NULL để check value of cell có phải là NULL hay không


---------------------------------------------

-- 1. In ra danh sách nhân viên
SELECT * FROM Employees

-- 2. Ai chưa xác định khu vực ở or region is empty value
SELECT * FROM Employees WHERE Region = NULL -- vì NULL không thể dùng toán tử so sánh bình thường

SELECT * FROM Employees WHERE Region IS NULL -- OKE

-- 3. Những ai đã xác định được khu vực cư trú
SELECT * FROM Employees WHERE Region IS NOT NULL
SELECT * FROM Employees WHERE NOT (Region IS NULL) -- SAU NOT LUÔN PHẢI LÀ MỘT MỆNH ĐỀ

-- 4. Những nhân viên đại diện kinh doanh và xác định được nơi cư trú
SELECT * FROM Employees WHERE Title = 'Sales Representative' AND Region IS NOT NULL
SELECT * FROM Employees WHERE Title = 'Sales Representative' AND NOT (Region IS NULL)

-- 5. Liệt kê danh sách khách hàng đến từ UK, USA, France có cả thông tin số fax and region
SELECT * FROM Customers WHERE Country IN ('UK', 'USA', 'France') AND Region IS NOT NULL AND Fax IS NOT NULL

