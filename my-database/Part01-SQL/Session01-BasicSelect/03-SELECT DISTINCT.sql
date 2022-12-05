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
	
	-- Khi ta SELECT it cột từ table gốc thì các dữ liệu hiển thị sẽ hiện thị tất cả dữ liệu và sẽ có sự trùng lặp về thông tin
	-- Lệnh DISTINCT hỗ trợ loại trừ thông tin trùng lặp lại
	-- SELECT DISTINCT <NAME COLUMN> FROM <NAME TABLE>

------------------------------------------------------------

-- 1. Liêt kê danh sách nhân viên
SELECT * FROM Employees

-- Phân tích có 9 danh xưng nhưng chỉ có 4 title.
SELECT TitleOfCourtesy FROM Employees -- 9 Danh xưng
SELECT DISTINCT TitleOfCourtesy FROM Employees -- 4 Title

-- Nếu DISTINCT đi kèm với ID/Key thì nó vô dụng vì ID/Key là duy nhất
SELECT DISTINCT EmployeeID, TitleOfCourtesy FROM Employees 

-- 2. In ra thông tin khách hàng
SELECT * FROM Customers

-- 3. Có bao nhiêu quốc gia xuất hiện trong thông tin khách hàng và in ra
SELECT DISTINCT Country FROM Customers
