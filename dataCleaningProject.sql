--cleaning data in sql queries
use portfolioproject;
select saledateconverted,convert(date,saledate)
  FROM portfolioproject.dbo.nashvilleHousing

update nashvillehousing
set saledate = convert(date,saledate)

alter table nashvillehousing
add	SaleDateConverted Date;

update nashvillehousing
set saledateconverted = convert(date,saledate)

--populate property address
select *
  FROM portfolioproject.dbo.nashvilleHousing
  order by parcelid

select a.parcelid,a.propertyaddress,
 b.parcelid,b.propertyaddress,isnull(a.propertyaddress,b.propertyaddress)
FROM portfolioproject.dbo.nashvilleHousing a 
join portfolioproject.dbo.nashvilleHousing b
on a.parcelid=b.parcelid
and a.[uniqueid] <>b.[uniqueid]
where a.propertyAddress is null

update a 
set Propertyaddress = isnull(a.propertyaddress,b.propertyaddress)
FROM portfolioproject.dbo.nashvilleHousing a 
join portfolioproject.dbo.nashvilleHousing b
  on a.parcelid=b.parcelid
where a.propertyAddress is null
and a.uniqueid <>b.uniqueid

--breaking out address into induvidual columnn (address,city,state)
select Propertyaddress
from portfolioProject.dbo.nashvilleHousing

select 
substring(propertyAddress,1,CHARINDEX(',',propertyAddress)-1) as address,
CHARINDEX(',',propertyAddress)
from portFolioProject.dbo.nashvilleHousing

select 
substring(propertyAddress,1,CHARINDEX(',',propertyAddress)-1) as address,
substring(propertyAddress,CHARINDEX(',',propertyAddress)+1,LEN(PropertyAddress)) as address
from portFolioProject.dbo.nashvilleHousing


alter table nashvillehousing
add	PropertySplitAddress Nvarchar(255);

update nashvillehousing
set PropertySplitAddress= Substring(propertyAddress,1,CHARINDEX(',',propertyAddress)-1)


alter table nashvillehousing
add	PropertySplitCity Nvarchar(255);

update nashvillehousing
set PropertySplitCity= Substring(propertyAddress,CHARINDEX(',',propertyAddress)+1,LEN(PropertyAddress))

select propertyAddress,Propertysplitaddress ,propertysplitcity
from portfolioProject.dbo.nashvilleHousing


select 
parsename(replace(owneraddress,',','.'),3),
parsename(replace(owneraddress,',','.'),2),
parsename(replace(owneraddress,',','.'),1)
from portfolioproject.dbo.nashvilleHousing


alter table nashvillehousing
add	ownerSplitAddress Nvarchar(255);

update nashvillehousing
set ownerSplitAddress= parsename(replace(owneraddress,',','.'),3)

alter table nashvillehousing
add	ownerSplitCity Nvarchar(255);

update nashvillehousing
set ownerSplitCity= parsename(replace(owneraddress,',','.'),2)


alter table nashvillehousing
add	ownerSplitstate Nvarchar(255);

update nashvillehousing
set ownerSplitstate= parsename(replace(owneraddress,',','.'),1)


select ownerAddress,ownersplitaddress,ownersplitstate,ownersplitcity
from portfolioProject.dbo.nashvilleHousing

--remove duplicates
with rowNumcte as(
select *,
row_number() over(
Partition by Parcelid,
			 propertyaddress,
			 Saleprice,
			 saledate,
			 legalReference
			 order by uniqueid)row_num
from PortFolioproject.dbo.nashVillehousing
--order by parcelid
)
select *
from rowNumcte
where row_num >1
order by propertyaddress


--delete unused column

alter table PortFolioproject.dbo.nashVillehousing
drop column Owneraddress,taxdistrict,Propertyaddress

select *
from portfolioProject.dbo.nashvilleHousing

