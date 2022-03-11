create database QLHocSinh
go

use QLHocSinh
go

create table TrinhDo(
	MaTD char(5) primary key,
	TenTD nvarchar(20)
)
go 
insert into TrinhDo values('TD001','Thac Si')
insert into TrinhDo values('TD002','Cu Nhan')
insert into TrinhDo values('TD003','Tien Si')
insert into TrinhDo values('TD004','Ki Su')
insert into TrinhDo values('TD005','Giao Su')
insert into TrinhDo values('TD006','Pho Giao Su')
go 
-----------------------------------------------------

create table NienKhoa(
	MaNK char(5) primary key,
	TenNienKhoa char (20) 
)
go
insert into NienKhoa values('NK001','2017-2020')
insert into NienKhoa values('NK002','2018-2021')
insert into NienKhoa values('NK003','2019-2022')
insert into NienKhoa values('NK004','2020-2023')
insert into NienKhoa values('NK005','2021-2024')
insert into NienKhoa values('NK006','2022-2025')
go
-------------------------------------------------

create table NguoiDung(
	Id char (5) primary key ,
	LoaiTaiKhoan char(5),
	TaiKhoan char (20),
	MatKhau char (20)
)
insert into NguoiDung values('ND01','giaovien','gv001','1234')
insert into NguoiDung values('ND02','hocsinh','hs001','125')
insert into NguoiDung values('ND03','giaovu','gv002','225')

------------------------------------------------
create table Khoi(
	MaKhoi char(6) primary key ,
	TenKhoi nvarchar(40)
)
go
insert into Khoi values('Khoi10',N'Khối 10')
insert into Khoi values('Khoi11',N'Khối 11')
insert into Khoi values('Khoi12',N'Khối 12')
go 
-----------------------------------------------------

create table MonHoc(
	MaMH char(5)  primary key,
	TenMH nvarchar(40) ,
	SoTiet int 
)
go
insert into MonHoc values('MH001','Toan Hoc',50)
insert into MonHoc values('MH002','Vat Ly',45)
insert into MonHoc values('MH003','Tieng Anh',30)
insert into MonHoc values('MH004','Hoa Hoc',55)
insert into MonHoc values('MH005','Ngu Van',45)
insert into MonHoc values('MH006','Sinh Hoc',50)
insert into MonHoc values('MH007','Lich Su',45)
insert into MonHoc values('MH008','Dia Ly',30)
insert into MonHoc values('MH009','Dao Duc',55)
insert into MonHoc values('MH010','The Duc',45)
go 
--------------------------------------------------

create table HocKy(
	MaHKy char(6) primary key,
	TenHKy nvarchar(40) 
)
go
insert into HocKy values('HocKy1',N'Học Kỳ 1')
insert into HocKy values('HocKy2',N'Học Kỳ 2')
go 
------------------------------------------------------

create table CanBoGiaoVien(
	MaCanBoGV char(10) not null primary key,
	HoTenGV nvarchar(30) ,
	DiaChi nvarchar(100) ,
	SoDienThoai char(13) ,
	TaiKhoan char(30),
	MatKhau char(30) ,
	LoaiTaiKhoan char(10) ,
	MaTD char(5),

	constraint FK_GV_TD foreign key(MaTD) 	references TrinhDo(MaTD) ON DELETE SET NULL
)
go 
insert into CanBoGiaoVien values('CBGV001','Bui Tat Sinh','Ha Noi','0987654345','admin','1234','admin','TD005')
insert into CanBoGiaoVien values('CBGV002','Ngo Nam Trung','Hai Duong','0987651234','ngonamtrung','nnt','admin','TD004')
insert into CanBoGiaoVien values('CBGV003','Vu Thi Minh','TP HCM','0987657634','giaovien','1234','giaovien','TD003')
insert into CanBoGiaoVien values('CBGV004','Nguyen Van Nam','Hai Phong','0987612345','nguyenvannam','nvn','giaovien','TD002')
insert into CanBoGiaoVien values('CBGV005','Pham Quynh Anh','Hoa Binh','0981234341','phamquynhanh','pqa','giaovien','TD001')
insert into CanBoGiaoVien values('CBGV006','Ngo Nam Phong','Hung Yen','0987651289','ngonamphong','nnp','giaovien','TD006')
insert into CanBoGiaoVien values('CBGV007','Phan Thi My','Gia Lai','0987655467','phanthimy','ptm','giaovien','TD002')
insert into CanBoGiaoVien values('CBGV008','Trinh Van Bac','Ninh Binh','0987617654','trinhvanbac','tvb','giaovien','TD001')
insert into CanBoGiaoVien values('CBGV009','Chu Thuy Nga','Nam DInh','0981231234','chuthuynga','ctn','giaovien','TD006')
go 
--------------------------------------------------------

create table Lop(
	MaLop char(6) primary key ,
	TenLop nvarchar(25),
	MaKhoi char(6),
	MaNK char(5),
	SiSo int ,
	MaCanBoGV char(10), 

	constraint FK_Lop_Khoi foreign key(MaKhoi)	references Khoi(MaKhoi) ON DELETE SET NULL,
	constraint FK_Lop_GV foreign key(MaCanBoGV)	references CanBoGiaoVien(MaCanBoGV) ON DELETE SET NULL,
	constraint FK_Lop_NK foreign key(MaNK)	references NienKhoa(MaNK) ON DELETE SET NULL 
)
go
insert into Lop values('ML101','10A1','Khoi10','NK003',40,'CBGV001')
insert into Lop values('ML102','10A2','Khoi10','NK003',40,'CBGV002')
insert into Lop values('ML103','10A3','Khoi10','NK003',40,'CBGV003')
insert into Lop values('ML104','10A4','Khoi10','NK003',40,'CBGV004')

insert into Lop values('ML111','11A1','Khoi11','NK002',35,'CBGV005')
insert into Lop values('ML112','11A2','Khoi11','NK002',40,'CBGV006')
insert into Lop values('ML113','11A3','Khoi11','NK002',40,'CBGV007')

insert into Lop values('ML121','12A1','Khoi12','NK001',40,'CBGV008')
insert into Lop values('ML122','12A2','Khoi12','NK001',40,'CBGV009')
go 
------------------------------------------------------------------

create table HoSoHocSinh(
	MaHS char(10) not null primary key,
	HoTenHS nvarchar(30),
	NgaySinh char(12),
	GioiTinh nvarchar(3), 
	DiaChi nvarchar(100), 
	Email nvarchar(25) ,
	MaLop char(6) , 

	constraint FK_HS_Lop foreign key(MaLop)	references Lop(MaLop) ON DELETE SET NULL
)
go
insert into HoSoHocSinh values('HS001','Dang Ngoc Thao','11/20/1999','Nu','Long Bien','thao1@gmail.com','ML101')
insert into HoSoHocSinh values('HS002','Bui Thi Ly','12/06/1998','Nu','Soc Son','ly1@gmail.com','ML101')
insert into HoSoHocSinh values('HS003','Vu Huong Ly','09/01/1997','Nu','Hoai Duc','ly2@gmail.com','ML101')
insert into HoSoHocSinh values('HS004','Pham Hai Yen','02/07/2001','Nu','Cau Giay','yen2@gmail.com','ML101')
insert into HoSoHocSinh values('HS005','Phan Nhat Minh','05/20/2002','Nam','Dong Anh','minh4@gmail.com','ML101')
insert into HoSoHocSinh values('HS006','Vu Khai','11/20/1999','Nam','Long Bien','khai5@gmail.com','ML111')
insert into HoSoHocSinh values('HS007','Bui Van Ly','12/06/1998','Nam','Soc Son','ly6@gmail.com','ML111')
insert into HoSoHocSinh values('HS008','Vu Thi Huong Ly','09/01/1997','Nu','Hoai Duc','ly8@gmail.com','ML111')
insert into HoSoHocSinh values('HS009','Pham Hai Yen','02/07/2001','Nu','Cau Giay','yen9@gmail.com','ML111')
insert into HoSoHocSinh values('HS010','Pham Thi Yen','02/07/2001','Nu','Cau Giay','yen89@gmail.com','ML122')
insert into HoSoHocSinh values('HS011','Vu Tuan Minh','11/20/1999','Nam','Long Bien','minh5@gmail.com','ML121')
insert into HoSoHocSinh values('HS012','Bui Thi Ly','12/06/1998','Nu','Soc Son','ly8@gmail.com','ML121')
insert into HoSoHocSinh values('HS013','Vu Huong Ly','09/01/1997','Nu','Hoai Duc','ly87@gmail.com','ML121')
insert into HoSoHocSinh values('HS014','Pham Yen','02/07/2001','Nu','Cau Giay','yen7@gmail.com','ML121')
insert into HoSoHocSinh values('HS015','Phan Minh','05/20/2002','Nam','Dong Anh','minh78@gmail.com','ML122')
insert into HoSoHocSinh values('HS016','Vu Tuan Khai','11/20/1999','Nam','Long Bien','khai89@gmail.com','ML122')
insert into HoSoHocSinh values('HS017','Bui Van Ly','12/06/1998','Nam','Soc Son','ly78@gmail.com','ML112')
insert into HoSoHocSinh values('HS018','Vu Thi  Ly','09/01/1997','Nu','Hoai Duc','ly45@gmail.com','ML112')
insert into HoSoHocSinh values('HS019','Pham Yen','02/07/2001','Nu','Cau Giay','yen45@gmail.com','ML112')
insert into HoSoHocSinh values('HS020','Pham Huong Yen','02/07/2001','Nu','Cau Giay','yen86@gmail.com','ML112')
go 
------------------------------------------------------------------

create table DiemMon(
	MaHS char(10) not null,
	MaMH char(6),
	MaHKy char(6),
	Diem15p char,
	Diem1tiet char,
	DiemTBMon char,
	DatMon nvarchar(10),

	constraint PK_Diem primary key(MaHS,MaMH,MaHKy),

	constraint FK_Diem_HS foreign key(MaHS)	references HoSoHocSinh(MaHS) ON DELETE CASCADE,
	constraint FK_Diem_HK foreign key(MaHKy)	references HocKy(MaHKy)
)
go
insert into DiemMon values('HS001','MH001','HocKy1',8,9,7,'Dat')
insert into DiemMon values('HS001','MH001','HocKy2',8,9,7,'Dat')
insert into DiemMon values('HS001','MH002','HocKy1',8,9,7,'Dat')
insert into DiemMon values('HS002','MH001','HocKy2','7','5','4','KhongDat')
insert into DiemMon values('HS002','MH002','HocKy2','7','5','4','KhongDat')
insert into DiemMon values('HS002','MH003','HocKy2','7','5','4','KhongDat')
insert into DiemMon values('HS002','MH001','HocKy1','7','5','4','KhongDat')

------------------------------------------------------------------------------------

create table PhanCongGiangDay(
	MaLop char(6),
	MaMH char(5),
	MaCanBoGV char(10),
	NgayPhanCong char(12),

	constraint PK_PhanCong primary key(MaLop,MaMH,MaCanBoGV),

	constraint FK_PhanCong_Lop foreign key(MaLop)	references Lop(MaLop) ON DELETE CASCADE,
	constraint FK_PhanCong_Mon foreign key(MaMH)	references MonHoc(MaMH),
	constraint FK_PhanCong_GV foreign key(MaCanBoGV)	references CanBoGiaoVien(MaCanBoGV)
)
go
insert into PhanCongGiangDay values('ML101','MH001','CBGV004','09/02/2019')
insert into PhanCongGiangDay values('ML102','MH005','CBGV001','01/01/2011')
insert into PhanCongGiangDay values('ML103','MH002','CBGV005','02/07/2012')
insert into PhanCongGiangDay values('ML104','MH003','CBGV002','04/05/2012')
insert into PhanCongGiangDay values('ML111','MH004','CBGV003','07/05/2017')
insert into PhanCongGiangDay values('ML112','MH004','CBGV005','01/09/2011')
insert into PhanCongGiangDay values('ML113','MH003','CBGV001','02/02/2012')
insert into PhanCongGiangDay values('ML121','MH001','CBGV003','04/05/2012')
insert into PhanCongGiangDay values('ML121','MH002','CBGV002','07/06/2017')
insert into PhanCongGiangDay values('ML122','MH003','CBGV006','01/09/2011')
insert into PhanCongGiangDay values('ML101','MH002','CBGV007','02/02/2012')
insert into PhanCongGiangDay values('ML102','MH001','CBGV008','04/05/2012')
insert into PhanCongGiangDay values('ML103','MH001','CBGV009','07/06/2017')
go
-------------------------------------------------------------------------------------

create table ThamSo(
	TuoiToiDa int,
	TuoiToiThieu int,
	SiSoToiDa int,
	SiSoToiThieu int,
	DiemDatMon int

)
go 
insert into ThamSo values('15','20','40','10','5')
select * from ThamSo