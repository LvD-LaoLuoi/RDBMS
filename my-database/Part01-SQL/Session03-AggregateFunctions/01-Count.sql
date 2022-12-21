USE Northwind

----------------------------------------------------------
-- LÍ THUYẾT
-- DB ENGINE hỗ trợ 1 loạt nhóm hàng thao tác trên nhóm dòng và cột, gom data và tính toán
-- Nhóm hàm gom nhóm gọi là: Aggregate Function includes: COUNT(), SUM(), MIN(), MAX(), AVG()

-- CÚ PHÁP CHUẨN: SELECT <COLUMNS> <AGGREGATE FUNCTIONS> FROM <TABLE>

-- CÚ PHÁP MỞ RỘNG: 
	-- SELECT <COLUMNS> <AGGREGATE FUNCTIONS> FROM <TABLE>...WHERE ...GROUP BY
	-- SELECT <COLUMNS> <AGGREGATE FUNCTIONS> FROM <TABLE>...WHERE ...GROUP BY...HAVING

-- HÀM COUNT() ĐẾM SỐ LẦN XUẤT HIỆN CỦA MỘT CÁI GÌ ĐÓ. NẾU CELL IS NULL THÌ KHÔNG ĐẾM.
	-- COUNT(*): ĐẾM TẤT CẢ SỐ DÒNG TRONG TABLE
	-- COUNT(*) FROM ... WHERE: CHỌN RA NHỮNG DÒNG THỎA MÃN WHERE RỒI MỚI TIẾN HÀNH ĐẾM

----------------------------------------------------------

-- 1. In ra danh sách các nhân viên
SELECT * FROM Employees

-- 2. Đếm xem có bao nhiêu nhân viên
SELECT COUNT(*) AS [Number of Employees] FROM Employees

-- 3. Có bao nhiêu NV ở London
SELECT COUNT(*) AS [No Employees in London] FROM Employees WHERE City = 'London'

-- 4. Có bao nhiêu lượt thành phố xuất hiện - cứ xuât hiện tên TP là đếm không care lập lại
SELECT COUNT(City) FROM Employees

-- 5. Đếm xem có bao nhiêu Region
SELECT COUNT(Region) FROM Employees

-- 6. Đếm xem có bao nhiêu khu vực có cell is null
SELECT COUNT(*) FROM Employees WHERE Region IS NULL -- ĐẾM SỰ XUẤT HIỆN CỦA DÒNG CHỨA REGION IS NULL

SELECT COUNT(Region) FROM Employees WHERE Region IS NULL -- 0 VÌ NULL KHÔNG ĐẾM ĐƯỢC DO KHÔNG CÓ VALUE

-- 7. Có bao nhiêu thành phố trong table nv
SELECT City FROM Employees

SELECT DISTINCT City FROM Employees

SELECT COUNT(DISTINCT City) FROM Employees

-- USE QUERY TRONG FROM (USE QUERY)
SELECT COUNT(*) FROM (SELECT DISTINCT City FROM Employees) AS CITIES

-- 8. Đếm xem mỗi thành phố có bao nhiêu nhân viên
	-- Khi câu hỏi có tính toán gom data mà lại chứa từ khóa mỗi...
	-- Gặp từ mỗi chính là chia để gom
	-- Sự xuất hiện chia nhóm, đếm theo sự xuất hiện của nhóm

SELECT * FROM Employees

SELECT COUNT(City) FROM Employees GROUP BY City -- ĐẾM VALUE CỦA CITY NHƯNG ĐẾM THEO NHÓM

SELECT City, COUNT(City) AS [No Employees] FROM Employees GROUP BY City -- PERFECT

-- NOTE: KHI GOM NHÓM, BẠN CÓ QUYỀN  LIỆT KÊ TÊN CỘT LẺ Ở SELECT, TUY NHIÊN CỘT LẺ ĐÓ BUỘC PHẢI XUẤT HIỆN TRONG
	-- MỆNH ĐỀ GROUP BY ĐỂ ĐẢM BẢO LOGIC VÀ GOM THEO CỘT HIỂN THỊ MỚI.
	-- MUỐN HIỂN THỊ SỐ LƯỢNG CỦA CÁI GÌ THÌ GOM NHÓM THEO CÁI ĐÓ.
	-- DO ĐÓ GOM KEY/PRIMI KEY LÀ VÔ NGHĨA VÌ MỖI CÁI LÀ DUY NHẤT

-- 9. Hãy cho tôi biết thành phố nào có từ hai nhân viên trở nên
	-- 9.1 Các thành phố có bao nhiêu nhân viên
	-- 9.2 Đếm xong mỗi thành phố, ta bắt đầu lọc kết quả sau đếm
	-- Filter sau đếm, trong Aggregate function gọi là HAVING...

SELECT City, COUNT(City) AS [No Employees] FROM Employees GROUP BY City HAVING COUNT(City) >= 2

SELECT City, COUNT(*) AS [No Employees] FROM Employees GROUP BY City HAVING COUNT(*) >= 2

-- 10. Đếm nhân viên của 2 thành phố Seattle và London
SELECT City, COUNT(EmployeeID) AS [No Employees] FROM Employees WHERE City IN ('London', 'Seattle') GROUP BY City

-- 11. Trong 2 thành phố Seattle và London. Thành phố nào có nhiều hơn 3 nhân viên
SELECT City, COUNT(EmployeeID) AS [No Employees] FROM Employees 
												 WHERE City IN ('London', 'Seattle') 
												 GROUP BY City
												 HAVING COUNT(EmployeeID) > 3

-- 12. Đếm xem có bao nhiêu đơn hàng được bán ra
SELECT COUNT(*) AS [No Orders] FROM Orders

-- 12.1 Nước Mỹ có bao nhiêu đơn hàng
SELECT * FROM Orders
SELECT COUNT(OrderID) AS [No USA Orders] FROM Orders WHERE ShipCountry = 'USA'

-- 12.2 Mỹ, Anh, Pháp chiếm tổng cộng bao nhiêu đơn hàng
SELECT COUNT(*) AS [Totals Orders] FROM Orders WHERE ShipCountry IN ('UK', 'USA', 'France')

-- 12.3 Mỹ, Anh, Pháp mỗi quố gia có bao nhiêu đơn hàng
SELECT ShipCountry, COUNT(*) AS [No Orders] 
							 FROM Orders 
							 WHERE ShipCountry IN ('UK', 'USA', 'France') 
							 GROUP BY ShipCountry

-- 12.4 Trong ba quốc gia trên quốc gia nào có từ 100 đơn hàng trở lên
SELECT ShipCountry, COUNT(*) AS [No Orders] 
							 FROM Orders 
							 WHERE ShipCountry IN ('UK', 'USA', 'France') 
							 GROUP BY ShipCountry
							 HAVING COUNT(*) >= 100

-- 12.5 Trong ba quốc gia trên quốc gia nào có số đơn hàng lớn nhất
SELECT ShipCountry, COUNT(*) AS [No Orders] 
							 FROM Orders 
							 WHERE ShipCountry IN ('UK', 'USA', 'France') 
							 GROUP BY ShipCountry
							 HAVING COUNT(*) >= ALL(SELECT COUNT(*) 
												FROM Orders WHERE ShipCountry IN ('UK', 'USA', 'France')
												GROUP BY ShipCountry)

-- 13. Đếm xem có bao nhiêu mặt hàng có trong kho
SELECT * FROM Products
SELECT COUNT(*) FROM Products

-- 14. Đếm xem có bao nhiêu lượt quốc gia đã mua hàng
SELECT * FROM Orders
SELECT COUNT(ShipCountry) FROM Orders

-- 15. Đếm xem có bao nhiêu quốc gia đã mua hàng
SELECT COUNT(DISTINCT ShipCountry) FROM Orders

-- 16. Đếm số lượng đơn hàng của mõi quốc gia
SELECT ShipCountry, COUNT(ShipCountry) AS [No Orders in country] FROM Orders GROUP BY ShipCountry

-- 17. Quốc gia nào có từ 10 đơn hàng trở lên
SELECT ShipCountry, COUNT(ShipCountry) AS [No Orders in country] 
FROM Orders 
GROUP BY ShipCountry
HAVING COUNT(ShipCountry) >= 10
ORDER BY COUNT(ShipCountry)

-- 18. Đếm xem mỗi chủng loại hàng có bao nhiêu mặt hàng
SELECT * FROM Categories
SELECT * FROM Products

SELECT CategoryID, COUNT(CategoryID) 
FROM Products
GROUP BY CategoryID

SELECT * FROM Categories WHERE CategoryID IN (SELECT CategoryID FROM PRODUCTS)

