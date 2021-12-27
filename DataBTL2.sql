[INSERT DATA]
FOR monhoc IN [
  {MAMH: "MH1", TENMON: "Nhap Mon Lap Trinh"},
  {MAMH: "MH2", TENMON: "Lap Trinh Huong Doi Tuong"},
  {MAMH: "MH3", TENMON: "Co So Du Lieu"},
  {MAMH: "MH4", TENMON: "Thuong Mai Dien Tu"},
  {MAMH: "MH5", TENMON: "Thiet Ke Giao Dien Nguoi Dung"},
  {MAMH: "MH6", TENMON: "Mang Xa Hoi"},
  {MAMH: "MH7", TENMON: "Dien Toan Dam May"},
  {MAMH: "MH8", TENMON: "Giai Tich"},
  {MAMH: "MH9", TENMON: "Xac Suat Thong Ke"},
  {MAMH: "MH10", TENMON: "Lap Trinh Java"},
] INSERT monhoc INTO MONHOC 

FOR ketquahoctap IN [
  {MAMH: "MH1", SINHVIEN_ID: 19522315, DTB: 8},
  {MAMH: "MH2", SINHVIEN_ID: 19522313, DTB: 7},
  {MAMH: "MH3", SINHVIEN_ID: 19522311, DTB: 6},
  {MAMH: "MH4", SINHVIEN_ID: 19522309, DTB: 8.5},
  {MAMH: "MH5", SINHVIEN_ID: 19522307, DTB: 9.2},
  {MAMH: "MH6", SINHVIEN_ID: 19522305, DTB: 7.5},
  {MAMH: "MH7", SINHVIEN_ID: 19522303, DTB: 6.6},
  {MAMH: "MH8", SINHVIEN_ID: 19522301, DTB: 7.5},
  {MAMH: "MH9", SINHVIEN_ID: 19522304, DTB: 8.5},
  {MAMH: "MH10"", SINHVIEN_ID: 19522306, DTB: 9},
]INSERT ketquahoctap INTO KETQUAHOCTAP 
FOR giangvien IN[
  {GVIEN_ID: "GV100",HO: "Nguyen",TEN: "Minh Hanh",DIACHI: "Quan 9, Ho Chi Minh",SDT: "0384153200",LUONG: 15000000,MAMH: "MH2", GIOITINH: "Nu" },
  {GVIEN_ID: "GV101",HO: "Tran",TEN: "Ngoc Tra",DIACHI: "Quan 1, Ho Chi Minh",SDT: "0384159630",LUONG: 17000000,MAMH: "MH4", GIOITINH: "Nu" },
  {GVIEN_ID: "GV102",HO: "Le",TEN: "Tuan Manh",DIACHI: "Quan Thu Duc, Ho Chi Minh",SDT: "0384199869",LUONG: 15000000,MAMH: "MH6", GIOITINH: "Nam" },
  {GVIEN_ID: "GV103",HO: "Tran",TEN: "Thi Xuan",DIACHI: "Quan 9, Ho Chi Minh",SDT: "0384154253",LUONG: 16000000,MAMH: "MH8", GIOITINH: "Nu" },
  {GVIEN_ID: "GV104",HO: "Nguyen",TEN: "My Yen",DIACHI: "Quan 1, Ho Chi Minh",SDT: "0384198640",LUONG: 12000000,MAMH: "MH10", GIOITINH: "Nu" },
  {GVIEN_ID: "GV105",HO: "Le",TEN: "Khanh Binh",DIACHI: "Quan 7, Ho Chi Minh",SDT: "0384158450",LUONG: 15000000,MAMH: "MH1", GIOITINH: "Nam" },
  {GVIEN_ID: "GV106",HO: "Tran",TEN: "Yen Nhi",DIACHI: "Quan 9, Ho Chi Minh",SDT: "0384153244",LUONG: 14000000,MAMH: "MH3", GIOITINH: "Nu" },
  {GVIEN_ID: "GV107",HO: "Le",TEN: "Huong Son",DIACHI: "Quan Thu Duc, Ho Chi Minh",SDT: "0384153200",LUONG: 15000000,MAMH: "MH5", GIOITINH: "Nam" },
  {GVIEN_ID: "GV108",HO: "Nguyen",TEN: "Huong Ngan",DIACHI: "Quan Thu Duc, Ho Chi Minh",SDT: "0384153520",LUONG: 18000000,MAMH: "MH7", GIOITINH: "Nu" },
  {GVIEN_ID: "GV109",HO: "Tran",TEN: "Thinh Phat",DIACHI: "Quan Thu Duc, Ho Chi Minh",SDT: "038415456",LUONG: 15000000,MAMH: "MH9", GIOITINH: "Nam" },
  {GVIEN_ID: "GV110",HO: "Le",TEN: "Minh Huy",DIACHI: "Quan 3, Ho Chi Minh",SDT: "0384153353",LUONG: 20000000,MAMH: "MH3", GIOITINH: "Nam" },
  {GVIEN_ID: "GV111",HO: "Nguyen",TEN: "My Van",DIACHI: "Quan Thu Duc, Ho Chi Minh",SDT: "038415455",LUONG: 15000000,MAMH: "MH5", GIOITINH: "Nu" },
  {GVIEN_ID: "GV112",HO: "Tran",TEN: "Ngoc Han",DIACHI: "Quan 1, Ho Chi Minh",SDT: "0384155885",LUONG: 15000000,MAMH: "MH7" , GIOITINH: "Nu"},
  {GVIEN_ID: "GV113",HO: "Nguyen",TEN: "Thu Thuy",DIACHI: "Quan 1, Ho Chi Minh",SDT: "0384153474",LUONG: 16000000,MAMH: "MH2", GIOITINH: "Nu" },
  {GVIEN_ID: "GV114",HO: "Phan",TEN: "Gia Huy",DIACHI: "Quan 1, Ho Chi Minh",SDT:"0384153455",LUONG: 17000000,MAMH: "MH4", GIOITINH: "Nam" },
  {GVIEN_ID: "GV115",HO: "Le",TEN: "Anh Kiet",DIACHI: "Binh Duong",SDT: "0384153455",LUONG: 11000000,MAMH: "MH6", GIOITINH: "Nu" }
] INSERT giangvien INTO GIANGVIEN 



FOR sinhvien IN [
  {SINHVIEN_ID: 19522300,HO: "Nguyen",TEN: "Minh Thao",DIACHI: "Quan 10, Ho Chi Minh",SDT: "0384555200",GIOITINH: "Nu" },
  {SINHVIEN_ID: 19522301,HO: "Phan",TEN: "Huong Tra",DIACHI: "Quan 3, Ho Chi Minh",SDT: "0384145630", GIOITINH: "Nu" },
  {SINHVIEN_ID: 19522302,HO: "Le",TEN: "Tuan Huy",DIACHI: "Quan 9, Ho Chi Minh",SDT: "0384185699",GIOITINH: "Nam" },
  {SINHVIEN_ID: 19522303,HO: "Tran",TEN: "Thi Xuan",DIACHI: "Quan 5, Ho Chi Minh",SDT: "0384141253",GIOITINH: "Nu" },
  {SINHVIEN_ID: 19522304,HO: "Nguyen",TEN: "My Yen",DIACHI: "Quan 1, Ho Chi Minh",SDT:"0384174120", GIOITINH: "Nu" },
  {SINHVIEN_ID: 19522305,HO: "Phan",TEN: "Khanh Binh",DIACHI: "Quan 7, Ho Chi Minh",SDT: "0388523450",GIOITINH: "Nam" },
  {SINHVIEN_ID: 19522306,HO: "Tran",TEN: "Yen Nhi",DIACHI: "Quan 9, Ho Chi Minh",SDT: "0384153896", GIOITINH: "Nu" },
  {SINHVIEN_ID: 19522307,HO: "Le",TEN: "Huong Manh",DIACHI: "Quan Thu Duc, Ho Chi Minh",SDT: "0384153200", GIOITINH: "Nam" },
  {SINHVIEN_ID: 19522308,HO: "Nguyen",TEN: "Thao Ngan",DIACHI: "Quan 7, Ho Chi Minh",SDT: "0384745200",GIOITINH: "Nu" },
  {SINHVIEN_ID: 19522309,HO: "Tran",TEN: "Thinh Phat",DIACHI: "Quan 3, Ho Chi Minh",SDT: "038856956",GIOITINH: "Nam" },
  {SINHVIEN_ID: 19522310,HO: "Le",TEN: "Minh Manh",DIACHI: "Quan 3, Ho Chi Minh",SDT: "03841785473",GIOITINH: "Nam" },
  {SINHVIEN_ID: 19522311,HO: "Nguyen",TEN: "My Hoa",DIACHI: "Quan Thu Duc, Ho Chi Minh",SDT: "038698555",GIOITINH: "Nu" },
  {SINHVIEN_ID: 19522312,HO: "Tran",TEN: "Ngoc Han",DIACHI: "Quan 1, Ho Chi Minh",SDT: "0384152589",GIOITINH: "Nu"},
  {SINHVIEN_ID: 19522313,HO: "Nguyen",TEN: "Thu Thuy",DIACHI: "Quan Thu Duc, Ho Chi Minh",SDT: "0384152584", GIOITINH: "Nu" },
  {SINHVIEN_ID: 19522314,HO: "Le",TEN: "Gia Khanh",DIACHI: "Quan 1, Ho Chi Minh",SDT: "0384153585", GIOITINH: "Nam" },
  {SINHVIEN_ID: 19522315,HO: "Phan",TEN: "Cao Kiet",DIACHI: "Quan Thu Duc. Ho Chi Minh",SDT: "0384856355", GIOITINH: "Nu" }
]INSERT sinhvien INTO SINHVIEN



--- insert Edge
FOR doc IN [
   {_from: "SINHVIEN/15222", _to: "MONHOC/15201", type: "DangKyHocPhan"},
   {_from: "SINHVIEN/15223", _to: "MONHOC/15202", type: "DangKyHocPhan"},
   {_from: "SINHVIEN/15224", _to: "MONHOC/15203", type: "DangKyHocPhan"},
   {_from: "SINHVIEN/15225", _to: "MONHOC/15204", type: "DangKyHocPhan"},
   {_from: "SINHVIEN/15226", _to: "MONHOC/15205", type: "DangKyHocPhan"},
   {_from: "SINHVIEN/15227", _to: "MONHOC/15206", type: "DangKyHocPhan"},
   {_from: "SINHVIEN/15228", _to: "MONHOC/15207", type: "DangKyHocPhan"},
   {_from: "SINHVIEN/15229", _to: "MONHOC/15208", type: "DangKyHocPhan"},
   {_from: "SINHVIEN/15230", _to: "MONHOC/15209", type: "DangKyHocPhan"},
   {_from: "SINHVIEN/15231", _to: "MONHOC/15210", type: "DangKyHocPhan"}
] INSERT doc INTO DKHP

-----demo tao do thi
LET arrlist = [
{
	"sanpham": {"TenSP":"Tai Nghe F9  Dock", "LoaiSP": "Tai nghe Khong day", "GiaBan": "119000", "MaNCC": "CT01"},
	"nhacungcap": {"MaNCC":"CT01", "TenNCC": "Cong ty thiet bi dien tu Hoang Phong"}
},

{
	"sanpham": {"TenSP":"Tai Nghe Earbuds SOUNDPEATS", "LoaiSP": "Tai nghe Khong day", "GiaBan": "498000", "MaNCC": "CT02"},
	"nhacungcap": {"MaNCC":"CT02", "TenNCC": "Cong ty SX va TM Binh An"}
},

{
	"sanpham": {"TenSP":"Tai Nghe JBL C150SI", "LoaiSP": "Tai nghe Co day", "GiaBan": "219900", "MaNCC": "CT03"},
	"nhacungcap": {"MaNCC":"CT03", "TenNCC": "Cong ty thiet bi dien tu Khang Thinh"}
},

{
	"sanpham": {"TenSP":"Loa Bluetooth Uslion Mini", "LoaiSP": "Loa Nghe Nhac", "GiaBan": "355000", "MaNCC": "CT01"},
	"nhacungcap": {"MaNCC":"CT01", "TenNCC": "Cong ty thiet bi dien tu Hoang Phong"}
},

{
	"sanpham": {"TenSP":"Loa Bluetooth ROBOT RB150", "LoaiSP": "Loa Nghe Nhac", "GiaBan": "149000", "MaNCC": "CT03"},
	"nhacungcap": {"MaNCC":"CT03", "TenNCC": "Cong ty thiet bi dien tu Khang Thinh"}
}
]

FOR index in arrlist
    LET spMaNCC = FIRST(
        FOR sp IN SanPham
            FILTER index.sanpham.MaNCC == sp.MaNCC
		FILTER index.sanpham.TenSP == sp.TenSP
            LIMIT 1
            RETURN sp._id
    )
    LET nccMaNCC = FIRST(
        FOR ncc IN NhaCungCap
            FILTER index.nhacungcap.MaNCC == ncc.MaNCC
            LIMIT 1
            RETURN ncc._id
    )
    FILTER spMaNCC != null AND nccMaNCC != null
    INSERT { _from: spMaNCC, _to: nccMaNCC } INTO SanPhamOF
    RETURN NEW
