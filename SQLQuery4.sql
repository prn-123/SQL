create procedure spInsertDistricts @pDistrict varchar(40)
as
insert into Districts values(@pDistrict)
go

