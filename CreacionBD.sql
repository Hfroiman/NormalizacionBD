CREATE DATABASE PrimerBaseDatos
go
USE PrimerBaseDatos
GO
CREATE TABLE Stock(
    IDStock VARCHAR(25) NOT NULL PRIMARY KEY,
    CantDisponible SMALLINT NOT NULL,
    CantMinima SMALLINT NOT NULL
)

GO
create TABLE TipoArticulo(
    IDTipoArticulo SMALLINT NOT NULL PRIMARY KEY,
    Descricion VARCHAR(100) not NULL
)

GO
create table Precios(
    Idprecios VARCHAR(50) NOT NULL PRIMARY KEY,
    PrecioCompra money not null,
    PrecioVenta money not NULL,
)

go 
create table Articulos(
    CodigoArticulo VARCHAR(50) not null PRIMARY KEY,
    Idprecios VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Precios (Idprecios),
    IDStock VARCHAR(25) NOT NULL FOREIGN KEY REFERENCES Stock (IDStock),
    IDTipoArticulo SMALLINT NOT NULL FOREIGN KEY REFERENCES TipoArticulo (IDTipoArticulo),
    Estado bit NOT NULL
)

go
create table Mes(
    IDmes TINYINT not null PRIMARY KEY,
    Nombre VARCHAR(25) not NULL,
    VentaMes SMALLINT not null,
    FacturadoMes money not null,
    Sueldo Money not null,
)

GO
create table Direccion(
    IDdireccion VARCHAR(50) not null PRIMARY key,
    Localidad VARCHAR(50) not null,
    Provincia VARCHAR(50) not NULL
)

GO
CREATE TABLE Datos(
    DNI VARCHAR(8) not null PRIMARY KEY,
    ApellidoNombre VARCHAR(75) not null,
    FechaNacimiento DATE not null,
    Telefono VARCHAR (25) not null,
)

go
create table Vendedores(
    DNI VARCHAR(8) not null UNIQUE FOREIGN KEY REFERENCES Datos(DNI),
    Legajo SMALLINT not null UNIQUE,
    IngresoEmpresa date not null,
    IDmes TINYINT not null FOREIGN KEY REFERENCES Mes (IDmes)
)

GO 
CREATE TABLE FormaPago(
    IdFormaPago bit not null PRIMARY KEY,
    Pago VARCHAR(35) not null,
    Importe money not null,
)

go
create table VentasRealizadas(
    CodigoFactura int not null PRIMARY key,
    FechaVenta DATE not null,
    Cliente VARCHAR(50) not null,
    LegajoVendedor SMALLINT not null,
    IdFormaPago bit not null FOREIGN KEY REFERENCES FormaPago (IdFormaPago)
)
