--Sisestada andmebaasi tabelid ja igasse tabelisse vähemalt viis rida andmeid. 

create table Projekt
(

ID int primary key,
Alguskuupäev date,
Lõpukuupäev date,
Eelarve int,
Projektijuht nvarchar(50)

)

select * from Projekt

insert into Projekt (ID, Alguskuupäev, Lõpukuupäev, Eelarve, Projektijuht)
values(1, '2026-04-07', '2026-06-12', 3036, 'Anton'),
(2, '2026-05-15', '2026-08-20', 4050, 'Gabriel'),
(3, '2026-04-12', '2026-06-21', 3060, 'Martin'),
(4, '2026-02-08', '2026-05-17', 2100, 'John'),
(5, '2026-01-25', '2026-04-16', 4029, 'Nick')




create table Masin
(
ID int primary key,
Registrinumber int,
Tüüp nvarchar(50),
Seisukord nvarchar(50)
)

insert into Masin (ID, Registrinumber, Tüüp, Seisukord)
values(1, 14, 'Betoonimikser', 'korras'),
(2, 21, 'Ekskavaator', 'halvas seisundis'),
(3, 32, 'Kraana', 'korras'),
(4, 23, 'Ekskavaator', 'halvas seisukorras'),
(5, 41, 'Betoonimikser', 'korras')
Select * from Masin

create table Materjal
(
ID int primary key,
Nimi nvarchar(50),
Ühik nvarchar(50),
HindÜhikuKohta int
)

insert into Materjal (ID, Nimi, Ühik, HindÜhikuKohta)
values(1, 'Tsement', 'kg', 200),
(2, 'Tsement', 'kg', 500),
(3, 'Betoon', 'kg', 600),
(4, 'Torud', ', m³', 900),
(5, 'Tellised', 'kg', 800)
select * from Materjal

create table Töötaja
(
ID int primary key,
Nimi nvarchar(50),
Amet nvarchar(50),
Tunnipalk int
)

insert into Töötaja (ID, Nimi, Amet, Tunnipalk)
values(1, 'Jimmy', 'ehitaja', 530),
(2, 'Nathan', 'insener', 820),
(3, 'Margaret', 'ehitaja', 510),
(4, 'Lillith', 'ehitaja', 550),
(5, 'Jake', 'insener', 740)
select * from Töötaja

create table Ehitusobjekt
(
ID int primary key,
Aadress nvarchar(50),
Pindala int,
Objektitüüp nvarchar(50)

)

insert into Ehitusobjekt (ID, Aadress, Pindala, Objektitüüp)
values(1, 'Bellevue 45', 780, 'Elumaja'),
(2, 'Illinois 13', 800, 'Tehas'),
(3, 'New York 15', 845, 'Elumaja'),
(4, 'Texas 17', 750, 'Sild'),
(5, 'Florida 19', 905, 'Elumaja')
select * from Ehitusobjekt
-------------------------------------------------------------------------
--2. Teha üks omal valikul stored procedure päring ja kutsuda see esile.
create procedure spGetNimiJaAmet
as begin 
select Nimi, Amet from Töötaja
end
exec spGetNimiJaAmet

--3. Tee kolm JOIN päringut.

Select Nimi, Amet, Tüüp from Töötaja
join Masin on Masin.ID = Töötaja.ID

Select Nimi, Projektijuht, Eelarve from Töötaja
join Projekt on Projekt.ID = Töötaja.ID

Select Nimi, Ühik, Objektitüüp from Materjal
join Ehitusobjekt on Ehitusobjekt.ID = Materjal.ID