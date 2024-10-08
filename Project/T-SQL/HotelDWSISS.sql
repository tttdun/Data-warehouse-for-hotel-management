USE [master]
GO
/****** Object:  Database [HotelDW]    Script Date: 21-May-24 5:45:42 PM ******/
CREATE DATABASE [HotelDW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelDW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HotelDW.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelDW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HotelDW_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HotelDW] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelDW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelDW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelDW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelDW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelDW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelDW] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelDW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelDW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelDW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelDW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelDW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelDW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelDW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelDW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelDW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelDW] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HotelDW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelDW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelDW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelDW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelDW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelDW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelDW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelDW] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelDW] SET  MULTI_USER 
GO
ALTER DATABASE [HotelDW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelDW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelDW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelDW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelDW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelDW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HotelDW', N'ON'
GO
ALTER DATABASE [HotelDW] SET QUERY_STORE = ON
GO
ALTER DATABASE [HotelDW] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HotelDW]
GO
/****** Object:  Schema [hotel]    Script Date: 21-May-24 5:45:42 PM ******/
CREATE SCHEMA [hotel]
GO
/****** Object:  Table [hotel].[DimDate]    Script Date: 21-May-24 5:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hotel].[DimDate](
	[DateKey] [float] NOT NULL,
	[Date] [datetime] NULL,
	[DayOfWeek] [float] NULL,
	[DayName] [nvarchar](255) NULL,
	[DayOfMonth] [float] NULL,
	[DayOfYear] [float] NULL,
	[WeekOfYear] [float] NULL,
	[MonthName] [nvarchar](255) NULL,
	[MonthOfYear] [float] NULL,
	[Quarter] [float] NULL,
	[Year] [float] NULL,
	[IsWeekday] [nvarchar](255) NULL,
 CONSTRAINT [PK_hotel.DimDate] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [hotel].[Date]    Script Date: 21-May-24 5:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [hotel].[Date] AS 
SELECT [DateKey] AS [DateKey]
, [Date] AS [Date]
, [DayOfWeek] AS [DayOfWeek]
, [DayName] AS [DayName]
, [DayOfMonth] AS [DayOfMonth]
, [DayOfYear] AS [DayOfYear]
, [WeekOfYear] AS [WeekOfYear]
, [MonthName] AS [MonthName]
, [MonthOfYear] AS [MonthOfYear]
, [Quarter] AS [Quarter]
, [Year] AS [Year]
, [IsWeekday] AS [IsWeekday]
FROM hotel.DimDate
GO
/****** Object:  Table [hotel].[DimCustomers]    Script Date: 21-May-24 5:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hotel].[DimCustomers](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[BirthDate] [datetime] NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [float] NULL,
	[RowIsCurrent] [bit] NULL,
	[RowStartDate] [datetime] NULL,
	[RowEndDate] [datetime] NULL,
	[RowChangeReason] [nvarchar](200) NULL,
 CONSTRAINT [PK_hotel.DimCustomers] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [hotel].[Customers]    Script Date: 21-May-24 5:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [hotel].[Customers] AS 
SELECT [CustomerKey] AS [CustomerKey]
, [CustomerID] AS [CustomerID]
, [FirstName] AS [FirstName]
, [LastName] AS [LastName]
, [BirthDate] AS [BirthDate]
, [Email] AS [EmailCustomer]
, [Phone] AS [PhoneCustomer]
, [RowIsCurrent] AS [Row Is Current]
, [RowStartDate] AS [Row Start Date]
, [RowEndDate] AS [Row End Date]
, [RowChangeReason] AS [Row Change Reason]
FROM hotel.DimCustomers
GO
/****** Object:  Table [hotel].[DimEmployees]    Script Date: 21-May-24 5:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hotel].[DimEmployees](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [nvarchar](50) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[HireDate] [date] NULL,
	[RowIsCurrent] [bit] NULL,
	[RowStartDate] [datetime] NULL,
	[RowEndDate] [datetime] NULL,
	[RowChangeReason] [nvarchar](200) NULL,
 CONSTRAINT [PK_hotel.DimEmployees] PRIMARY KEY CLUSTERED 
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [hotel].[Employees]    Script Date: 21-May-24 5:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [hotel].[Employees] AS 
SELECT [EmployeeKey] AS [EmployeeKey]
, [EmployeeID] AS [EmployeeID]
, [EmployeeName] AS [EmployeeName]
, [Title] AS [EmployeeTitle]
, [City] AS [City]
, [Country] AS [Country]
, [HireDate] AS [HireDate]
, [RowIsCurrent] AS [Row Is Current]
, [RowStartDate] AS [Row Start Date]
, [RowEndDate] AS [Row End Date]
, [RowChangeReason] AS [Row Change Reason]
FROM hotel.DimEmployees
GO
/****** Object:  Table [hotel].[FactSales]    Script Date: 21-May-24 5:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hotel].[FactSales](
	[CustomerKey] [int] NOT NULL,
	[EmployeeKey] [int] NOT NULL,
	[BookingID] [nvarchar](50) NOT NULL,
	[RoomNumber] [float] NOT NULL,
	[SettlementDateKey] [float] NULL,
	[RoomType] [nvarchar](50) NULL,
	[BedType] [nvarchar](50) NULL,
	[RoomCost] [money] NULL,
	[BedCost] [money] NULL,
	[GuestNumber] [float] NULL,
	[Discount] [float] NULL,
	[Tax] [float] NULL,
	[Total] [money] NULL,
 CONSTRAINT [PK_hotel.FactSales] PRIMARY KEY NONCLUSTERED 
(
	[CustomerKey] ASC,
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [hotel].[Sales]    Script Date: 21-May-24 5:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [hotel].[Sales] AS 
SELECT [CustomerKey] AS [CustomerKey]
, [EmployeeKey] AS [EmployeeKey]
, [BookingID] AS [BookingID]
, [RoomNumber] AS [RoomNumber]
, [SettlementDateKey] AS [SettlementDateKey]
, [RoomType] AS [RoomType]
, [BedType] AS [BedType]
, [RoomCost] AS [RoomCost]
, [BedCost] AS [BedCost]
, [GuestNumber] AS [GuestNumber]
, [Discount] AS [Discount]
, [Tax] AS [Tax]
, [Total] AS [Total]
FROM hotel.FactSales
GO
/****** Object:  Table [hotel].[FactBookings]    Script Date: 21-May-24 5:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hotel].[FactBookings](
	[CustomerKey] [int] NOT NULL,
	[BookingID] [nvarchar](50) NOT NULL,
	[EmployeeKey] [int] NOT NULL,
	[RoomNumber] [float] NOT NULL,
	[ArrivalDateKey] [float] NULL,
	[DepartureDateKey] [float] NULL,
	[RoomType] [nvarchar](50) NULL,
	[BedType] [nvarchar](50) NULL,
	[GuestCount] [float] NULL,
	[BookingStatus] [nvarchar](50) NULL,
	[RoomCost] [money] NULL,
	[BedCost] [money] NULL,
	[TotalPrice] [numeric](18, 4) NULL,
 CONSTRAINT [PK_hotel.FactBookings] PRIMARY KEY NONCLUSTERED 
(
	[CustomerKey] ASC,
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [hotel].[Blank Fact]    Script Date: 21-May-24 5:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [hotel].[Blank Fact] AS 
SELECT [CustomerKey] AS [CustomerKey]
, [BookingID] AS [BookingID]
, [EmployeeKey] AS [EmployeeKey]
, [RoomNumber] AS [RoomNumber]
, [ArrivalDateKey] AS [ArrivalDateKey]
, [DepartureDateKey] AS [DepartureDateKey]
, [RoomType] AS [RoomType]
, [BedType] AS [BedType]
, [GuestCount] AS [GuestCount]
, [BookingStatus] AS [BookingStatus]
, [RoomCost] AS [RoomCost]
, [BedCost] AS [BedCost]
, [TotalPrice] AS [TotalPrice]
FROM hotel.FactBookings
GO
/****** Object:  View [hotel].[BedTypes]    Script Date: 21-May-24 5:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [hotel].[BedTypes] AS 
SELECT [BedTypeKey] AS [BedTypeKey]
, [BedTypeID] AS [BedTypeID]
, [BedType] AS [BedType]
, [Notes] AS [Notes]
, [BedCost] AS [BedCost]
, [RowIsCurrent] AS [Row Is Current]
, [RowStartDate] AS [Row Start Date]
, [RowEndDate] AS [Row End Date]
, [RowChangeReason] AS [Row Change Reason]
FROM hotel.DimBedTypes
GO
/****** Object:  View [hotel].[Rooms]    Script Date: 21-May-24 5:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [hotel].[Rooms] AS 
SELECT [RoomNumber] AS [RoomNumber]
, [RoomTypeKey] AS [RoomTypeKey]
, [BedTypeKey] AS [BedTypeKey]
, [RoomStatusKey] AS [RoomStatusKey]
, [RoomType] AS [RoomType]
, [BedType] AS [BedType]
, [Rate] AS [Rate]
, [Notes] AS [Notes]
, [ArrivalDateKey] AS [ArrivalDateKey]
, [DepartureDate] AS [DepartureDate]
, [GuestCount] AS [GuestCount]
FROM hotel.FactRooms
GO
/****** Object:  View [hotel].[RoomStatus]    Script Date: 21-May-24 5:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [hotel].[RoomStatus] AS 
SELECT [RoomStatusKey] AS [RoomStatusKey]
, [RoomStatusID] AS [RoomStatusID]
, [RoomStatus] AS [RoomStatus]
, [Notes] AS [Notes]
, [RowIsCurrent] AS [Row Is Current]
, [RowStartDate] AS [Row Start Date]
, [RowEndDate] AS [Row End Date]
, [RowChangeReason] AS [Row Change Reason]
FROM hotel.DimRoomStatus
GO
/****** Object:  View [hotel].[RoomTypes]    Script Date: 21-May-24 5:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [hotel].[RoomTypes] AS 
SELECT [RoomTypeKey] AS [RoomTypeKey]
, [RoomTypeID] AS [RoomTypeID]
, [RoomType] AS [RoomType]
, [Notes] AS [Notes]
, [TypeCost] AS [TypeCost]
, [RowIsCurrent] AS [Row Is Current]
, [RowStartDate] AS [Row Start Date]
, [RowEndDate] AS [Row End Date]
, [RowChangeReason] AS [Row Change Reason]
FROM hotel.DimRoomTypes
GO
ALTER TABLE [hotel].[DimCustomers] ADD  DEFAULT ('31-Dec-9999') FOR [RowEndDate]
GO
ALTER TABLE [hotel].[DimEmployees] ADD  CONSTRAINT [DF__DimEmploy__RowEn__4222D4EF]  DEFAULT ('31-Dec-9999') FOR [RowEndDate]
GO
ALTER TABLE [hotel].[FactBookings]  WITH CHECK ADD  CONSTRAINT [FK_hotel_FactBookings_ArrivalDateKey] FOREIGN KEY([ArrivalDateKey])
REFERENCES [hotel].[DimDate] ([DateKey])
GO
ALTER TABLE [hotel].[FactBookings] CHECK CONSTRAINT [FK_hotel_FactBookings_ArrivalDateKey]
GO
ALTER TABLE [hotel].[FactBookings]  WITH CHECK ADD  CONSTRAINT [FK_hotel_FactBookings_CustomerKey] FOREIGN KEY([CustomerKey])
REFERENCES [hotel].[DimCustomers] ([CustomerKey])
GO
ALTER TABLE [hotel].[FactBookings] CHECK CONSTRAINT [FK_hotel_FactBookings_CustomerKey]
GO
ALTER TABLE [hotel].[FactBookings]  WITH CHECK ADD  CONSTRAINT [FK_hotel_FactBookings_DepartureDateKey] FOREIGN KEY([DepartureDateKey])
REFERENCES [hotel].[DimDate] ([DateKey])
GO
ALTER TABLE [hotel].[FactBookings] CHECK CONSTRAINT [FK_hotel_FactBookings_DepartureDateKey]
GO
ALTER TABLE [hotel].[FactBookings]  WITH CHECK ADD  CONSTRAINT [FK_hotel_FactBookings_EmployeeKey] FOREIGN KEY([EmployeeKey])
REFERENCES [hotel].[DimEmployees] ([EmployeeKey])
GO
ALTER TABLE [hotel].[FactBookings] CHECK CONSTRAINT [FK_hotel_FactBookings_EmployeeKey]
GO
ALTER TABLE [hotel].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_hotel_FactSales_CustomerKey] FOREIGN KEY([CustomerKey])
REFERENCES [hotel].[DimCustomers] ([CustomerKey])
GO
ALTER TABLE [hotel].[FactSales] CHECK CONSTRAINT [FK_hotel_FactSales_CustomerKey]
GO
ALTER TABLE [hotel].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_hotel_FactSales_EmployeeKey] FOREIGN KEY([EmployeeKey])
REFERENCES [hotel].[DimEmployees] ([EmployeeKey])
GO
ALTER TABLE [hotel].[FactSales] CHECK CONSTRAINT [FK_hotel_FactSales_EmployeeKey]
GO
ALTER TABLE [hotel].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_hotel_FactSales_SettlementDateKey] FOREIGN KEY([SettlementDateKey])
REFERENCES [hotel].[DimDate] ([DateKey])
GO
ALTER TABLE [hotel].[FactSales] CHECK CONSTRAINT [FK_hotel_FactSales_SettlementDateKey]
GO
EXEC [HotelDW].sys.sp_addextendedproperty @name=N'Description', @value=N'Default description - you should change this.' 
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'CustomerKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'CustomerKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'CustomerKey'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'CustomerKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derive' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'CustomerKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerID' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerID' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'FirstName' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'FirstName' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'LastName' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'LastName' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'BirthDate' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BirthDate' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmailCustomer' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'PhoneCustomer' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Phone' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowIsCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowIsCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowIsCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowIsCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/0' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowIsCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowIsCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derive' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowIsCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'24-Jan-11' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derive' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derive' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowChangeReason'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowChangeReason'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowChangeReason'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowChangeReason'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowChangeReason'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derive' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers', @level2type=N'COLUMN',@level2name=N'RowChangeReason'
GO
EXEC sys.sp_addextendedproperty @name=N'Database Schema', @value=N'hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Customers' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers'
GO
EXEC sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers'
GO
EXEC sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimCustomers'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Date' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayOfWeek' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DayOfWeek'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DayOfWeek'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DayOfWeek'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayName' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DayName'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DayName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DayName'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayOfMonth' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DayOfMonth'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DayOfMonth'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DayOfMonth'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayOfYear' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DayOfYear'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DayOfYear'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'DayOfYear'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'WeekOfYear' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'WeekOfYear'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'WeekOfYear'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'WeekOfYear'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'MonthName' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'MonthName'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'MonthName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'MonthName'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'MonthOfYear' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'MonthOfYear'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'MonthOfYear'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'MonthOfYear'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Quarter' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Year' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'IsWeekday'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'IsWeekday' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'IsWeekday'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'IsWeekday'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate', @level2type=N'COLUMN',@level2name=N'IsWeekday'
GO
EXEC sys.sp_addextendedproperty @name=N'Database Schema', @value=N'hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Date' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeKey'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeID' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'EmployeeID' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employees' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeName'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeName' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeName'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'EmployeeName' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeName'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employees' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'EmployeeName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeTitle' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'EmployeeTitle' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employees' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'City' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'City' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employees' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Country' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'Country'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'Country'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Country' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'Country'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'Country'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'Country'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employees' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'Country'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'HireDate' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'HireDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'HireDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'HireDate' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'HireDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'HireDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'HireDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employees' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'HireDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowIsCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowIsCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowIsCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowIsCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/0' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowIsCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowIsCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowIsCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'24-Jan-11' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowChangeReason'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowChangeReason'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowChangeReason'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowChangeReason'
GO
EXEC sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowChangeReason'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees', @level2type=N'COLUMN',@level2name=N'RowChangeReason'
GO
EXEC sys.sp_addextendedproperty @name=N'Database Schema', @value=N'hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Employees' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees'
GO
EXEC sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees'
GO
EXEC sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'DimEmployees'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimCustomer' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'CustomerKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'CustomerKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'CustomerKey'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup form DimCustomers.CustomerKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'CustomerKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'CustomerKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'BookingID' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BookingID' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Bookings' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimEmployee' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'EmployeeKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'EmployeeKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'EmployeeKey'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup form DimEmployees.EmployeeKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'EmployeeKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'EmployeeKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimRoom' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoomNumber' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'RoomNumber' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'RoomNumber' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Rooms' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimArrival' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'ArrivalDateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'ArrivalDateKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'ArrivalDateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key Lookup from DimDate.DateKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'ArrivalDateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimDeparture' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'DepartureDateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'DepartureDateKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'DepartureDateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key Lookup from DimDate.DateKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'DepartureDateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Name Room Type to DimRoomType' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoomType' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'RoomType' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'RoomTypes' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Name Bed Type to DimBedType' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BedType'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'BedType' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BedType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BedType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BedType' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BedType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BedType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BedType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'BedTypes' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BedType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Count to DimGuest' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'GuestCount'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'GuestCount' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'GuestCount'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'GuestCount'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'GuestCount' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'GuestCount'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'GuestCount'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'GuestCount'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Bookings' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'GuestCount'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Status to DimBooking' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BookingStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'BookingStatus' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BookingStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BookingStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ReservationStatus' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BookingStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BookingStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel ' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BookingStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Bookings' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BookingStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoomCost' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TypeCost' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel ' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'RoomTypes' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'RoomCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'BedCost' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BedCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BedCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BedCost' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BedCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BedCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel ' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BedCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'BedTypes' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'BedCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Price to DimTotal' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'TotalPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'TotalPrice' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'TotalPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'TotalPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TypeCost + BedCost' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings', @level2type=N'COLUMN',@level2name=N'TotalPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'Database Schema', @value=N'hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Blank Fact' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings'
GO
EXEC sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings'
GO
EXEC sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactBookings'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'CustomerKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'CustomerKey'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimCustomer.CustomerKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'CustomerKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'CustomerKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'EmployeeKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'EmployeeKey'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimEmployee.EmployeeKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'EmployeeKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'EmployeeKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'BookingID' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BookingID' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Bookings' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BookingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoomNumber' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'RoomNumber' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Rooms' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'SettlementDateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'SettlementDateKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'SettlementDateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key Lookup from DimDate.DateKey' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'SettlementDateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 4' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'SettlementDateKey'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoomType' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'RoomType' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'RoomTypes' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'BedType' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BedType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BedType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BedType' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BedType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BedType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BedType'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'BedTypes' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BedType'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'amounts' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoomCost' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TypeCost' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'RoomTypes' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'RoomCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'amounts' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BedCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'BedCost' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BedCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BedCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BedCost' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BedCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BedCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BedCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'BedTypes' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'BedCost'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'amounts' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'GuestNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'GuestNumber' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'GuestNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'GuestNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'GuestCount' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'GuestNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'GuestNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'GuestNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Bookings' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'GuestNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'amounts' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Discount' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Discount' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Payments' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'amounts' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Tax' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TaxRate' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'Source System', @value=N'Hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Table', @value=N'Payments' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Folder', @value=N'amounts' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Total'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Total' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Total'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Datatype', @value=N' money' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Total'
GO
EXEC sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'RoomCost+BedCost+TaxRate-(RoomCost+BedCost)*Discount' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales', @level2type=N'COLUMN',@level2name=N'Total'
GO
EXEC sys.sp_addextendedproperty @name=N'Database Schema', @value=N'hotel' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales'
GO
EXEC sys.sp_addextendedproperty @name=N'Display Name', @value=N'Sales' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales'
GO
EXEC sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales'
GO
EXEC sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact' , @level0type=N'SCHEMA',@level0name=N'hotel', @level1type=N'TABLE',@level1name=N'FactSales'
GO
USE [master]
GO
ALTER DATABASE [HotelDW] SET  READ_WRITE 
GO
