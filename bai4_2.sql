select hangsx.mahangsx,tenhang,count(masp) as N'số sản phẩm'
from sanpham inner join hangsx on sanpham.mahangsx=hangsx.mahangsx
group by hangsx.mahangsx,tenhang
-------------------------------
select sanpham.masp,tensp,sum(soluongN*dongiaN) as N'tổng tiền nhập'
from nhap inner join pnhap on nhap.sohdn=pnhap.sohdn
			inner join sanpham on nhap.masp=sanpham.masp
where year(ngaynhap) = 2020
group by sanpham.masp,tensp
---------------------------------
select sanpham.masp,tensp,sum(soluongX) as N'Số lượng xuất'
from xuat inner join pxuat on xuat.sohdx=pxuat.sohdx
		inner join sanpham on xuat.masp=sanpham.masp
		inner join hangsx on sanpham.mahangsx=hangsx.mahangsx
where tenhang = 'SamSung' and year(ngayx) = 2020
group by sanpham.masp,tensp
having sum(soluongX) >= 10000
-------------------------------------
select phong,count(*) as N'số nhân vien nam'
from nhanvien
where gioitinh = 'nam'
group by phong
-------------------------------------
select tenhang,sum(soluongN) as N'tổng số lượng nhập'
from nhap inner join pnhap on nhap.sohdn=pnhap.sohdn
		inner join sanpham on nhap.masp=sanpham.masp
		inner join hangsx on sanpham.mahangsx=hangsx.mahangsx
where year(ngaynhap) = 2020
group by tenhang
---------------------------------------
---------------------------------------
select manv,sum(soluongN*dongiaN) as N'tổng tiền nhập của mỗi nhân viên'
from nhap inner join pnhap on nhap.sohdn=pnhap.sohdn
where year(ngaynhap) =2020
group by manv
having sum(soluongN*dongiaN) > 100000
-----------------------------------------
select sanpham.masp,tensp
from sanpham inner join nhap on sanpham.masp=nhap.masp
except
select sanpham.masp,tensp
from sanpham inner join xuat on sanpham.masp=xuat.masp 
-----------------------------------------
select sanpham.masp,tensp
from sanpham inner join nhap on sanpham.masp=nhap.masp
		inner join xuat on sanpham.masp=xuat.masp
		inner join pnhap on nhap.sohdn=pnhap.sohdn
		inner join pxuat on xuat.sohdx=pxuat.sohdx
where year(ngaynhap) =2020 and year(ngayx) =2020
--------------------------------------------
select nhanvien.manv,tennv
from nhanvien inner join pnhap on nhanvien.tennv=pnhap.manv
union
select nhanvien.manv,tennv
from nhanvien inner join pxuat on nhanvien.manv=pxuat.manv
--------------------------------------------------------
select nhanvien.manv,tennv
from nhanvien
where nhanvien.manv not in (select manv from pxuat)
		and nhanvien.manv not in (select manv from pnhap)