--Luyện tập lại các câu lệnh trong slq
-- Có gắng try hard thôi
USE Northwind

-- 1.In ra thông tin các sản phẩm có trong hệ thống
	-- Output 1: Mã sản phẩm, tên sản phẩm, mã nhà cung cấp, mã chủng loại, đơn giá, số lượng trong kho
	SELECT P.ProductID, P.ProductID, P.SupplierID, P.CategoryID, P.UnitPrice, P.QuantityPerUnit 
	FROM Products P

	-- Output 2: Mã sản phẩm, tên sản phẩm, mã nhà cung cấp, tên nhà cung cấp, xuất xứ của nhà cung cấp
	SELECT * FROM Products
	SELECT * FROM Suppliers

	SELECT P.ProductID, P.ProductName, P.SupplierID, S.CompanyName, S.Country  
	FROM Products P LEFT JOIN Suppliers S
	ON P.SupplierID = S.SupplierID

	-- Output 3: Mã sản phẩm, tên sản phẩm, mã chủng loại, tên chủng loại
	SELECT * FROM Products
	SELECT * FROM Categories

	SELECT P.ProductID, P.ProductName, P.CategoryID, C.CategoryName 
	FROM Products P LEFT JOIN Categories C
	ON P.CategoryID = C.CategoryID

	-- Output 4: Mã sản phẩm, tên sản phẩm, mã chủng loại, tên chủng loại, mã nhà cung cấp, tên nhà cung cấp, xuất xứ nhà cung cấp
	SELECT P.ProductID, P.ProductName, P.CategoryID, C.CategoryName, S.SupplierID, S.CompanyName, S.Country
	FROM Products P LEFT JOIN Categories C
	ON P.CategoryID = P.CategoryID
	LEFT JOIN Suppliers S
	ON P.SupplierID = S.SupplierID
		
-- 2.In ra thông tin các sản phẩm được cung cấp bởi nhà cung cấp tới từ mỹ
	-- Output 1: Mã sản phẩm, tên sản phẩm, mã nhà cung cấp, tên nhà cung cấp, quốc gia, đơn giá, số lượng trong kho
	SELECT P.ProductID, P.ProductName, P.SupplierID, S.CompanyName, S.Country, P.UnitPrice, P.QuantityPerUnit
	FROM Products P LEFT JOIN Suppliers S
	ON P.SupplierID = S.SupplierID
	WHERE S.Country = 'USA' -- 12 ROWS

	-- Output 2: Mã sản phẩm, tên sản phẩm, mã nhà cung cấp, tên nhà cung cấp, đơn giá, số lượng trong kho, mã chủng loại, tên chủng loại
	SELECT P.ProductID, P.ProductName, S.SupplierID, S.CompanyName, P.UnitPrice, P.QuantityPerUnit, C.CategoryID, C.CategoryName
	FROM Products P LEFT JOIN Suppliers S
	ON P.SupplierID = S.SupplierID
	LEFT JOIN Categories C
	ON P.CategoryID = C.CategoryID
	WHERE S.Country = 'USA' -- 12 ROWS

-- 3. In ra thông tin các sản phẩm được cung cấp bởi nhà cung cấp đến từ Anh, Pháp, Mỹ
	-- Output: Mã sản phẩm, tên sản phẩm, mã nhà cung cấp, tên nhà cung cấp, quốc gia, đơn giá, số lượng trong kho
	SELECT P.ProductID, P.ProductName, P.SupplierID, S.CompanyName, S.Country, P.UnitPrice, P.QuantityPerUnit
	FROM Products P LEFT JOIN Suppliers S
	ON P.SupplierID = S.SupplierID
	WHERE S.Country IN ('UK', 'France', 'USA')
	ORDER BY S.Country

-- 4. Có bao nhiêu nhà cung cấp
	SELECT * FROM Suppliers
	SELECT COUNT(SupplierID) FROM Suppliers

-- 5. Có bao nhiêu nhà cung cấp tới từ Mỹ
	SELECT COUNT(SupplierID) AS [No Supplier by America]
	FROM Suppliers S
	WHERE S.Country = 'USA' -- 4 rows

-- 6. Nhà cung cấp Exotic Liquids cung cấp những sản phẩm nào
	-- Output 1: Mã sản phẩm, tên sản phẩm, đơn giá, số lượng trong kho
	SELECT P.ProductID, P.ProductName, P.UnitPrice, P.QuantityPerUnit, S.CompanyName
	FROM Products P LEFT JOIN Suppliers S
	ON P.SupplierID = S.SupplierID
	WHERE S.CompanyName = 'Exotic Liquids'

	-- Output 2: Mã sản phẩm, tên sản phẩm, mã nhóm hàng, tên nhóm hàng
	SELECT P.ProductID, P.ProductName, C.CategoryID, C.CategoryName, S.CompanyName
	FROM Products P LEFT JOIN Categories C
	ON P.CategoryID = C.CategoryID
	LEFT JOIN Suppliers S
	ON P.SupplierID = S.SupplierID
	WHERE S.CompanyName = 'Exotic Liquids'

	-- Output 3: Mã nhà cung cấp, tên nhà cung cấp, mã sản phẩm, tên sản phẩm, mã nhóm hàng, tên nhóm hàng
	SELECT S.SupplierID, S.CompanyName, P.ProductID, P.ProductName, C.CategoryID, C.CategoryName, S.CompanyName
	FROM Suppliers S LEFT JOIN Products P
	ON S.SupplierID = P.SupplierID
	LEFT JOIN Categories C
	ON P.CategoryID = C.CategoryID
	WHERE S.CompanyName = 'Exotic Liquids'

	-----------------------------------------------------------------------------------------------------
	USE Northwind

-- 7. Mỗi nhà cung cấp bao nhiêu mặt hàng
	-- Output 1: Mã nhà cung cấp, số lượng mặt hàng
	SELECT * FROM Suppliers
	SELECT * FROM Products

	SELECT SupplierID, COUNT(ProductName) AS [No Products] FROM Products GROUP BY SupplierID

	-- Output 2: Mã nhà cung cấp, tên nhà cung cấp, số lượng mặt hàng
	SELECT S.SupplierID, S.CompanyName, COUNT(P.ProductName) AS [No Products]
	FROM Suppliers S LEFT JOIN Products P
	ON S.SupplierID = P.SupplierID
	GROUP BY S.SupplierID, S.CompanyName

-- 8.Nhà cung cấp Exotic Liquids cung cấp bao nhiêu nhãn hàng
	-- Output: Mã nhà cung cấp, tên nhà cung cấp, số lượng mặt hàng
	SELECT S.SupplierID, S.CompanyName, COUNT(P.ProductName) AS [No Products]
	FROM Suppliers S LEFT JOIN Products P
	ON S.SupplierID = P.SupplierID
	WHERE S.CompanyName = 'Exotic Liquids'
	GROUP BY S.SupplierID, S.CompanyName

-- 9. Nhà cung cấp nào cung cấp nhiều nhãn hàng nhất
	-- Output: Mã nhà cung cấp, tên nhà cung cấp, số lượng nhã hàng
	SELECT S.SupplierID, S.CompanyName, COUNT(P.ProductName) AS [No Products]
	FROM Suppliers S LEFT JOIN Products P
	ON S.SupplierID = P.SupplierID
	GROUP BY S.SupplierID, S.CompanyName
	HAVING COUNT(P.ProductName) >= ALL(SELECT COUNT(ProductName) FROM Products GROUP BY SupplierID)

-- 10. Liệt kê các nhà cung cấp mà cung cấp từ 3 nhãn hàng trở lên
	-- Output: Mã nhà cung cấp, tên nhà cung cấp, số lượng nhãn hàng
	SELECT S.SupplierID, S.CompanyName, COUNT(P.ProductName) AS [No Products Greater than or equal to 3]
	FROM Suppliers S LEFT JOIN Products P
	ON S.SupplierID = P.SupplierID
	GROUP BY S.SupplierID, S.CompanyName
	HAVING COUNT(P.ProductName) >= 3
	ORDER BY COUNT(P.ProductName)

-- 11. Có bao nhiêu sản phẩm với mỗi chủng loại hàng
	SELECT * FROM Products
	SELECT CategoryID, COUNT(ProductName) AS [No Products] 
	FROM Products 
	GROUP BY CategoryID
	ORDER BY COUNT(ProductName)

-- 12. In ra thông tin các sản phẩm (mặt hàng) kèm thông tin nhóm hàng
	-- Output: Mã nhóm hàng, tên nhóm hàng, mã sản phẩm, tên sản phẩm
	SELECT C.CategoryID, C.CategoryName, P.ProductID, P.ProductName
	FROM Products P LEFT JOIN Categories C
	ON P.CategoryID = C.CategoryID

-- 13. Liệt kê các sản phẩm thuộc nhóm hàng Seafood
	-- Output 1: Mã sản phẩm, tên sản phẩm
	SELECT P.ProductID, P.ProductName, C.CategoryName
	FROM Products P LEFT JOIN Categories C
	ON P.CategoryID = C.CategoryID
	WHERE C.CategoryName = 'Seafood'

	-- Output 2: Mã sản phẩm, tên sản phẩm, mã nhóm hàng, tên nhóm hàng
	SELECT P.ProductID, P.ProductName, C.CategoryID, C.CategoryName
	FROM Products P LEFT JOIN Categories C
	ON P.CategoryID = C.CategoryID
	WHERE C.CategoryName = 'Seafood'

-- 14. Liệt kê các sản phẩm thuộc nhóm hàng Seafood và Beverages, sắp xếp theo nhóm hàng
	-- Output 1: Mã sản phẩm, tên sản phẩm
	SELECT P.ProductID, P.ProductName
	FROM Products P LEFT JOIN Categories C
	ON P.CategoryID = C.CategoryID
	WHERE C.CategoryName IN ('Seafood', 'Beverages')
	ORDER BY C.CategoryName
	-- Output 2: Mã sản phẩm, tên sản phẩm, mã nhóm hàng, tên nhóm hàng
	SELECT P.ProductID, P.ProductName, C.CategoryID, C.CategoryName
	FROM Products P LEFT JOIN Categories C
	ON P.CategoryID = C.CategoryID
	WHERE C.CategoryName IN ('Seafood', 'Beverages')
	ORDER BY C.CategoryName

-- 15. Mỗi nhóm hàng có bao nhiêu mặt hàng
	-- Output 1: Mã nhóm hàng, số lượng nhãn hàng
	SELECT CategoryID, COUNT(ProductName) AS [No Products] 
	FROM Products 
	GROUP BY CategoryID
	-- Output 2: Mã nhóm hàng, tên nhóm hàng, số lượng nhãn hàng
	SELECT C.CategoryID, C.CategoryName, COUNT(P.ProductName) AS [No Products]
	FROM Products P LEFT JOIN Categories C
	ON P.CategoryID = C.CategoryID
	GROUP BY C.CategoryID, C.CategoryName
	ORDER BY COUNT(P.ProductName)

-- 16. Nhóm hàng nào có nhiều mặt hàng nhất
	-- Output: Mã nhóm hàng, tên nhóm hàng, số lượng nhãn hàng
	SELECT C.CategoryID, C.CategoryName, COUNT(P.ProductName) AS [No Products]
	FROM Products P LEFT JOIN Categories C
	ON P.CategoryID = C.CategoryID
	GROUP BY C.CategoryID, C.CategoryName
	HAVING COUNT(P.ProductName) >= ALL(SELECT COUNT(ProductName) FROM Products GROUP BY CategoryID)

-- 17. Nhóm hàng nào có từ 10 mặt hàng trở lên
	-- Output: Mã nhóm hàng, tên nhóm hàng, số lượng nhãn hàng
	SELECT C.CategoryID, C.CategoryName, COUNT(P.ProductName) AS [No Products]
	FROM Products P LEFT JOIN Categories C
	ON P.CategoryID = C.CategoryID
	GROUP BY C.CategoryID, C.CategoryName
	HAVING COUNT(P.ProductName) >= 10
	ORDER BY COUNT(P.ProductName)

-- 18. In ra số lượng mặt hàng của 2 nhóm Seafood và Beverages
	-- Output: Mã nhóm hàng, tên nhóm hàng, số lượng mặt hàng
	SELECT C.CategoryID, C.CategoryName, COUNT(P.ProductName) AS [No Products]
	FROM Products P LEFT JOIN Categories C
	ON P.CategoryID = C.CategoryID
	WHERE C.CategoryName IN ('Seafood', 'Beverages')
	GROUP BY C.CategoryID, C.CategoryName

-- 19. In ra tất cả các đơn hàng
	-- Output 1: Mã đơn hàng, mã khách hàng, mã nhân viên bán hàng, ngày đặt hàng, gửi tới quốc gia nào
	SELECT OrderID, CustomerID, EmployeeID, OrderDate, ShipCountry FROM Orders ORDER BY ShipCountry
	-- Output 2: Mã đơn hàng, mã khách hàng, tên khách hàng, mã nhân viên, tên nhân viên, ngày đặt hàng, gửi tới quốc gia nào
	SELECT O.OrderID, O.CustomerID, C.CompanyName, E.EmployeeID, E.FirstName, O.OrderDate, O.ShipCountry
	FROM Orders O LEFT JOIN Employees E
	ON O.EmployeeID = E.EmployeeID
	LEFT JOIN Customers C
	ON O.CustomerID = C.CustomerID
	ORDER BY O.ShipCountry
	-- Output 3: Mã đơn hàng, mã khách hàng, tên khách hàng, mã nhân viên, tên nhân viên, ngày đặt hàng, mã công ty vận chuyển, tên công ty vận chuyển, quốc gia gửi tới
	SELECT O.OrderID, O.CustomerID, C.CompanyName, E.EmployeeID, E.FirstName, O.OrderDate, O.ShipVia, S.CompanyName, O.ShipCountry
	FROM Orders O LEFT JOIN Employees E
	ON O.EmployeeID = E.EmployeeID
	LEFT JOIN Customers C
	ON O.CustomerID = C.CustomerID
	LEFT JOIN Shippers S
	ON O.ShipVia = S.ShipperID
	ORDER BY O.ShipCountry

-- 20. In ra các đơn hàng gửi tới mỹ
USE Northwind
	-- Output 1: Mã đơn hàng, mã khách hàng, tên khách hàng, mã nhân viên, ngày đặt hàng, gửi tới quốc gia nào
	SELECT O.OrderID, O.CustomerID, C.CompanyName, O.EmployeeID, O.OrderDate, O.ShipCountry
	FROM Orders O LEFT JOIN Customers C
	ON O.CustomerID = C.CustomerID
	WHERE O.ShipCountry = 'USA' -- 122 ROWS

	-- Output 2: Mã đơn hàng, mã khách hàng, tên khách hàng, mã nhân viên, tên nhân viên, ngày đặt hàng, gửi tới quốc gia nào.
	SELECT O.OrderID, O.CustomerID, C.CompanyName, O.EmployeeID, E.FirstName, O.OrderDate, O.ShipCountry
	FROM Orders O LEFT JOIN Customers C
	ON O.CustomerID = C.CustomerID
	LEFT JOIN Employees E
	ON O.EmployeeID = E.EmployeeID
	WHERE O.ShipCountry = 'USA'

-- 21.In ra các đơn hàng gửi tới Anh, Pháp, Mỹ
	-- Output 1: Mã đơn hàng, mã khách hàng, tên khách hàng, mã nhân viên bán hàng, ngày đặt hàng, gửi tới quốc gia nào.
	SELECT O.OrderID, O.CustomerID, C.CompanyName, O.EmployeeID, O.OrderDate, O.ShipCountry
	FROM Orders O LEFT JOIN Customers C
	ON O.CustomerID = C.CustomerID
	WHERE O.ShipCountry IN ('UK', 'France', 'USA')
	ORDER BY O.ShipCountry -- 255 ROWS

	-- Output 2: Mã đơn hàng, mã khách hàng, tên khách hàng, mã nhân viên bán hàng, tên nhân viên bán hàng, ngày đặt hàng, gửi tới quốc gia nào
	SELECT O.OrderID, O.CustomerID, C.CompanyName, O.EmployeeID, E.FirstName, O.OrderDate, O.ShipCountry
	FROM Orders O LEFT JOIN Customers C
	ON O.CustomerID = C.CustomerID
	LEFT JOIN Employees E
	ON O.EmployeeID = E.EmployeeID
	WHERE O.ShipCountry IN ('UK', 'France', 'USA')
	ORDER BY O.ShipCountry -- 255 ROWS

-- 22. Có tổng cộng bao nhiêu đơn hàng?
	SELECT COUNT(OrderID) AS [No Orders] FROM Orders

---------------------------------------------------------------------
USE Northwind

-- 23. In ra tổng số chi tiết của mỗi đơn hàng
	-- Output 1: Mã đơn hàng, số lượng chi tiết đơn hàng.
	SELECT * FROM [Order Details]

	SELECT OrderID, COUNT(Quantity) AS [No Order Details]
	FROM [Order Details]
	GROUP BY OrderID

	-- Output 2: Mã đơn hàng, mã khách hàng, tên khách hàng, số lượng chi tiết đơn hàng
	SELECT O.OrderID, C.CustomerID, C.CompanyName, COUNT(OD.Quantity) AS [No Order Details]
	FROM [Order Details] OD LEFT JOIN Orders O
	ON OD.OrderID = O.OrderID
	LEFT JOIN Customers C
	ON O.CustomerID = C.CustomerID
	GROUP BY O.OrderID, C.CustomerID, C.CompanyName
	ORDER BY O.OrderID

-- 24. Tính tổng tiền của mỗi đơn hàng (Nhớ trừ tiền giảm giá tùy theo từng đơn)
	SELECT * FROM [Order Details]

	SELECT OrderID, SUM(Quantity) AS [Total Quantity]
	FROM [Order Details]
	GROUP BY OrderID

	SELECT OrderID, SUM(Quantity) AS [Total Quantity]
	FROM [Order Details]
	GROUP BY OrderID

	SELECT OrderID, SUM(UnitPrice * Quantity * (1 - Discount)) AS [Total Salary]
	FROM [Order Details]
	GROUP BY OrderID

	-- Output 1: Mã đơn hàng, tổng tiền
	SELECT OrderID, SUM(UnitPrice * Quantity * (1 - Discount)) AS [Total Bill]
	FROM [Order Details]
	GROUP BY OrderID

	-- Output 2: Mã đơn hàng, mã khách hàng, tên khách hàng, tổng tiền
	SELECT O.OrderID, C.CustomerID, C.CompanyName, SUM(UnitPrice * Quantity * (1 - Discount)) AS [Total Bill]
	FROM [Order Details] OD LEFT JOIN Orders O
	ON OD.OrderID = O.OrderID
	LEFT JOIN Customers C
	ON O.CustomerID = C.CustomerID
	GROUP BY O.OrderID, C.CustomerID, C.CompanyName
	ORDER BY O.OrderID

-- 25. In ra các hóa đơn có tổng tiền lớn hơn 1000$ trở lên
	SELECT * FROM [Order Details]
	-- Output 1: Mã đơn hàng, tổng tiền
	SELECT OrderID, SUM(UnitPrice * Quantity * (1 - Discount)) AS [Total Bill]
	FROM [Order Details]
	GROUP BY OrderID
	HAVING SUM(UnitPrice * Quantity * (1 - Discount)) >= 1000
	ORDER BY [Total Bill]

	-- Output 2: Mã đơn hàng, mã khách hàng, tên khách hàng, tổng tiền
	SELECT O.OrderID, C.CustomerID, C.CompanyName, SUM(UnitPrice * Quantity * (1 - Discount)) AS [Total Bill]
	FROM [Order Details] OD LEFT JOIN Orders O
	ON OD.OrderID = O.OrderID
	LEFT JOIN Customers C
	ON O.CustomerID = C.CustomerID
	GROUP BY O.OrderID, C.CustomerID, C.CompanyName
	HAVING SUM(UnitPrice * Quantity * (1 - Discount)) >= 1000
	ORDER BY [Total Bill]

-- 26. Tính tiền của các đơn hàng gửi tới Mỹ
	SELECT OD.OrderID
	FROM [Order Details] OD LEFT JOIN Orders O
	ON OD.OrderID = O.OrderID
	WHERE O.ShipCountry = 'USA'
	GROUP BY OD.OrderID
	-- Output: Mã đơn hàng, quốc gia, tổng tiền
	SELECT OD.OrderID, O.ShipCountry, SUM(UnitPrice * Quantity * (1 - Discount)) AS [Total Bill]
	FROM [Order Details] OD LEFT JOIN Orders O
	ON OD.OrderID = O.OrderID
	WHERE O.ShipCountry = 'USA'
	GROUP BY OD.OrderID, O.ShipCountry
	ORDER BY [Total Bill]

-- 27. Tính tổng tiền của tất cả các đơn hàng gửi tới mỹ
	-- Output: Quốc gia, tổng tiền
	SELECT O.ShipCountry, SUM(UnitPrice * Quantity * (1 - Discount)) AS [Total Bill]
	FROM [Order Details] OD LEFT JOIN Orders O
	ON OD.OrderID = O.OrderID
	WHERE O.ShipCountry = 'USA'
	GROUP BY O.ShipCountry

-- 28. Tính tiền của các đơn hàng gửi tới Anh, Pháp, Mỹ (Tính riêng cho từng đơn hàng)
	-- Output: Quốc gia, mã đơn hàng, tổng tiền
	SELECT OD.OrderID, O.ShipCountry, SUM(UnitPrice * Quantity * (1 - Discount)) AS [Total Bill]
	FROM [Order Details] OD LEFT JOIN Orders O
	ON OD.OrderID = O.OrderID
	WHERE O.ShipCountry IN ('UK', 'USA', 'France')
	GROUP BY OD.OrderID, O.ShipCountry
	ORDER BY O.ShipCountry, [Total Bill]

-- 29. Tổng tiền thu được của tất cả các đơn hàng là bao nhiêu
	SELECT SUM(UnitPrice * Quantity * (1 - Discount)) AS [Total Bill]
	FROM [Order Details]
	
-- 30. In ra số lượng đơn hàng của mỗi khách hàng
	SELECT *
	FROM Customers C LEFT JOIN Orders O
	ON C.CustomerID = O.CustomerID
	LEFT JOIN [Order Details] OD
	ON OD.OrderID = O.OrderID
	WHERE C.CustomerID = 'LETSS'

	-- Output: Mã khách hàng, tên khách hàng, số lượng đơn hàng
	SELECT C.CustomerID, C.CompanyName, COUNT(OD.OrderID) AS [No Orders]
	FROM Customers C LEFT JOIN Orders O
	ON C.CustomerID = O.CustomerID
	LEFT JOIN [Order Details] OD
	ON OD.OrderID = O.OrderID
	GROUP BY C.CustomerID, C.CompanyName
	ORDER BY [No Orders]

-- 31. Khách hàng nào có nhiều đơn hàng nhất
	-- Output: Mã khách hàng, tên khách hàng, số lượng đơn hàng đã mua
	SELECT C.CustomerID, C.CompanyName, COUNT(OD.OrderID) AS [No Orders]
	FROM Customers C LEFT JOIN Orders O
	ON C.CustomerID = O.CustomerID
	LEFT JOIN [Order Details] OD
	ON OD.OrderID = O.OrderID
	GROUP BY C.CustomerID, C.CompanyName
	HAVING COUNT(OD.ProductID) >= ALL(
										SELECT COUNT(OD.OrderID)
										FROM Customers C LEFT JOIN Orders O
										ON C.CustomerID = O.CustomerID
										LEFT JOIN [Order Details] OD
										ON OD.OrderID = O.OrderID
										GROUP BY C.CustomerID, C.CompanyName
									)
	ORDER BY [No Orders]

-- 32. Có bao nhiêu công ty giao hàng
	SELECT * FROM Orders
	SELECT * FROM Shippers

	SELECT COUNT(DISTINCT ShipVia)
	FROM Orders

-- 33. In ra số lượng đơn hàng mỗi công ty đã vận chuyển
	-- Output: Mã công ty giao hàng, tên công ty giao hàng, số lượng đơn hàng vận chuyển
	SELECT O.ShipVia, S.CompanyName, COUNT(O.ShipVia) AS [No Orders]
	FROM Orders O LEFT JOIN Shippers S
	ON O.ShipVia = S.ShipperID
	GROUP BY O.ShipVia, S.CompanyName
	ORDER BY O.ShipVia

-- 34. Công ty nào vận chuyển nhiều đơn hàng nhất?
	-- Output: Mã công ty giao hàng, tên công ty giao hàng, số lượng đơn hàng đã vận chuyển
	SELECT O.ShipVia, S.CompanyName, COUNT(O.ShipVia) AS [No Orders]
	FROM Orders O LEFT JOIN Shippers S
	ON O.ShipVia = S.ShipperID
	GROUP BY O.ShipVia, S.CompanyName
	HAVING COUNT(O.ShipVia) >= ALL(SELECT COUNT(ShipVia) FROM Orders GROUP BY ShipVia)
	ORDER BY O.ShipVia

-- 35. In ra các đơn hàng vận chuyển bởi công ty Speedy Express
	-- Output 1: Mã đơn hàng, ngày đặt hàng, mã công ty giao hàng
	SELECT O.OrderID, O.OrderDate, O.ShipVia
	FROM Orders O LEFT JOIN Shippers S
	ON O.ShipVia = S.ShipperID
	WHERE S.CompanyName = 'Speedy Express'

	-- Output 2: Mã đơn hàng, ngày đặt hàng, gửi tới quốc gia nào, mã công ty giao hàng, tên công ty giao hàng
	SELECT O.OrderID, O.OrderDate, O.ShipCountry, S.ShipperID, S.CompanyName
	FROM Orders O LEFT JOIN Shippers S
	ON O.ShipVia = S.ShipperID
	WHERE S.CompanyName = 'Speedy Express'

-- 36. Công ty Speedy Express đã vận chuyển bao nhiêu đơn hàng
	-- Output: Mã công ty giao hàng, tên công ty, số lượng đơn hàng đã vận chuyển
	SELECT O.ShipVia, S.CompanyName, COUNT(O.ShipVia) AS [No Orders]
	FROM Orders O LEFT JOIN Shippers S
	ON O.ShipVia = S.ShipperID
	WHERE S.CompanyName = 'Speedy Express'
	GROUP BY O.ShipVia, S.CompanyName
	ORDER BY O.ShipVia