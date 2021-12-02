DROP TABLE NV_SANPHAM;
DROP TABLE QL_SANPHAM;
DROP TABLE CHINHANH;
DROP TABLE CTHD;
DROP TABLE HOADON;
DROP TABLE KHACHHANG;
DROP TABLE NHANVIEN;
DROP TABLE SANPHAM;
DROP TABLE NHACUNGCAP;

CREATE TABLE SANPHAM(
  MaSP varchar2(25) PRIMARY KEY,
  TenSP varchar2(50),
  LoaiSP varchar2(50),
  GiaBan  number,
  MaNCC  varchar2(25),
  XuatXu varchar2(30)
);

CREATE TABLE NHACUNGCAP(
  MaNCC Varchar2(25) PRIMARY KEY,
  TenNCC varchar(50)
);

--SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());

CREATE TABLE CHINHANH(
  MaChiNhanh varchar2(25) PRIMARY KEY,
  TenChiNhanh varchar2(50),
  Email varchar2(50),
  SoDT varchar2(11),
  NgayTL date
);
 
CREATE TABLE NHANVIEN(
  MaNV  varchar2(25) PRIMARY KEY,
  TenNV varchar2(30),
  GioiTinh varchar2(3),
  DiaChi varchar2(40),
  SoDT varchar2(11),
  Luong  number,
  MaChiNhanh varchar2(25)
);

CREATE TABLE NV_SANPHAM(
  MaChiNhanh varchar2(25),
  MaSP varchar2(25),
  TinhTrang varchar2(25),
  KhuyenMai number,
  Constraint PK_SachCN_NV primary key (MaChiNhanh, MaSP) 
);
 
CREATE TABLE QL_SANPHAM(
  MaChiNhanh varchar2(25),
  MaSP varchar2(25),
  SoLuong number,
  NgayNhapSP date,
  Constraint PK_SachCN_QL primary key (MaChiNhanh, MaSP) 
);

CREATE TABLE KHACHHANG(
    MaKH        varchar2(25) PRIMARY KEY,
    TenKH       varchar2(25),
    GioiTinh    varchar2(3),
    SoDT        varchar2(11),
    DiaChi  varchar2(40)
);
CREATE TABLE HOADON(
  MaHD  varchar2(25) PRIMARY KEY,
  NGHD  date,
  MaKH  varchar2(25),
  MaNV  varchar2(25),
  TriGia number
);

CREATE TABLE CTHD(
    MaHD     varchar2(25),
    MaSP     varchar2(25),
    SoLuongMua number
);


ALTER TABLE SANPHAM
ADD CONSTRAINT FK_SANPHAM_NHACUNGCAP FOREIGN KEY (MaNCC) 
REFERENCES NHACUNGCAP(MaNCC);

ALTER TABLE HOADON
ADD CONSTRAINT FK_HD_maKH FOREIGN KEY (MaKH) 
REFERENCES KHACHHANG(MaKH);

ALTER TABLE HOADON
ADD CONSTRAINT FK_HD_maNV FOREIGN KEY (MaNV) 
REFERENCES NHANVIEN(MaNV);

ALTER TABLE CTHD
ADD CONSTRAINT FK_CTHD_maHD FOREIGN KEY (MaHD) 
REFERENCES HOADON(MaHD);

ALTER TABLE CTHD
ADD CONSTRAINT FK_CTHD_maSP FOREIGN KEY (MaSP) 
REFERENCES SANPHAM(MaSP);

ALTER TABLE QL_SANPHAM
ADD CONSTRAINT FK_QL_SANPHAM_CHINHANH FOREIGN KEY (MaChiNhanh) 
REFERENCES CHINHANH(MaChiNhanh); 
 
ALTER TABLE QL_SANPHAM
ADD CONSTRAINT FK_QL_SANPHAM FOREIGN KEY (MaSP) 
REFERENCES SANPHAM(MaSP); 
 
ALTER TABLE NV_SANPHAM
ADD CONSTRAINT FK_NV_SANPHAM_CHINHANH FOREIGN KEY (MaChiNhanh) 
REFERENCES CHINHANH(MaChiNhanh); 

ALTER TABLE NV_SANPHAM
ADD CONSTRAINT FK_NV_SANPHAM FOREIGN KEY (MaSP) 
REFERENCES SANPHAM(MaSP);

Insert into NHACUNGCAP values ('CT01', 'Cong ty thiet bi dien tu Hoang Phong');
Insert into NHACUNGCAP values ('CT02', 'Cong ty SX va TM Binh An');
Insert into NHACUNGCAP values ('CT03', 'Cong ty thiet bi dien tu Khang Thinh');
Insert into NHACUNGCAP values ('CT04', 'Trang dien tu thuong mai Lazada');
Insert into NHACUNGCAP values ('CT05', 'Cong ty TNHH thuong mai Le Nguyen ');
Insert into NHACUNGCAP values ('CT06', 'Cong ty thiet bi dien tu Hung Phat ');
Insert into NHACUNGCAP values ('CT07', 'Cong ty SX va TM Tuong An');
Insert into NHACUNGCAP values ('CT08', 'Cong ty TNHH thuong mai Ang Sang Vang');
Insert into NHACUNGCAP values ('CT09', 'Trang dien tu thuong mai Tiki');
Insert into NHACUNGCAP values ('CT10', 'Cong ty thiet bi dien tu Dang Quang');
Insert into NHACUNGCAP values ('CT11', 'Cong ty co phan cong nghe Chung Sen');
Insert into NHACUNGCAP values ('CT12', 'Cong ty TNHH thuong mai An Binh');
Insert into NHACUNGCAP values ('CT13', 'Cong ty TNHH thuong mai Dang Khoi ');
Insert into NHACUNGCAP values ('CT14', 'Cong ty SX va TM Dat Binh');
Insert into NHACUNGCAP values ('CT15', 'Cong ty thiet bi dien tu Trung Kien ');
Insert into NHACUNGCAP values ('CT16', 'Cong ty co phan cong nghe Nguyen Anh');
Insert into NHACUNGCAP values ('CT17', 'Cong ty TNHH thuong mai Thien Vu');
Insert into NHACUNGCAP values ('CT18', 'Cong ty SX va TM Nam Quoc Thinh');
Insert into NHACUNGCAP values ('CT19', 'Cong ty thiet bi dien tu Nam Long');
Insert into NHACUNGCAP values ('CT20', 'Cong ty TNHH thuong mai Dai Phat');
Insert into NHACUNGCAP values ('CT21', 'Cong ty SX va TM Dong Nai');
Insert into NHACUNGCAP values ('CT22', 'Cong ty TNHH thuong mai Cam Phat');
Insert into NHACUNGCAP values ('CT23', 'Cong ty thiet bi dien tu Nguyen Ha ');
Insert into NHACUNGCAP values ('CT24', 'Cong ty co phan cong nghe Hoang Nguyen');
Insert into NHACUNGCAP values ('CT25', 'Cong ty SX va TM Nam Phat');
Insert into NHACUNGCAP values ('CT26', 'Cong ty thiet bi dien tu Nam A');
Insert into NHACUNGCAP values ('CT27', 'Cong ty TNHH thuong mai Hoa Thien Loc');
Insert into NHACUNGCAP values ('CT28', 'Cong ty TNHH thiet bi Doan Gia');
Insert into NHACUNGCAP values ('CT29', 'Cong ty thiet bi dien tu Dat Binh Loc');
Insert into NHACUNGCAP values ('CT30', 'Cong ty TNHH thiet bi Nguyen Giang');
Insert into NHACUNGCAP values ('CT31', 'Cong ty co phan cong nghe Hung Phat ');
Insert into NHACUNGCAP values ('CT32', 'Cong ty SX va TM  Trung Kien');
Insert into NHACUNGCAP values ('CT33', 'Cong ty TNHH thiet bi  Du Cam');
Insert into NHACUNGCAP values ('CT34', 'Cong ty co phan cong nghe Khang Thien');
Insert into NHACUNGCAP values ('CT35', 'Cong ty TNHH thiet bi An Nam');
Insert into NHACUNGCAP values ('CT36', 'Cong ty thiet bi dien tu Kim Son');
Insert into NHACUNGCAP values ('CT37', 'Cong ty TNHH thiet bi HM Audio');
Insert into NHACUNGCAP values ('CT38', 'Cong ty TNHH thiet bi  Manh Tien Audio');
Insert into NHACUNGCAP values ('CT39', 'Cong ty SX va TM Vinet Shop');
Insert into NHACUNGCAP values ('CT40', 'Cong ty TNHH thiet bi Cuong Thinh Audio ');
Insert into NHACUNGCAP values ('CT41', 'Cong ty co phan cong nghe Minh Tri');
Insert into NHACUNGCAP values ('CT42', 'Cong ty thiet bi dien tu Dien May online');
Insert into NHACUNGCAP values ('CT43', 'Cong ty TNHH thiet bi  PhuKien360');
Insert into NHACUNGCAP values ('CT44', 'Cong ty TNHH thiet bi  Cong Nghe July');
Insert into NHACUNGCAP values ('CT45', 'Trang dien tu thuong mai Shopee');
Insert into NHACUNGCAP values ('CT46', 'Cong ty TNHH thiet bi Trung Quan Audio ');
Insert into NHACUNGCAP values ('CT47', 'Cong ty co phan cong nghe Gu Cong Nghe');
Insert into NHACUNGCAP values ('CT48', 'Cong ty thiet bi dien tu Tien Manh');
Insert into NHACUNGCAP values ('CT49', 'Cong ty TNHH thiet bi  Viet Nam Audio ');
Insert into NHACUNGCAP values ('CT50', 'Cong ty thiet bi dien tu Ben Vung');

Insert into SANPHAM values ('SP01', 'Tai Nghe F9  Dock','Tai nghe Khong day', 119000, 'CT01', 'Trung Quoc');
Insert into SANPHAM values ('SP02', 'Tai Nghe Earbuds SOUNDPEATS','Tai nghe Khong day', 498000, 'CT05', 'My');
Insert into SANPHAM values ('SP03', 'Tai Nghe Apple AirPods 2 ','Tai nghe Khong day', 3498000, 'CT03', 'My');
Insert into SANPHAM values ('SP04', 'Tai Nghe TWS AMA S11','Tai nghe Khong day', 400000, 'CT01', 'Nhat Ban');
Insert into SANPHAM values ('SP05', 'Tai Nghe BEARTEK Bearbuds B68 ','Tai nghe Khong day', 349000, 'CT04', 'Duc');
Insert into SANPHAM values ('SP06', 'Tai Nghe Remax RM','Tai nghe Khong day', 259000, 'CT02', 'Viet Nam');
Insert into SANPHAM values ('SP07', 'Tai Nghe Remax RB-620HB','Tai nghe Khong day', 950000, 'CT10', 'Trung Quoc');
Insert into SANPHAM values ('SP08', 'Tai Nghe Sony WH-CH510','Tai nghe Khong day', 990000, 'CT09', 'Nhat Ban');
Insert into SANPHAM values ('SP09', 'Tai Nghe Haylou GT1 Pro','Tai nghe Khong day', 365000, 'CT07', 'Trung Quoc');
Insert into SANPHAM values ('SP10', 'Tai Nghe REROKA-CYBORG','Tai nghe Khong day', 499000, 'CT08', 'Trung Quoc');
Insert into SANPHAM values ('SP11', 'Tai Nghe BEARTEK Bearbuds B33 ','Tai nghe Khong day', 299000, 'CT06', 'Viet Nam');
Insert into SANPHAM values ('SP12', 'Tai Nghe Beartek  B22 True Wireless','Tai nghe Khong day', 249000, 'CT06', 'Viet Nam');
Insert into SANPHAM values ('SP13', 'Tai Nghe Bluetooth ADEMAX 5.0 F9','Tai nghe Khong day', 109000, 'CT07', 'Viet Nam');
Insert into SANPHAM values ('SP14', 'Tai Nghe Lanith F9 Pro 5.0','Tai nghe Khong day', 179000, 'CT08', 'My');
Insert into SANPHAM values ('SP15', 'Tai Nghe THE DEOSD-TD-C200S','Tai nghe Khong day', 299000, 'CT09', 'Trung Quoc');
Insert into SANPHAM values ('SP16', 'Tai Nghe Gaming Apro366 5.0','Tai nghe Khong day', 199000, 'CT10', 'Trung Quoc');
Insert into SANPHAM values ('SP17', 'Tai Nghe Kem mic PKCBX7 PF144','Tai nghe Khong day', 119000, 'CT02', 'Duc');
Insert into SANPHAM values ('SP18', 'Tai Nghe Bluetooth PKCB PF171','Tai nghe Khong day', 219000, 'CT03', 'Viet Nam');
Insert into SANPHAM values ('SP19', 'Tai Nghe Gaming Plextone G2','Tai nghe Khong day', 468000, 'CT04', 'Nhat Ban');
Insert into SANPHAM values ('SP20', 'Tai Nghe Kem mic pkcb r15x','Tai nghe Khong day', 299000, 'CT08', 'Duc');
Insert into SANPHAM values ('SP21', 'Loa RB109','Loa', 115000, 'CT05', 'My');
Insert into SANPHAM values ('SP22', 'Loa USLION Mini Plus','Loa', 355000, 'CT04', 'Nhat Ban');
Insert into SANPHAM values ('SP23', 'Loa USB FM','Loa', 600000, 'CT01', 'Nhat Ban');
Insert into SANPHAM values ('SP24', 'Loa Remax RB-M28','Loa', 1150000, 'CT03', 'Duc');
Insert into SANPHAM values ('SP25', 'Loa X3-Pro 40WNB','Loa', 1999000, 'CT03', 'My');

Insert into SANPHAM values ('SP26', 'Tai Nghe JBL C150SI', 'Tai Nghe Co Day', 219900, 'CT05', 'My');
Insert into SANPHAM values ('SP27', 'Tai Nghe XSmart QKZ AK2 Pro', 'Tai Nghe Co Day', 142000, 'CT01', 'Trung Quoc');
Insert into SANPHAM values ('SP28', 'Tai Nghe Sony MDR-XB55AP', 'Tai Nghe Co Day', 690000, 'CT05', 'Nhat Ban');
Insert into SANPHAM values ('SP29', 'Tai Nghe Remax RM-805', 'Tai Nghe Co Day', 259000, 'CT03', 'Trung Quoc');
Insert into SANPHAM values ('SP30', 'Tai Nghe Mi Basic HSEJ03JY', 'Tai Nghe Co Day', 121000, 'CT02', 'Trung Quoc');
Insert into SANPHAM values ('SP31', 'Tai Nghe Marshall Mode', 'Tai Nghe Co Day', 1200000, 'CT05', 'Duc');
Insert into SANPHAM values ('SP32', 'Tai Nghe AKG', 'Tai Nghe Co Day', 186000, 'CT01', 'Trung Quoc');
Insert into SANPHAM values ('SP33', 'Tai Nghe Plextone G25', 'Tai Nghe Co Day', 338000, 'CT03', 'Nhat Ban');
Insert into SANPHAM values ('SP34', 'Tai Nghe Dareu VH350se', 'Tai Nghe Co Day', 230000, 'CT02', 'My');
Insert into SANPHAM values ('SP35', 'Tai Nghe Viniel IP10', 'Tai Nghe Co Day', 180000, 'CT05', 'Trung Quoc');
Insert into SANPHAM values ('SP36', 'Tai Nghe Microlab K290', 'Tai Nghe Co Day', 198000, 'CT08', 'Viet Nam');
Insert into SANPHAM values ('SP37', 'Tai Nghe F16 Gaming Headset', 'Tai Nghe Co Day', 325000, 'CT07', 'My');
Insert into SANPHAM values ('SP38', 'Tai Nghe Ovann X4', 'Tai Nghe Co Day', 299000, 'CT05', 'Viet Nam');
Insert into SANPHAM values ('SP39', 'Tai Nghe HiFi Remax RM-595', 'Tai Nghe Co Day', 315000, 'CT10', 'Nhat Ban');
Insert into SANPHAM values ('SP40', 'Tai Nghe Zealot', 'Tai Nghe Co Day', 549000, 'CT02', 'Duc');
Insert into SANPHAM values ('SP41', 'Tai Nghe Earldom ET-E11', 'Tai Nghe Co Day', 157000, 'CT08', 'Trung Quoc');
Insert into SANPHAM values ('SP42', 'Tai Nghe Remax RM810', 'Tai Nghe Co Day', 900000, 'CT01', 'Trung Quoc');
Insert into SANPHAM values ('SP43', 'Tai Nghe xMOWI RX3', 'Tai Nghe Co Day', 198000, 'CT07', 'Duc');
Insert into SANPHAM values ('SP44', 'Tai Nghe HOCO M34', 'Tai Nghe Co Day', 78000, 'CT04', 'Trung Quoc');
Insert into SANPHAM values ('SP45', 'Loa Bluetooth Sanag X6 Plus', 'Loa Nghe Nhac', 259000, 'CT10', 'Viet Nam');
Insert into SANPHAM values ('SP46', 'Loa Anker SoundCore Motion B', 'Loa Nghe Nhac', 1050000, 'CT07', 'Trung Quoc');
Insert into SANPHAM values ('SP47', 'Loa Bluetooth Sony SRS-XB13', 'Loa Nghe Nhac', 1169000, 'CT01', 'Nhat Ban');
Insert into SANPHAM values ('SP48', 'Loa Bluetooth Uslion Mini', 'Loa Nghe Nhac', 355000, 'CT06', 'Duc');
Insert into SANPHAM values ('SP49', 'Loa OVLENG V13', 'Loa Nghe Nhac', 399000, 'CT08', 'Nhat Ban');
Insert into SANPHAM values ('SP50', 'Loa Bluetooth ROBOT RB150', 'Loa Nghe Nhac', 149000, 'CT03', 'Trung Quoc');


Insert into CHINHANH values ('TS01', 'Tran Hung Dao - Phuong 3', 'ts01@gmail.com', '0378595433',To_Date  ('11/10/2019', 'dd/mm/yyyy'));
Insert into CHINHANH values ('TS02', 'Le Hong Phong - Phuong 10', 'ts02@gmail.com','0907956421',To_Date  ('12/12/2019', 'dd/mm/yyyy'));

Insert into NHANVIEN values ('NV01', 'Nguyen Minh Anh', 'nam', 'Binh Dinh', '0384227891',7200000, 'TS02');
Insert into NHANVIEN values ('NV02', 'Tran Thanh Thoai','nu', 'Nha Trang', '0347228471',6800000, 'TS02');
Insert into NHANVIEN values ('NV03', 'Nguyen Ngoc Hoai An','nam', 'TP.HCM', '0345667280',10000000, 'TS02');
Insert into NHANVIEN values ('NV04', 'Le Thanh Tam', 'nam','Ha Noi', '0346710924',12000000, 'TS02');
Insert into NHANVIEN values ('NV05', 'Tran Nhat Thanh','nu', 'Vung Tau', '0346718923',7200000, 'TS02');

Insert into NHANVIEN values ('NV06', 'Huynh Ngoc Minh', 'nam','TP.HCM', '0328198271',9000000, 'TS01');
Insert into NHANVIEN values ('NV07', 'Tran Ngoc Thanh','nu', 'Hue', '0364891264',9500000, 'TS01');
Insert into NHANVIEN values ('NV08', 'Le Nguyet An','nu', 'Da Nang', '0328196274',8500000, 'TS01');
Insert into NHANVIEN values ('NV09', 'Do Thanh Tu', 'nu','Ha Noi', '0328121271',7500000, 'TS01');
Insert into NHANVIEN values ('NV10', 'Nguyen Le Thanh Minh', 'nam','Thanh Hoa', '0327198271',6800000, 'TS01');

Insert into NHANVIEN values ('NV11', 'Le Thanh Thanh', 'nu','Nha Trang', '0328198371',7400000, 'TS02');
Insert into NHANVIEN values ('NV12', 'Huynh Tran', 'nam','TP.HCM', '0384198271',9000000, 'TS02');
Insert into NHANVIEN values ('NV13', 'Hoai Ngoc Tuan', 'nam','Da Nang', '0328162271',5100000, 'TS02');
Insert into NHANVIEN values ('NV14', 'Tran Minh Man', 'nam','TP.HCM', '0328193671',10000000, 'TS02');
Insert into NHANVIEN values ('NV15', 'Do Tuan An', 'nam','Nha Trang', '0328197171',9500000, 'TS02');

Insert into NHANVIEN values ('NV16', 'Tram Tuan','nam', 'Thanh Hoa', '0324598271',9000000, 'TS01');
Insert into NHANVIEN values ('NV17', 'Tran Thanh An', 'nam','TP.HCM', '0356198271',7200000, 'TS01');
Insert into NHANVIEN values ('NV18', 'Bui Tuan Huy', 'nam','TP.HCM', '0328191271',9000000, 'TS01');
Insert into NHANVIEN values ('NV19', 'Do Thanh Cuong', 'nam','Dien Bien', '0329098271',8500000, 'TS01');
Insert into NHANVIEN values ('NV20', 'Tran Bui Thanh Thoai','nu', 'TP.HCM', '0327198271',5500000, 'TS01');

Insert into NHANVIEN values ('NV21', 'Le Thanh Huy', 'nam','Nha Trang', '0328193371',7400000, 'TS02');
Insert into NHANVIEN values ('NV22', 'Do Chi Minh', 'nam','Cao Bang', '0323298371',7800000, 'TS02');
Insert into NHANVIEN values ('NV23', 'Nguyen Chi Thien', 'nam','Hue', '0361198371',5100000, 'TS02');
Insert into NHANVIEN values ('NV24', 'Tran Huy Viet', 'nam','TP.HCM', '0328838371',8900000, 'TS02');
Insert into NHANVIEN values ('NV25', 'Le Viet Anh', 'nam','Ha Noi', '0328198871',7400000, 'TS02');

Insert into NHANVIEN values ('NV26', 'Nguyen Minh An', 'nu','Binh Dinh', '0384347891',7200000, 'TS01');
Insert into NHANVIEN values ('NV27', 'Tran Thanh Huy', 'nam','Vung Tau', '0342128471',7700000, 'TS01');
Insert into NHANVIEN values ('NV28', 'Nguyen Hoai An', 'nu','TP.HCM', '0335667280',85000000, 'TS01');
Insert into NHANVIEN values ('NV29', 'Le Thanh Thanh','nu', 'Ha Noi', '0384510924',8800000, 'TS01');
Insert into NHANVIEN values ('NV30', 'Tran Nhat Cuong', 'nam','Vung Tau', '0321718923',7200000, 'TS01');

Insert into NHANVIEN values ('NV31', 'Do Minh Thien', 'nam','Hue', '0386527891',7200000, 'TS02');
Insert into NHANVIEN values ('NV32', 'Bui Nhat Thoai','nu', 'Nha Trang', '0347338471',6800000, 'TS02');
Insert into NHANVIEN values ('NV33', 'Nguyen Le Mi A', 'nam','TP.HCM', '0345656280',10000000, 'TS02');
Insert into NHANVIEN values ('NV34', 'Nguyen Thanh Cuong', 'nam','Ha Noi', '0344110924',11000000, 'TS02');
Insert into NHANVIEN values ('NV35', 'Nguyen Viet Xuan', 'nam','Tien Giang', '0356718923',7200000, 'TS02');

Insert into NHANVIEN values ('NV36', 'Huynh Minh Ai', 'nu','TP.HCM', '0321198271',9000000, 'TS01');
Insert into NHANVIEN values ('NV37', 'Tran Ai Mi', 'nu','Hue', '0322891264',9500000, 'TS01');
Insert into NHANVIEN values ('NV38', 'Le Thanh Nhan', 'nam','Da Nang', '0345196274',8500000, 'TS01');
Insert into NHANVIEN values ('NV39', 'Cao Thu Thuy', 'nu','Ha Noi', '0328331271',7500000, 'TS01');
Insert into NHANVIEN values ('NV40', 'Nguyen Thi Thanh Ngan', 'nu','Thanh Hoa', '0366198271',6800000, 'TS01');

Insert into NHANVIEN values ('NV41', 'Pham Thi Hong Dang','nu', 'Nha Trang', '0328998371',6400000, 'TS02');
Insert into NHANVIEN values ('NV42', 'Do Van Du', 'nu','TP.HCM', '0384118271',9400000, 'TS02');
Insert into NHANVIEN values ('NV43', 'Bui My Dan', 'nu','Da Nang', '0325562271',5500000, 'TS02');
Insert into NHANVIEN values ('NV44', 'Tran Thi Tieu Vy','nu', 'TP.HCM', '0326693671',5600000, 'TS02');
Insert into NHANVIEN values ('NV45', 'Do Thi Ha','nu', 'Thanh Hoa', '0323197171',9100000, 'TS02');

Insert into NHANVIEN values ('NV46', 'Do Tram My Van','nu', 'Kien Giang', '0322998271',9100000, 'TS01');
Insert into NHANVIEN values ('NV47', 'Kieu Thi Thuy Hoai', 'nu','Ben Tre', '0353298271',7800000, 'TS01');
Insert into NHANVIEN values ('NV48', 'Tran Bui Duc Long','nam', 'Vinh Long', '0328541271',9500000, 'TS01');
Insert into NHANVIEN values ('NV49', 'Dang Nguyen Hue An','nu', 'Ca Mau', '0329099121',6500000, 'TS01');
Insert into NHANVIEN values ('NV50', 'Do Tuan Tai','nam', 'Tay Ninh', '0327192271',5300000, 'TS01');
Insert into NHANVIEN values ('NV51', 'Nguyen Anh Kiet','nam', 'Vinh Phuc', '0327192159',5500000, 'TS01');

INSERT INTO KHACHHANG VALUES ('KH01', 'Nguyen Quoc Trung', 'Nam', '0333589676', 'Hung Loc, Hau Loc, Thanh Hoa');
INSERT INTO KHACHHANG VALUES ('KH02', 'Tran Hoai Nam', 'Nam', '0848589676', 'Hoa Loc, Hau Loc, Thanh Hoa');
INSERT INTO KHACHHANG VALUES ('KH03', 'Bui Van Truong', 'Nam', '0948589676', 'Kios  Le Minh Xuan P7 TPHCM');
INSERT INTO KHACHHANG VALUES ('KH04', 'Nguyen Van Tu', 'Nam', '0334739676', 'Ho Phong TX, Gia Rai, Bac Lieu');
INSERT INTO KHACHHANG VALUES ('KH05', 'Luu Thai Bao', 'Nam', '0945687676', 'QL1A, Hoa Binh, Bac Lieu');
INSERT INTO KHACHHANG VALUES ('KH06', 'Nguyen Thi Bao Linh', 'Nu', '0949153648', 'C1 Tran Phu, p3, Bac Lieu');
INSERT INTO KHACHHANG VALUES ('KH07', 'Nguyen Hong Ngoc', 'Nu', '0912357486', 'Khom 1, Soc Trang');
INSERT INTO KHACHHANG VALUES ('KH08', 'Dinh Tien Dat', 'Nam', '0458693258', 'Hung Vuong, P6, Soc Trang');
INSERT INTO KHACHHANG VALUES ('KH09', 'Nguyen Quynh Anh', 'Nu', '0989987585', 'Nguyen Hue, Hau Giang');
INSERT INTO KHACHHANG VALUES ('KH10', 'Dang Hoang Khoa', 'Nam', '0912568469', 'Vinh Lac, Kien Giang');

INSERT INTO KHACHHANG VALUES ('KH11', 'Trinh Thi Diem Quynh', 'Nu', '0357475698', 'Tran Phu, Rach Gia, Kien Giang');
INSERT INTO KHACHHANG VALUES ('KH12', 'TRan Thu Linh', 'Nu', '0785693458', 'Cai Tac, Chau Thanh, Hau Giang');
INSERT INTO KHACHHANG VALUES ('KH13', 'Nguyen Thi Tuyet Hoa', 'Nu', '0975358169', 'Thoi Hoa, Co Do, Can THo');
INSERT INTO KHACHHANG VALUES ('KH14', 'Le Viet Anh', 'Nam', '0987956915', 'Chau Van Lien, O Mon, Can Tho');
INSERT INTO KHACHHANG VALUES ('KH15', 'Mai Khoi Nguyen', 'Nam', '0357489658', 'Le Hong Phong, Can Tho');
INSERT INTO KHACHHANG VALUES ('KH16', 'Nguyen Kha Anh', 'Nu', '035469852,', 'Khu Vuc 3, Ninh Kieu, Can Tho');
INSERT INTO KHACHHANG VALUES ('KH17', 'Tran Dinh Trong', 'Nam', '0984586259', 'An Hoa, Ninh Kieu, Can Tho');
INSERT INTO KHACHHANG VALUES ('KH18', 'Nguyen Kim Anh', 'Nu', '0357475462', 'Khom 5, Binh Minh, Vinh Long');
INSERT INTO KHACHHANG VALUES ('KH19', 'Hoang Thi Nga', 'Nu', '0956325415', 'Xuan Dinh, Bac Tu Liem, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH20', 'Tran Quoc Bao', 'Nam', '0629574325', 'Duc Thang, Bac Tu Lien, Ha Noi');

INSERT INTO KHACHHANG VALUES ('KH21', 'Nguyen Hoang Anh', 'Nam', '0159358426', 'Nghia Tan, Cau Giay, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH22', 'Tran My Duyen', 'Nu', '0989652358', 'Co Nhue, Bac Tu Lien, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH23', 'Nguyen Thi Thuy', 'Nu', '0949153246', 'Quan Hoa, Cau Giay, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH24', 'Le Hong Phong', 'Nam', '0536125498', 'Nghia Do, Cau Giay, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH25', 'Tran Duc Thien', 'Nam', '035126854', 'Nguyen Khang, Yen Hoa, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH26', 'Le Thi Trang', 'Nu', '0693025014', 'Lang Ha, Dong Da, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH27', 'Nguyen Thi Sao Mai', 'Nu', '0369564215', 'Trung Hoa,  Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH28', 'Tran Minh Tho', 'Nam', '0452652168', 'Lang Thuong, Ba Dinh, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH29', 'Hoang Thi Chinh', 'Nu', '0543692478', 'Hoang Hoa Tham, Tay Ho, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH30', 'Dinh Thhi Theu', 'Nu', '0365412958', 'Thai Thinh, Dong Da, Ha Noi');

INSERT INTO KHACHHANG VALUES ('KH31', 'Ho Thi Ngoc An', 'Nu', '0328694357', 'Thai Ha, Dong Da, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH32', 'Bui Van Toan', 'Nam', '0536125427', 'Cho Dua, Dong Da, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH33', 'Bui Van Manh', 'Nam', '0385674354', 'Cau Giay, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH34', 'Le Thuy Linh', 'Nu', '0536985425', 'Thuy Khue, Tay Ho, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH35', 'Dong Nhu Quynh', 'Nu', '0415632758', 'Doi Can, Ba Dinh, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH36', 'Dinh Thuy Ngoc', 'Nu', '0236412589', 'Hao Nam, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH37', 'Phan Ngoc Anh', 'Nu', '0358413652', 'Hang Bot, Dong Da, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH38', 'Phan Van Khai', 'Nam', '0125468235', 'Xa Dan, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH39', 'Luong Ngoc Chien', 'Nam', '0123528546', 'Dien Ban, Ba Dinh, Ha Noi');
INSERT INTO KHACHHANG VALUES ('KH40', 'Le Thuan Linh', 'Nam', '0458963215', 'Hang Bong, Ha Noi');

INSERT INTO KHACHHANG VALUES ('KH41', 'Nguyen Trung Nhan', 'Nam', '0569246853', 'Khoi 4, Thanh C??ng, Nghe An');
INSERT INTO KHACHHANG VALUES ('KH42', 'Do Thanh Tam', 'Nu', '0356412897', 'Khoi 4B, Nghe An');
INSERT INTO KHACHHANG VALUES ('KH43', 'Pham Tuyet Ngan', 'Nu', '0264853965', 'Nguyen Thi Minh Khai, Nghe An');
INSERT INTO KHACHHANG VALUES ('KH44', 'Do Van Huy', 'Nam', '0159468256', 'Xuan Lac, Nghi Loc, Nghe An');
INSERT INTO KHACHHANG VALUES ('KH45', 'Mai Anh Thi', 'Nu', '0945683486', 'Khoi 1, Yen Thanh, Nghe An');
INSERT INTO KHACHHANG VALUES ('KH46', 'Vu Ha My', 'Nu', '0523987428', 'Tieu Khu 2, Tuyen Hoa, Quang Hoa, Quang Binh');
INSERT INTO KHACHHANG VALUES ('KH47', 'Hoang Thai Duong', 'Nam', '0596348712', 'Quang Trach, Di Luan, Quang Binh');
INSERT INTO KHACHHANG VALUES ('KH48', 'Tong Hao Thien', 'Nam', '0846925715', 'Quang Trung,Viet Nam');
INSERT INTO KHACHHANG VALUES ('KH49', 'Le Dinh Hoang Linh', 'Nu', '0856974235', 'Bo Trach, Quang Binh');
INSERT INTO KHACHHANG VALUES ('KH50', 'Do Ngoc Nhu', 'Nu', '0582693456', 'Lien Thuy, Le Thuy, Quang Binh');

Insert into HOADON values ('HD01', To_date('11/11/2021','dd/mm/yyyy'),'KH23','NV22', 238000);
Insert into HOADON values ('HD02', To_date('12/10/2021','dd/mm/yyyy'),'KH06','NV05',498000);
Insert into HOADON values ('HD03', To_date('10/04/2021','dd/mm/yyyy'),'KH17','NV10',10494000);
Insert into HOADON values ('HD04', To_date('30/09/2021','dd/mm/yyyy'),'KH10','NV04',2000000);
Insert into HOADON values ('HD05', To_date('12/11/2021','dd/mm/yyyy'),'KH01','NV08',3141000);
Insert into HOADON values ('HD06', To_date('09/11/2021','dd/mm/yyyy'),'KH09','NV13',2331000);
Insert into HOADON values ('HD07', To_date('03/08/2021','dd/mm/yyyy'),'KH07','NV03',1900000);
Insert into HOADON values ('HD08', To_date('25/12/2021','dd/mm/yyyy'),'KH11','NV24',3960000);
Insert into HOADON values ('HD09', To_date('12/11/2021','dd/mm/yyyy'),'KH02','NV01',2190000);
Insert into HOADON values ('HD10', To_date('21/11/2021','dd/mm/yyyy'),'KH12','NV14',3992000);
Insert into HOADON values ('HD11', To_date('12/11/2021','dd/mm/yyyy'),'KH14','NV11',299000);
Insert into HOADON values ('HD12', To_date('15/09/2021','dd/mm/yyyy'),'KH18','NV19',498000);
Insert into HOADON values ('HD13', To_date('23/12/2021','dd/mm/yyyy'),'KH22','NV15',436000);
Insert into HOADON values ('HD14', To_date('12/11/2021','dd/mm/yyyy'),'KH25','NV12',537000);
Insert into HOADON values ('HD15', To_date('04/09/2021','dd/mm/yyyy'),'KH15','NV06',594000);
Insert into HOADON values ('HD16', To_date('10/08/2021','dd/mm/yyyy'),'KH05','NV23',995000);
Insert into HOADON values ('HD17', To_date('17/09/2021','dd/mm/yyyy'),'KH20','NV02',952000);
Insert into HOADON values ('HD18', To_date('28/10/2021','dd/mm/yyyy'),'KH24','NV18',1533000);
Insert into HOADON values ('HD19', To_date('20/10/2021','dd/mm/yyyy'),'KH19','NV16',468000);
Insert into HOADON values ('HD20', To_date('12/11/2021','dd/mm/yyyy'),'KH21','NV07',2691000);
Insert into HOADON values ('HD21', To_date('12/11/2021','dd/mm/yyyy'),'KH03','NV17',230000);
Insert into HOADON values ('HD22', To_date('30/12/2021','dd/mm/yyyy'),'KH04','NV20',1065000);
Insert into HOADON values ('HD23', To_date('14/09/2021','dd/mm/yyyy'),'KH13','NV21',600000);
Insert into HOADON values ('HD24', To_date('19/12/2021','dd/mm/yyyy'),'KH08','NV09',1150000);
Insert into HOADON values ('HD25', To_date('12/09/2021','dd/mm/yyyy'),'KH16','NV25',5997000);
INSERT INTO HOADON VALUES ('HD26',To_Date  ('11/10/2021', 'dd/mm/yyyy'), 'KH01','NV01', 219900);
INSERT INTO HOADON VALUES ('HD27',To_Date  ('12/11/2021', 'dd/mm/yyyy'), 'KH05','NV10', 242000);
INSERT INTO HOADON VALUES ('HD28',To_Date  ('15/12/2021', 'dd/mm/yyyy'), 'KH04','NV20', 357000);
INSERT INTO HOADON VALUES ('HD29',To_Date  ('05/10/2021', 'dd/mm/yyyy'), 'KH02','NV45', 1775000);
INSERT INTO HOADON VALUES ('HD30',To_Date  ('08/05/2021', 'dd/mm/yyyy'), 'KH11','NV35', 299000);
INSERT INTO HOADON VALUES ('HD31',To_Date  ('15/08/2021', 'dd/mm/yyyy'), 'KH15','NV12', 357000);
INSERT INTO HOADON VALUES ('HD32',To_Date  ('30/09/2021', 'dd/mm/yyyy'), 'KH17','NV29', 1775000);
INSERT INTO HOADON VALUES ('HD33',To_Date  ('15/10/2021', 'dd/mm/yyyy'), 'KH20','NV39', 284000);
INSERT INTO HOADON VALUES ('HD34',To_Date  ('18/02/2021', 'dd/mm/yyyy'), 'KH25','NV50', 259000);
INSERT INTO HOADON VALUES ('HD35',To_Date  ('22/03/2021', 'dd/mm/yyyy'), 'KH50','NV40', 900000);
INSERT INTO HOADON VALUES ('HD36',To_Date  ('24/04/2021', 'dd/mm/yyyy'), 'KH40','NV42', 2196000);
INSERT INTO HOADON VALUES ('HD37',To_Date  ('16/11/2021', 'dd/mm/yyyy'), 'KH41','NV44', 6300000);
INSERT INTO HOADON VALUES ('HD38',To_Date  ('24/11/2021', 'dd/mm/yyyy'), 'KH36','NV33', 259000);
INSERT INTO HOADON VALUES ('HD39',To_Date  ('11/12/2021', 'dd/mm/yyyy'), 'KH38','NV30', 1295000);
INSERT INTO HOADON VALUES ('HD40',To_Date  ('24/10/2021', 'dd/mm/yyyy'), 'KH30','NV28', 4676000);
INSERT INTO HOADON VALUES ('HD41',To_Date  ('20/10/2021', 'dd/mm/yyyy'), 'KH28','NV24', 1495000);
INSERT INTO HOADON VALUES ('HD42',To_Date  ('17/11/2021', 'dd/mm/yyyy'), 'KH27','NV14', 499000);
INSERT INTO HOADON VALUES ('HD43',To_Date  ('12/11/2021', 'dd/mm/yyyy'), 'KH12','NV13', 4950000);
INSERT INTO HOADON VALUES ('HD44',To_Date  ('18/12/2021', 'dd/mm/yyyy'), 'KH08','NV16', 1495000);
INSERT INTO HOADON VALUES ('HD45',To_Date  ('16/10/2021', 'dd/mm/yyyy'), 'KH07','NV05', 2093000);
INSERT INTO HOADON VALUES ('HD46',To_Date  ('15/09/2021', 'dd/mm/yyyy'), 'KH18','NV02', 199000);
INSERT INTO HOADON VALUES ('HD47',To_Date  ('18/07/2021', 'dd/mm/yyyy'), 'KH19','NV03', 595000);
INSERT INTO HOADON VALUES ('HD48',To_Date  ('12/09/2021', 'dd/mm/yyyy'), 'KH22','NV01', 249000);
INSERT INTO HOADON VALUES ('HD49',To_Date  ('10/07/2021', 'dd/mm/yyyy'), 'KH23','NV17', 179000);
INSERT INTO HOADON VALUES ('HD50',To_Date  ('09/06/2021', 'dd/mm/yyyy'), 'KH49','NV32', 598000);

Insert into CTHD values ('HD01','SP01',2);
Insert into CTHD values ('HD02','SP02',1);
Insert into CTHD values ('HD03','SP03',3);
Insert into CTHD values ('HD04','SP04',5);
Insert into CTHD values ('HD05','SP05',7);
Insert into CTHD values ('HD06','SP06',9);
Insert into CTHD values ('HD07','SP07',2);
Insert into CTHD values ('HD08','SP08',4);
Insert into CTHD values ('HD09','SP09',6);
Insert into CTHD values ('HD10','SP10',8);
Insert into CTHD values ('HD11','SP11',1);
Insert into CTHD values ('HD12','SP12',2);
Insert into CTHD values ('HD13','SP13',4);
Insert into CTHD values ('HD14','SP14',3);
Insert into CTHD values ('HD15','SP15',6);
Insert into CTHD values ('HD16','SP16',5);
Insert into CTHD values ('HD17','SP17',8);
Insert into CTHD values ('HD18','SP16',7);
Insert into CTHD values ('HD19','SP19',1);
Insert into CTHD values ('HD20','SP20',9);
Insert into CTHD values ('HD21','SP21',2);
Insert into CTHD values ('HD22','SP22',3);
Insert into CTHD values ('HD23','SP23',1);
Insert into CTHD values ('HD24','SP24',1);
Insert into CTHD values ('HD25','SP25',3);
INSERT INTO CTHD VALUES ('HD26', 'SP26', 1);
INSERT INTO CTHD VALUES ('HD27', 'SP30', 2);
INSERT INTO CTHD VALUES ('HD28', 'SP01', 3);
INSERT INTO CTHD VALUES ('HD29', 'SP22', 5);
INSERT INTO CTHD VALUES ('HD30', 'SP15', 1);
INSERT INTO CTHD VALUES ('HD31', 'SP17', 3);
INSERT INTO CTHD VALUES ('HD32', 'SP22', 5);
INSERT INTO CTHD VALUES ('HD33', 'SP27', 2);
INSERT INTO CTHD VALUES ('HD34', 'SP29', 1);
INSERT INTO CTHD VALUES ('HD35', 'SP35', 5);
INSERT INTO CTHD VALUES ('HD36', 'SP40', 4);
INSERT INTO CTHD VALUES ('HD37', 'SP42', 7);
INSERT INTO CTHD VALUES ('HD38', 'SP45', 1);
INSERT INTO CTHD VALUES ('HD39', 'SP45', 5);
INSERT INTO CTHD VALUES ('HD40', 'SP47', 4);
INSERT INTO CTHD VALUES ('HD41', 'SP15', 5);
INSERT INTO CTHD VALUES ('HD42', 'SP10', 1);
INSERT INTO CTHD VALUES ('HD43', 'SP08', 5);
INSERT INTO CTHD VALUES ('HD44', 'SP12', 6);
INSERT INTO CTHD VALUES ('HD45', 'SP11', 7);
INSERT INTO CTHD VALUES ('HD46', 'SP16', 1);
INSERT INTO CTHD VALUES ('HD47', 'SP17', 5);
INSERT INTO CTHD VALUES ('HD48', 'SP12', 1);
INSERT INTO CTHD VALUES ('HD49', 'SP14', 1);
INSERT INTO CTHD VALUES ('HD50', 'SP15', 2);




Insert into NV_SANPHAM values ('TS01', 'SP01', 'Con Hang',0);
Insert into NV_SANPHAM values ('TS01', 'SP02', 'Con Hang',5);
Insert into NV_SANPHAM values ('TS01', 'SP03', 'Con Hang',10);
Insert into NV_SANPHAM values ('TS01', 'SP04', 'Con Hang',15);
Insert into NV_SANPHAM values ('TS01', 'SP05', 'Con Hang',20);
Insert into NV_SANPHAM values ('TS01', 'SP06', 'Con Hang',25);
Insert into NV_SANPHAM values ('TS01', 'SP07', 'Con Hang',30);
Insert into NV_SANPHAM values ('TS01', 'SP08', 'Con Hang',35);
Insert into NV_SANPHAM values ('TS01', 'SP09', 'Con Hang',40);
Insert into NV_SANPHAM values ('TS01', 'SP10', 'Con Hang',45);
Insert into NV_SANPHAM values ('TS01', 'SP11', 'Con Hang',50);

Insert into NV_SANPHAM values ('TS01', 'SP12', 'Con Hang',0);
Insert into NV_SANPHAM values ('TS01', 'SP13', 'Con Hang',5);
Insert into NV_SANPHAM values ('TS01', 'SP14', 'Con Hang',10);
Insert into NV_SANPHAM values ('TS01', 'SP15', 'Con Hang',15);
Insert into NV_SANPHAM values ('TS01', 'SP16', 'Con Hang',20);
Insert into NV_SANPHAM values ('TS01', 'SP17', 'Con Hang',25);
Insert into NV_SANPHAM values ('TS01', 'SP18', 'Con Hang',30);
Insert into NV_SANPHAM values ('TS01', 'SP19', 'Con Hang',35);
Insert into NV_SANPHAM values ('TS01', 'SP20', 'Con Hang',40);
Insert into NV_SANPHAM values ('TS01', 'SP21', 'Con Hang',45);
Insert into NV_SANPHAM values ('TS01', 'SP22', 'Con Hang',50);

Insert into NV_SANPHAM values ('TS01', 'SP23', 'Con Hang',0);
Insert into NV_SANPHAM values ('TS01', 'SP24', 'Con Hang',5);
Insert into NV_SANPHAM values ('TS01', 'SP25', 'Con Hang',10);
Insert into NV_SANPHAM values ('TS02', 'SP26', 'Con Hang',15);
Insert into NV_SANPHAM values ('TS02', 'SP27', 'Con Hang',20);
Insert into NV_SANPHAM values ('TS02', 'SP28', 'Con Hang',25);
Insert into NV_SANPHAM values ('TS02', 'SP29', 'Con Hang',30);
Insert into NV_SANPHAM values ('TS02', 'SP30', 'Con Hang',35);
Insert into NV_SANPHAM values ('TS02', 'SP31', 'Con Hang',40);
Insert into NV_SANPHAM values ('TS02', 'SP32', 'Con Hang',45);
Insert into NV_SANPHAM values ('TS02', 'SP33', 'Con Hang',50);

Insert into NV_SANPHAM values ('TS02', 'SP34', 'Con Hang',0);
Insert into NV_SANPHAM values ('TS02', 'SP35', 'Con Hang',5);
Insert into NV_SANPHAM values ('TS02', 'SP36', 'Con Hang',10);
Insert into NV_SANPHAM values ('TS02', 'SP37', 'Con Hang',15);
Insert into NV_SANPHAM values ('TS02', 'SP38', 'Con Hang',0);
Insert into NV_SANPHAM values ('TS02', 'SP39', 'Con Hang',5);
Insert into NV_SANPHAM values ('TS02', 'SP40', 'Con Hang',10);
Insert into NV_SANPHAM values ('TS02', 'SP41', 'Con Hang',15);
Insert into NV_SANPHAM values ('TS02', 'SP42', 'Con Hang',20);

Insert into NV_SANPHAM values ('TS02', 'SP43', 'Con Hang',25);
Insert into NV_SANPHAM values ('TS02', 'SP44', 'Con Hang',30);
Insert into NV_SANPHAM values ('TS02', 'SP45', 'Con Hang',40);
Insert into NV_SANPHAM values ('TS02', 'SP46', 'Con Hang',45);
Insert into NV_SANPHAM values ('TS02', 'SP47', 'Con Hang',50);
Insert into NV_SANPHAM values ('TS02', 'SP48', 'Con Hang',35);
Insert into NV_SANPHAM values ('TS02', 'SP49', 'Con Hang',0);
Insert into NV_SANPHAM values ('TS02', 'SP50', 'Con Hang',20);


Insert into QL_SANPHAM values ('TS01', 'SP01', 310, To_Date  ('20/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP02', 167, To_Date  ('11/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP03', 288, To_Date  ('24/01/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP04', 113, To_Date  ('20/09/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP05', 442, To_Date  ('30/10/2020', 'dd/mm/yyyy'));

Insert into QL_SANPHAM values ('TS01', 'SP06', 332, To_Date  ('11/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP07', 134, To_Date  ('20/02/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP08', 432, To_Date  ('20/12/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP09', 123, To_Date  ('20/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP10', 124, To_Date  ('19/11/2020', 'dd/mm/yyyy'));

Insert into QL_SANPHAM values ('TS01', 'SP11', 231, To_Date  ('13/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP12', 241, To_Date  ('23/04/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP13', 241, To_Date  ('12/11/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP14', 331, To_Date  ('09/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP15', 139, To_Date  ('04/05/2020', 'dd/mm/yyyy'));

Insert into QL_SANPHAM values ('TS01', 'SP16', 433, To_Date  ('27/07/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP17', 143, To_Date  ('31/01/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP18', 423, To_Date  ('21/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP19', 149, To_Date  ('11/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP20', 436, To_Date  ('03/10/2020', 'dd/mm/yyyy'));

Insert into QL_SANPHAM values ('TS01', 'SP21', 499, To_Date  ('07/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP22', 322, To_Date  ('29/12/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP23', 411, To_Date  ('04/04/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP24', 201, To_Date  ('20/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS01', 'SP25', 321, To_Date  ('17/07/2020', 'dd/mm/yyyy'));

Insert into QL_SANPHAM values ('TS02', 'SP26', 122, To_Date  ('10/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP27', 321, To_Date  ('22/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP28', 421, To_Date  ('10/12/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP29', 221, To_Date  ('13/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP30', 243, To_Date  ('25/08/2020', 'dd/mm/yyyy'));

Insert into QL_SANPHAM values ('TS02', 'SP31', 113, To_Date  ('31/03/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP32', 321, To_Date  ('20/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP33', 342, To_Date  ('15/07/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP34', 168, To_Date  ('20/09/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP35', 453, To_Date  ('20/05/2020', 'dd/mm/yyyy'));

Insert into QL_SANPHAM values ('TS02', 'SP36', 327, To_Date  ('19/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP37', 113, To_Date  ('02/12/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP38', 431, To_Date  ('11/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP39', 242, To_Date  ('05/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP40', 144, To_Date  ('20/10/2020', 'dd/mm/yyyy'));

Insert into QL_SANPHAM values ('TS02', 'SP41', 210, To_Date  ('21/07/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP42', 221, To_Date  ('11/05/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP43', 300, To_Date  ('21/10/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP44', 132, To_Date  ('19/05/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP45', 200, To_Date  ('23/11/2020', 'dd/mm/yyyy'));

Insert into QL_SANPHAM values ('TS02', 'SP46', 100, To_Date  ('11/11/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP47', 201, To_Date  ('20/11/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP48', 301, To_Date  ('01/09/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP49', 191, To_Date  ('22/06/2020', 'dd/mm/yyyy'));
Insert into QL_SANPHAM values ('TS02', 'SP50', 231, To_Date  ('20/10/2020', 'dd/mm/yyyy'));

