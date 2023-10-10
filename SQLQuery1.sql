USE [master]
GO
/****** Object:  Database [Tienda Sara]    Script Date: 08/10/2023 01:16:03 p. m. ******/
CREATE DATABASE [Tienda Sara]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tienda Sara', FILENAME = N'C:\Users\yanir\OneDrive\Escritorio\Mineria de datos\SQL DATA\MSSQL16.SQL\MSSQL\DATA\Tienda Sara.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tienda Sara_log', FILENAME = N'C:\Users\yanir\OneDrive\Escritorio\Mineria de datos\SQL DATA\MSSQL16.SQL\MSSQL\DATA\Tienda Sara_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Tienda Sara] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tienda Sara].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tienda Sara] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tienda Sara] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tienda Sara] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tienda Sara] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tienda Sara] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tienda Sara] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tienda Sara] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tienda Sara] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tienda Sara] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tienda Sara] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tienda Sara] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tienda Sara] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tienda Sara] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tienda Sara] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tienda Sara] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tienda Sara] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tienda Sara] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tienda Sara] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tienda Sara] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tienda Sara] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tienda Sara] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tienda Sara] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tienda Sara] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tienda Sara] SET  MULTI_USER 
GO
ALTER DATABASE [Tienda Sara] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tienda Sara] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tienda Sara] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tienda Sara] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tienda Sara] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tienda Sara] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Tienda Sara] SET QUERY_STORE = ON
GO
ALTER DATABASE [Tienda Sara] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Tienda Sara]
GO
/****** Object:  Table [dbo].[Carrito]    Script Date: 08/10/2023 01:16:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[Id] [int] NOT NULL,
	[FolioVenta] [int] NOT NULL,
	[TotalCompra] [decimal](18, 2) NOT NULL,
	[Estatus] [int] NOT NULL,
	[Fecha] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarritoDetalle]    Script Date: 08/10/2023 01:16:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarritoDetalle](
	[Id] [int] NOT NULL,
	[IdCarrito] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Subtotal] [decimal](18, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 08/10/2023 01:16:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 08/10/2023 01:16:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[Id] [int] NOT NULL,
	[Descripcion] [nvarchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 08/10/2023 01:16:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdMarca] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (1, 1, CAST(5000.00 AS Decimal(18, 2)), 1, CAST(N'2023-09-22' AS Date))
GO
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (2, 3, CAST(1200.00 AS Decimal(18, 2)), 1, CAST(N'2023-09-15' AS Date))
GO
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (3, 5, CAST(2000.00 AS Decimal(18, 2)), 2, CAST(N'2023-09-26' AS Date))
GO
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (4, 10, CAST(249.00 AS Decimal(18, 2)), 1, CAST(N'2023-09-30' AS Date))
GO
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (5, 7, CAST(39.00 AS Decimal(18, 2)), 2, CAST(N'2023-09-26' AS Date))
GO
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (6, 4, CAST(45.00 AS Decimal(18, 2)), 3, CAST(N'2023-09-15' AS Date))
GO
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (7, 2, CAST(250.00 AS Decimal(18, 2)), 1, CAST(N'2023-09-30' AS Date))
GO
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (8, 6, CAST(849.00 AS Decimal(18, 2)), 1, CAST(N'2023-09-17' AS Date))
GO
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (9, 8, CAST(119.00 AS Decimal(18, 2)), 1, CAST(N'2023-09-30' AS Date))
GO
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (10, 9, CAST(649.00 AS Decimal(18, 2)), 2, CAST(N'2023-09-15' AS Date))
GO
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (1, 1, 1, 2, CAST(500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (2, 2, 2, 1, CAST(249.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (3, 3, 3, 1, CAST(1200.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (4, 4, 4, 2, CAST(90.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (5, 5, 5, 1, CAST(2000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (6, 6, 6, 2, CAST(1698.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (7, 7, 7, 3, CAST(39.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (8, 8, 8, 5, CAST(119.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (9, 9, 9, 2, CAST(649.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (10, 10, 10, 1, CAST(249.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (1, N'Electronica')
GO
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (2, N'Ropa y moda')
GO
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (3, N'Hogar y Jardin')
GO
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (4, N'Salud y Belleza')
GO
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (5, N'Deportes')
GO
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (6, N'Jugetes')
GO
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (7, N'Alimentos y Bebidas')
GO
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (8, N'Libros')
GO
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (9, N'Automotriz')
GO
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (10, N'Mascotas')
GO
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (1, N'Samsung')
GO
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (2, N' Zara')
GO
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (3, N' Ikea')
GO
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (4, N'L''Oréal')
GO
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (5, N'Nike')
GO
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (6, N'Lego')
GO
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (7, N'Coca-Cola')
GO
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (8, N'Amazon')
GO
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (9, N'Ford')
GO
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (10, N'Dog Chow')
GO
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (1, N'tablet', CAST(5000.00 AS Decimal(18, 2)), 1, 1, 1)
GO
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (2, N'pantalon', CAST(499.00 AS Decimal(18, 2)), 2, 2, 2)
GO
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (3, N'carreteilla', CAST(1200.00 AS Decimal(18, 2)), 1, 3, 3)
GO
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (4, N'tinte para cabello', CAST(79.00 AS Decimal(18, 2)), 3, 4, 4)
GO
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (5, N'Tenis', CAST(1999.00 AS Decimal(18, 2)), 2, 5, 5)
GO
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (6, N'Caja de ladrillos', CAST(849.00 AS Decimal(18, 2)), 3, 6, 6)
GO
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (7, N'Refresco ', CAST(39.00 AS Decimal(18, 2)), 2, 7, 7)
GO
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (8, N'el principito', CAST(119.00 AS Decimal(18, 2)), 5, 8, 8)
GO
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (9, N'Emblema parrilla', CAST(624.00 AS Decimal(18, 2)), 2, 9, 9)
GO
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (10, N'Alimento para mascota', CAST(249.00 AS Decimal(18, 2)), 2, 10, 10)
GO
USE [master]
GO
ALTER DATABASE [Tienda Sara] SET  READ_WRITE 
GO
