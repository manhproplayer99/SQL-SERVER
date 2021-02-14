﻿Select * From SanPham
Select * From HangSX
Select * From NhanVien
Select * From PNhap
Select * From Nhap
Select * From PXuat
Select * From Xuat
----------------------------
select masp,tensp,tenhang,soluong,mausac,giaban,donvitinh,mota
from sanpham inner join hangsx on sanpham.mahangsx=hangsx.mahangsx
order by giaban desc
----------------------------
select masp,tensp,soluong,mausac,giaban,donvitinh,mota
from sanpham inner join hangsx on sanpham.mahangsx=hangsx.mahangsx
where tenhang = 'Samsung'
-------------------------------
Select * From NhanVien
Where gioitinh = N'Nữ' And phong = N'Kế toán'
-------------------------------
select nhap.sohdn,sanpham.masp,tensp,tenhang,soluongN,dongiaN,soluongN*dongiaN as N'Tien nhap',mausac,donvitinh,ngaynhap,tennv,phong
from nhap inner join pnhap on nhap.sohdn=pnhap.sohdn 
	inner join sanpham on sanpham.masp=nhap.masp
	inner join nhanvien on pnhap.manv=nhanvien.manv
	inner join hangsx on sanpham.mahangsx=hangsx.mahangsx
order by sohdn asc
--------------------------------
select xuat.sohdx, sanpham.masp, tensp, tenhang, soluongX, GiaBan,
soluongX*giaban As N'Tiền xuất', mausac, donvitinh, ngayx, tennv, phong
from xuat Inner join sanpham on xuat.masp=sanpham.masp
 Inner join pxuat on xuat.sohdx=pxuat.sohdx
 Inner join nhanvien on pxuat.manv = nhanvien.manv
 Inner join hangsx on sanpham.mahangsx=hangsx.mahangsx
where Month(ngayx)=06 And Year(ngayx)=2020
order by sohdx ASC 
--------------------------------
select nhap.sohdn ,sanpham.masp,tensp,soluongN,dongiaN,ngaynhap,tennv,phong
from nhap inner join sanpham on sanpham.masp=nhap.masp
		inner join pnhap on nhap.sohdn=pnhap.sohdn
		inner join nhanvien on nhanvien.manv=pnhap.manv
		inner join hangsx on sanpham.mahangsx=hangsx.mahangsx
where year(ngaynhap) =2020 and tenhang ='SamSung'
----------------------------------
select top 10 xuat.sohdx,ngayx,soluongX
from xuat inner join pxuat on xuat.sohdx=pxuat.sohdx
where year(ngayx) =2020
order by soluongX desc
---------------------------------
Select top 10 masp, tensp,giaban
From sanpham
Order by giaban DESC
---------------------------------
Select masp, tensp, soluong, mausac, giaban, donvitinh, mota
From sanpham Inner join hangsx on sanpham.mahangsx = hangsx.mahangsx
Where tenhang = 'SamSung' And giaban Between 100000 And 50000000
-------------------------------------
select sum(soluongN*dongiaN) as N'Tổng tiền nhập'
from nhap inner join sanpham on nhap.masp=sanpham.masp
		inner join hangsx on sanpham.mahangsx=hangsx.mahangsx
		inner join pnhap on nhap.sohdn=pnhap.sohdn
where tenhang = 'SamSung' and year(ngaynhap) = 2020
--------------------------------------
Select Sum(soluongX*giaban) As N'Tổng tiền xuất'
From xuat Inner join sanpham on xuat.masp = sanpham.masp
 Inner join pxuat on xuat.sohdx=pxuat.sohdx
Where ngayx = '06/14/2020'