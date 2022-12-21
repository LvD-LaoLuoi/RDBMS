CREATE DATABASE Cartesian
-- DB là kho, tủ or thùng chưa data bên trong và cất dưới dạng table

CREATE TABLE EnDict			-- DDL <Data Defintion Language> (một nhánh của SQL)
(
	Nmbr int,
	EnDesc varchar(30)
)

-- Từ điển tiếng anh số đếm
-- 1. One
-- 2. Two

INSERT INTO EnDict VALUES(1, 'One')
INSERT INTO EnDict VALUES(2, 'Two')
INSERT INTO EnDict VALUES(3, 'Three')
INSERT INTO EnDict VALUES(5, 'Five')

----------------------------------------------------
CREATE TABLE VnDict			-- DDL <Data Defintion Language> (một nhánh của SQL)
(
	Nmbr int,
	VnDesc nvarchar(30)		-- nvarchar() string lưu tiếng việt
)

INSERT INTO VnDict VALUES(1, N'Một')
INSERT INTO VnDict VALUES(2, N'Hai')
INSERT INTO VnDict VALUES(3, N'Ba')
INSERT INTO VnDict VALUES(4, N'Bốn')

-----------------------------------------------------CROSS JOIN---------------------------------------------

SELECT * FROM VnDict			--DML <Data Manipulation Language>
SELECT * FROM EnDict	

SELECT * FROM VnDict, EnDict ORDER BY EnDesc -- Tích Đề - Các
SELECT * FROM VnDict CROSS JOIN EnDict -- Tích Đề - Các

-- JOIN LÀ SELECT CÙNG LÚC NHIỀU TABLE VÀ TẠO RA MỘT BẢN MỚI TẠM TRONG RAM VÀ KHÔNG ẢNH HƯỞNG TỚI DỮ LIỆU GỐC
-- KHI GHÉP DỮ LIỆU DỄ TRÙNG CỘT THÌ NÊN DÙNG ALIAS (AS), ĐẶT TÊN GIẢ ĐỂ THAM CHIẾU VÀ CHỈ ĐỊNH CỘT THUỘC TABLE NÀO
-- HOẶC TA CÓ THỂ THAM CHIÊU QUA TÊN TABLE

SELECT * FROM VnDict VN, EnDict EN ORDER BY VN.Nmbr -- ĐẶT TÊN GIẢ CHO CÁC TABLE DÙNG ĐỂ THAM CHIẾU CHO CÁC CỘT

SELECT * FROM VnDict, EnDict ORDER BY VnDict.Nmbr -- THAM CHIẾU CỘT QUA TABLE

SELECT VN.Nmbr, VN.VnDesc, EN.EnDesc FROM VnDict VN, EnDict EN ORDER BY EN.Nmbr

SELECT VN.*, EN.EnDesc FROM VnDict VN, EnDict EN ORDER BY EN.Nmbr

