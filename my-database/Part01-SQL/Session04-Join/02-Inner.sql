USE Cartesian
------------------------------------- INNER JOIN------------------------------------------
-- INNER JOIN NHÌN SÂU VÀO GHÉP, GHÉP CÓ TƯƠNG QUAN, THEO ĐIỂM TRUNG
-- JOIN CHỈ LÀ GỘP DATA VÀ TẠO MỘT TABLE TẠM THỜI TRÊN RAM NÊN CÓ THỂ ÁP DỤNG TẤT CẢ CÁC CÂU LỆNH ĐỐI VỚI TABLE 

SELECT * FROM VnDict VN, EnDict EN
WHERE VN.Nmbr = EN.Nmbr

-- CHUẨN THẾ GIỚI
SELECT * FROM VnDict INNER JOIN EnDict
ON VnDict.Nmbr = EnDict.Nmbr

SELECT * FROM VnDict JOIN EnDict
ON VnDict.Nmbr = EnDict.Nmbr

------------------------------------------
SELECT * FROM VnDict VN, EnDict EN
		 WHERE VN.Nmbr = EN.Nmbr

SELECT * FROM VnDict VN, EnDict EN
		 WHERE VN.Nmbr > EN.Nmbr