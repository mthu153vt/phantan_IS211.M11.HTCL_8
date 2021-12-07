--1.Tài khoản giám đốc: Xem thông tin của những sản phẩm (MASP, TENSP, NGAYNHAPSP)
--- của tất cả chi nhánh đã được nhập vào trong tháng 9,10

(SELECT QL1.MaSP, S1.TenSP, QL1.NgayNhapSP 
FROM TS01.SANPHAM S1 JOIN TS01.QL_SANPHAM QL1 
ON S1.MaSP = QL1.MaSP   
WHERE EXTRACT(MONTH FROM NgayNhapSP) = 9) 
UNION 
(SELECT QL.MaSP, S.TenSP, QL.NgayNhapSP 
FROM TS01.SANPHAM S JOIN TS01.QL_SANPHAM QL 
ON S. S.MaSP = QL.MaSP
WHERE EXTRACT (MONTH FROM NgayNhapSP) = 10);

--2-	Tài khoản giám đốc: tìm thông tin sản phẩm có giá bán  cao nhất tại mỗi nhà cung cấp.
SELECT MaNCC, MAX(GIABAN) AS "GIA CAO NHAT" 
FROM TS01.SANPHAM
GROUP BY MaNCC

--3-	Tài khoản giám đốc: Tính trung bình lương nhân viên theo giới tính của chi nhánh 2
SELECT MACHINHANH, GIOITINH, AVG(LUONG) AS TBLUONG
FROM TS02.NHANVIEN@TS02_dblink 
GROUP BY MACHINHANH, GIOITINH 
ORDER BY MACHINHANH, AVG(LUONG) ASC;

--4-	Từ chi nhánh 1 , thống kê số sản phẩm có giá bán từ 250 000đ trở lên tại chi nhánh 2
SELECT CN.MaChiNhanh, COUNT(DISTINCT S.MaSP) AS "SO SAN PHAM" 
FROM (TS01.SANPHAM S JOIN TS01.QL_SANPHAM QL 
ON S.MaSP = QL.MaSP) 
JOIN TS01.CHINHANH CN 
ON QL.MaChiNhanh = CN.MaChiNhanh 
WHERE S.GiaBan > 250000  
GROUP BY CN.MaChiNhanh;

--5-	Tại chi nhánh 2, Xem thông tin nhân viên (MaNV, TenNV) mà làm việc ở cả hai chi nhánh  (TS01, TS02)
(SELECT MaNV, TenNV 
FROM   TS01.NhanVien  
WHERE  MaChiNhanh = 'TS01') 
INTERSECT 
(SELECT MaNV, TenNV 
FROM   TS02.NhanVien@TS02_dblink  
WHERE  MaChiNhanh = 'TS02');


--6-	Tài khoản Quản Lý: Tại chi nhánh 1, tìm thông tin  nhà cung cấp (MaNCC, TenNCC) có tổng giá của số lượng sản phẩm là lớn nhất
SELECT NCC.MaNCC, NCC.TenNCC , SUM(GiaBan) AS TongGia 
FROM TS01.SANPHAM SP JOIN TS01.NHACUNGCAP NCC
 ON SP.MaNCC= NCC.MaNCC 
GROUP BY NCC.MaNCC, NCC.TenNCC 
HAVING SUM(GiaBan) >= ALL
(SELECT SUM(GiaBan) TongGia     
FROM TS01.SANPHAM 
GROUP BY MaNCC);

--7-	Tài khoản Quản Lý: Tại chi nhánh 1, hiển thị thông tin sản phẩm (MaSP, TenSP, NgayNhapSP)
-- với tình trạng ‘còn hàng’ và được nhập tháng 4  hoặc có giá bán > 100000
(SELECT QL1.MaSP, S1.TenSP, QL1.NgayNhapSP 
FROM TS01.SANPHAM S1 JOIN TS01.QL_SANPHAM QL1 
ON S1.MaSP = QL1.MaSP    
WHERE EXTRACT(MONTH FROM NgayNhapSP) = 4) 
UNION  
(SELECT QL.MaSP, S.TenSP, QL.NgayNhapSP  
FROM   TS01.SANPHAM S JOIN TS01.QL_SANPHAM QL 
ON S.MaSP = QL.MaSP   
     WHERE S.GiaBan > 100000);

--8-	Tài khoản nhân viên: Xem thông tin sản phẩm (MaSP, TenSP) 
--và  khuyến mãi của những sản phẩm còn hàng ở cả 2 chi nhánh (TS01, TS02)
(SELECT NV1.MaSP, S1.TenSP, NV1.KhuyenMai
FROM TS02.SANPHAM@TS02_DBLINK S1 
JOIN TS02.NV_SANPHAM@TS02_DBLINK NV1 
ON S1.MaSP = NV1.MaSP
WHERE NV1.MaChiNhanh = 'TS01' 
AND TinhTrang = 'Con Hang')
INTERSECT
(SELECT NV.MaSP, S.TenSP, NV.KhuyenMai
FROM TS01.SANPHAM S JOIN TS01.NV_SANPHAM NV 
ON S.MaSP = NV.MaSP
WHERE NV.MaChiNhanh = 'TS02' 
AND TinhTrang = 'Con Hang');

--9-	Tính tổng lương của nhân viên mỗi chi nhánh theo giới tính, sắp xếp tăng dần tổng lương
SELECT MACHINHANH, GIOITINH, SUM(LUONG) 
AS TONGLUONG
FROM TS02.NHANVIEN@TS02_dblink 
GROUP BY MACHINHANH, GIOITINH 
ORDER BY MACHINHANH, SUM(LUONG) ASC;

--10-	Tài khoản Giám Đốc: Tìm sản phẩm không phải của nhà cung cấp “Cong ty thiet bi dien tu Hoang Phong” 
--và “Cong ty TNHH thuong mai Le Nguyen” , và có tình trạng  còn hàng
SELECT sp.MaSP, TenSP, TenNCC
FROM SanPham sp JOIN NhaCungCap ncc 
ON sp.MaNCC = ncc.MaNCC
MINUS
SELECT sp.MaSP, TenSP, TenNCC
FROM NhaCungCap ncc JOIN SanPham sp 
ON sp.MaNCC = ncc.MaNCC
JOIN NV_SanPham nsp 

ON sp.MaSP = nsp.MaSP
WHERE TenNCC IN ('Cong ty thiet bi dien tu Hoang Phong ','Cong ty TNHH thuong mai Le Nguyen ') 
OR TinhTrang = 'Het Hang';


---trigger 1:Sửa SanPham:
CREATE OR REPLACE TRIGGER TRG_KHUYENMAI_SANPHAM_UPD
AFTER UPDATE OF XUATXU ON SANPHAM
FOR EACH ROW
DECLARE
pragma autonomous_transaction;
tr_MASP SANPHAM.MASP%TYPE;
BEGIN
     IF UPDATING THEN
        BEGIN
             SELECT MASP INTO tr_MASP
             FROM SANPHAM 
             WHERE :NEW.XUATXU = 'Trung Quoc' 
                   AND MASP = :NEW.MASP;
  
             IF (tr_MASP IS NOT NULL)
             THEN
                 UPDATE NV_SANPHAM 
                 SET khuyenmai=khuyenmai + 10 
                 WHERE NV_SANPHAM.masp = tr_MASP ;     
             END IF;
             EXCEPTION
                 WHEN NO_DATA_FOUND THEN
                 DBMS_OUTPUT.PUT_LINE (‘NOT FOUND’);
        END;
     END IF;
COMMIT;  
END;

---Trigger 2: thêm NV_SanPham:
CREATE OR REPLACE TRIGGER TRG_KHUYENMAI_NVSANPHAM_INS
BEFORE INSERT ON NV_SANPHAM
FOR EACH ROW
DECLARE
pragma autonomous_transaction;
       tr_MASP nv_sanpham.MASP%TYPE;
BEGIN
     IF INSERTING THEN
        BEGIN
             SELECT MASP INTO tr_MASP
             FROM SANPHAM
             WHERE XUATXU = 'Trung Quoc' AND MASP = :NEW.MASP;
             IF (tr_MASP is not null) 
             THEN
             DBMS_OUTPUT.PUT_LINE ('San pham co xuat xu Trung Quoc   - khuyen mai them 10%');
            :NEW.Khuyenmai := :NEW.Khuyenmai + 10;
            END IF;
            EXCEPTION
                     WHEN NO_DATA_FOUND THEN
                     DBMS_OUTPUT.PUT_LINE ('NOT FOUND');
        END;
     END IF;
        COMMIT;
END;


--Function 1:Nội dung: Hàm in ra thông tin nhân viên theo mã nhân viên
CREATE OR REPLACE FUNCTION DATA_NHANVIEN(f_MANV 
                           IN NHANVIEN.MANV%TYPE)
RETURN VARCHAR2
AS
  rs_HOTEN NHANVIEN.TENNV%TYPE;
  rs_GIOITINH NHANVIEN.GIOITINH%TYPE;
  rs_SDT NHANVIEN.SODT%TYPE;
  rs_LUONG NHANVIEN.LUONG%TYPE
BEGIN
  SELECT TENNV, GIOITINH, SODT, LUONG 
        INTO rs_HOTEN, rs_GIOITINH, rs_SDT, rs_LUONG
  FROM NHANVIEN
  WHERE MANV = f_MANV;
  RETURN 'Ten: '||rs_HOTEN||' Gioi tinh: '||rs_GIOITINH||' SDT: '||rs_SDT||' Luong: '||rs_LUONG;
END;
--test
set SERVEROUTPUT ON;
DECLARE
   result varchar2(32000);
BEGIN
     result:=DATA_NHANVIEN('NV01');
     DBMS_OUTPUT.PUT_LINE(result);
END;


--Function 2:Nội dung: Tính doanh thu của năm
CREATE OR REPLACE FUNCTION tinhDoanhThu(nam INTEGER)
RETURN NUMBER
AS
	tongDoanhThu NUMBER;
BEGIN
	SELECT SUM(TRIGIA) INTO tongDoanhThu
	FROM	HOADON
	GROUP BY EXTRACT(YEAR FROM NGHD)
	HAVING EXTRACT(YEAR FROM NGHD) = nam;
	RETURN tongDoanhThu;
END;


--test1
DECLARE
	tongDoanhThu NUMBER := 0;
BEGIN
	tongDoanhThu := tinhDoanhThu(2021);
	DBMS_OUTPUT.PUT_LINE('DOANH THU 2021: ' || tongDoanhThu);
    IF (tongDoanhThu > 100000000)THEN
        DBMS_OUTPUT.PUT_LINE('DOANH THU 2021 DAT CHI TIEU ');
    ELSIF (tongDoanhThu < 100000000 AND tongDoanhThu > 50000000) THEN
        DBMS_OUTPUT.PUT_LINE('DOANH THU 2021 DAT TRUNG BINH ');
ELSIF (tongDoanhThu < 50000000 AND tongDoanhThu > 10000000) THEN
        DBMS_OUTPUT.PUT_LINE('DOANH THU 2021 RAT THAP ');
    END IF;
END;

--test2
DECLARE
	tongDoanhThu NUMBER := 0;
BEGIN
	tongDoanhThu := tinhDoanhThu(2021);
	DBMS_OUTPUT.PUT_LINE('DOANH THU 2021:'|| tongDoanhThu);
END;


--Procedure 1:- Nội dung: Nhập vào mã chi nhánh in ra tổng số lượng sản phẩm 
--mà chi nhanh đó đã bán và chi tiết từng thông tin sản phẩm (pro_qlsp) 
set serveroutput on;
Create or replace procedure proc_qlsp(macn_in IN NV_SANPHAM.MaSP%TYPE)
is
   var_soluong number;
   var_tenchinhanh CHINHANH.TenChiNhanh%TYPE;
   var_tinhtrang NV_SANPHAM.TinhTrang%TYPE;
   var_tensp SANPHAM.TenSP%TYPE;
   var_masp SANPHAM.MaSP%TYPE;
   var_loaisp SANPHAM.LoaiSP%TYPE;
   var_giaban SANPHAM.GiaBan%TYPE;
   var_xuatxu SANPHAM.XuatXu%TYPE;
   var_mancc SANPHAM.MaNCC%TYPE;
   cur_masanpham NV_SANPHAM.MaSP%TYPE;
CURSOR CUR IS SELECT NV_SANPHAM.MaSP
FROM NV_SANPHAM
WHERE NV_SANPHAM.MaChiNhanh = macn_in;
BEGIN
   SELECT CN.TenChiNhanh, COUNT(*) INTO       var_tenchinhanh, var_soluong
   FROM CHINHANH CN, NV_SANPHAM NV_SP
   WHERE CN.MaChiNhanh = NV_SP.MaChiNhanh 
   AND CN.MaChiNhanh = macn_in
   GROUP BY CN.MaChiNhanh,CN.TenChiNhanh;
   DBMS_OUTPUT.PUT_LINE('** THONG TIN SAN PHAM CUA   CHI NHANH: '|| var_tenchinhanh || ' **');
DBMS_OUTPUT.PUT_LINE('** SO LUONG SANPHAM CUA CHINHANH: '|| var_soluong || ' **');
OPEN CUR;
LOOP
FETCH CUR INTO cur_masanpham;
DBMS_OUTPUT.PUT_LINE('=============================================');
EXIT WHEN CUR%NOTFOUND;
   SELECT
   TinhTrang, TenSP, LoaiSP, GiaBan, XuatXu, MaNCC
   INTO
      var_tinhtrang, var_tensp, var_loaisp,
      var_giaban, var_xuatxu, var_mancc
   FROM NV_SANPHAM, SANPHAM
   WHERE NV_SANPHAM.MaSP = SANPHAM.MaSP AND
       SANPHAM.MaSP = cur_masanpham AND        NV_SANPHAM.MaChiNhanh = macn_in ;
       DBMS_OUTPUT.PUT_LINE('TinhTrang: ' ||    var_tinhtrang);
       DBMS_OUTPUT.PUT_LINE('MaSP: '||var_masp||', TenSP: '||cur_masanpham||', LoaiSP: '||var_loaisp);
      DBMS_OUTPUT.PUT_LINE('GiaBan: '||var_giaban||', XuatXu: '||var_xuatxu);
      DBMS_OUTPUT.PUT_LINE('MaNCC: '||var_mancc);
END LOOP;
CLOSE CUR;
END;
--test
BEGIN  
   proc_qlsp('TS02'); 
END;


--Procedure 2:Nội dung: Nhập mã nhân viên kiểm tra bảng hóa đơn 
--và cho biết nhân viên đó bán được bao nhiêu hóa đơn. Xuất ra tên và số hóa đơn đó.
set serveroutput on;
CREATE OR REPLACE PROCEDURE show_NHANVIEN_HOADON (V_MANV NHANVIEN.MANV%TYPE)
AS
   V_TENNV VARCHAR2(25);
   SL_MAHD VARCHAR2(25);
BEGIN
   SELECT TENNV INTO V_TENNV
   FROM NHANVIEN
   WHERE V_MANV= MANV;
     DBMS_OUTPUT.PUT_LINE('TEN NV: ' || V_TENNV);
   SELECT COUNT(MAHD) INTO SL_MAHD
   FROM NHANVIEN NV JOIN HOADON HD 
                    ON NV.MANV = HD.MANV
   WHERE V_MANV = HD.MANV;
   DBMS_OUTPUT.PUT_LINE('DA BAN DUOC:
                       '||SL_MAHD|| 'DON HANG');
   EXCEPTION
   WHEN NO_DATA_FOUND 
   THEN
      DBMS_OUTPUT.PUT_LINE('NHAN VIEN KHONG TON TAI');
END;
--test
BEGIN
   show_NHANVIEN_HOADON('NV01');
END;


--Procedure 3:Các sản phẩm được nhập hàng trước thời gian nhất định thì sẽ được khuyến mãi 
set serveroutput on; 
CREATE OR REPLACE PROCEDURE pdiscount (pMOCTHOIGIAN 
IN QL_SANPHAM.NGAYNHAPSP%TYPE, pMAGIAMGIA INT)
AS
    pMASP QL_SANPHAM.NGAYNHAPSP%TYPE;
    pNGAYNHAPSP QL_SANPHAM.NGAYNHAPSP%TYPE;
    CUR_MASP QL_SANPHAM.MASP%TYPE;    
    CURSOR CUR IS
    SELECT QL_SANPHAM.MASP
    FROM QL_SANPHAM
    WHERE QL_SANPHAM.NGAYNHAPSP < TO_DATE(pMOCTHOIGIAN);    
BEGIN
    OPEN CUR;    
    LOOP
        FETCH CUR INTO CUR_MASP;
        EXIT WHEN CUR%NOTFOUND;
        
        UPDATE NV_SANPHAM
        SET NV_SANPHAM.KHUYENMAI = pMAGIAMGIA
        WHERE NV_SANPHAM.MASP = CUR_MASP;
        
        SELECT  NGAYNHAPSP INTO pNGAYNHAPSP
        FROM QL_SANPHAM
        WHERE QL_SANPHAM.MASP = CUR_MASP;        
     DBMS_OUTPUT.PUT_LINE ('San pham '||CUR_MASP|| ' duoc nhap vao ' || pNGAYNHAPSP || ' - giam gia '|| pMAGIAMGIA|| '%');        
    END LOOP;
    
END;
--test
declare
        pMOCTHOIGIAN  QL_SANPHAM.NGAYNHAPSP%TYPE;
        pMAGIAMGIA int;
    begin
        pMOCTHOIGIAN := '11/08/2021';
        pMAGIAMGIA := 18;
        DBMS_OUTPUT.PUT_LINE ('SAN PHAM NHAP TRUOC NGAY ' || pMOCTHOIGIAN || ' DUOC GIAM GIA: ');
        pdiscount (pMOCTHOIGIAN, pMAGIAMGIA);
    end;
