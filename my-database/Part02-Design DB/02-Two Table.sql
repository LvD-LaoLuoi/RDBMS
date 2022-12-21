CREATE DATABASE ONEMANY

USE ONEMANY

-- TABLE 1 TẠO TRƯỚC, TABLE N TẠO SAU
CREATE TABLE MajorV1
(
	MajorID char(2) PRIMARY KEY,
	MajorName nvarchar(40) NOT NULL
)

SELECT * FROM MajorV1

-- CHÈN DATA VÀO TABLE NHƯ KIỂU LẤY QUẦN ÁO CHO VÀO TỦ
INSERT INTO MajorV1 VALUES('SE', N'Kĩ thuật phần mềm')
INSERT INTO MajorV1 VALUES('IA', N'An toàn thông tin')

-- TẠO TABLE SINH VIÊN
CREATE TABLE StudentV1
(
	StudentID char(8),
	LastName nvarchar(40) NOT NULL,
	FirstName nvarchar(10) NOT NULL,
	DOB datetime NULL,
	Address nvarchar(50) NULL,
	MajorID char(2) NOT NULL,

	CONSTRAINT PK_StudentV1 
	PRIMARY KEY (StudentID),

	CONSTRAINT FK_StudentV1_MajorV1 
	FOREIGN KEY (MajorID) REFERENCES MajorV1(MajorID)
	ON DELETE CASCADE
	ON UPDATE CASCADE

)

--DROP TABLE StudentV1
--DROP TABLE MajorV1

SELECT * FROM StudentV1

-- THÊM DATA SINH VIÊN VÀO TABLE 
INSERT INTO StudentV1 VALUES('FT01', N'Lê', N'Hoàng', NULL, NULL, 'SE')
INSERT INTO StudentV1 VALUES('FT02', N'Nguyễn', N'Huy', NULL, NULL, 'IA')

INSERT INTO StudentV1 VALUES(NULL, N'Vương', N'Anh', NULL, NULL, 'IA')
-- ĐỐI VỚI PRIMARY KEY THÌ SẼ TỰ ĐỘNG ADD THÊM NOT NULL KHI KHỞI TẠO BẢNG
-- ĐỐI VỚI FOREIGN KEY THÌ SẼ KHÔNG TỰ ĐỘNG ADD THÊM NOT NULL MÀ NGƯỜI DÙNG PHẢI TỰ ADD NẾU KHÔNG NÓ VẪN SẼ NHẬN GIÁ TRỊ NULL
INSERT INTO StudentV1 VALUES('FT03', N'Vương', N'Anh', NULL, NULL, NULL)

--DROP TABLE MajorV1
-- Không thể xóa bảng MajorV1 trước vì nó đang bị Student reference tới
-- Muốn xóa thì cần xóa các student tham chiếu tới MajorV1 trước.

-- Xóa khóa ngoại
ALTER TABLE StudentV1 DROP CONSTRAINT FK_StudentV1_MajorV1

--ADD KHÓA NỘI
ALTER TABLE StudentV1 ADD CONSTRAINT PK_StudentV1 PRIMARY KEY (StudentID)
-- ADD Thêm khóa ngoại
ALTER TABLE StudentV1 ADD CONSTRAINT FK_StudentV1_MajorV1 
	FOREIGN KEY (MajorID) REFERENCES MajorV1(MajorID)
	ON DELETE CASCADE
	ON UPDATE CASCADE

-- Câu lệnh update
UPDATE MajorV1 SET MajorID = 'AK' WHERE MajorID = 'IA'

-- Xóa một ngành trong khóa ngoại
DELETE FROM MajorV1 WHERE MajorID = 'SE'

----------------------------------Version 2-------------------------------------------
-- KHI 1 XÓA THÌ N VỀ NULL
-- ĐỂ GIỮ LẠI DATA VÀ BẢO LƯU TỐI ĐA DỮ LIỆU
CREATE TABLE MajorV2
(
	MajorID char(2) PRIMARY KEY,
	MajorName nvarchar(40) NOT NULL
)

SELECT * FROM MajorV2

-- CHÈN DATA VÀO TABLE NHƯ KIỂU LẤY QUẦN ÁO CHO VÀO TỦ
INSERT INTO MajorV2 VALUES('SE', N'Kĩ thuật phần mềm')
INSERT INTO MajorV2 VALUES('IA', N'An toàn thông tin')

CREATE TABLE StudentV2
(
	StudentID char(8),
	LastName nvarchar(40) NOT NULL,
	FirstName nvarchar(10) NOT NULL,
	DOB datetime NULL,
	Address nvarchar(50) NULL,
	MajorID char(2) NOT NULL,

	CONSTRAINT PK_StudentV2 
	PRIMARY KEY (StudentID),

	CONSTRAINT FK_StudentV2_MajorV2 
	FOREIGN KEY (MajorID) REFERENCES MajorV2(MajorID)
	ON DELETE SET NULL
	ON UPDATE CASCADE

)

-- ADD DATA INTO STUDENT TABLE
INSERT INTO StudentV2 VALUES('FT01', N'Lê', N'Hoàng', NULL, NULL, 'SE')
INSERT INTO StudentV2 VALUES('FT02', N'Nguyễn', N'Huy', NULL, NULL, 'IA')


---------------------------------- VERSION 3 ---------------------------------------
-- XÓA DATA CÓ RẰNG BUỘC VÀ SET DEFAULT

CREATE TABLE MajorV3
(
	MajorID char(2) PRIMARY KEY,
	MajorName nvarchar(40) NOT NULL
)

SELECT * FROM MajorV3

-- CHÈN DATA VÀO TABLE NHƯ KIỂU LẤY QUẦN ÁO CHO VÀO TỦ
INSERT INTO MajorV3 VALUES('SE', N'Kĩ thuật phần mềm')
INSERT INTO MajorV3 VALUES('IA', N'An toàn thông tin')

CREATE TABLE StudentV3
(
	StudentID char(8),
	LastName nvarchar(40) NOT NULL,
	FirstName nvarchar(10) NOT NULL,
	DOB datetime NULL,
	Address nvarchar(50) NULL,
	MajorID char(2) DEFAULT 'SE',

	CONSTRAINT PK_StudentV3 
	PRIMARY KEY (StudentID),

	CONSTRAINT FK_StudentV3_MajorV3 
	FOREIGN KEY (MajorID) REFERENCES MajorV3(MajorID)
	ON DELETE SET DEFAULT
	ON UPDATE CASCADE

)

-- ADD DATA INTO STUDENT TABLE
INSERT INTO StudentV3 VALUES('FT01', N'Lê', N'Hoàng', NULL, NULL, 'SE')
INSERT INTO StudentV3 VALUES('FT02', N'Nguyễn', N'Huy', NULL, NULL, 'IA')

-----------------------------------------VERSION 4----------------------------------------------
--PHẦN NÀY THÍ NGHIỆM CÁC LOẠI RẰNG BUỘC - CONSTRAINTS - QUY TẮC GÀI TRÊN DATA

-- 1. RẰNG BUỘC PRIMARY KEY
--