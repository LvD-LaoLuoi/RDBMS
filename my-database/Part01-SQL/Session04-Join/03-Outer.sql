USE Cartesian

-- 1. Liệt kê cho tôi các cặp từ điển Anh - Việt
SELECT * FROM EnDict EN, VnDict VN
		 WHERE EN.Nmbr = VN.Nmbr

SELECT * FROM EnDict EN INNER JOIN VnDict VN
		 ON EN.Nmbr = VN.Nmbr

SELECT * FROM EnDict EN JOIN VnDict VN
		 ON EN.Nmbr = VN.Nmbr
-- 3 CÂU TRÊN LÀ TƯƠNG ĐƯƠNG

-- 2. HỤT MẤT CỦA TUI 4 - BỐN VÀ 5 - FIVE KHÔNG THẤY XUẤT HIỆN
SELECT * FROM EnDict EN, VnDict VN

-- 3. TUI MUỐN LẤY TIẾNG ANH LÀM CHUẨN, TÌM CÁC NGHĨA TƯƠNG ĐƯƠNG. NẾU KHÔNG CÓ THÌ VẪN HIỆN RA
SELECT * FROM EnDict EN LEFT JOIN VnDict VN
		 ON EN.Nmbr = VN.Nmbr

SELECT * FROM EnDict EN LEFT OUTER JOIN VnDict VN
		 ON EN.Nmbr = VN.Nmbr

-- 4. TUI MUỐN LẤY TIẾNG VIỆT LÀM CHUẨN
SELECT * FROM EnDict EN RIGHT JOIN VnDict VN
		 ON EN.Nmbr = VN.Nmbr

SELECT * FROM EnDict EN RIGHT OUTER JOIN VnDict VN
		 ON EN.Nmbr = VN.Nmbr

-- 5. TUI MUỐN LẤY HẾT CẢ PHẦN CHUNG VÀ RIÊNG, THIẾU DỮ LIỆU THÌ VALUE LÀ NULL
SELECT * FROM EnDict EN FULL JOIN VnDict VN
		 ON EN.Nmbr = VN.Nmbr

SELECT * FROM EnDict EN FULL OUTER JOIN VnDict VN
		 ON EN.Nmbr = VN.Nmbr

-- OUTER JOIN SINH RA ĐỂ ĐẢM BẢO VIỆC KẾT NỐI GHÉP BẢNG
-- KHÔNG BỊ MẤT MÁT DATA
-- DO INNER JOIN, JOIN CHỈ TÌM CÁI CHÙNG 2 BÊN MÀ THÔI DO ĐÓ OUTER JOIN LÀ GIẢI PHÁP CHO TẤT CẢ
-- SAU KHI LẤY RA ĐƯỢC DATA TA CÓ THỂ DÙNG WHERE ĐỂ FILTER DỮ LIỆU MỘT CÁCH BÌNH THƯỜNG

-- 6. In ra bộ từ điển Anh - Việt của những con số từ 3 trở lên
SELECT * FROM EnDict EN LEFT JOIN VnDict VN
		 ON EN.Nmbr = VN.Nmbr
		 WHERE EN.Nmbr >= 3

-- 7. In ra bộ từ điển Anh Việt và Việt Anh của những con số từ 3 trở lên
SELECT * FROM EnDict EN FULL JOIN VnDict VN
		 ON EN.Nmbr = VN.Nmbr
		 WHERE EN.Nmbr >= 3 -- DO 4 BỊ NULL NÊN KHÔNG TRẢ VỀ

SELECT * FROM EnDict EN FULL JOIN VnDict VN
		 ON EN.Nmbr = VN.Nmbr
		 WHERE EN.Nmbr >= 3 OR VN.Nmbr >= 3


