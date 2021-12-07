-------YEU CAU 3---------
Insert into SANPHAM values ('SP60', 'Loa Bluetooth ROBOT RB555', 'Loa Nghe Nhac', 549000, 'CT03', 'Trung Quoc');
Insert into SANPHAM values ('SP61', 'Tai nghe Bluetooth Sony’, 'Tai nghe', 449000, 'CT03', 'Han Quoc');
insert into KHACHHANG values ('KH60', 'Do Minh Thuy’, 'Nu', '0582693886',’Quan 1, TPHCM’);
insert into KHACHHANG values ('KH61', ‘Tran Thao Uyen’, 'Nu', '0582563886',’Quan 2, TPHCM’);

--LOST DATA--

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT * FROM TS01.KHACHHANG@dblink WHERE MaKH = 'KH05';

UPDATE TS01. KHACHHANG@dblink SET TENKH = ‘Tran Nhat Khue’ WHERE MaKH = 'KH05';

UPDATE TS01. KHACHHANG@dblink SET TENKH = ‘Nguyen Xuan Thuy’ WHERE MaKH = 'KH05';

SET TRANSACTION ISOLATION LEVEL Serializable;

UPDATE TS01. KHACHHANG @dblink SET TenKH = ‘Nguyen Quoc Luon’ WHERE MAKH = 'KH05';

--UNREPEATABLE DATA--

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT * FROM TS01.SANPHAM@dblink WHERE MASP = 'SP45';

UPDATE TS01.SANPHAM@dblink SET TENSP = ‘Loa Sony Ultra Sound’ WHERE MASP= 'SP45';

SELECT * FROM TS01.SANPHAM@dblink WHERE MASP = 'SP45';

SET TRANSACTION ISOLATION LEVEL Serializable;


UPDATE TS01.SANPHAM@dblink SET TENSP = ‘Loa Bluetooth Uslion’ WHERE MASP= 'SP45';

--PHANTOM READ--

SET TRANSACTION ISOLATION LEVEL Read committed;

SELECT * FROM TS01.SANPHAM@dblink WHERE MASP = 'SP60';

DELETE FROM TS01.SANPHAM@dblink WHERE MASP = ‘SP60’;

SET TRANSACTION ISOLATION LEVEL Serializable;

SELECT * FROM TS01.SANPHAM@dblink WHERE MASP = 'SP61';

DELETE FROM TS01.SANPHAM@dblink WHERE MASP = ‘SP61’;


--DEADLOCK--

SET TRANSACTION ISOLATION LEVEL Read committed;

UPDATE  TS01.KHACHHANG@dblink SET DIACHI = ‘Vung Tau’ WHERE MAKH = ‘KH60’;

UPDATE  TS01.KHACHHANG@dblink SET DIACHI = ‘Phu Yen’ WHERE MAKH = ‘KH61’;

SELECT * FROM TS01.KHACHHANG@dblink;


-------YEU CAU 4  ---------


--Cau chua toi uu--
SELECT masp, tensp
FROM sanpham sp, nv_sanpham nvsp, ql_sanpham qlsp, nhacungcap ncc, chinhanh cn
WHERE tinhtrang = 'Con Hang' 		
	and cn.machinhanh = 'TS01' 
	and ncc.mancc= 'CT01'
	and sp.masp = nvsp.masp 
	and sp.masp = qlsp.masp
	and nvsp.masp = qlsp.masp
	and sp.mancc = ncc.mancc 
	and  cn.machinhanh = nvsp.machinhanh 
	and cn.machinhanh = qlsp.machinhanh;
---viet lai
SELECT masp, tensp
FROM sanpham sp, nv_sanpham nvsp, ql_sanpham qlsp, nhacungcap ncc,                    
	chinhanh cn
WHERE tinhtrang = 'Con Hang' 
	and ncc.mancc= 'CT01'
	and sp.masp = nvsp.masp 
	and nvsp.masp = qlsp.masp
	and sp.mancc = ncc.mancc  ;
