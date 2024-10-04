                                             ### SQL GROUP PROJECT ###
									### Done by : Geofrey , Narmatha , Pavithra, Sowmiya ###

create database ChinookMusic;
use ChinookMusic;
# Joining the tables
# Creating Table1 Music
Create Table Music AS
select ar.artistId,ar.name as ArtistName,a.albumId,a.title as AlbumName,
t.TrackId,t.name as TrackName,t.composer,t.milliseconds,t.unitprice,
mt.MediaTypeId,mt.Name as MediaTypeName,g.GenreID,g.name as GenreName,
pt.PlaylistID, pl.Name as PlaylistName,il.InvoiceLineId,il.Quantity,
i.InvoiceId,i.CustomerId,i.invoiceDate,i.Billingaddress,i.BillingCity,
i.BillingCountry,i.Total as TotalAmt
from artist ar
join  album a
on ar.ArtistID = a.ArtistID 
join track t
on a.AlbumID = t.AlbumID
join mediatype mt
on t.MediaTypeId = mt.MediaTypeId
join Genre g
on t.GenreID = g.GenreID
join PlaylistTrack pt
on t.TrackID = pt.TrackID
join Playlist pl
on pt.PlaylistID = pl.playlistID
join InvoiceLine il
on t.TrackId =il.TrackId
join Invoice i
on il.InvoiceId  = i.InvoiceId;



#Creating Table2 Customer+Employee

create table ProductionValues As 
select c.customerId as CustomerIdNO,c.firstName as Customer_FirstName,c.lastname as Customer_LastName,
c.Address as Customer_Address,c.City as Customer_City,c.country as Customer_Country,c.phone as Customer_Phone,c.SupportRepId,
e.employeeId , e.firstname as Employee_FirstName,e.lastname as Employee_LastName,e.Title as Employee_Tiltle,e.Reportsto,
e.address as Employee_address,e.City as Employee_City,e.Country as Employee_Country,
e.phone as Employee_Phone,e.Email as Employee_Email,em.Title as Report_Title, em.FirstName as Reprt_FirstName, em.LastName as Report_lastName, 
timestampdiff(year,e.Birthdate,now()) as Age, timestampdiff(year,e.hiredate,now()) as Experience
from Customer c 
cross join employee e 
on c.SupportRepId = e.employeeId
cross join employee em
on e.Reportsto = em.employeeId;


Create Table MusicDetails As
select * from Music m
join ProductionValues pv
on m.customerId = pv.customerIdNO;

