USE [master]
GO
/****** Object:  Database [quarry]    Script Date: 9/5/2019 2:47:49 PM ******/
CREATE DATABASE [quarry]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quarry', FILENAME = N'D:\Database\Data\quarry.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quarry_log', FILENAME = N'D:\Database\Data\quarry_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [quarry] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quarry].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quarry] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quarry] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quarry] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quarry] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quarry] SET ARITHABORT OFF 
GO
ALTER DATABASE [quarry] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [quarry] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quarry] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quarry] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quarry] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quarry] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quarry] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quarry] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quarry] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quarry] SET  DISABLE_BROKER 
GO
ALTER DATABASE [quarry] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quarry] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quarry] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quarry] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quarry] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quarry] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quarry] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quarry] SET RECOVERY FULL 
GO
ALTER DATABASE [quarry] SET  MULTI_USER 
GO
ALTER DATABASE [quarry] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quarry] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quarry] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quarry] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quarry] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'quarry', N'ON'
GO
ALTER DATABASE [quarry] SET QUERY_STORE = OFF
GO
USE [quarry]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [quarry]
GO
/****** Object:  User [quarry]    Script Date: 9/5/2019 2:47:49 PM ******/
CREATE USER [quarry] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[quarry]
GO
ALTER ROLE [db_owner] ADD MEMBER [quarry]
GO
/****** Object:  Schema [quarry]    Script Date: 9/5/2019 2:47:49 PM ******/
CREATE SCHEMA [quarry]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 9/5/2019 2:47:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Action] [nvarchar](255) NULL,
 CONSTRAINT [PK_AuthorizedUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facilities]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facilities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermiteeId] [int] NULL,
	[FacilityName] [nvarchar](255) NULL,
	[Cost] [money] NULL,
 CONSTRAINT [PK_Facilities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](150) NOT NULL,
	[UnitCost] [money] NOT NULL,
	[UnitMeasureId] [int] NULL,
	[CategoryId] [int] NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](max) NULL,
	[OldValues] [nvarchar](max) NULL,
	[NewValues] [nvarchar](max) NULL,
	[Action] [nvarchar](max) NULL,
	[DateCreated] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Particulars]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Particulars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Particular] [nvarchar](max) NULL,
 CONSTRAINT [PK_Particulars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permitees]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permitees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccreditationNumber] [nvarchar](128) NULL,
	[TownCityId] [int] NULL,
	[PermiteeTypeId] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[ContactNumber1] [nvarchar](50) NULL,
	[ContactNumber2] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[AddressLine1] [nvarchar](150) NULL,
	[AddressLine2] [nvarchar](150) NULL,
	[BusinessRegistration] [nvarchar](150) NULL,
	[EntryBy] [nvarchar](128) NULL,
	[LastEditedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_Permittees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermiteeTypes]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermiteeTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermiteeTypeName] [nvarchar](100) NOT NULL,
	[UnitCost] [money] NOT NULL,
 CONSTRAINT [PK_PermitteeTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramOfWorks]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramOfWorks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermitteeId] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Cost] [money] NULL,
	[SourceFund] [nvarchar](max) NULL,
	[DateStarted] [datetime] NULL,
	[DateFinish] [datetime] NULL,
	[Proponent] [nvarchar](max) NULL,
	[QuarrySites] [nvarchar](max) NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_ProgramOfWorks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuariesInPermitees]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuariesInPermitees](
	[PermiteeId] [int] NOT NULL,
	[QuarrieId] [int] NOT NULL,
 CONSTRAINT [PK_QuariesInPermitees] PRIMARY KEY CLUSTERED 
(
	[PermiteeId] ASC,
	[QuarrieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quarries]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quarries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuarryName] [nvarchar](100) NULL,
	[JurisdictionName] [nvarchar](100) NULL,
	[EntryBy] [nvarchar](150) NULL,
	[LastEditedBy] [nvarchar](150) NULL,
 CONSTRAINT [PK_Quarries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuarriesInTowns]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuarriesInTowns](
	[QuarryId] [int] NOT NULL,
	[TownId] [int] NOT NULL,
 CONSTRAINT [PK_QuarriesInTowns] PRIMARY KEY CLUSTERED 
(
	[QuarryId] ASC,
	[TownId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SummaryProgramOfWorks]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SummaryProgramOfWorks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParticularId] [int] NULL,
	[SagId] [int] NULL,
	[ProgramOfWorkId] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[Quantity] [money] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_SummaryProgramOfWorks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionDetails]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionId] [nvarchar](128) NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitCost] [money] NOT NULL,
	[EntryBy] [nvarchar](150) NULL,
	[LastEditedBy] [nvarchar](150) NULL,
 CONSTRAINT [PK_TransactionDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionFacilities]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionFacilities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionId] [nvarchar](128) NOT NULL,
	[FacilitiesId] [int] NOT NULL,
	[Cost] [money] NULL,
	[isRenew] [bit] NULL,
	[EntryBy] [nvarchar](128) NOT NULL,
	[EntryModifiedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_TransactionFacilities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionPenalties]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionPenalties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionId] [nvarchar](128) NULL,
	[Penalty] [nvarchar](max) NULL,
	[Amount] [money] NULL,
 CONSTRAINT [PK_TransactionPenalties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [nvarchar](128) NOT NULL,
	[OfficialReceipt] [nvarchar](128) NULL,
	[PermiteeId] [int] NULL,
	[TransactionTypeId] [int] NULL,
	[TransactionDate] [datetime] NULL,
	[TransactionTotal] [money] NULL,
	[EntryBy] [nvarchar](128) NULL,
	[LastEditedBy] [nvarchar](128) NULL,
	[IsPrinted] [bit] NULL,
	[FilingDate] [datetime2](7) NULL,
	[Interest] [money] NULL,
	[Surcharge] [money] NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionTypes]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionType] [nvarchar](128) NULL,
 CONSTRAINT [PK_TransactionTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionVehicles]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionVehicles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionId] [nvarchar](128) NULL,
	[VehicleId] [int] NULL,
	[Cost] [money] NULL,
	[isRenew] [bit] NULL,
	[EntryBy] [nvarchar](128) NULL,
	[EntryModifiedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_TransactionVehicles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRolesInActions]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRolesInActions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](128) NULL,
	[Action] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserRolesInActions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/5/2019 2:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](128) NULL,
	[EmailConfirmed] [bit] NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](25) NULL,
	[PhoneNumberConfirmed] [bit] NULL,
	[TwoFactorEnabled] [bit] NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NULL,
	[AccessFailedCount] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[LastUpdatedBy] [nvarchar](150) NULL,
	[LastUpdated] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[CivilStatus] [nvarchar](12) NULL,
	[Gender] [nvarchar](6) NULL,
	[BirthDate] [datetime] NULL,
	[AddressLine2] [nvarchar](500) NULL,
	[AddressLine1] [nvarchar](500) NULL,
	[TownCity] [int] NULL,
	[Cellular] [nvarchar](25) NULL,
	[Height] [decimal](5, 2) NULL,
	[Weight] [decimal](5, 2) NULL,
	[Religion] [nvarchar](50) NULL,
	[Citizenship] [nvarchar](50) NULL,
	[Languages] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 9/5/2019 2:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserRoles_Id] [nvarchar](128) NOT NULL,
	[Users_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_UsersInRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoles_Id] ASC,
	[Users_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 9/5/2019 2:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermiteeId] [int] NULL,
	[VehicleTypeId] [int] NULL,
	[PlateNo] [nvarchar](50) NULL,
	[Capacity] [money] NULL,
	[Description] [nvarchar](128) NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleTypes]    Script Date: 9/5/2019 2:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NULL,
	[VehicleTypeName] [nvarchar](255) NULL,
	[Cost] [money] NULL,
 CONSTRAINT [PK_VehicleTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [quarry].[Productions]    Script Date: 9/5/2019 2:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quarry].[Productions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermiteeId] [int] NULL,
	[QuarriesId] [int] NULL,
	[SagId] [int] NULL,
	[Quantity] [int] NULL,
	[VehicleId] [int] NULL,
	[DestinationId] [int] NULL,
	[OriginId] [int] NULL,
	[ReceiptNo] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[DateCreated] [datetime2](7) NULL,
	[ReceiptDate] [datetime2](7) NULL,
	[ProductionDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Deliveries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [quarry].[Provinces]    Script Date: 9/5/2019 2:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quarry].[Provinces](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[SortOrder] [nchar](10) NULL,
 CONSTRAINT [PK_Provinces] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [quarry].[Receipts]    Script Date: 9/5/2019 2:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quarry].[Receipts](
	[Id] [int] NOT NULL,
	[Receipt] [nvarchar](255) NULL,
	[PermiteeId] [int] NULL,
 CONSTRAINT [PK_Receipts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [quarry].[Sags]    Script Date: 9/5/2019 2:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quarry].[Sags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitMeasurementId] [int] NULL,
	[Sag] [nvarchar](max) NULL,
	[UnitCost] [money] NULL,
 CONSTRAINT [PK_Sags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [quarry].[Towns]    Script Date: 9/5/2019 2:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quarry].[Towns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ProvinceId] [int] NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [quarry].[TransactionSags]    Script Date: 9/5/2019 2:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quarry].[TransactionSags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionId] [nvarchar](128) NULL,
	[SagId] [int] NULL,
	[UnitCost] [money] NULL,
	[Quantity] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_TransactionSags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [quarry].[UnitMeasurements]    Script Date: 9/5/2019 2:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quarry].[UnitMeasurements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitMeasure] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_UnitMeasurements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (1, N'Governor''s Business Permit Fees')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (2, N'Governor''s Accreditation Fees')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (4, N'Tax On Excess Sag Volume')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Facilities] ON 

INSERT [dbo].[Facilities] ([Id], [PermiteeId], [FacilityName], [Cost]) VALUES (1, NULL, N'Cement', 2000.0000)
INSERT [dbo].[Facilities] ([Id], [PermiteeId], [FacilityName], [Cost]) VALUES (2, NULL, N'Potteries and Cement Products Production ', 750.0000)
INSERT [dbo].[Facilities] ([Id], [PermiteeId], [FacilityName], [Cost]) VALUES (3, NULL, N'Pulverizing', 2000.0000)
INSERT [dbo].[Facilities] ([Id], [PermiteeId], [FacilityName], [Cost]) VALUES (4, NULL, N'Crushing', 2000.0000)
INSERT [dbo].[Facilities] ([Id], [PermiteeId], [FacilityName], [Cost]) VALUES (5, NULL, N'Batching ', 2000.0000)
INSERT [dbo].[Facilities] ([Id], [PermiteeId], [FacilityName], [Cost]) VALUES (6, NULL, N'Similar Plants', 2000.0000)
INSERT [dbo].[Facilities] ([Id], [PermiteeId], [FacilityName], [Cost]) VALUES (7, NULL, N'Processing', 750.0000)
SET IDENTITY_INSERT [dbo].[Facilities] OFF
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([Id], [ItemName], [UnitCost], [UnitMeasureId], [CategoryId], [SortOrder]) VALUES (1, N'Filing | Application Fee', 500.0000, 4, 1, 0)
INSERT [dbo].[Items] ([Id], [ItemName], [UnitCost], [UnitMeasureId], [CategoryId], [SortOrder]) VALUES (2, N'UP Research Foundation Fund (PD 1856)', 20.0000, 4, 1, 1)
INSERT [dbo].[Items] ([Id], [ItemName], [UnitCost], [UnitMeasureId], [CategoryId], [SortOrder]) VALUES (3, N'Processing | Verification | Inspections (Community | Site)', 1500.0000, 1, 1, 2)
INSERT [dbo].[Items] ([Id], [ItemName], [UnitCost], [UnitMeasureId], [CategoryId], [SortOrder]) VALUES (4, N'Sticker', 50.0000, 4, 2, 3)
INSERT [dbo].[Items] ([Id], [ItemName], [UnitCost], [UnitMeasureId], [CategoryId], [SortOrder]) VALUES (5, N'Filing Fee for Application of Governor''s Accredidation', 500.0000, 4, 2, 4)
INSERT [dbo].[Items] ([Id], [ItemName], [UnitCost], [UnitMeasureId], [CategoryId], [SortOrder]) VALUES (15, N'Delivery Receipt', 2.1000, 3, 4, 5)
INSERT [dbo].[Items] ([Id], [ItemName], [UnitCost], [UnitMeasureId], [CategoryId], [SortOrder]) VALUES (16, N'Transport Slip', 1.9950, 4, 4, 6)
SET IDENTITY_INSERT [dbo].[Items] OFF
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (20, N'Quarries', N'QuarryName=ddsssdsfsdf<br/>JurisdictionName=44sssdfsdf<br/>', N'QuarryName=ddsssdsfsdfasdasd<br/>JurisdictionName=44sssdfsdfasdasd<br/>', N'Update', CAST(N'2019-08-01T20:23:12.5561604' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (21, N'Vehicles', N'PlateNo=111<br/>Capacity=1233.0000<br/>Description=111<br/>', N'PlateNo=111sdfsdf<br/>Capacity=2222222<br/>Description=111sdfsdf<br/>', N'Update', CAST(N'2019-08-01T20:24:40.0027451' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (22, N'Vehicles', N'TransactionVehicles=System.Collections.Generic.HashSet`1[Models.TransactionVehicles]<br/>Facilities=System.Collections.Generic.HashSet`1[Models.Facilities]<br/>Deliveries=System.Collections.Generic.HashSet`1[Models.Deliveries]<br/>Id=1007<br/>PlateNo=111sdfsdf<br/>Capacity=2222222.0000<br/>Description=111sdfsdf<br/>', NULL, N'Delete', CAST(N'2019-08-01T20:28:04.6115687' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (24, N'Quarries', N'Permitees=System.Collections.Generic.HashSet`1[Models.Permitees]<br/>Deliveries=System.Collections.Generic.HashSet`1[Models.Deliveries]<br/>Id=1120<br/>QuarryName=x<br/>JurisdictionName=x<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>EntryByFullName=Joseph Panganiban<br/>EditedByFullName=Joseph Panganiban<br/>', NULL, N'Delete', CAST(N'2019-08-01T20:54:17.9583817' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (25, N'Quarries', N'Permitees=System.Collections.Generic.HashSet`1[Models.Permitees]<br/>Deliveries=System.Collections.Generic.HashSet`1[Models.Deliveries]<br/>Id=1121<br/>QuarryName=x<br/>JurisdictionName=x<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>EntryByFullName=Joseph Panganiban<br/>EditedByFullName=Joseph Panganiban<br/>', NULL, N'Delete', CAST(N'2019-08-01T20:57:33.5781746' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (26, N'TransactionDetails', N'Items=<br/>Transactions=<br/>TotalCost=500.0000<br/>CostAndQuantity=500.00/<br/>QuantityValue=1<br/>Id=3022<br/>TransactionId=<br/>ItemId=1<br/>Quantity=1<br/>UnitCost=500.0000<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>', NULL, N'Delete', CAST(N'2019-08-01T21:13:24.9620102' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (27, N'Particulars', N'SummaryProgramOfWorks=System.Collections.Generic.HashSet`1[Models.SummaryProgramOfWorks]<br/>Id=7<br/>Particular=xxxx<br/>', NULL, N'Delete', CAST(N'2019-08-01T21:26:32.2649181' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (28, N'Particulars', N'Particular=Concret Class "A"<br/>', N'Particular=Concret Class A<br/>', N'Update', CAST(N'2019-08-01T21:30:24.5068718' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (29, N'Permitees', N'FullName=Mark Christopher Ramos Cacal<br/>MiddleName=Ramos<br/>', N'FullName=Mark Christopher R Cacal<br/>MiddleName=R<br/>', N'Update', CAST(N'2019-08-01T21:39:11.0122287' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (30, N'Permitees', N'PermiteeTypes=<br/>Transactions=System.Collections.Generic.HashSet`1[Models.Transactions]<br/>Vehicles=System.Collections.Generic.HashSet`1[Models.Vehicles]<br/>Quarries=System.Collections.Generic.HashSet`1[Models.Quarries]<br/>Deliveries=System.Collections.Generic.HashSet`1[Models.Deliveries]<br/>Receipts=System.Collections.Generic.HashSet`1[Models.Receipts]<br/>ProgramOfWorks=System.Collections.Generic.HashSet`1[Models.ProgramOfWorks]<br/>FullName=Mark Christopher R Cacal<br/>QuarrySites=<br/>_QuarySites=<br/>Id=3<br/>TownCityId=<br/>PermiteeTypeId=<br/>FirstName=Mark Christopher<br/>LastName=Cacal<br/>MiddleName=R<br/>CompanyName=Tech Static<br/>AddressLine1=148-D National ROAD BAYOMBONG NUEVA VIZCAYA<br/>AddressLine2=<br/>EntryBy=<br/>LastEditedBy=<br/>AccreditationNumber=2019-472<br/>BusinessRegistration=XXX<br/>ContactNumber1=<br/>ContactNumber2=<br/>Email=<br/>', NULL, N'Delete', CAST(N'2019-08-01T21:39:45.3307388' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (31, N'ProgramOfWorks', N'', N'', N'Update', CAST(N'2019-08-06T20:24:22.8902860' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (32, N'Transactions', N'Permitees=<br/>TransactionDetails=System.Collections.Generic.HashSet`1[Models.TransactionDetails]<br/>TransactionVehicles=System.Collections.Generic.HashSet`1[Models.TransactionVehicles]<br/>TransactionFacilities=System.Collections.Generic.HashSet`1[Models.TransactionFacilities]<br/>TransactionSags=System.Collections.Generic.HashSet`1[Models.TransactionSags]<br/>TransactionTypes=<br/>DetailSubTotal=0<br/>VehicleSubTotal=0<br/>FacilitiesSubTotal=0<br/>SagSubTotal=0<br/>SagTotalQuantity=0<br/>Id=1955a78f-bdbd-48fc-93ca-b99e134471b7<br/>PermiteeId=<br/>TransactionDate=7/12/2019 8:50:41 AM<br/>TransactionTotal=16918.5500<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>IsPrinted=True<br/>TransactionTypeId=<br/>FilingDate=6/6/2019 12:00:00 AM<br/>Interest=<br/>Surcharge=<br/>', NULL, N'Delete', CAST(N'2019-08-06T22:21:32.6141326' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (33, N'Transactions', N'Permitees=<br/>TransactionDetails=System.Collections.Generic.HashSet`1[Models.TransactionDetails]<br/>TransactionVehicles=System.Collections.Generic.HashSet`1[Models.TransactionVehicles]<br/>TransactionFacilities=System.Collections.Generic.HashSet`1[Models.TransactionFacilities]<br/>TransactionSags=System.Collections.Generic.HashSet`1[Models.TransactionSags]<br/>TransactionTypes=<br/>DetailSubTotal=0<br/>VehicleSubTotal=0<br/>FacilitiesSubTotal=0<br/>SagSubTotal=0<br/>SagTotalQuantity=0<br/>Id=bd16056c-ee04-4e41-8e35-57153374cd47<br/>PermiteeId=<br/>TransactionDate=7/12/2019 9:57:44 AM<br/>TransactionTotal=20502.5500<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>IsPrinted=True<br/>TransactionTypeId=<br/>FilingDate=6/6/2019 12:00:00 AM<br/>Interest=384.0000<br/>Surcharge=3200.0000<br/>', NULL, N'Delete', CAST(N'2019-08-06T22:21:35.2659900' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (34, N'Transactions', N'Permitees=<br/>TransactionDetails=System.Collections.Generic.HashSet`1[Models.TransactionDetails]<br/>TransactionVehicles=System.Collections.Generic.HashSet`1[Models.TransactionVehicles]<br/>TransactionFacilities=System.Collections.Generic.HashSet`1[Models.TransactionFacilities]<br/>TransactionSags=System.Collections.Generic.HashSet`1[Models.TransactionSags]<br/>TransactionTypes=<br/>DetailSubTotal=0<br/>VehicleSubTotal=0<br/>FacilitiesSubTotal=0<br/>SagSubTotal=0<br/>SagTotalQuantity=0<br/>Id=edbc836b-e46a-4dd9-b96d-2ea4318c3adc<br/>PermiteeId=<br/>TransactionDate=7/24/2019 10:26:02 AM<br/>TransactionTotal=22000.0000<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>IsPrinted=True<br/>TransactionTypeId=<br/>FilingDate=<br/>Interest=<br/>Surcharge=<br/>', NULL, N'Delete', CAST(N'2019-08-06T22:21:52.2951354' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (35, N'TransactionSags', N'TotalCost=20.0000<br/>UnitCost=20.0000<br/>Quantity=1<br/>', N'TotalCost=1000<br/>UnitCost=20<br/>Quantity=50<br/>', N'Update', CAST(N'2019-08-06T22:22:27.6249006' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (36, N'Vehicles', N'', N'', N'Update', CAST(N'2019-08-06T23:53:03.2600182' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (37, N'Vehicles', N'', N'', N'Update', CAST(N'2019-08-06T23:53:23.1203663' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (38, N'Vehicles', N'Permitees=<br/>TransactionVehicles=System.Collections.Generic.HashSet`1[Models.TransactionVehicles]<br/>Facilities=System.Collections.Generic.HashSet`1[Models.Facilities]<br/>VehicleTypes=<br/>Deliveries=System.Collections.Generic.HashSet`1[Models.Deliveries]<br/>IsNew=False<br/>Id=1009<br/>PermiteeId=<br/>VehicleTypeId=<br/>PlateNo=123456<br/>Capacity=<br/>Description=<br/>', NULL, N'Delete', CAST(N'2019-08-07T00:02:43.3304130' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (39, N'Permitees', N'PermiteeTypes=<br/>Transactions=System.Collections.Generic.HashSet`1[Models.Transactions]<br/>Vehicles=System.Collections.Generic.HashSet`1[Models.Vehicles]<br/>Quarries=System.Collections.Generic.HashSet`1[Models.Quarries]<br/>Deliveries=System.Collections.Generic.HashSet`1[Models.Deliveries]<br/>Receipts=System.Collections.Generic.HashSet`1[Models.Receipts]<br/>ProgramOfWorks=System.Collections.Generic.HashSet`1[Models.ProgramOfWorks]<br/>FullName=First Name 123 12123<br/>QuarrySites=<br/>_QuarySites=<br/>ProductionLedgerReports=<br/>Id=1007<br/>TownCityId=<br/>PermiteeTypeId=<br/>FirstName=First Name<br/>LastName=12123<br/>MiddleName=123<br/>CompanyName=3<br/>AddressLine1=148-D National ROAD BAYOMBONG NUEVA VIZCAYA<br/>AddressLine2=<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>AccreditationNumber=2019-00180<br/>BusinessRegistration=12<br/>ContactNumber1=<br/>ContactNumber2=<br/>Email=<br/>', NULL, N'Delete', CAST(N'2019-08-07T16:15:45.4777915' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (40, N'Permitees', N'PermiteeTypes=<br/>FullName=aaa aa xx<br/>QuarrySites=<br/>_QuarySites=<br/>ProductionLedgerReports=<br/>Id=1008<br/>TownCityId=<br/>PermiteeTypeId=<br/>FirstName=aaa<br/>LastName=xx<br/>MiddleName=aa<br/>CompanyName=aa<br/>AddressLine1=aa<br/>AddressLine2=<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>AccreditationNumber=2019-00180<br/>BusinessRegistration=xx<br/>ContactNumber1=<br/>ContactNumber2=<br/>Email=<br/>', NULL, N'Delete', CAST(N'2019-08-07T16:22:12.6305766' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (41, N'Permitees', N'PermiteeTypes=<br/>FullName=Mark Ramos Cacal<br/>QuarrySites=<br/>_QuarySites=<br/>ProductionLedgerReports=<br/>Id=1011<br/>TownCityId=<br/>PermiteeTypeId=<br/>FirstName=Mark<br/>LastName=Cacal<br/>MiddleName=Ramos<br/>CompanyName=Northops<br/>AddressLine1=sss<br/>AddressLine2=<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>AccreditationNumber=2019-00180<br/>BusinessRegistration=commercial<br/>ContactNumber1=1111<br/>ContactNumber2=<br/>Email=mark@gmail.com<br/>', NULL, N'Delete', CAST(N'2019-08-08T20:30:55.9394174' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (42, N'Permitees', N'PermiteeTypes=<br/>FullName=Mark Ramos Cacal<br/>QuarrySites=<br/>_QuarySites=<br/>ProductionLedgerReports=<br/>Id=1013<br/>TownCityId=<br/>PermiteeTypeId=<br/>FirstName=Mark<br/>LastName=Cacal<br/>MiddleName=Ramos<br/>CompanyName=Northops<br/>AddressLine1=sss<br/>AddressLine2=<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>AccreditationNumber=2019-00181<br/>BusinessRegistration=commercial<br/>ContactNumber1=1111<br/>ContactNumber2=<br/>Email=mark@gmail.com<br/>', NULL, N'Delete', CAST(N'2019-08-08T21:50:49.8077439' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (43, N'Permitees', N'PermiteeTypes=<br/>FullName=Mark Ramos Cacal<br/>QuarrySites=<br/>_QuarySites=<br/>ProductionLedgerReports=<br/>Id=1014<br/>TownCityId=<br/>PermiteeTypeId=<br/>FirstName=Mark<br/>LastName=Cacal<br/>MiddleName=Ramos<br/>CompanyName=Northops<br/>AddressLine1=sss<br/>AddressLine2=<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>AccreditationNumber=2019-00181<br/>BusinessRegistration=commercial<br/>ContactNumber1=1111<br/>ContactNumber2=<br/>Email=mark@gmail.com<br/>', NULL, N'Delete', CAST(N'2019-08-08T22:15:26.5704484' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (44, N'Permitees', N'PermiteeTypes=<br/>FullName=Mark Ramos Cacal<br/>QuarrySites=<br/>_QuarySites=<br/>ProductionLedgerReports=<br/>Id=1012<br/>TownCityId=<br/>PermiteeTypeId=<br/>FirstName=Mark<br/>LastName=Cacal<br/>MiddleName=Ramos<br/>CompanyName=Northops<br/>AddressLine1=sss<br/>AddressLine2=<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>AccreditationNumber=2019-00180<br/>BusinessRegistration=commercial<br/>ContactNumber1=1111<br/>ContactNumber2=<br/>Email=mark@gmail.com<br/>', NULL, N'Delete', CAST(N'2019-08-08T22:15:49.4923698' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (45, N'Transactions', N'Permitees=<br/>TransactionTypes=<br/>DetailSubTotal=0<br/>VehicleSubTotal=0<br/>FacilitiesSubTotal=0<br/>SagSubTotal=0<br/>SagTotalQuantity=0<br/>Id=88d60245-1346-4057-bf5f-1f8db38a1a9c<br/>PermiteeId=<br/>TransactionDate=8/6/2019 10:22:36 PM<br/>TransactionTotal=2250.0000<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>IsPrinted=True<br/>TransactionTypeId=<br/>FilingDate=<br/>Interest=<br/>Surcharge=<br/>', NULL, N'Delete', CAST(N'2019-08-08T22:16:11.5077192' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (46, N'Vehicles', N'PlateNo=Hauling Track<br/>', N'PlateNo=Hauling Track >14<br/>', N'Update', CAST(N'2019-08-08T22:24:57.6406144' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (47, N'TransactionDetails', N'Items=<br/>Transactions=<br/>TotalCost=1500.0000<br/>CostAndQuantity=1,500.00/<br/>QuantityValue=1<br/>Id=3025<br/>TransactionId=<br/>ItemId=3<br/>Quantity=1<br/>UnitCost=1500.0000<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>', NULL, N'Delete', CAST(N'2019-08-08T22:28:55.7516861' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (48, N'Transactions', N'', N'', N'Update', CAST(N'2019-08-08T22:29:13.6056885' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (49, N'TransactionVehicles', N'Cost=750.0000<br/>', N'Cost=0<br/>', N'Update', CAST(N'2019-08-08T22:35:50.3197909' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (50, N'Transactions', N'', N'', N'Update', CAST(N'2019-08-08T22:35:56.7646384' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (51, N'Quarries', N'Id=117<br/>QuarryName=123456789<br/>JurisdictionName=123<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>EntryByFullName=Joseph Panganiban<br/>EditedByFullName=Joseph Panganiban<br/>', NULL, N'Delete', CAST(N'2019-08-13T12:25:11.6655593' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (52, N'Quarries', N'Id=118<br/>QuarryName=Boliwao1<br/>JurisdictionName=Boliwao1<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>EntryByFullName=Joseph Panganiban<br/>EditedByFullName=Joseph Panganiban<br/>', NULL, N'Delete', CAST(N'2019-08-13T12:25:18.3431927' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (53, N'TransactionPenalties', N'Transactions=<br/>Id=1<br/>TransactionId=<br/>Penalty=heheheh<br/>Amount=400.0000<br/>', NULL, N'Delete', CAST(N'2019-08-15T22:38:54.0667150' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (54, N'Transactions', N'', N'', N'Update', CAST(N'2019-08-15T22:55:19.5317808' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (55, N'Transactions', N'Permitees=<br/>TransactionTypes=<br/>DetailSubTotal=0<br/>VehicleSubTotal=0<br/>FacilitiesSubTotal=0<br/>SagSubTotal=0<br/>PenaltiesSubTotal=0<br/>SagTotalQuantity=0<br/>PenaltyCost=0<br/>Id=c99708a2-9f03-4d00-94eb-0281d64f4187<br/>PermiteeId=<br/>TransactionDate=8/8/2019 10:27:48 PM<br/>TransactionTotal=16918.5500<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>IsPrinted=True<br/>TransactionTypeId=<br/>FilingDate=6/24/2019 12:00:00 AM<br/>Interest=<br/>Surcharge=<br/>', NULL, N'Delete', CAST(N'2019-08-16T11:19:16.1992983' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (56, N'Transactions', N'Permitees=<br/>TransactionTypes=<br/>DetailSubTotal=0<br/>VehicleSubTotal=0<br/>FacilitiesSubTotal=0<br/>SagSubTotal=0<br/>PenaltiesSubTotal=0<br/>SagTotalQuantity=0<br/>PenaltyCost=0<br/>Id=122a65ed-e0c7-4ee0-be07-84e4b91b367f<br/>PermiteeId=<br/>TransactionDate=8/15/2019 10:48:10 PM<br/>TransactionTotal=193.0000<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>LastEditedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>IsPrinted=True<br/>TransactionTypeId=<br/>FilingDate=8/15/2019 12:00:00 AM<br/>Interest=<br/>Surcharge=<br/>', NULL, N'Delete', CAST(N'2019-08-16T11:19:18.2980819' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (57, N'TransactionVehicles', N'Transactions=<br/>Vehicles=<br/>isRenewStatus=Old<br/>Id=3041<br/>TransactionId=<br/>VehicleId=<br/>Cost=1500.0000<br/>isRenew=<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>EntryModifiedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>', NULL, N'Delete', CAST(N'2019-08-16T14:12:42.2302631' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (58, N'TransactionVehicles', N'Transactions=<br/>Vehicles=<br/>isRenewStatus=Old<br/>Id=3042<br/>TransactionId=<br/>VehicleId=<br/>Cost=1500.0000<br/>isRenew=<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>EntryModifiedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>', NULL, N'Delete', CAST(N'2019-08-16T14:12:45.2109077' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (59, N'TransactionVehicles', N'Transactions=<br/>Vehicles=<br/>isRenewStatus=Old<br/>Id=3043<br/>TransactionId=<br/>VehicleId=<br/>Cost=1500.0000<br/>isRenew=<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>EntryModifiedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>', NULL, N'Delete', CAST(N'2019-08-16T14:12:47.4244601' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (60, N'TransactionVehicles', N'Transactions=<br/>Vehicles=<br/>isRenewStatus=Old<br/>Id=3048<br/>TransactionId=<br/>VehicleId=<br/>Cost=1500.0000<br/>isRenew=<br/>EntryBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>EntryModifiedBy=b14c5c06-6f12-4258-9293-9a9a177251dc<br/>', NULL, N'Delete', CAST(N'2019-08-16T14:13:23.4858845' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (61, N'Transactions', N'', N'', N'Update', CAST(N'2019-08-16T14:15:53.5629863' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (62, N'Quarries', N'', N'', N'Update', CAST(N'2019-08-31T05:26:54.7489335' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (63, N'Quarries', N'', N'', N'Update', CAST(N'2019-08-31T05:30:11.9891841' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (64, N'Quarries', N'', N'', N'Update', CAST(N'2019-08-31T05:32:22.5785426' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (65, N'Quarries', N'', N'', N'Update', CAST(N'2019-08-31T05:33:15.8820717' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (66, N'Quarries', N'', N'', N'Update', CAST(N'2019-08-31T05:33:57.1002309' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (67, N'Quarries', N'', N'', N'Update', CAST(N'2019-08-31T05:34:20.3542320' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (68, N'Quarries', N'', N'', N'Update', CAST(N'2019-08-31T05:35:27.5017821' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Logs] ([Id], [TableName], [OldValues], [NewValues], [Action], [DateCreated], [CreatedBy]) VALUES (69, N'Quarries', N'', N'', N'Update', CAST(N'2019-08-31T05:35:53.5623532' AS DateTime2), N'b14c5c06-6f12-4258-9293-9a9a177251dc')
SET IDENTITY_INSERT [dbo].[Logs] OFF
SET IDENTITY_INSERT [dbo].[Particulars] ON 

INSERT [dbo].[Particulars] ([Id], [Particular]) VALUES (1, N'Gravel Blanket')
INSERT [dbo].[Particulars] ([Id], [Particular]) VALUES (2, N'Handlaid')
INSERT [dbo].[Particulars] ([Id], [Particular]) VALUES (3, N'Gravel Surfacing')
INSERT [dbo].[Particulars] ([Id], [Particular]) VALUES (4, N'Leveling Course')
INSERT [dbo].[Particulars] ([Id], [Particular]) VALUES (5, N'Concret Class A')
INSERT [dbo].[Particulars] ([Id], [Particular]) VALUES (6, N'Concrete Class "A" W/o Forms')
SET IDENTITY_INSERT [dbo].[Particulars] OFF
SET IDENTITY_INSERT [dbo].[Permitees] ON 

INSERT [dbo].[Permitees] ([Id], [AccreditationNumber], [TownCityId], [PermiteeTypeId], [FirstName], [LastName], [MiddleName], [CompanyName], [ContactNumber1], [ContactNumber2], [Email], [AddressLine1], [AddressLine2], [BusinessRegistration], [EntryBy], [LastEditedBy]) VALUES (2, N'2019-178', NULL, 3, N'Noly ', N'Okamoto', N'M. ', N'JAN-NORRIS CONSTRUCTION & SUPPLY', NULL, NULL, NULL, N'Metroville Sub., Munpulang Lupa, Valenzuela City, Manila', NULL, N'PCAB', NULL, NULL)
INSERT [dbo].[Permitees] ([Id], [AccreditationNumber], [TownCityId], [PermiteeTypeId], [FirstName], [LastName], [MiddleName], [CompanyName], [ContactNumber1], [ContactNumber2], [Email], [AddressLine1], [AddressLine2], [BusinessRegistration], [EntryBy], [LastEditedBy]) VALUES (1003, N'2019-00179', NULL, 3, N'Joseph', N'Panganiban', N'x', N'Tech Static', NULL, NULL, NULL, N'148-D National ROAD BAYOMBONG NUEVA VIZCAYA', NULL, N'123468', N'b97f5a28-5900-4787-bf54-7f4029796a6d', N'b97f5a28-5900-4787-bf54-7f4029796a6d')
INSERT [dbo].[Permitees] ([Id], [AccreditationNumber], [TownCityId], [PermiteeTypeId], [FirstName], [LastName], [MiddleName], [CompanyName], [ContactNumber1], [ContactNumber2], [Email], [AddressLine1], [AddressLine2], [BusinessRegistration], [EntryBy], [LastEditedBy]) VALUES (1015, N'2019-00181', NULL, NULL, N'Mark', N'Cacal', N'Ramos', N'Northops', N'1111', N'', N'mark@gmail.com', N'sss', N'', N'commercial', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
SET IDENTITY_INSERT [dbo].[Permitees] OFF
SET IDENTITY_INSERT [dbo].[PermiteeTypes] ON 

INSERT [dbo].[PermiteeTypes] ([Id], [PermiteeTypeName], [UnitCost]) VALUES (3, N'Premium', 3000.0000)
INSERT [dbo].[PermiteeTypes] ([Id], [PermiteeTypeName], [UnitCost]) VALUES (4, N'Commercial', 0.0000)
SET IDENTITY_INSERT [dbo].[PermiteeTypes] OFF
SET IDENTITY_INSERT [dbo].[ProgramOfWorks] ON 

INSERT [dbo].[ProgramOfWorks] ([Id], [PermitteeId], [Name], [Address], [Cost], [SourceFund], [DateStarted], [DateFinish], [Proponent], [QuarrySites], [DateCreated]) VALUES (1, 2, N'Rehabilitation', N'1212', NULL, N'1212', CAST(N'2019-07-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProgramOfWorks] OFF
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 88)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 89)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 90)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 91)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 92)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 93)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 94)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 95)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 96)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 97)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 98)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 99)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 100)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 101)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 102)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 103)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 104)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 105)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 106)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 107)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 108)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 109)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 110)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 111)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 112)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 113)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 114)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (2, 115)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1003, 88)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1003, 89)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1003, 90)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1003, 91)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 89)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 90)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 91)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 92)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 93)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 94)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 95)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 96)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 97)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 98)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 99)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 100)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 101)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 102)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 103)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 104)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 105)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 106)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 107)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 108)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 109)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 110)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 111)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 112)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 113)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 114)
INSERT [dbo].[QuariesInPermitees] ([PermiteeId], [QuarrieId]) VALUES (1015, 115)
SET IDENTITY_INSERT [dbo].[Quarries] ON 

INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (88, N'Boliwao', N'Boliwao', NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (89, N'Tuao North', N'Tuao North', NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (90, N'Bonfal East', N'Bonfal East', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (91, N'San Leonardo', N'San Leonardo', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (92, N'Sto. Domingo', N'Sto. Domingo', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (93, N'Bone South', N'Bone South', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (94, N'Banganan', N'Banganan', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (95, N'Siguem', N'Siguem', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (96, N'Capisaan', N'Capisaan', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (97, N'San Fabian', N'San Fabian', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (98, N'Bagahabag', NULL, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (99, N'Vista Hills', N'Vista Hills', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (100, N'Bonfal Proper', N'Bonfal Proper', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (101, N'Salinas', N'Salinas', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (102, N'Magapuy', N'Magapuy', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (103, N'Nagcuartelan', N'Nagcuartelan', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (104, N'Mangayang', N'Mangayang', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (105, N'Biyoy', N'Biyoy', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (106, N'Malabing', N'Malabing', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (107, N'Baracbac', N'Baracbac', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (108, N'Baretbet', N'Baretbet', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (109, N'Maddiangat', N'Maddiangat', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (110, N'Barat', N'Barat', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (111, N'Calitlitan', N'Calitlitan', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (112, N'Cutar', N'Cutar', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (113, N'Bitnong', N'Bitnong', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (114, N'Pudi', N'Pudi', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (115, N'VillaFlores', N'VillaFlores', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[Quarries] ([Id], [QuarryName], [JurisdictionName], [EntryBy], [LastEditedBy]) VALUES (116, N'Bone North', N'Bone North', N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
SET IDENTITY_INSERT [dbo].[Quarries] OFF
INSERT [dbo].[QuarriesInTowns] ([QuarryId], [TownId]) VALUES (89, 1)
INSERT [dbo].[QuarriesInTowns] ([QuarryId], [TownId]) VALUES (98, 1)
INSERT [dbo].[QuarriesInTowns] ([QuarryId], [TownId]) VALUES (98, 2)
SET IDENTITY_INSERT [dbo].[SummaryProgramOfWorks] ON 

INSERT [dbo].[SummaryProgramOfWorks] ([Id], [ParticularId], [SagId], [ProgramOfWorkId], [CreatedBy], [Quantity], [Price]) VALUES (9, 1, 4, 1, NULL, 550.7100, 25000.0000)
INSERT [dbo].[SummaryProgramOfWorks] ([Id], [ParticularId], [SagId], [ProgramOfWorkId], [CreatedBy], [Quantity], [Price]) VALUES (10, 3, 8, 1, NULL, 42.2500, 500.0000)
INSERT [dbo].[SummaryProgramOfWorks] ([Id], [ParticularId], [SagId], [ProgramOfWorkId], [CreatedBy], [Quantity], [Price]) VALUES (11, 2, 6, 1, NULL, 84.0000, 3600.0000)
SET IDENTITY_INSERT [dbo].[SummaryProgramOfWorks] OFF
SET IDENTITY_INSERT [dbo].[TransactionDetails] ON 

INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (1020, N'1de67895-2913-4652-a645-1b375ab85281', 1, 1, 500.0000, NULL, NULL)
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (1021, N'de9641e2-4e3a-43b4-9be3-60caed927aea', 1, 1, 500.0000, NULL, NULL)
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (1022, N'7c4c9ffb-fe31-489a-b05d-97cf3ab7e01a', 1, 1, 500.0000, NULL, NULL)
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (1023, N'7bd348a2-088c-40a5-9f44-8a40ce02aa6f', 2, 10, 20.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (1024, N'34e44cd5-72c7-483d-938f-6359a7af8056', 2, 10, 20.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (1025, N'bcd37b3c-0f99-437a-94f3-b245cfad2986', 5, 1, 50.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (1026, N'a78da922-246a-456c-b994-47d28b4412d9', 12, 1, 2000.0000, N'b97f5a28-5900-4787-bf54-7f4029796a6d', N'b97f5a28-5900-4787-bf54-7f4029796a6d')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (1027, N'5c1a8376-599e-4a6b-b886-536a72b2cb59', 4, 50, 50.0000, N'b97f5a28-5900-4787-bf54-7f4029796a6d', N'b97f5a28-5900-4787-bf54-7f4029796a6d')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (1028, N'7e415c5c-f559-4928-ada8-f05d282a2940', 2, 5, 20.0000, N'b97f5a28-5900-4787-bf54-7f4029796a6d', N'b97f5a28-5900-4787-bf54-7f4029796a6d')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (1029, N'5c1a8376-599e-4a6b-b886-536a72b2cb59', 1, 1, 500.0000, N'b97f5a28-5900-4787-bf54-7f4029796a6d', N'b97f5a28-5900-4787-bf54-7f4029796a6d')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (1030, N'5c1a8376-599e-4a6b-b886-536a72b2cb59', 11, 1, 750.0000, N'b97f5a28-5900-4787-bf54-7f4029796a6d', N'b97f5a28-5900-4787-bf54-7f4029796a6d')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (1031, N'5c1a8376-599e-4a6b-b886-536a72b2cb59', 14, 100, 20.0000, N'b97f5a28-5900-4787-bf54-7f4029796a6d', N'b97f5a28-5900-4787-bf54-7f4029796a6d')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2014, N'81b4d48f-c7db-4ed3-af30-ea8d7cec42d0', 1, 1, 500.0000, N'b97f5a28-5900-4787-bf54-7f4029796a6d', N'b97f5a28-5900-4787-bf54-7f4029796a6d')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2015, N'0055cc0d-539c-40b9-8f1f-5ba4b788f45d', 1, 1, 500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2016, N'8175c0ad-b0f3-4638-bb07-44f417ce377b', 1, 2, 500.0000, NULL, NULL)
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2017, N'b3ff2394-1e38-43b9-8932-f2cb0b9c941f', 1, 1, 500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2018, N'08d45e9e-db5e-4302-97ae-9cc5f02e07d2', 1, 1, 500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2019, N'08d45e9e-db5e-4302-97ae-9cc5f02e07d2', 2, 1, 20.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2020, N'08d45e9e-db5e-4302-97ae-9cc5f02e07d2', 3, 1, 1500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2021, N'08d45e9e-db5e-4302-97ae-9cc5f02e07d2', 4, 4, 50.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2022, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 1, 1, 500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2023, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 2, 1, 20.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2024, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 3, 2, 1500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2025, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 4, 1, 50.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2026, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 5, 1, 500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2027, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 15, 90, 2.1000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2028, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 16, 90, 1.9950, NULL, NULL)
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2029, N'bd16056c-ee04-4e41-8e35-57153374cd47', 1, 1, 500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2030, N'bd16056c-ee04-4e41-8e35-57153374cd47', 2, 1, 20.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2031, N'bd16056c-ee04-4e41-8e35-57153374cd47', 3, 2, 1500.0000, NULL, NULL)
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2032, N'bd16056c-ee04-4e41-8e35-57153374cd47', 4, 1, 50.0000, NULL, NULL)
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2033, N'bd16056c-ee04-4e41-8e35-57153374cd47', 5, 1, 500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2034, N'bd16056c-ee04-4e41-8e35-57153374cd47', 15, 90, 2.1000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (2035, N'bd16056c-ee04-4e41-8e35-57153374cd47', 16, 90, 1.9950, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3017, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 1, 1, 500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3018, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 2, 1, 20.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3019, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 3, 40, 1500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3020, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 4, 4, 50.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3023, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 1, 1, 500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3024, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 2, 1, 20.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3026, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 4, 1, 50.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3027, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 5, 1, 500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3028, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 15, 90, 2.1000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3029, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 16, 90, 1.9950, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3030, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 3, 2, 1500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3031, N'884cfab6-aacc-48e3-b89e-add160008928', 1, 1, 500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3032, N'884cfab6-aacc-48e3-b89e-add160008928', 2, 1, 20.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3033, N'884cfab6-aacc-48e3-b89e-add160008928', 3, 1, 1500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3034, N'884cfab6-aacc-48e3-b89e-add160008928', 4, 8, 50.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3035, N'884cfab6-aacc-48e3-b89e-add160008928', 5, 1, 500.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3036, N'884cfab6-aacc-48e3-b89e-add160008928', 15, 50, 2.1000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionDetails] ([Id], [TransactionId], [ItemId], [Quantity], [UnitCost], [EntryBy], [LastEditedBy]) VALUES (3037, N'884cfab6-aacc-48e3-b89e-add160008928', 16, 50, 1.9950, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
SET IDENTITY_INSERT [dbo].[TransactionDetails] OFF
SET IDENTITY_INSERT [dbo].[TransactionFacilities] ON 

INSERT [dbo].[TransactionFacilities] ([Id], [TransactionId], [FacilitiesId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (10, N'b5e4427d-09d2-4ae0-b538-6ce806b5602c', 1, 2000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionFacilities] ([Id], [TransactionId], [FacilitiesId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (11, N'7e415c5c-f559-4928-ada8-f05d282a2940', 1, 2000.0000, 1, N'b97f5a28-5900-4787-bf54-7f4029796a6d', N'b97f5a28-5900-4787-bf54-7f4029796a6d')
INSERT [dbo].[TransactionFacilities] ([Id], [TransactionId], [FacilitiesId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (12, N'7e415c5c-f559-4928-ada8-f05d282a2940', 2, 750.0000, 1, N'b97f5a28-5900-4787-bf54-7f4029796a6d', N'b97f5a28-5900-4787-bf54-7f4029796a6d')
INSERT [dbo].[TransactionFacilities] ([Id], [TransactionId], [FacilitiesId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (13, N'd7f4fc58-0a29-48ce-a469-85a6754cba5c', 1, 2000.0000, NULL, N'b97f5a28-5900-4787-bf54-7f4029796a6d', N'b97f5a28-5900-4787-bf54-7f4029796a6d')
INSERT [dbo].[TransactionFacilities] ([Id], [TransactionId], [FacilitiesId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (14, N'5c1a8376-599e-4a6b-b886-536a72b2cb59', 1, 2000.0000, NULL, N'b97f5a28-5900-4787-bf54-7f4029796a6d', N'b97f5a28-5900-4787-bf54-7f4029796a6d')
INSERT [dbo].[TransactionFacilities] ([Id], [TransactionId], [FacilitiesId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (1010, N'0055cc0d-539c-40b9-8f1f-5ba4b788f45d', 1, 2000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionFacilities] ([Id], [TransactionId], [FacilitiesId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (1011, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 1, 2000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionFacilities] ([Id], [TransactionId], [FacilitiesId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (1012, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 2, 750.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionFacilities] ([Id], [TransactionId], [FacilitiesId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (1013, N'bd16056c-ee04-4e41-8e35-57153374cd47', 1, 2000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionFacilities] ([Id], [TransactionId], [FacilitiesId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (1014, N'bd16056c-ee04-4e41-8e35-57153374cd47', 2, 750.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionFacilities] ([Id], [TransactionId], [FacilitiesId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2011, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 1, 2000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionFacilities] ([Id], [TransactionId], [FacilitiesId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2012, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 2, 750.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionFacilities] ([Id], [TransactionId], [FacilitiesId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2013, N'884cfab6-aacc-48e3-b89e-add160008928', 1, 2000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionFacilities] ([Id], [TransactionId], [FacilitiesId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2014, N'884cfab6-aacc-48e3-b89e-add160008928', 7, 750.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
SET IDENTITY_INSERT [dbo].[TransactionFacilities] OFF
SET IDENTITY_INSERT [dbo].[TransactionPenalties] ON 

INSERT [dbo].[TransactionPenalties] ([Id], [TransactionId], [Penalty], [Amount]) VALUES (2, N'c99708a2-9f03-4d00-94eb-0281d64f4187', N'jljlk', 500.0000)
INSERT [dbo].[TransactionPenalties] ([Id], [TransactionId], [Penalty], [Amount]) VALUES (3, N'122a65ed-e0c7-4ee0-be07-84e4b91b367f', N'esdfsd', 123.0000)
SET IDENTITY_INSERT [dbo].[TransactionPenalties] OFF
INSERT [dbo].[Transactions] ([Id], [OfficialReceipt], [PermiteeId], [TransactionTypeId], [TransactionDate], [TransactionTotal], [EntryBy], [LastEditedBy], [IsPrinted], [FilingDate], [Interest], [Surcharge]) VALUES (N'884cfab6-aacc-48e3-b89e-add160008928', NULL, 2, 1, CAST(N'2019-08-16T14:15:08.987' AS DateTime), 18424.7500, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc', 1, CAST(N'2019-08-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Transactions] ([Id], [OfficialReceipt], [PermiteeId], [TransactionTypeId], [TransactionDate], [TransactionTotal], [EntryBy], [LastEditedBy], [IsPrinted], [FilingDate], [Interest], [Surcharge]) VALUES (N'e7feeef5-7ebc-447d-9d5a-00b9c4de911d', N'1234828482', 2, 3, CAST(N'2019-09-03T14:37:36.177' AS DateTime), 9350.0000, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TransactionTypes] ON 

INSERT [dbo].[TransactionTypes] ([Id], [TransactionType]) VALUES (1, N'New')
INSERT [dbo].[TransactionTypes] ([Id], [TransactionType]) VALUES (2, N'Renew')
INSERT [dbo].[TransactionTypes] ([Id], [TransactionType]) VALUES (3, N'Additional Sag')
SET IDENTITY_INSERT [dbo].[TransactionTypes] OFF
SET IDENTITY_INSERT [dbo].[TransactionVehicles] ON 

INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2005, N'08d45e9e-db5e-4302-97ae-9cc5f02e07d2', 21, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2006, N'08d45e9e-db5e-4302-97ae-9cc5f02e07d2', 22, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2007, N'08d45e9e-db5e-4302-97ae-9cc5f02e07d2', 23, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2008, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 54, 2500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2009, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 55, 2000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2010, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 53, 2500.0000, NULL, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2011, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 56, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2012, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 57, 1000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2013, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 58, 0.0000, NULL, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2014, N'bd16056c-ee04-4e41-8e35-57153374cd47', 53, 2500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2015, N'bd16056c-ee04-4e41-8e35-57153374cd47', 54, 2500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2016, N'bd16056c-ee04-4e41-8e35-57153374cd47', 55, 2000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2017, N'bd16056c-ee04-4e41-8e35-57153374cd47', 56, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2018, N'bd16056c-ee04-4e41-8e35-57153374cd47', 57, 1000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (2019, N'bd16056c-ee04-4e41-8e35-57153374cd47', 58, 0.0000, NULL, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3004, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 21, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3005, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 22, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3006, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 37, 1000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3007, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 23, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3008, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 24, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3009, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 25, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3010, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 25, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3011, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 26, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3012, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 27, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3013, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 28, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3014, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 29, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3015, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 30, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3016, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 31, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3017, N'93ce22d8-728b-4f4a-9cb7-ca93ca4af956', 32, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3020, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 21, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3021, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 22, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3022, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 23, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3023, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 24, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3024, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 25, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3025, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 26, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3026, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 27, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3027, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 28, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3028, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 29, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3029, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 30, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3030, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 31, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3031, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 32, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3032, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 33, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3033, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 34, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3034, N'edbc836b-e46a-4dd9-b96d-2ea4318c3adc', 35, 1000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3035, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 1010, 2500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3036, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 1011, 2500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3037, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 1012, 2000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3038, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 1013, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3039, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 1014, 1000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3040, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 1015, 0.0000, NULL, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3044, N'884cfab6-aacc-48e3-b89e-add160008928', 21, 2500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3045, N'884cfab6-aacc-48e3-b89e-add160008928', 22, 2500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3046, N'884cfab6-aacc-48e3-b89e-add160008928', 23, 2000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3047, N'884cfab6-aacc-48e3-b89e-add160008928', 24, 1500.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3049, N'884cfab6-aacc-48e3-b89e-add160008928', 25, 1000.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[TransactionVehicles] ([Id], [TransactionId], [VehicleId], [Cost], [isRenew], [EntryBy], [EntryModifiedBy]) VALUES (3050, N'884cfab6-aacc-48e3-b89e-add160008928', 26, 750.0000, NULL, N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
SET IDENTITY_INSERT [dbo].[TransactionVehicles] OFF
INSERT [dbo].[UserRoles] ([Id], [Name], [Description]) VALUES (N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Admin', N'Administrator')
INSERT [dbo].[UserRoles] ([Id], [Name], [Description]) VALUES (N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Supervisor', NULL)
SET IDENTITY_INSERT [dbo].[UserRolesInActions] ON 

INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (1, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (2, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (3, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (4, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (5, NULL, N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (6, NULL, N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (7, NULL, N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (8, NULL, N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (9, NULL, N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (10, NULL, N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (11, NULL, N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (12, NULL, N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (13, NULL, N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (14, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (15, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (16, NULL, N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (17, NULL, N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (18, NULL, N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (19, NULL, N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (20, NULL, N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (21, NULL, N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (22, NULL, N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (23, NULL, N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (24, NULL, N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (25, NULL, N'Add Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (26, NULL, N'Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (27, NULL, N'Delete Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (28, NULL, N'Edit Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (29, NULL, N'Add Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (30, NULL, N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (31, NULL, N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (32, NULL, N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (33, NULL, N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (34, NULL, N'Add Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (35, NULL, N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (36, NULL, N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (37, NULL, N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (38, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (39, NULL, N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (40, NULL, N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (41, NULL, N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (42, NULL, N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (43, NULL, N'Delete Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (44, NULL, N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (45, N'd83ac277-ac04-4118-9c05-363da0cd809c', N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (46, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (47, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (48, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (49, NULL, N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (50, NULL, N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (51, NULL, N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (52, NULL, N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (53, NULL, N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (54, NULL, N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (55, NULL, N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (56, NULL, N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (57, NULL, N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (58, NULL, N'Add Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (59, NULL, N'Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (60, NULL, N'Delete Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (61, NULL, N'Edit Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (62, NULL, N'Add Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (63, NULL, N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (64, NULL, N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (65, NULL, N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (66, NULL, N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (67, NULL, N'Add Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (68, NULL, N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (69, NULL, N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (70, NULL, N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (71, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (72, NULL, N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (73, NULL, N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (74, NULL, N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (75, NULL, N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (76, NULL, N'Delete Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (77, NULL, N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (78, NULL, N'Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (79, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (80, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (81, NULL, N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (82, NULL, N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (83, NULL, N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (84, NULL, N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (85, NULL, N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (86, NULL, N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (87, NULL, N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (88, NULL, N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (89, NULL, N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (90, NULL, N'Add Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (91, NULL, N'Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (92, NULL, N'Delete Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (93, NULL, N'Edit Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (94, NULL, N'Add Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (95, NULL, N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (96, NULL, N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (97, NULL, N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (98, NULL, N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (99, NULL, N'Add Transaction Items')
GO
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (100, NULL, N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (101, NULL, N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (102, NULL, N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (103, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (104, NULL, N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (105, NULL, N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (106, NULL, N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (107, NULL, N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (108, NULL, N'Delete Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (109, NULL, N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (110, NULL, N'Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (111, NULL, N'Add Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (112, NULL, N'Add Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (113, NULL, N'Delete Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (114, NULL, N'Update Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (115, NULL, N'Add Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (116, NULL, N'Delete Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (117, NULL, N'Update Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (118, NULL, N'Print Billing Statement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (119, NULL, N'Delete Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (120, NULL, N'Update Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (121, NULL, N'Add Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (122, NULL, N'Delete Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (123, NULL, N'Update Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (124, NULL, N'Add Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (125, NULL, N'Delete Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (126, NULL, N'Update Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (127, NULL, N'Add User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (128, NULL, N'User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (129, NULL, N'Update User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (130, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (131, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (132, NULL, N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (133, NULL, N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (134, NULL, N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (135, NULL, N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (136, NULL, N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (137, NULL, N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (138, NULL, N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (139, NULL, N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (140, NULL, N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (141, NULL, N'Add Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (142, NULL, N'Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (143, NULL, N'Delete Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (144, NULL, N'Edit Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (145, NULL, N'Add Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (146, NULL, N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (147, NULL, N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (148, NULL, N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (149, NULL, N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (150, NULL, N'Add Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (151, NULL, N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (152, NULL, N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (153, NULL, N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (154, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (155, NULL, N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (156, NULL, N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (157, NULL, N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (158, NULL, N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (159, NULL, N'Delete Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (160, NULL, N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (161, NULL, N'Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (162, NULL, N'Add Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (163, NULL, N'Add Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (164, NULL, N'Delete Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (165, NULL, N'Update Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (166, NULL, N'Add Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (167, NULL, N'Delete Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (168, NULL, N'Update Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (169, NULL, N'Print Billing Statement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (170, NULL, N'Delete Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (171, NULL, N'Update Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (172, NULL, N'Add Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (173, NULL, N'Delete Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (174, NULL, N'Update Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (175, NULL, N'Add Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (176, NULL, N'Delete Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (177, NULL, N'Update Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (178, NULL, N'Add User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (179, NULL, N'User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (180, NULL, N'Update User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (181, NULL, N'Delete User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (182, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (183, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (184, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (185, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (186, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (187, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (188, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (189, NULL, N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (190, NULL, N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (191, NULL, N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (192, NULL, N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (193, NULL, N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (194, NULL, N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (195, NULL, N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (196, NULL, N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (197, NULL, N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (198, NULL, N'Add Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (199, NULL, N'Users')
GO
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (200, NULL, N'Delete Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (201, NULL, N'Edit Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (202, NULL, N'Add Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (203, NULL, N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (204, NULL, N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (205, NULL, N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (206, NULL, N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (207, NULL, N'Add Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (208, NULL, N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (209, NULL, N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (210, NULL, N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (211, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (212, NULL, N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (213, NULL, N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (214, NULL, N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (215, NULL, N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (216, NULL, N'Delete Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (217, NULL, N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (218, NULL, N'Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (219, NULL, N'Add Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (220, NULL, N'Add Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (221, NULL, N'Delete Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (222, NULL, N'Update Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (223, NULL, N'Add Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (224, NULL, N'Delete Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (225, NULL, N'Update Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (226, NULL, N'Print Billing Statement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (227, NULL, N'Delete Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (228, NULL, N'Update Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (229, NULL, N'Add Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (230, NULL, N'Delete Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (231, NULL, N'Update Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (232, NULL, N'Add Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (233, NULL, N'Delete Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (234, NULL, N'Update Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (235, NULL, N'Add User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (236, NULL, N'User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (237, NULL, N'Update User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (238, NULL, N'Delete User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (239, NULL, N'Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (240, NULL, N'Add Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (241, NULL, N'Delete Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (242, NULL, N'Update Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (243, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (244, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (245, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (246, NULL, N'Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (247, NULL, N'Add Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (248, NULL, N'Delete Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (249, NULL, N'Update Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (250, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (251, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (252, NULL, N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (253, NULL, N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (254, NULL, N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (255, NULL, N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (256, NULL, N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (257, NULL, N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (258, NULL, N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (259, NULL, N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (260, NULL, N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (261, NULL, N'Add Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (262, NULL, N'Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (263, NULL, N'Delete Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (264, NULL, N'Edit Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (265, NULL, N'Add Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (266, NULL, N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (267, NULL, N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (268, NULL, N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (269, NULL, N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (270, NULL, N'Add Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (271, NULL, N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (272, NULL, N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (273, NULL, N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (274, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (275, NULL, N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (276, NULL, N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (277, NULL, N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (278, NULL, N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (279, NULL, N'Delete Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (280, NULL, N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (281, NULL, N'Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (282, NULL, N'Add Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (283, NULL, N'Add Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (284, NULL, N'Delete Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (285, NULL, N'Update Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (286, NULL, N'Add Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (287, NULL, N'Delete Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (288, NULL, N'Update Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (289, NULL, N'Print Billing Statement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (290, NULL, N'Delete Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (291, NULL, N'Update Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (292, NULL, N'Add Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (293, NULL, N'Delete Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (294, NULL, N'Update Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (295, NULL, N'Add Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (296, NULL, N'Delete Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (297, NULL, N'Update Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (298, NULL, N'Add User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (299, NULL, N'User Roles')
GO
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (300, NULL, N'Update User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (301, NULL, N'Delete User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (302, NULL, N'Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (303, NULL, N'Add Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (304, NULL, N'Delete Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (305, NULL, N'Update Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (306, NULL, N'Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (307, NULL, N'Add Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (308, NULL, N'Delete Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (309, NULL, N'Update Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (310, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (311, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (312, NULL, N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (313, NULL, N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (314, NULL, N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (315, NULL, N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (316, NULL, N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (317, NULL, N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (318, NULL, N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (319, NULL, N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (320, NULL, N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (321, NULL, N'Add Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (322, NULL, N'Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (323, NULL, N'Delete Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (324, NULL, N'Edit Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (325, NULL, N'Add Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (326, NULL, N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (327, NULL, N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (328, NULL, N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (329, NULL, N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (330, NULL, N'Add Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (331, NULL, N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (332, NULL, N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (333, NULL, N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (334, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (335, NULL, N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (336, NULL, N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (337, NULL, N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (338, NULL, N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (339, NULL, N'Delete Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (340, NULL, N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (341, NULL, N'Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (342, NULL, N'Add Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (343, NULL, N'Add Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (344, NULL, N'Delete Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (345, NULL, N'Update Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (346, NULL, N'Add Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (347, NULL, N'Delete Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (348, NULL, N'Update Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (349, NULL, N'Print Billing Statement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (350, NULL, N'Delete Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (351, NULL, N'Update Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (352, NULL, N'Add Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (353, NULL, N'Delete Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (354, NULL, N'Update Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (355, NULL, N'Add Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (356, NULL, N'Delete Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (357, NULL, N'Update Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (358, NULL, N'Add User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (359, NULL, N'User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (360, NULL, N'Update User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (361, NULL, N'Delete User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (362, NULL, N'Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (363, NULL, N'Add Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (364, NULL, N'Delete Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (365, NULL, N'Update Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (366, NULL, N'Delete Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (367, NULL, N'Update Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (368, NULL, N'Add Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (369, NULL, N'Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (370, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (371, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (372, NULL, N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (373, NULL, N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (374, NULL, N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (375, NULL, N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (376, NULL, N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (377, NULL, N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (378, NULL, N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (379, NULL, N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (380, NULL, N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (381, NULL, N'Add Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (382, NULL, N'Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (383, NULL, N'Delete Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (384, NULL, N'Edit Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (385, NULL, N'Add Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (386, NULL, N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (387, NULL, N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (388, NULL, N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (389, NULL, N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (390, NULL, N'Add Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (391, NULL, N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (392, NULL, N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (393, NULL, N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (394, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (395, NULL, N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (396, NULL, N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (397, NULL, N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (398, NULL, N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (399, NULL, N'Delete Vehicle Types')
GO
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (400, NULL, N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (401, NULL, N'Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (402, NULL, N'Add Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (403, NULL, N'Add Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (404, NULL, N'Delete Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (405, NULL, N'Update Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (406, NULL, N'Add Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (407, NULL, N'Delete Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (408, NULL, N'Update Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (409, NULL, N'Print Billing Statement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (410, NULL, N'Delete Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (411, NULL, N'Update Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (412, NULL, N'Add Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (413, NULL, N'Delete Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (414, NULL, N'Update Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (415, NULL, N'Add Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (416, NULL, N'Delete Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (417, NULL, N'Update Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (418, NULL, N'Add User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (419, NULL, N'User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (420, NULL, N'Update User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (421, NULL, N'Delete User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (422, NULL, N'Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (423, NULL, N'Add Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (424, NULL, N'Delete Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (425, NULL, N'Update Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (426, NULL, N'Delete Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (427, NULL, N'Update Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (428, NULL, N'Add Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (429, NULL, N'Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (430, NULL, N'Import Permittees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (431, NULL, N'Import Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (432, NULL, N'Import Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (433, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (434, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (435, NULL, N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (436, NULL, N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (437, NULL, N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (438, NULL, N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (439, NULL, N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (440, NULL, N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (441, NULL, N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (442, NULL, N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (443, NULL, N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (444, NULL, N'Add Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (445, NULL, N'Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (446, NULL, N'Delete Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (447, NULL, N'Edit Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (448, NULL, N'Add Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (449, NULL, N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (450, NULL, N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (451, NULL, N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (452, NULL, N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (453, NULL, N'Add Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (454, NULL, N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (455, NULL, N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (456, NULL, N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (457, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (458, NULL, N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (459, NULL, N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (460, NULL, N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (461, NULL, N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (462, NULL, N'Delete Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (463, NULL, N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (464, NULL, N'Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (465, NULL, N'Add Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (466, NULL, N'Add Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (467, NULL, N'Delete Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (468, NULL, N'Update Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (469, NULL, N'Add Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (470, NULL, N'Delete Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (471, NULL, N'Update Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (472, NULL, N'Print Billing Statement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (473, NULL, N'Delete Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (474, NULL, N'Update Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (475, NULL, N'Add Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (476, NULL, N'Delete Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (477, NULL, N'Update Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (478, NULL, N'Add Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (479, NULL, N'Delete Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (480, NULL, N'Update Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (481, NULL, N'Add User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (482, NULL, N'User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (483, NULL, N'Update User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (484, NULL, N'Delete User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (485, NULL, N'Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (486, NULL, N'Add Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (487, NULL, N'Delete Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (488, NULL, N'Update Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (489, NULL, N'Delete Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (490, NULL, N'Update Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (491, NULL, N'Add Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (492, NULL, N'Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (493, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (494, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (495, NULL, N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (496, NULL, N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (497, NULL, N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (498, NULL, N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (499, NULL, N'Update Permitee')
GO
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (500, NULL, N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (501, NULL, N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (502, NULL, N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (503, NULL, N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (504, NULL, N'Add Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (505, NULL, N'Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (506, NULL, N'Delete Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (507, NULL, N'Edit Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (508, NULL, N'Add Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (509, NULL, N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (510, NULL, N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (511, NULL, N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (512, NULL, N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (513, NULL, N'Add Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (514, NULL, N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (515, NULL, N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (516, NULL, N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (517, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (518, NULL, N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (519, NULL, N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (520, NULL, N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (521, NULL, N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (522, NULL, N'Delete Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (523, NULL, N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (524, NULL, N'Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (525, NULL, N'Add Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (526, NULL, N'Add Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (527, NULL, N'Delete Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (528, NULL, N'Update Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (529, NULL, N'Add Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (530, NULL, N'Delete Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (531, NULL, N'Update Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (532, NULL, N'Print Billing Statement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (533, NULL, N'Delete Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (534, NULL, N'Update Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (535, NULL, N'Add Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (536, NULL, N'Delete Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (537, NULL, N'Update Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (538, NULL, N'Add Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (539, NULL, N'Delete Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (540, NULL, N'Update Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (541, NULL, N'Add User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (542, NULL, N'User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (543, NULL, N'Update User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (544, NULL, N'Delete User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (545, NULL, N'Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (546, NULL, N'Add Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (547, NULL, N'Delete Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (548, NULL, N'Update Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (549, NULL, N'Delete Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (550, NULL, N'Update Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (551, NULL, N'Add Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (552, NULL, N'Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (553, NULL, N'Import Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (554, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (555, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (556, NULL, N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (557, NULL, N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (558, NULL, N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (559, NULL, N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (560, NULL, N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (561, NULL, N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (562, NULL, N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (563, NULL, N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (564, NULL, N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (565, NULL, N'Add Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (566, NULL, N'Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (567, NULL, N'Delete Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (568, NULL, N'Edit Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (569, NULL, N'Add Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (570, NULL, N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (571, NULL, N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (572, NULL, N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (573, NULL, N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (574, NULL, N'Add Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (575, NULL, N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (576, NULL, N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (577, NULL, N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (578, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (579, NULL, N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (580, NULL, N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (581, NULL, N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (582, NULL, N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (583, NULL, N'Delete Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (584, NULL, N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (585, NULL, N'Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (586, NULL, N'Add Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (587, NULL, N'Add Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (588, NULL, N'Delete Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (589, NULL, N'Update Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (590, NULL, N'Add Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (591, NULL, N'Delete Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (592, NULL, N'Update Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (593, NULL, N'Print Billing Statement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (594, NULL, N'Delete Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (595, NULL, N'Update Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (596, NULL, N'Add Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (597, NULL, N'Delete Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (598, NULL, N'Update Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (599, NULL, N'Add Transaction Vehicles')
GO
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (600, NULL, N'Delete Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (601, NULL, N'Update Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (602, NULL, N'Add User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (603, NULL, N'User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (604, NULL, N'Update User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (605, NULL, N'Delete User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (606, NULL, N'Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (607, NULL, N'Add Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (608, NULL, N'Delete Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (609, NULL, N'Update Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (610, NULL, N'Delete Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (611, NULL, N'Update Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (612, NULL, N'Add Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (613, NULL, N'Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (614, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (615, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (616, NULL, N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (617, NULL, N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (618, NULL, N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (619, NULL, N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (620, NULL, N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (621, NULL, N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (622, NULL, N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (623, NULL, N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (624, NULL, N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (625, NULL, N'Add Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (626, NULL, N'Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (627, NULL, N'Delete Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (628, NULL, N'Edit Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (629, NULL, N'Add Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (630, NULL, N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (631, NULL, N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (632, NULL, N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (633, NULL, N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (634, NULL, N'Add Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (635, NULL, N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (636, NULL, N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (637, NULL, N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (638, NULL, N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (639, NULL, N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (640, NULL, N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (641, NULL, N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (642, NULL, N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (643, NULL, N'Delete Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (644, NULL, N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (645, NULL, N'Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (646, NULL, N'Add Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (647, NULL, N'Add Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (648, NULL, N'Delete Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (649, NULL, N'Update Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (650, NULL, N'Add Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (651, NULL, N'Delete Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (652, NULL, N'Update Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (653, NULL, N'Print Billing Statement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (654, NULL, N'Delete Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (655, NULL, N'Update Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (656, NULL, N'Add Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (657, NULL, N'Delete Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (658, NULL, N'Update Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (659, NULL, N'Add Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (660, NULL, N'Delete Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (661, NULL, N'Update Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (662, NULL, N'Add User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (663, NULL, N'User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (664, NULL, N'Update User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (665, NULL, N'Delete User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (666, NULL, N'Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (667, NULL, N'Add Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (668, NULL, N'Delete Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (669, NULL, N'Update Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (670, NULL, N'Delete Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (671, NULL, N'Update Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (672, NULL, N'Add Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (673, NULL, N'Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (674, NULL, N'Import Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (675, NULL, N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (676, NULL, N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (677, NULL, N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (678, NULL, N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (679, NULL, N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (680, NULL, N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (681, NULL, N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (682, NULL, N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (683, NULL, N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (684, NULL, N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (685, NULL, N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (686, NULL, N'Add Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (687, NULL, N'Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (688, NULL, N'Delete Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (689, NULL, N'Edit Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (690, NULL, N'Add Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (691, NULL, N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (692, NULL, N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (693, NULL, N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (694, NULL, N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (695, NULL, N'Add Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (696, NULL, N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (697, NULL, N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (698, NULL, N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (699, NULL, N'Facilities')
GO
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (700, NULL, N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (701, NULL, N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (702, NULL, N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (703, NULL, N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (704, NULL, N'Delete Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (705, NULL, N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (706, NULL, N'Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (707, NULL, N'Add Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (708, NULL, N'Add Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (709, NULL, N'Delete Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (710, NULL, N'Update Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (711, NULL, N'Add Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (712, NULL, N'Delete Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (713, NULL, N'Update Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (714, NULL, N'Print Billing Statement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (715, NULL, N'Delete Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (716, NULL, N'Update Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (717, NULL, N'Add Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (718, NULL, N'Delete Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (719, NULL, N'Update Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (720, NULL, N'Add Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (721, NULL, N'Delete Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (722, NULL, N'Update Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (723, NULL, N'Add User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (724, NULL, N'User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (725, NULL, N'Update User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (726, NULL, N'Delete User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (727, NULL, N'Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (728, NULL, N'Add Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (729, NULL, N'Delete Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (730, NULL, N'Update Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (731, NULL, N'Delete Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (732, NULL, N'Update Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (733, NULL, N'Add Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (734, NULL, N'Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (735, NULL, N'Import Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (736, NULL, N'Import Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (737, NULL, N'Import Permittees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (738, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (739, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (740, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (741, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (742, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Add Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (743, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Delete Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (744, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Update Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (745, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Add Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (746, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Update Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (747, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (748, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (749, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (750, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (751, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (752, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (753, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (754, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (755, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (756, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Add Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (757, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (758, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (759, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Add Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (760, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (761, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Update Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (762, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (763, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (764, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Add Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (765, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (766, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (767, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (768, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (769, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (770, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Import Permittees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (771, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Import Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (772, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Import Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (773, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (774, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Add Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (775, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Update Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (776, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (777, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Print Billing Statement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (778, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Add Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (779, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Update Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (780, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Add Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (781, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Update Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (782, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Add Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (783, N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'Update Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (784, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Categories')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (785, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (786, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (787, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Update Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (788, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (789, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (790, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Update Permitee')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (791, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Permitees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (792, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (793, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (794, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Update Permitee Type')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (795, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (796, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (797, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (798, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Edit Users')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (799, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add Vehicles')
GO
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (800, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (801, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'UnitOfMeasurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (802, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Update Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (803, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (804, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add Transaction Items')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (805, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'TransactionItems')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (806, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (807, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'PermiteeTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (808, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Facilities')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (809, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (810, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Update Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (811, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'VehicleTypes')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (812, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (813, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (814, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Update Vehicle Types')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (815, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (816, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (817, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (818, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (819, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Update Category')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (820, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (821, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (822, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Update Unit Measurement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (823, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Print Billing Statement')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (824, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (825, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Update Transaction Details')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (826, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (827, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (828, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Update Transactions')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (829, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (830, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (831, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Update Transaction Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (832, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (833, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (834, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Update User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (835, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete User Roles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (836, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (837, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (838, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (839, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Update Sags')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (840, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Delete Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (841, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Update Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (842, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Add Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (843, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Deliveries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (844, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Import Quarries')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (845, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Import Vehicles')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (846, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Import Permittees')
INSERT [dbo].[UserRolesInActions] ([Id], [RoleId], [Action]) VALUES (847, N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'Productions')
SET IDENTITY_INSERT [dbo].[UserRolesInActions] OFF
INSERT [dbo].[Users] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [LastUpdatedBy], [LastUpdated], [CreatedDate], [FirstName], [LastName], [MiddleName], [CivilStatus], [Gender], [BirthDate], [AddressLine2], [AddressLine1], [TownCity], [Cellular], [Height], [Weight], [Religion], [Citizenship], [Languages]) VALUES (N'5c12a91a-3b86-48c9-b043-560a5d835fc5', N'paul.alonday@nuevavizcaya.gov.ph', NULL, N'ACnRwoZa5TzkMu0i3XKXWKBhlITkfpqZ7dH8GTZUcCNBZLifWfJSwFzDuiJU0ObN9w==', N'afd6dd5e-dcf9-4380-983b-f3993dfbc666', NULL, NULL, NULL, NULL, 1, NULL, N'paul.alonday', NULL, NULL, NULL, N'Paul', N'Alonday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [LastUpdatedBy], [LastUpdated], [CreatedDate], [FirstName], [LastName], [MiddleName], [CivilStatus], [Gender], [BirthDate], [AddressLine2], [AddressLine1], [TownCity], [Cellular], [Height], [Weight], [Religion], [Citizenship], [Languages]) VALUES (N'7f27bd2b-6f64-4460-bb50-a237b79dd927', N'erickson.miranda@nuevavizcaya.gov.ph', NULL, N'AC3VibyvQf8G2U7/1HwQXOGE8OflEahzsunuPCeX8DsZZl4sjQXwI+W9woWNrrktrQ==', N'039fce62-2615-46ff-8cc4-c2b024a9579c', NULL, NULL, NULL, NULL, 1, NULL, N'erickson.miranda', NULL, NULL, NULL, N'Erickson', N'Miranda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [LastUpdatedBy], [LastUpdated], [CreatedDate], [FirstName], [LastName], [MiddleName], [CivilStatus], [Gender], [BirthDate], [AddressLine2], [AddressLine1], [TownCity], [Cellular], [Height], [Weight], [Religion], [Citizenship], [Languages]) VALUES (N'902e4505-7b99-4307-acf5-2605ae28adc8', N'sherlyn.fernandez@nuevavizcaya.gov.ph', NULL, N'ANts5nVTwSPwbUw7tXhBZCH3pcHvC14+AnZsFdH3S/22R1DLcLeGIfqQiZ1mixR5eg==', N'39b856f2-be80-468e-a4c2-9d80aeaa1b0b', NULL, NULL, NULL, NULL, 1, NULL, N'sherlyn.fernandez', NULL, NULL, NULL, N'Sherlyn', N'Fernandez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [LastUpdatedBy], [LastUpdated], [CreatedDate], [FirstName], [LastName], [MiddleName], [CivilStatus], [Gender], [BirthDate], [AddressLine2], [AddressLine1], [TownCity], [Cellular], [Height], [Weight], [Religion], [Citizenship], [Languages]) VALUES (N'b14c5c06-6f12-4258-9293-9a9a177251dc', N'josep@northops.asia', NULL, N'AOeCqK5fq932DdFUMLPEVKovKCjGRJ/AC1wRXngcf73x0R2gHpok/08ZhvqAlzgFZQ==', N'f51c1dac-107b-464d-b6e9-5922c7c49366', NULL, NULL, NULL, NULL, 1, NULL, N'josep', NULL, NULL, NULL, N'Joseph', N'Panganiban', N'x', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [LastUpdatedBy], [LastUpdated], [CreatedDate], [FirstName], [LastName], [MiddleName], [CivilStatus], [Gender], [BirthDate], [AddressLine2], [AddressLine1], [TownCity], [Cellular], [Height], [Weight], [Religion], [Citizenship], [Languages]) VALUES (N'b97f5a28-5900-4787-bf54-7f4029796a6d', N'admin@admin.com', NULL, N'AGK++t3ICkrQ5TXRE0OHfy5ONVgj4DEstdI8clkO5m55Us2EK4KDrrsVRpM9pmvoDg==', N'8165128f-1f04-4474-9a72-8f5b231a357c', NULL, NULL, NULL, NULL, NULL, NULL, N'admin', NULL, NULL, NULL, N'Mark Christopher ', N'Cacal', N'Ramos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [LastUpdatedBy], [LastUpdated], [CreatedDate], [FirstName], [LastName], [MiddleName], [CivilStatus], [Gender], [BirthDate], [AddressLine2], [AddressLine1], [TownCity], [Cellular], [Height], [Weight], [Religion], [Citizenship], [Languages]) VALUES (N'c759c045-3fd7-4de7-92ea-ca3d72c89ad7', N'quarry@nuevavizcaya.gov.ph', NULL, N'AJr3PLEbGmPQR2+QX3yO7KLzxYQjA+LTcM1AbfxH6rdDcOIp/ZrMn8vlX4dssmSI8A==', N'76710952-8cf6-449d-8d34-3733ec7f7447', NULL, NULL, NULL, NULL, 1, NULL, N'quarry', NULL, NULL, NULL, N'PENARO', N'ADMIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UsersInRoles] ([UserRoles_Id], [Users_Id]) VALUES (N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'5c12a91a-3b86-48c9-b043-560a5d835fc5')
INSERT [dbo].[UsersInRoles] ([UserRoles_Id], [Users_Id]) VALUES (N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'7f27bd2b-6f64-4460-bb50-a237b79dd927')
INSERT [dbo].[UsersInRoles] ([UserRoles_Id], [Users_Id]) VALUES (N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'902e4505-7b99-4307-acf5-2605ae28adc8')
INSERT [dbo].[UsersInRoles] ([UserRoles_Id], [Users_Id]) VALUES (N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'b14c5c06-6f12-4258-9293-9a9a177251dc')
INSERT [dbo].[UsersInRoles] ([UserRoles_Id], [Users_Id]) VALUES (N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'b97f5a28-5900-4787-bf54-7f4029796a6d')
INSERT [dbo].[UsersInRoles] ([UserRoles_Id], [Users_Id]) VALUES (N'335b17d4-ee6b-40fe-b7ea-236435cb6f59', N'b97f5a28-5900-4787-bf54-7f4029796a6d')
INSERT [dbo].[UsersInRoles] ([UserRoles_Id], [Users_Id]) VALUES (N'12ef8813-bc7b-443e-9fdf-c7da6fbb5a2d', N'c759c045-3fd7-4de7-92ea-ca3d72c89ad7')
SET IDENTITY_INSERT [dbo].[Vehicles] ON 

INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (21, 2, 3, N'RJH 435', 10.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (22, 2, 3, N'URG297', 10.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (23, 2, 3, N'HOWO A7', 10.0000, N'WHITE')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (24, 2, 3, N'WDE768', 10.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (25, 2, 3, N'UST598', 10.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (26, 2, 3, N'CPD169', 10.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (27, 2, 3, N'WSV335', 10.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (28, 2, 3, N'RKC433', 10.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (29, 2, 3, N'WXI475', 10.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (30, 2, 3, N'WKQ716', 10.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (31, 2, 3, N'TLP516', 10.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (32, 2, 3, N'HOKA', 10.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (33, 2, 3, N'UVO224', 10.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (34, 2, 3, N'HOKA', 10.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (35, 2, 4, N'TFX720', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (36, 2, 4, N'UJG629', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (37, 2, 4, N'TMG788', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (38, 2, 4, N'UJV859', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (39, 2, 4, N'UNE474', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (40, 2, 4, N'TJL956', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (41, 2, 4, N'TEA528', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (42, 2, 4, N'BCT593', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (43, 2, 5, N'CPY568', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (44, 2, 5, N'TMIXER', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (45, 2, 5, N'WGZ489', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (46, 2, 5, N'RMV470', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (47, 2, 5, N'URS178', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (48, 2, 5, N'UA1728', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (49, 2, 5, N'CTN145', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (50, 2, 5, N'GEZ519', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (51, 2, 5, N'QU2130', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (52, 2, 5, N'4-SINO MINI', 6.0000, N'')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (1008, 1003, 2, N'123456', 10.0000, N'white')
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (1010, 1015, 6, N'Payloader', NULL, NULL)
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (1011, 1015, 1, N'Backhoe', NULL, NULL)
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (1012, 1015, 2, N'Hauling Track >14', NULL, NULL)
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (1013, 1015, 3, N'Hauling Track 10-14cm', NULL, NULL)
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (1014, 1015, 4, N'Hauling Track 6-10cm', NULL, NULL)
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (1015, 1015, 5, N'Hauling Track <6cu. m', NULL, NULL)
INSERT [dbo].[Vehicles] ([Id], [PermiteeId], [VehicleTypeId], [PlateNo], [Capacity], [Description]) VALUES (1016, 1015, 1, N'123456789', 123.0000, N'123')
SET IDENTITY_INSERT [dbo].[Vehicles] OFF
SET IDENTITY_INSERT [dbo].[VehicleTypes] ON 

INSERT [dbo].[VehicleTypes] ([Id], [Code], [VehicleTypeName], [Cost]) VALUES (1, N'B', N'Backhoe', 2500.0000)
INSERT [dbo].[VehicleTypes] ([Id], [Code], [VehicleTypeName], [Cost]) VALUES (2, N'G14', N'GAF - Hauling Truck (>14cu.m)', 2000.0000)
INSERT [dbo].[VehicleTypes] ([Id], [Code], [VehicleTypeName], [Cost]) VALUES (3, N'G10', N'GAF - Hauling Truck (10 cu.m - 14cu.m)', 1500.0000)
INSERT [dbo].[VehicleTypes] ([Id], [Code], [VehicleTypeName], [Cost]) VALUES (4, N'G6', N'GAF - Hauling Truck (6 cu.m - 10 cu. m)', 1000.0000)
INSERT [dbo].[VehicleTypes] ([Id], [Code], [VehicleTypeName], [Cost]) VALUES (5, N'GL6', N'GAF - Hauling Truck (< 6cu.m)', 750.0000)
INSERT [dbo].[VehicleTypes] ([Id], [Code], [VehicleTypeName], [Cost]) VALUES (6, N'P', N'Payloader', 2500.0000)
SET IDENTITY_INSERT [dbo].[VehicleTypes] OFF
SET IDENTITY_INSERT [quarry].[Productions] ON 

INSERT [quarry].[Productions] ([Id], [PermiteeId], [QuarriesId], [SagId], [Quantity], [VehicleId], [DestinationId], [OriginId], [ReceiptNo], [CreatedBy], [DateCreated], [ReceiptDate], [ProductionDate]) VALUES (1021, 2, NULL, 1, 5, 22, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-09-03T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-03T00:00:00.0000000' AS DateTime2))
INSERT [quarry].[Productions] ([Id], [PermiteeId], [QuarriesId], [SagId], [Quantity], [VehicleId], [DestinationId], [OriginId], [ReceiptNo], [CreatedBy], [DateCreated], [ReceiptDate], [ProductionDate]) VALUES (1022, 2, 98, 5, 5, 22, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-09-02T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-02T00:00:00.0000000' AS DateTime2))
INSERT [quarry].[Productions] ([Id], [PermiteeId], [QuarriesId], [SagId], [Quantity], [VehicleId], [DestinationId], [OriginId], [ReceiptNo], [CreatedBy], [DateCreated], [ReceiptDate], [ProductionDate]) VALUES (1023, 2, 110, 8, 10, 22, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [quarry].[Productions] OFF
SET IDENTITY_INSERT [quarry].[Provinces] ON 

INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (1, N'Metro Manila', N'1         ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (2, N'Abra', N'2         ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (3, N'Agusan del Norte', N'3         ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (4, N'Agusan del Sur', N'4         ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (5, N'Aklan', N'5         ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (6, N'Albay', N'6         ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (7, N'Antique', N'7         ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (8, N'Apayao', N'8         ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (9, N'Aurora', N'9         ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (10, N'Basilan', N'10        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (11, N'Bataan', N'11        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (12, N'Batanes', N'12        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (13, N'Batangas', N'13        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (14, N'Benguet', N'14        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (15, N'Biliran', N'15        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (16, N'Bohol', N'16        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (17, N'Bukidnon', N'17        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (18, N'Bulacan', N'18        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (19, N'Cagayan', N'19        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (20, N'Camarines Norte', N'20        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (21, N'Camarines Sur', N'21        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (22, N'Camiguin', N'22        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (23, N'Capiz', N'23        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (24, N'Catanduanes', N'24        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (25, N'Cavite', N'25        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (26, N'Cebu', N'26        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (27, N'Compostela Valley', N'27        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (28, N'Cotabato', N'28        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (29, N'Davao del Norte', N'29        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (30, N'Davao del Sur', N'30        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (31, N'Davao Oriental', N'31        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (32, N'Dinagat Islands', N'32        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (33, N'Eastern Samar', N'33        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (34, N'Guimaras', N'34        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (35, N'Ifugao', N'35        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (36, N'Ilocos Norte', N'36        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (37, N'Ilocos Sur', N'37        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (38, N'Iloilo', N'38        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (39, N'Isabela', N'39        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (40, N'Kalinga', N'40        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (41, N'La Union', N'41        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (42, N'Laguna', N'42        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (43, N'Lanao del Norte', N'43        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (44, N'Lanao del Sur', N'44        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (45, N'Leyte', N'45        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (46, N'Maguindanao', N'46        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (47, N'Marinduque', N'47        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (48, N'Masbate', N'48        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (49, N'Misamis Occidental', N'49        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (50, N'Misamis Oriental', N'50        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (51, N'Mountain Province', N'51        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (52, N'Negros Occidental', N'52        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (53, N'Negros Oriental', N'53        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (54, N'Northern Samar', N'54        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (55, N'Nueva Ecija', N'55        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (56, N'Nueva Vizcaya', N'56        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (57, N'Occidental Mindoro', N'57        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (58, N'Oriental Mindoro', N'58        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (59, N'Palawan', N'59        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (60, N'Pampanga', N'60        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (61, N'Pangasinan', N'61        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (62, N'Quezon', N'62        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (63, N'Quirino', N'63        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (64, N'Rizal', N'64        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (65, N'Romblon', N'65        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (66, N'Samar', N'66        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (67, N'Sarangani', N'67        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (68, N'Siquijor', N'68        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (69, N'Sorson', N'69        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (70, N'South Cotabato', N'70        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (71, N'Southern Leyte', N'71        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (72, N'Sultan Kudarat', N'72        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (73, N'Sulu', N'73        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (74, N'Surigao del Norte', N'74        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (75, N'Surigao del Sur', N'75        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (76, N'Tarlac', N'76        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (77, N'Tawi-Tawi', N'77        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (78, N'Zambales', N'78        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (79, N'Zamboanga del Norte', N'79        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (80, N'Zamboanga del Sur', N'80        ')
INSERT [quarry].[Provinces] ([Id], [Name], [SortOrder]) VALUES (81, N'Zamboanga Sibugay', N'81        ')
SET IDENTITY_INSERT [quarry].[Provinces] OFF
SET IDENTITY_INSERT [quarry].[Sags] ON 

INSERT [quarry].[Sags] ([Id], [UnitMeasurementId], [Sag], [UnitCost]) VALUES (1, 2, N'Ordinary Earth', 20.0000)
INSERT [quarry].[Sags] ([Id], [UnitMeasurementId], [Sag], [UnitCost]) VALUES (4, 2, N'Mixed Sand & Gravel', 25.0000)
INSERT [quarry].[Sags] ([Id], [UnitMeasurementId], [Sag], [UnitCost]) VALUES (5, 2, N'Screened Sand/Fine Aggregates', 30.0000)
INSERT [quarry].[Sags] ([Id], [UnitMeasurementId], [Sag], [UnitCost]) VALUES (6, 2, N'Boulders', 50.0000)
INSERT [quarry].[Sags] ([Id], [UnitMeasurementId], [Sag], [UnitCost]) VALUES (7, 2, N'Crushed Rocks', 70.0000)
INSERT [quarry].[Sags] ([Id], [UnitMeasurementId], [Sag], [UnitCost]) VALUES (8, 2, N'Screened Sand/Coarse Aggregates', 35.0000)
SET IDENTITY_INSERT [quarry].[Sags] OFF
SET IDENTITY_INSERT [quarry].[Towns] ON 

INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1, N'City of Manila', 1, 0)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (2, N'Caloocan City', 1, 2)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (3, N'Las Piñas', 1, 3)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (4, N'Makati', 1, 4)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (5, N'Malabon', 1, 5)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (6, N'Mandaluyong', 1, 6)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (7, N'Marikina', 1, 7)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (8, N'Muntinlupa', 1, 8)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (9, N'Navotas', 1, 9)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (10, N'Parañaque', 1, 10)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (11, N'Pasay', 1, 11)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (12, N'Pasig', 1, 12)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (13, N'Quezon City', 1, 13)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (14, N'San Juan', 1, 14)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (15, N'Taguig', 1, 15)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (16, N'Valenzuela', 1, 16)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (17, N'Bangueds', 2, 17)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (18, N'Boliney', 2, 18)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (19, N'Bucay', 2, 19)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (20, N'Bucloc', 2, 20)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (21, N'Daguioman', 2, 21)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (22, N'Danglas', 2, 22)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (23, N'Dolores', 2, 23)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (24, N'La Paz', 2, 24)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (25, N'Lacub', 2, 25)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (26, N'Lagangilang', 2, 26)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (27, N'Lagayan', 2, 27)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (28, N'Langiden', 2, 28)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (29, N'Licuan-Baay', 2, 29)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (30, N'Luba', 2, 30)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (31, N'Malibcong', 2, 31)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (32, N'Manabo', 2, 32)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (33, N'Peñarrubia', 2, 33)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (34, N'Pidigan', 2, 34)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (35, N'Pilar', 2, 35)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (36, N'Sallapadan', 2, 36)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (37, N'San Isidro', 2, 37)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (38, N'San Juan', 2, 38)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (39, N'San Quintin', 2, 39)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (40, N'Tayum', 2, 40)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (41, N'Tineg', 2, 41)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (42, N'Tubo', 2, 42)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (43, N'Villaviciosa', 2, 43)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (44, N'Butuan City', 3, 44)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (45, N'Cabadbaran City', 3, 45)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (46, N'Buenavista', 3, 46)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (47, N'Carmen', 3, 47)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (48, N'Jabonga', 3, 48)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (49, N'Kitcharao', 3, 49)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (50, N'Las Nieves', 3, 50)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (51, N'Magallanes', 3, 51)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (52, N'Nasipit', 3, 52)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (53, N'Remedios T. Romualdez', 3, 53)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (54, N'Santia', 3, 54)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (55, N'Tubay', 3, 55)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (56, N'Bayugan City', 4, 56)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (57, N'Bunawan', 4, 57)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (58, N'Esperanza', 4, 58)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (59, N'La Paz', 4, 59)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (60, N'Loreto', 4, 60)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (61, N'Prosperidad', 4, 61)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (62, N'Rosario', 4, 62)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (63, N'San Francisco', 4, 63)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (64, N'San Luis', 4, 64)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (65, N'Santa Josefa', 4, 65)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (66, N'Sibagat', 4, 66)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (67, N'Talacon', 4, 67)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (68, N'Trento', 4, 68)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (69, N'Veruela', 4, 69)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (70, N'Altavas', 5, 70)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (71, N'Balete', 5, 71)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (72, N'Banga', 5, 72)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (73, N'Batan', 5, 73)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (74, N'Buruanga', 5, 74)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (75, N'Ibajay', 5, 75)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (76, N'Kalibo', 5, 76)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (77, N'Lezo', 5, 77)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (78, N'Libacao', 5, 78)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (79, N'Madalag', 5, 79)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (80, N'Makato', 5, 80)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (81, N'Malay', 5, 81)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (82, N'Malinao', 5, 82)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (83, N'Nabas', 5, 83)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (84, N'New Washington', 5, 84)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (85, N'Numancia', 5, 85)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (86, N'Tangalan', 5, 86)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (87, N'Legazpi City', 6, 87)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (88, N'Ligao City', 6, 88)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (89, N'Tabaco City', 6, 89)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (90, N'Bacacay', 6, 90)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (91, N'Camalig', 6, 91)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (92, N'Daraga', 6, 92)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (93, N'Guinobatan', 6, 93)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (94, N'Jovellar', 6, 94)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (95, N'Libon', 6, 95)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (96, N'Malilipot', 6, 96)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (97, N'Malinao', 6, 97)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (98, N'Manito', 6, 98)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (99, N'Oas', 6, 99)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (100, N'Pio Duran', 6, 100)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (101, N'Polangui', 6, 101)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (102, N'Rapu-Rapu', 6, 102)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (103, N'Santo Domin', 6, 103)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (104, N'Anini-y', 7, 104)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (105, N'Barbaza', 7, 105)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (106, N'Belison', 7, 106)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (107, N'Bugasong', 7, 107)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (108, N'Caluya', 7, 108)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (109, N'Culasi', 7, 109)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (110, N'Hamtic', 7, 110)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (111, N'Laua-an', 7, 111)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (112, N'Libertad', 7, 112)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (113, N'Pandan', 7, 113)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (114, N'Patnonn', 7, 114)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (115, N'San Jose', 7, 115)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (116, N'San Remigio', 7, 116)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (117, N'Sebaste', 7, 117)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (118, N'Sibalom', 7, 118)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (119, N'Tibiao', 7, 119)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (120, N'Tobias Fornier', 7, 120)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (121, N'Valderrama', 7, 121)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (122, N'Calanasan', 8, 122)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (123, N'Conner', 8, 123)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (124, N'Flora', 8, 124)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (125, N'Kabugao', 8, 125)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (126, N'Luna', 8, 126)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (127, N'Pudtol', 8, 127)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (128, N'Santa Marcela', 8, 128)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (129, N'Baler', 9, 129)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (130, N'Casiguran', 9, 130)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (131, N'Dilasag', 9, 131)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (132, N'Dinalungan', 9, 132)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (133, N'Dingalan', 9, 133)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (134, N'Dipaculao', 9, 134)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (135, N'Maria Aurora', 9, 135)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (136, N'San Luis', 9, 136)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (137, N'Isabela City', 10, 137)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (138, N'Lamitan City', 10, 138)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (139, N'Akbar', 10, 139)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (140, N'Al-Barka', 10, 140)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (141, N'Hadji Mohammad Ajul', 10, 141)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (142, N'Hadji Muhtamad', 10, 142)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (143, N'Lantawan', 10, 143)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (144, N'Maluso', 10, 144)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (145, N'Sumisip', 10, 145)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (146, N'Tabuan-Lasa', 10, 146)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (147, N'Tipo-Tipo', 10, 147)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (148, N'Tuburan', 10, 148)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (149, N'Ungkaya Pukan', 10, 149)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (150, N'Balanga City', 11, 150)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (151, N'Abucay', 11, 151)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (152, N'Bagac', 11, 152)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (153, N'Dinalupihan', 11, 153)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (154, N'Hermosa', 11, 154)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (155, N'Limay', 11, 155)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (156, N'Mariveles', 11, 156)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (157, N'Morong', 11, 157)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (158, N'Orani', 11, 158)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (159, N'Orion', 11, 159)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (160, N'Pilar', 11, 160)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (161, N'Samal', 11, 161)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (162, N'Basco', 12, 162)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (163, N'Itbayat', 12, 163)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (164, N'Ivana', 12, 164)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (165, N'Mahatao', 12, 165)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (166, N'Sabtang', 12, 166)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (167, N'Uyugan', 12, 167)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (168, N'Batangas City', 13, 168)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (169, N'Lipa City', 13, 169)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (170, N'Tanauan City', 13, 170)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (171, N'Ancillo', 13, 171)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (172, N'Alitagtag', 13, 172)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (173, N'Balayan', 13, 173)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (174, N'Balete', 13, 174)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (175, N'Bauan', 13, 175)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (176, N'Calaca', 13, 176)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (177, N'Calatagan', 13, 177)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (178, N'Cuenca', 13, 178)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (179, N'Ibaan', 13, 179)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (180, N'Laurel', 13, 180)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (181, N'Lemery', 13, 181)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (182, N'Lian', 13, 182)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (183, N'Lobo', 13, 183)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (184, N'Mabini', 13, 184)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (185, N'Malvar', 13, 185)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (186, N'Mataas na Kahoy', 13, 186)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (187, N'Nasugbu', 13, 187)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (188, N'Padre Garcia', 13, 188)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (189, N'Rosario', 13, 189)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (190, N'San Jose', 13, 190)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (191, N'San Juan', 13, 191)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (192, N'San Luis', 13, 192)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (193, N'San Nicolas', 13, 193)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (194, N'San Pascual', 13, 194)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (195, N'Santa Teresita', 13, 195)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (196, N'Santo Tomas', 13, 196)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (197, N'Taal', 13, 197)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (198, N'Talisay', 13, 198)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (199, N'Taysan', 13, 199)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (200, N'Tingloy', 13, 200)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (201, N'Tuy', 13, 201)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (202, N'Baguio City', 14, 202)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (203, N'Atok', 14, 203)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (204, N'Bakun', 14, 204)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (205, N'Bokod', 14, 205)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (206, N'Buguias', 14, 206)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (207, N'Iton', 14, 207)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (208, N'Kabayan', 14, 208)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (209, N'Kapangan', 14, 209)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (210, N'Kibungan', 14, 210)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (211, N'La Trinidad', 14, 211)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (212, N'Mankayan', 14, 212)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (213, N'Sablan', 14, 213)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (214, N'Tuba', 14, 214)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (215, N'Tublay', 14, 215)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (216, N'Almeria', 15, 216)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (217, N'Biliran', 15, 217)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (218, N'Cabucgayan', 15, 218)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (219, N'Caibiran', 15, 219)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (220, N'Culaba', 15, 220)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (221, N'Kawayan', 15, 221)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (222, N'Maripipi', 15, 222)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (223, N'Naval', 15, 223)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (224, N'Tagbilaran City', 16, 224)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (225, N'Alburquerque', 16, 225)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (226, N'Alicia', 16, 226)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (227, N'Anda', 16, 227)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (228, N'Antequera', 16, 228)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (229, N'Baclayon', 16, 229)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (230, N'Balilihan', 16, 230)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (231, N'Batuan', 16, 231)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (232, N'Bien Unido', 16, 232)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (233, N'Bilar', 16, 233)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (234, N'Buenavista', 16, 234)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (235, N'Calape', 16, 235)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (236, N'Candijay', 16, 236)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (237, N'Carmen', 16, 237)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (238, N'Catigbian', 16, 238)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (239, N'Clarin', 16, 239)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (240, N'Corella', 16, 240)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (241, N'Cortes', 16, 241)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (242, N'Dahoy', 16, 242)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (243, N'Danao', 16, 243)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (244, N'Dauis', 16, 244)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (245, N'Dimiao', 16, 245)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (246, N'Duero', 16, 246)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (247, N'Garcia Hernandez', 16, 247)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (248, N'Getafe', 16, 248)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (249, N'Guindulman', 16, 249)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (250, N'Inabanga', 16, 250)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (251, N'Jagna', 16, 251)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (252, N'Lila', 16, 252)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (253, N'Loay', 16, 253)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (254, N'Loboc', 16, 254)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (255, N'Loon', 16, 255)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (256, N'Mabini', 16, 256)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (257, N'Maribojoc', 16, 257)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (258, N'Panglao', 16, 258)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (259, N'Pilar', 16, 259)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (260, N'President Carlos P. Garcia', 16, 260)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (261, N'Sagbayan', 16, 261)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (262, N'San Isidro', 16, 262)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (263, N'San Miguel', 16, 263)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (264, N'Sevilla', 16, 264)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (265, N'Sierra Bullones', 16, 265)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (266, N'Sikatuna', 16, 266)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (267, N'Talibon', 16, 267)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (268, N'Trinidad', 16, 268)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (269, N'Tubin', 16, 269)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (270, N'Ubay', 16, 270)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (271, N'Valencia', 16, 271)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (272, N'Malaybalay City', 17, 272)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (273, N'Valencia City', 17, 273)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (274, N'Baunn', 17, 274)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (275, N'Cabanglasan', 17, 275)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (276, N'Damulog', 17, 276)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (277, N'Dangcagan', 17, 277)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (278, N'Don Carlos', 17, 278)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (279, N'Impasug-ong', 17, 279)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (280, N'Kadingilan', 17, 280)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (281, N'Kalilangan', 17, 281)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (282, N'Kibawe', 17, 282)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (283, N'Kitaotao', 17, 283)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (284, N'Lantapan', 17, 284)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (285, N'Libona', 17, 285)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (286, N'Malitbog', 17, 286)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (287, N'Manolo Fortich', 17, 287)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (288, N'Maramag', 17, 288)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (289, N'Pangantucan', 17, 289)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (290, N'Quezon', 17, 290)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (291, N'San Fernando', 17, 291)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (292, N'Sumilao', 17, 292)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (293, N'Talakag', 17, 293)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (294, N'Malolos City', 18, 294)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (295, N'Meycauayan City', 18, 295)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (296, N'San Jose del Monte City', 18, 296)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (297, N'Angat', 18, 297)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (298, N'Balagtas', 18, 298)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (299, N'Baliuag', 18, 299)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (300, N'Bocaue', 18, 300)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (301, N'Bulacan', 18, 301)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (302, N'Bustos', 18, 302)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (303, N'Calumpit', 18, 303)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (304, N'Doña Remedios Trinidad', 18, 304)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (305, N'Guiguinto', 18, 305)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (306, N'Hanoy', 18, 306)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (307, N'Marilao', 18, 307)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (308, N'Norzagaray', 18, 308)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (309, N'Obando', 18, 309)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (310, N'Pandi', 18, 310)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (311, N'Paombong', 18, 311)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (312, N'Plaridel', 18, 312)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (313, N'Pulilan', 18, 313)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (314, N'San Ildefonso', 18, 314)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (315, N'San Miguel', 18, 315)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (316, N'San Rafael', 18, 316)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (317, N'Santa Maria', 18, 317)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (318, N'Tuguegarao City', 19, 318)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (319, N'Abulug', 19, 319)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (320, N'Alcala', 19, 320)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (321, N'Allacapan', 19, 321)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (322, N'Amulung', 19, 322)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (323, N'Aparri', 19, 323)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (324, N'Baggao', 19, 324)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (325, N'Ballesteros', 19, 325)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (326, N'Buguey', 19, 326)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (327, N'Calayan', 19, 327)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (328, N'Camalaniugan', 19, 328)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (329, N'Claveria', 19, 329)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (330, N'Enrile', 19, 330)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (331, N'Gattaran', 19, 331)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (332, N'nzaga', 19, 332)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (333, N'Iguig', 19, 333)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (334, N'Lal-lo', 19, 334)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (335, N'Lasam', 19, 335)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (336, N'Pamplona', 19, 336)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (337, N'Peñablanca', 19, 337)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (338, N'Piat', 19, 338)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (339, N'Rizal', 19, 339)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (340, N'Sanchez-Mira', 19, 340)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (341, N'Santa Ana', 19, 341)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (342, N'Santa Praxedes', 19, 342)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (343, N'Santa Teresita', 19, 343)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (344, N'Santo Niño', 19, 344)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (345, N'Solana', 19, 345)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (346, N'Tuao', 19, 346)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (347, N'Basud', 20, 347)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (348, N'Capalonga', 20, 348)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (349, N'Daet', 20, 349)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (350, N'Jose Panganiban', 20, 350)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (351, N'Labo', 20, 351)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (352, N'Mercedes', 20, 352)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (353, N'Paracale', 20, 353)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (354, N'San Lorenzo Ruiz', 20, 354)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (355, N'San Vicente', 20, 355)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (356, N'Santa Elena', 20, 356)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (357, N'Talisay', 20, 357)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (358, N'Vinzons', 20, 358)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (359, N'Iriga City', 21, 359)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (360, N'Naga City', 21, 360)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (361, N'Baao', 21, 361)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (362, N'Balatan', 21, 362)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (363, N'Bato', 21, 363)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (364, N'Bombon', 21, 364)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (365, N'Buhi', 21, 365)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (366, N'Bula', 21, 366)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (367, N'Cabusao', 21, 367)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (368, N'Calabanga', 21, 368)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (369, N'Camaligan', 21, 369)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (370, N'Canaman', 21, 370)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (371, N'Caramoan', 21, 371)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (372, N'Del Galle', 21, 372)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (373, N'Gainza', 21, 373)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (374, N'Garchitorena', 21, 374)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (375, N'a', 21, 375)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (376, N'Lanoy', 21, 376)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (377, N'Libmanan', 21, 377)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (378, N'Lupi', 21, 378)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (379, N'Magarao', 21, 379)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (380, N'Milaor', 21, 380)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (381, N'Minalabac', 21, 381)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (382, N'Nabua', 21, 382)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (383, N'Ocampo', 21, 383)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (384, N'Pamplona', 21, 384)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (385, N'Pasacao', 21, 385)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (386, N'Pili', 21, 386)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (387, N'Presentacion', 21, 387)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (388, N'Ragay', 21, 388)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (389, N'Sagñay', 21, 389)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (390, N'San Fernando', 21, 390)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (391, N'San Jose', 21, 391)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (392, N'Sipocot', 21, 392)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (393, N'Siruma', 21, 393)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (394, N'Tigaon', 21, 394)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (395, N'Tinambac', 21, 395)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (396, N'Catarman', 22, 396)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (397, N'Guinsiliban', 22, 397)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (398, N'Mahinog', 22, 398)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (399, N'Mambajao', 22, 399)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (400, N'Sagay', 22, 400)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (401, N'Roxas City', 23, 401)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (402, N'Cuartero', 23, 402)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (403, N'Dao', 23, 403)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (404, N'Dumalag', 23, 404)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (405, N'Dumarao', 23, 405)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (406, N'Ivisan', 23, 406)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (407, N'Jamindan', 23, 407)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (408, N'Ma-ayon', 23, 408)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (409, N'Mambusao', 23, 409)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (410, N'Panay', 23, 410)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (411, N'Panitan', 23, 411)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (412, N'Pilar', 23, 412)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (413, N'Pontevedra', 23, 413)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (414, N'President Roxas', 23, 414)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (415, N'Sapi-an', 23, 415)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (416, N'Sigma', 23, 416)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (417, N'Tapaz', 23, 417)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (418, N'Bagamanoc', 24, 418)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (419, N'Baras', 24, 419)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (420, N'Bato', 24, 420)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (421, N'Caramoran', 24, 421)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (422, N'Gigmoto', 24, 422)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (423, N'Pandan', 24, 423)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (424, N'Panganiban', 24, 424)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (425, N'San Andres', 24, 425)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (426, N'San Miguel', 24, 426)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (427, N'Viga', 24, 427)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (428, N'Virac', 24, 428)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (429, N'Bacoor City', 25, 429)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (430, N'Cavite City', 25, 430)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (431, N'Dasmariñas City', 25, 431)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (432, N'Imus City', 25, 432)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (433, N'Tagaytay City', 25, 433)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (434, N'Trece Martires City', 25, 434)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (435, N'Alfonso', 25, 435)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (436, N'Amadeo', 25, 436)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (437, N'Carmona', 25, 437)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (438, N'General Mariano Alvarez', 25, 438)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (439, N'General Emilio Aguinaldo', 25, 439)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (440, N'General Trias', 25, 440)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (441, N'Indang', 25, 441)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (442, N'Kawit', 25, 442)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (443, N'Magallanes', 25, 443)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (444, N'Marandon', 25, 444)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (445, N'Mendez', 25, 445)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (446, N'Naic', 25, 446)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (447, N'Noveleta', 25, 447)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (448, N'Rosario', 25, 448)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (449, N'Silang', 25, 449)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (450, N'Tanza', 25, 450)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (451, N'Ternate', 25, 451)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (452, N'Bo City', 26, 452)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (453, N'Cebu City', 26, 453)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (454, N'Carcar City', 26, 454)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (455, N'Danao City', 26, 455)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (456, N'Lapu-Lapu City', 26, 456)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (457, N'Mandaue City', 26, 457)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (458, N'Naga City', 26, 458)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (459, N'Talisay City', 26, 459)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (460, N'Toledo City', 26, 460)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (461, N'Alcantara', 26, 461)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (462, N'Alcoy', 26, 462)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (463, N'Alegria', 26, 463)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (464, N'Aloguinsan', 26, 464)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (465, N'Argao', 26, 465)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (466, N'Asturias', 26, 466)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (467, N'Badian', 26, 467)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (468, N'Balamban', 26, 468)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (469, N'Bantayan', 26, 469)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (470, N'Barili', 26, 470)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (471, N'Boljoon', 26, 471)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (472, N'Borbon', 26, 472)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (473, N'Carmen', 26, 473)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (474, N'Camotes Island', 26, 474)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (475, N'Catmon', 26, 475)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (476, N'Compostela', 26, 476)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (477, N'Consolacion', 26, 477)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (478, N'Cordoba', 26, 478)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (479, N'Daanbantayan', 26, 479)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (480, N'Dalaguete', 26, 480)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (481, N'Dumanjug', 26, 481)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (482, N'Ginatilan', 26, 482)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (483, N'Liloan', 26, 483)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (484, N'Madridejos', 26, 484)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (485, N'Malabuyoc', 26, 485)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (486, N'Medellin', 26, 486)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (487, N'Minglanilla', 26, 487)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (488, N'Moalboal', 26, 488)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (489, N'Oslob', 26, 489)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (490, N'Pilar', 26, 490)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (491, N'Pinamungahan', 26, 491)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (492, N'Poro', 26, 492)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (493, N'Ronda', 26, 493)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (494, N'Samboan', 26, 494)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (495, N'San Fernando', 26, 495)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (496, N'San Francisco', 26, 496)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (497, N'San Remigio', 26, 497)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (498, N'Santa Fe', 26, 498)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (499, N'Santander', 26, 499)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (500, N'Sibonga', 26, 500)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (501, N'Sod', 26, 501)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (502, N'Tabon', 26, 502)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (503, N'Tabuelan', 26, 503)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (504, N'Tuburan', 26, 504)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (505, N'Tudela', 26, 505)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (506, N'Compostela', 27, 506)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (507, N'Laak (San Vicente)', 27, 507)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (508, N'Mabini (Dona Alicia)', 27, 508)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (509, N'Maco', 27, 509)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (510, N'Maragusan (San Mariano)', 27, 510)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (511, N'Mawab', 27, 511)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (512, N'Monkayo', 27, 512)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (513, N'Montevista', 27, 513)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (514, N'Nabunturan', 27, 514)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (515, N'New Bataan', 27, 515)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (516, N'Pantukan', 27, 516)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (517, N'Alamada', 28, 517)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (518, N'Aleosan', 28, 518)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (519, N'Antipas', 28, 519)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (520, N'Arakan', 28, 520)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (521, N'Banisilan', 28, 521)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (522, N'Carmen', 28, 522)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (523, N'Kabacan', 28, 523)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (524, N'Kidapawan City', 28, 524)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (525, N'Libungan', 28, 525)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (526, N'Magpet', 28, 526)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (527, N'Makilala', 28, 527)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (528, N'Matalam', 28, 528)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (529, N'Midsayap', 28, 529)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (530, N'Mlang', 28, 530)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (531, N'Pigkawayan', 28, 531)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (532, N'Pikit', 28, 532)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (533, N'President Roxas', 28, 533)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (534, N'Tulunan', 28, 534)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (535, N'Asuncion (Saug)', 29, 535)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (536, N'Braulio E. Dujali', 29, 536)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (537, N'Carmen', 29, 537)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (538, N'Kapalong', 29, 538)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (539, N'New Corella', 29, 539)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (540, N'Panabo City', 29, 540)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (541, N'Samal Island Garden City', 29, 541)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (542, N'Santo Tomas', 29, 542)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (543, N'Tagum City', 29, 543)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (544, N'Talaind', 29, 544)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (545, N'Bansalan', 30, 545)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (546, N'Davao City', 30, 546)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (547, N'Dis City', 30, 547)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (548, N'Don Marcelino', 30, 548)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (549, N'Hanoy', 30, 549)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (550, N'Jose Abad Santos (Trinidad)', 30, 550)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (551, N'Kiblawan', 30, 551)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (552, N'Magsaysay', 30, 552)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (553, N'Malalag', 30, 553)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (554, N'Malita', 30, 554)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (555, N'Matanao', 30, 555)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (556, N'Padada', 30, 556)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (557, N'Santa Cruz', 30, 557)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (558, N'Santa Maria', 30, 558)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (559, N'Sarangani', 30, 559)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (560, N'Sulop', 30, 560)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (561, N'Mati City', 31, 561)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (562, N'Baganga', 31, 562)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (563, N'Banaybanay', 31, 563)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (564, N'Boston', 31, 564)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (565, N'Caraga', 31, 565)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (566, N'Cateel', 31, 566)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (567, N'vernor Generoso', 31, 567)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (568, N'Lupon', 31, 568)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (569, N'Manay', 31, 569)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (570, N'San Isidro', 31, 570)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (571, N'Tarrana', 31, 571)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (572, N'Basilisa (Rizal)', 32, 572)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (573, N'Cagdianao', 32, 573)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (574, N'Dinagat', 32, 574)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (575, N'Libjo (Albor)', 32, 575)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (576, N'Loreto', 32, 576)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (577, N'San Jose', 32, 577)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (578, N'Tubajon', 32, 578)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (579, N'Arteche', 33, 579)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (580, N'Balangiga', 33, 580)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (581, N'Balangkayan', 33, 581)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (582, N'Borongan (Capital)', 33, 582)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (583, N'Can-Avid', 33, 583)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (584, N'Dolores', 33, 584)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (585, N'General Mac Arthur', 33, 585)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (586, N'Giporlos', 33, 586)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (587, N'Guiuan', 33, 587)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (588, N'Hernani', 33, 588)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (589, N'Jipapad', 33, 589)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (590, N'Lawaan', 33, 590)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (591, N'Llorente', 33, 591)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (592, N'Maslog', 33, 592)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (593, N'Maydolong', 33, 593)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (594, N'Mercedes', 33, 594)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (595, N'Oras', 33, 595)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (596, N'Quinapondan', 33, 596)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (597, N'Salcedo', 33, 597)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (598, N'San Julian', 33, 598)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (599, N'San Policarpo', 33, 599)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (600, N'Sulat', 33, 600)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (601, N'Taft', 33, 601)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (602, N'Buenavista', 34, 602)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (603, N'Jordan', 34, 603)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (604, N'Nueva Valencia', 34, 604)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (605, N'San Lorenzo', 34, 605)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (606, N'Sibunag', 34, 606)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (607, N'Aguinaldo', 35, 607)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (608, N'Alfonso Lista (Potia)', 35, 608)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (609, N'Asipulo', 35, 609)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (610, N'Banaue', 35, 610)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (611, N'Hingyon', 35, 611)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (612, N'Hungduan', 35, 612)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (613, N'Kiangan', 35, 613)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (614, N'Lagawe', 35, 614)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (615, N'Lamut', 35, 615)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (616, N'Mayoyao', 35, 616)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (617, N'Tinoc', 35, 617)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (618, N'Adams', 36, 618)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (619, N'Bacarra', 36, 619)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (620, N'Badoc', 36, 620)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (621, N'Bangui', 36, 621)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (622, N'Banna (Espiritu)', 36, 622)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (623, N'Batac', 36, 623)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (624, N'Burs', 36, 624)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (625, N'Carasi', 36, 625)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (626, N'Currimao', 36, 626)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (627, N'Dingras', 36, 627)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (628, N'Dumalneg', 36, 628)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (629, N'Laoag City', 36, 629)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (630, N'Marcos', 36, 630)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (631, N'Nueva Era', 36, 631)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (632, N'Pagudpud', 36, 632)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (633, N'Paoay', 36, 633)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (634, N'Pasuquin', 36, 634)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (635, N'Piddig', 36, 635)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (636, N'Pinili', 36, 636)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (637, N'San Nicolas', 36, 637)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (638, N'Sarrat', 36, 638)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (639, N'Solsona', 36, 639)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (640, N'Vintar', 36, 640)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (641, N'Alilem', 37, 641)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (642, N'Banayoyo', 37, 642)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (643, N'Bantay', 37, 643)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (644, N'Burs', 37, 644)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (645, N'Cabugao', 37, 645)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (646, N'Candon City', 37, 646)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (647, N'Caoayan', 37, 647)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (648, N'Cervantes', 37, 648)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (649, N'Galimuyod', 37, 649)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (650, N'Grerio Del Pilar (Concepcion)', 37, 650)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (651, N'Lidlidda', 37, 651)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (652, N'Magsingal', 37, 652)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (653, N'Nagbukel', 37, 653)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (654, N'Narvacan', 37, 654)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (655, N'Quirino (Angkaki)', 37, 655)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (656, N'Salcedo (Baugen)', 37, 656)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (657, N'San Emilio', 37, 657)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (658, N'San Esteban', 37, 658)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (659, N'San Ildefonso', 37, 659)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (660, N'San Juan (Lapog)', 37, 660)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (661, N'San Vicente', 37, 661)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (662, N'Santa', 37, 662)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (663, N'Santa Catalina', 37, 663)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (664, N'Santa Cruz', 37, 664)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (665, N'Santa Lucia', 37, 665)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (666, N'Santa Maria', 37, 666)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (667, N'Santia', 37, 667)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (668, N'Santo Domin', 37, 668)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (669, N'Sigay', 37, 669)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (670, N'Sinait', 37, 670)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (671, N'Sugpon', 37, 671)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (672, N'Suyo', 37, 672)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (673, N'Tagudin', 37, 673)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (674, N'Vigan City', 37, 674)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (675, N'Ajuy', 38, 675)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (676, N'Alimodian', 38, 676)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (677, N'Anilao', 38, 677)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (678, N'Badiangan', 38, 678)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (679, N'Balasan', 38, 679)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (680, N'Banate', 38, 680)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (681, N'Barotac Nuevo', 38, 681)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (682, N'Barotac Viejo', 38, 682)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (683, N'Batad', 38, 683)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (684, N'Bingawan', 38, 684)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (685, N'Cabatuan', 38, 685)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (686, N'Calinog', 38, 686)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (687, N'Carles', 38, 687)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (688, N'Concepcion', 38, 688)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (689, N'Dingle', 38, 689)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (690, N'Duenas', 38, 690)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (691, N'Dumangas', 38, 691)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (692, N'Estancia', 38, 692)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (693, N'Guimbal', 38, 693)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (694, N'Igbaras', 38, 694)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (695, N'Iloilo City', 38, 695)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (696, N'Janiuay', 38, 696)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (697, N'Lambunao', 38, 697)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (698, N'Leganes', 38, 698)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (699, N'Lemery', 38, 699)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (700, N'Leon', 38, 700)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (701, N'Maasin', 38, 701)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (702, N'Miagao', 38, 702)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (703, N'Mina', 38, 703)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (704, N'New Lucena', 38, 704)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (705, N'Oton', 38, 705)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (706, N'Passi City', 38, 706)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (707, N'Pavia', 38, 707)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (708, N'Pototan', 38, 708)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (709, N'San Dionisio', 38, 709)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (710, N'San Enrique', 38, 710)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (711, N'San Joaquin', 38, 711)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (712, N'San Miguel', 38, 712)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (713, N'San Rafael', 38, 713)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (714, N'Santa Barbara', 38, 714)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (715, N'Sara', 38, 715)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (716, N'Tigbauan', 38, 716)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (717, N'Tubungan', 38, 717)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (718, N'Zarraga', 38, 718)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (719, N'Alicia', 39, 719)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (720, N'Angadanan', 39, 720)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (721, N'Aurora', 39, 721)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (722, N'Benito Soliven', 39, 722)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (723, N'Burs', 39, 723)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (724, N'Cabagan', 39, 724)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (725, N'Cabatuan', 39, 725)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (726, N'Cauayan City', 39, 726)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (727, N'Cordon', 39, 727)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (728, N'Delfin Albano (Magsaysay)', 39, 728)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (729, N'Dinapigue', 39, 729)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (730, N'Divilican', 39, 730)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (731, N'Echague', 39, 731)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (732, N'Gamu', 39, 732)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (733, N'Ilagan', 39, 733)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (734, N'Jones', 39, 734)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (735, N'Luna', 39, 735)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (736, N'Maconacon', 39, 736)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (737, N'Mallig', 39, 737)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (738, N'Naguilian', 39, 738)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (739, N'Palanan', 39, 739)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (740, N'Quezon', 39, 740)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (741, N'Quirino', 39, 741)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (742, N'Ramon', 39, 742)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (743, N'Reina Mercedes', 39, 743)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (744, N'Roxas', 39, 744)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (745, N'San Agustin', 39, 745)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (746, N'San Guillermo', 39, 746)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (747, N'San Isidro', 39, 747)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (748, N'San Manuel', 39, 748)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (749, N'San Mariano', 39, 749)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (750, N'San Mateo', 39, 750)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (751, N'San Pablo', 39, 751)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (752, N'Santa Maria', 39, 752)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (753, N'Santia City', 39, 753)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (754, N'Santo Tomas', 39, 754)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (755, N'Tumauini', 39, 755)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (756, N'Balbalan', 40, 756)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (757, N'Lubuagan', 40, 757)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (758, N'Pasil', 40, 758)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (759, N'Pinukpuk', 40, 759)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (760, N'Rizal (Liwan)', 40, 760)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (761, N'Tabuk', 40, 761)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (762, N'Tanudan', 40, 762)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (763, N'Tinglayan', 40, 763)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (764, N'Ao', 41, 764)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (765, N'Aringay', 41, 765)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (766, N'Bacnotan', 41, 766)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (767, N'Bagulin', 41, 767)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (768, N'Balaoan', 41, 768)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (769, N'Bangar', 41, 769)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (770, N'Bauang', 41, 770)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (771, N'Burs', 41, 771)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (772, N'Caba', 41, 772)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (773, N'Luna', 41, 773)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (774, N'Naguilian', 41, 774)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (775, N'Pu', 41, 775)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (776, N'Rosario', 41, 776)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (777, N'San Fernando City', 41, 777)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (778, N'San Gabriel', 41, 778)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (779, N'San Juan', 41, 779)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (780, N'Santo Tomas', 41, 780)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (781, N'Santol', 41, 781)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (782, N'Sudipen', 41, 782)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (783, N'Tubao', 41, 783)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (784, N'Alaminos', 42, 784)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (785, N'Bay', 42, 785)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (786, N'Binan', 42, 786)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (787, N'Cabuyao', 42, 787)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (788, N'Calamba City', 42, 788)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (789, N'Calauan', 42, 789)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (790, N'Cavinti', 42, 790)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (791, N'Famy', 42, 791)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (792, N'Kalayaan', 42, 792)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (793, N'Liliw', 42, 793)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (794, N'Los Banos', 42, 794)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (795, N'Luisiana', 42, 795)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (796, N'Lumban', 42, 796)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (797, N'Mabitac', 42, 797)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (798, N'Magdalena', 42, 798)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (799, N'Majayjay', 42, 799)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (800, N'Nagcarlan', 42, 800)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (801, N'Paete', 42, 801)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (802, N'Pagsanjan', 42, 802)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (803, N'Pakil', 42, 803)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (804, N'Pangil', 42, 804)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (805, N'Pila', 42, 805)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (806, N'Rizal', 42, 806)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (807, N'San Pablo City', 42, 807)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (808, N'San Pedro', 42, 808)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (809, N'Santa Cruz', 42, 809)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (810, N'Santa Maria', 42, 810)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (811, N'Santa Rosa', 42, 811)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (812, N'Siniloan', 42, 812)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (813, N'Victoria', 42, 813)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (814, N'Bacolod', 43, 814)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (815, N'Baloi', 43, 815)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (816, N'Baroy', 43, 816)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (817, N'Iligan City', 43, 817)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (818, N'Kapatagan', 43, 818)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (819, N'Kauswagan', 43, 819)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (820, N'Kolambugan', 43, 820)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (821, N'Lala', 43, 821)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (822, N'Linamon', 43, 822)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (823, N'Magsaysay', 43, 823)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (824, N'Mai', 43, 824)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (825, N'Matungao', 43, 825)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (826, N'Munai', 43, 826)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (827, N'Nunungan', 43, 827)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (828, N'Pantao Ragat', 43, 828)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (829, N'Pantar', 43, 829)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (830, N'Poona Piagapo', 43, 830)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (831, N'Salvador', 43, 831)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (832, N'Sapad', 43, 832)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (833, N'Sultan Naga Dimaporo (Karomata)', 43, 833)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (834, N'Taloan', 43, 834)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (835, N'Tangcal', 43, 835)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (836, N'Tubod', 43, 836)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (837, N'Marawi City', 44, 837)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (838, N'Bacolod-Kalawi', 44, 838)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (839, N'Balabagan', 44, 839)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (840, N'Balindong', 44, 840)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (841, N'Bayang', 44, 841)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (842, N'Binidayan', 44, 842)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (843, N'Buadiposo-Buntong', 44, 843)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (844, N'Bubong', 44, 844)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (845, N'Bumbaran', 44, 845)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (846, N'Butig', 44, 846)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (847, N'Calanogas', 44, 847)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (848, N'Ditsaan-Ramain', 44, 848)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (849, N'Ganassi', 44, 849)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (850, N'Kapai', 44, 850)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (851, N'Kapatagan', 44, 851)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (852, N'Lumba-Bayabao', 44, 852)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (853, N'Lumbaca-Unayan', 44, 853)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (854, N'Lumbatan', 44, 854)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (855, N'Lumbayanague', 44, 855)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (856, N'Madalum', 44, 856)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (857, N'Madamba', 44, 857)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (858, N'Maguing', 44, 858)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (859, N'Malabang', 44, 859)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (860, N'Marantao', 44, 860)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (861, N'Marong', 44, 861)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (862, N'Masiu', 44, 862)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (863, N'Mulondo', 44, 863)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (864, N'Pagayawan', 44, 864)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (865, N'Piagapo', 44, 865)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (866, N'Poona Bayabao', 44, 866)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (867, N'Pualas', 44, 867)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (868, N'Saguiaran', 44, 868)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (869, N'Sultan Dumalondong', 44, 869)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (870, N'Picong', 44, 870)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (871, N'Taloan II', 44, 871)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (872, N'Tamparan', 44, 872)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (873, N'Taraka', 44, 873)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (874, N'Tubaran', 44, 874)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (875, N'Tugaya', 44, 875)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (876, N'Wao', 44, 876)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (877, N'Baybay City', 45, 877)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (878, N'Ormoc City', 45, 878)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (879, N'Tacloban City', 45, 879)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (880, N'Abuyog', 45, 880)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (881, N'Alangalang', 45, 881)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (882, N'Albuera', 45, 882)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (883, N'Babatnn', 45, 883)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (884, N'Baru', 45, 884)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (885, N'Bato', 45, 885)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (886, N'Burauen', 45, 886)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (887, N'Calubian', 45, 887)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (888, N'Capoocan', 45, 888)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (889, N'Carigara', 45, 889)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (890, N'Dagami', 45, 890)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (891, N'Dulag', 45, 891)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (892, N'Hilons', 45, 892)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (893, N'Hindang', 45, 893)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (894, N'Inopacan', 45, 894)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (895, N'Isabel', 45, 895)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (896, N'Jaro', 45, 896)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (897, N'Javier', 45, 897)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (898, N'Julita', 45, 898)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (899, N'Kananga', 45, 899)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (900, N'La Paz', 45, 900)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (901, N'Leyte', 45, 901)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (902, N'MacArthur', 45, 902)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (903, N'Mahaplag', 45, 903)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (904, N'Matag-ob', 45, 904)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (905, N'Matalom', 45, 905)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (906, N'Mayorga', 45, 906)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (907, N'Merida', 45, 907)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (908, N'Palo', 45, 908)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (909, N'Palompon', 45, 909)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (910, N'Pastrana', 45, 910)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (911, N'San Isidro', 45, 911)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (912, N'San Miguel', 45, 912)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (913, N'Santa Fe', 45, 913)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (914, N'Taban', 45, 914)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (915, N'Tabontabon', 45, 915)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (916, N'Tanauan', 45, 916)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (917, N'Tolosa', 45, 917)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (918, N'Tunga', 45, 918)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (919, N'Villaba', 45, 919)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (920, N'Cotabato City', 46, 920)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (921, N'Ampatuan', 46, 921)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (922, N'Barira', 46, 922)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (923, N'Buldon', 46, 923)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (924, N'Buluan', 46, 924)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (925, N'Datu Abdullah Sangki', 46, 925)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (926, N'Datu Anggal Midtimbang', 46, 926)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (927, N'Datu Blah T. Sinsuat', 46, 927)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (928, N'Datu Hoffer Ampatuan', 46, 928)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (929, N'Datu Montawal', 46, 929)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (930, N'Datu Odin Sinsuat', 46, 930)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (931, N'Datu Paglas', 46, 931)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (932, N'Datu Piang', 46, 932)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (933, N'Datu Salibo', 46, 933)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (934, N'Datu Saudi-Ampatuan', 46, 934)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (935, N'Datu Unsay', 46, 935)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (936, N'General Salipada K. Pendatun', 46, 936)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (937, N'Guindulungan', 46, 937)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (938, N'Kabuntalan', 46, 938)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (939, N'Mamasapano', 46, 939)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (940, N'Mangudadatu', 46, 940)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (941, N'Matanog', 46, 941)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (942, N'Northern Kabuntalan', 46, 942)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (943, N'Pagalungan', 46, 943)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (944, N'Paglat', 46, 944)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (945, N'Pandag', 46, 945)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (946, N'Parang', 46, 946)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (947, N'Rajah Buayan', 46, 947)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (948, N'Shariff Aguak', 46, 948)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (949, N'Shariff Saydona Mustapha', 46, 949)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (950, N'South Upi', 46, 950)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (951, N'Sultan Kudarat', 46, 951)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (952, N'Sultan Mastura', 46, 952)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (953, N'Sultan sa Barongis', 46, 953)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (954, N'Talayan', 46, 954)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (955, N'Talitay', 46, 955)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (956, N'Upi', 46, 956)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (957, N'Boac', 47, 957)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (958, N'Buenavista', 47, 958)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (959, N'Gasan', 47, 959)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (960, N'Mogpog', 47, 960)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (961, N'Santa Cruz', 47, 961)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (962, N'Torrijos', 47, 962)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (963, N'Masbate City', 48, 963)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (964, N'Aroroy', 48, 964)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (965, N'Baleno', 48, 965)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (966, N'Balud', 48, 966)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (967, N'Batuan', 48, 967)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (968, N'Cataingan', 48, 968)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (969, N'Cawayan', 48, 969)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (970, N'Claveria', 48, 970)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (971, N'Dimasalang', 48, 971)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (972, N'Esperanza', 48, 972)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (973, N'Mandaon', 48, 973)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (974, N'Milagros', 48, 974)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (975, N'Mobo', 48, 975)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (976, N'Monreal', 48, 976)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (977, N'Palanas', 48, 977)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (978, N'Pio V. Corpuz', 48, 978)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (979, N'Placer', 48, 979)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (980, N'San Fernando', 48, 980)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (981, N'San Jacinto', 48, 981)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (982, N'San Pascual', 48, 982)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (983, N'Uson', 48, 983)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (984, N'Oroquieta City', 49, 984)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (985, N'Ozamiz City', 49, 985)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (986, N'Tangub City', 49, 986)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (987, N'Aloran', 49, 987)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (988, N'Baliangao', 49, 988)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (989, N'Bonifacio', 49, 989)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (990, N'Calamba', 49, 990)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (991, N'Clarin', 49, 991)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (992, N'Concepcion', 49, 992)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (993, N'Don Victoriano Chiongbian', 49, 993)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (994, N'Jimenez', 49, 994)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (995, N'Lopez Jaena', 49, 995)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (996, N'Panaon', 49, 996)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (997, N'Plaridel', 49, 997)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (998, N'Sapang Dalaga', 49, 998)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (999, N'Sinacaban', 49, 999)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1000, N'Tudela', 49, 1000)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1001, N'Cagayan de Oro', 50, 1001)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1002, N'El Salvador City', 50, 1002)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1003, N'Ginog City', 50, 1003)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1004, N'Alubijid', 50, 1004)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1005, N'Balingasag', 50, 1005)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1006, N'Balinan', 50, 1006)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1007, N'Binuangan', 50, 1007)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1008, N'Claveria', 50, 1008)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1009, N'Gitagum', 50, 1009)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1010, N'Initao', 50, 1010)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1011, N'Jasaan', 50, 1011)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1012, N'Kinoguitan', 50, 1012)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1013, N'Langlong', 50, 1013)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1014, N'Laguindingan', 50, 1014)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1015, N'Libertad', 50, 1015)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1016, N'Lugait', 50, 1016)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1017, N'Magsaysay', 50, 1017)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1018, N'Manticao', 50, 1018)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1019, N'Medina', 50, 1019)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1020, N'Naawan', 50, 1020)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1021, N'Opol', 50, 1021)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1022, N'Salay', 50, 1022)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1023, N'Sugbongcon', 50, 1023)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1024, N'Taloan', 50, 1024)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1025, N'Talisayan', 50, 1025)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1026, N'Villanueva', 50, 1026)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1027, N'Barlig', 51, 1027)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1028, N'Bauko', 51, 1028)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1029, N'Besao', 51, 1029)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1030, N'Bontoc', 51, 1030)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1031, N'Natonin', 51, 1031)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1032, N'Paracelis', 51, 1032)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1033, N'Sabangan', 51, 1033)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1034, N'Sadanga', 51, 1034)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1035, N'Sagada', 51, 1035)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1036, N'Tadian', 51, 1036)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1037, N'Bacolod City', 52, 1037)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1038, N'Ba City', 52, 1038)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1039, N'Cadiz City', 52, 1039)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1040, N'Escalante City', 52, 1040)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1041, N'Himamaylan City', 52, 1041)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1042, N'Kabankalan City', 52, 1042)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1043, N'La Carlota City', 52, 1043)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1044, N'Sagay City', 52, 1044)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1045, N'San Carlos City', 52, 1045)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1046, N'Silay City', 52, 1046)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1047, N'Sipalay City', 52, 1047)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1048, N'Talisay City', 52, 1048)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1049, N'Victorias City', 52, 1049)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1050, N'Binalbagan', 52, 1050)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1051, N'Calatrava', 52, 1051)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1052, N'Candoni', 52, 1052)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1053, N'Cauayan', 52, 1053)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1054, N'Enrique B. Magalona', 52, 1054)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1055, N'Hinigaran', 52, 1055)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1056, N'Hinoba-an', 52, 1056)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1057, N'Ilog', 52, 1057)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1058, N'Isabela', 52, 1058)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1059, N'La Castellana', 52, 1059)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1060, N'Manapla', 52, 1060)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1061, N'Moises Padilla', 52, 1061)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1062, N'Murcia', 52, 1062)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1063, N'Pontevedra', 52, 1063)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1064, N'Pulupandan', 52, 1064)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1065, N'Salvador Benedicto', 52, 1065)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1066, N'San Enrique', 52, 1066)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1067, N'Toboso', 52, 1067)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1068, N'Valladolid', 52, 1068)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1069, N'Amlan (Ayuquitan)', 53, 1069)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1070, N'Ayunn', 53, 1070)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1071, N'Bacong', 53, 1071)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1072, N'Bais City', 53, 1072)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1073, N'Basay', 53, 1073)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1074, N'Bayawan City (Tulong)', 53, 1074)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1075, N'Bindoy (Payabon)', 53, 1075)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1076, N'Canlaon City', 53, 1076)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1077, N'Dauin', 53, 1077)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1078, N'Dumaguete City', 53, 1078)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1079, N'Guihulngan', 53, 1079)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1080, N'Jimalalud', 53, 1080)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1081, N'La Libertad', 53, 1081)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1082, N'Mabinay', 53, 1082)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1083, N'Manjuyod', 53, 1083)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1084, N'Pamplona', 53, 1084)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1085, N'San Jose', 53, 1085)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1086, N'Santa Catalina', 53, 1086)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1087, N'Siaton', 53, 1087)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1088, N'Sibulan', 53, 1088)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1089, N'Tanjay City', 53, 1089)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1090, N'Tayasan', 53, 1090)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1091, N'Valencia (Luzurrizga)', 53, 1091)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1092, N'Vallehermoso', 53, 1092)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1093, N'Zamboanguita', 53, 1093)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1094, N'Allen', 54, 1094)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1095, N'Biri', 54, 1095)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1096, N'Bobon', 54, 1096)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1097, N'Capul', 54, 1097)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1098, N'Catarman', 54, 1098)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1099, N'Catubig', 54, 1099)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1100, N'Gamay', 54, 1100)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1101, N'Laoang', 54, 1101)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1102, N'Lapinig', 54, 1102)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1103, N'Las Navas', 54, 1103)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1104, N'Lavezares', 54, 1104)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1105, N'Lope De Vega', 54, 1105)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1106, N'Mapanas', 54, 1106)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1107, N'Mondran', 54, 1107)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1108, N'Palapag', 54, 1108)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1109, N'Pambujan', 54, 1109)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1110, N'Rosario', 54, 1110)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1111, N'San Antonio', 54, 1111)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1112, N'San Isidro', 54, 1112)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1113, N'San Jose', 54, 1113)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1114, N'San Roque', 54, 1114)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1115, N'San Vicente', 54, 1115)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1116, N'Silvino Lobos', 54, 1116)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1117, N'Victoria', 54, 1117)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1118, N'Aliaga', 55, 1118)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1119, N'Bongabon', 55, 1119)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1120, N'Cabanatuan City', 55, 1120)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1121, N'Cabiao', 55, 1121)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1122, N'Carranglan', 55, 1122)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1123, N'Cuyapo', 55, 1123)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1124, N'Gabaldon', 55, 1124)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1125, N'Gapan', 55, 1125)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1126, N'General Mamerto Natividad', 55, 1126)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1127, N'General Tinio', 55, 1127)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1128, N'Guimba', 55, 1128)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1129, N'Jaen', 55, 1129)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1130, N'Laur', 55, 1130)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1131, N'Licab', 55, 1131)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1132, N'Llanera', 55, 1132)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1133, N'Lupao', 55, 1133)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1134, N'Munoz', 55, 1134)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1135, N'Nampicuan', 55, 1135)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1136, N'Palayan City', 55, 1136)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1137, N'Pantabangan', 55, 1137)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1138, N'Penaranda', 55, 1138)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1139, N'Quezon', 55, 1139)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1140, N'Rizal', 55, 1140)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1141, N'San Antonio', 55, 1141)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1142, N'San Esteban', 55, 1142)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1143, N'San Isidro', 55, 1143)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1144, N'San Jose City', 55, 1144)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1145, N'San Leonardo', 55, 1145)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1146, N'Santa Rosa', 55, 1146)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1147, N'Santo Domin', 55, 1147)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1148, N'Talavera', 55, 1148)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1149, N'Talugtog', 55, 1149)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1150, N'Zarasa', 55, 1150)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1151, N'Alfonso Castañeda', 56, 1151)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1152, N'Ambaguio', 56, 1152)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1153, N'Aritao', 56, 1153)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1154, N'Bagabag', 56, 1154)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1155, N'Bambang', 56, 1155)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1156, N'Bayombong', 56, 1156)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1157, N'Diadi', 56, 1157)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1158, N'Dupax Del Norte', 56, 1158)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1159, N'Dupax Del Sur', 56, 1159)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1160, N'Kasibu', 56, 1160)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1161, N'Kayapa', 56, 1161)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1162, N'Quezon', 56, 1162)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1163, N'Santa Fe', 56, 1163)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1164, N'Solano', 56, 1164)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1165, N'Villaverde', 56, 1165)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1166, N'Abra de Ilog', 57, 1166)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1167, N'Calintaan', 57, 1167)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1168, N'Looc', 57, 1168)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1169, N'Lubang', 57, 1169)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1170, N'Magsaysay', 57, 1170)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1171, N'Mamburao', 57, 1171)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1172, N'Paluan', 57, 1172)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1173, N'Rizal', 57, 1173)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1174, N'Sablayan', 57, 1174)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1175, N'San Jose', 57, 1175)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1176, N'Santa Cruz', 57, 1176)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1177, N'Baco', 58, 1177)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1178, N'Bansud', 58, 1178)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1179, N'Bongabong', 58, 1179)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1180, N'Bulalacao (San Pedro)', 58, 1180)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1181, N'Calapan City', 58, 1181)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1182, N'Gloria', 58, 1182)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1183, N'Mansalay', 58, 1183)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1184, N'Naujan', 58, 1184)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1185, N'Pinamalayan', 58, 1185)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1186, N'Pola', 58, 1186)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1187, N'Puerto Galera', 58, 1187)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1188, N'Roxas', 58, 1188)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1189, N'San Teodoro', 58, 1189)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1190, N'Socorro', 58, 1190)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1191, N'Victoria', 58, 1191)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1192, N'Aborlan', 59, 1192)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1193, N'Agutaya', 59, 1193)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1194, N'Araceli', 59, 1194)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1195, N'Balabac', 59, 1195)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1196, N'Bataraza', 59, 1196)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1197, N'Brooke''s Point', 59, 1197)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1198, N'Busuanga', 59, 1198)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1199, N'Cagayancillo', 59, 1199)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1200, N'Coron', 59, 1200)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1201, N'Culion', 59, 1201)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1202, N'Cuyo', 59, 1202)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1203, N'Dumaran', 59, 1203)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1204, N'El Nido (Bacuit)', 59, 1204)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1205, N'Kalayaan', 59, 1205)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1206, N'Linapacan', 59, 1206)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1207, N'Magsaysay', 59, 1207)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1208, N'Narra', 59, 1208)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1209, N'Puerto Princesa City', 59, 1209)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1210, N'Quezon', 59, 1210)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1211, N'Rizal (Marcos)', 59, 1211)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1212, N'Roxas', 59, 1212)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1213, N'San Vicente', 59, 1213)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1214, N'Sofronio Espanola', 59, 1214)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1215, N'Taytay', 59, 1215)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1216, N'Angeles City', 60, 1216)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1217, N'Apalit', 60, 1217)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1218, N'Arayat', 60, 1218)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1219, N'Bacolor', 60, 1219)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1220, N'Candaba', 60, 1220)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1221, N'Floridablanca', 60, 1221)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1222, N'Guagua', 60, 1222)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1223, N'Lubao', 60, 1223)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1224, N'Mabalacat', 60, 1224)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1225, N'Macabebe', 60, 1225)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1226, N'Magalang', 60, 1226)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1227, N'Masantol', 60, 1227)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1228, N'Mexico', 60, 1228)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1229, N'Minalin', 60, 1229)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1230, N'Porac', 60, 1230)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1231, N'San Fernando City', 60, 1231)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1232, N'San Luis', 60, 1232)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1233, N'San Simon', 60, 1233)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1234, N'Santa Ana', 60, 1234)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1235, N'Santa Rita', 60, 1235)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1236, N'Santo Tomas', 60, 1236)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1237, N'Sasmoan (Sexmoan)', 60, 1237)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1238, N'Agno', 61, 1238)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1239, N'Aguilar', 61, 1239)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1240, N'Alaminos City', 61, 1240)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1241, N'Alcala', 61, 1241)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1242, N'Anda', 61, 1242)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1243, N'Asingan', 61, 1243)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1244, N'Balungao', 61, 1244)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1245, N'Bani', 61, 1245)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1246, N'Basista', 61, 1246)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1247, N'Bautista', 61, 1247)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1248, N'Bayambang', 61, 1248)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1249, N'Binalonan', 61, 1249)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1250, N'Binmaley', 61, 1250)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1251, N'Bolinao', 61, 1251)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1252, N'Bugallon', 61, 1252)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1253, N'Burs', 61, 1253)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1254, N'Calasiao', 61, 1254)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1255, N'Dagupan City', 61, 1255)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1256, N'Dasol', 61, 1256)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1257, N'Infanta', 61, 1257)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1258, N'Labrador', 61, 1258)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1259, N'Laoac', 61, 1259)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1260, N'Lingayen', 61, 1260)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1261, N'Mabini', 61, 1261)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1262, N'Malasiqui', 61, 1262)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1263, N'Manaoag', 61, 1263)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1264, N'Mangaldan', 61, 1264)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1265, N'Mangatarem', 61, 1265)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1266, N'Mapandan', 61, 1266)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1267, N'Natividad', 61, 1267)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1268, N'Pozorrubio', 61, 1268)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1269, N'Rosales', 61, 1269)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1270, N'San Carlos City', 61, 1270)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1271, N'San Fabian', 61, 1271)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1272, N'San jacinto', 61, 1272)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1273, N'San Manuel', 61, 1273)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1274, N'San Nicolas', 61, 1274)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1275, N'San Quintin', 61, 1275)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1276, N'Santa Barbara', 61, 1276)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1277, N'Santa Maria', 61, 1277)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1278, N'Santo Tomas', 61, 1278)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1279, N'Sison', 61, 1279)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1280, N'Sual', 61, 1280)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1281, N'Tayug', 61, 1281)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1282, N'Umingan', 61, 1282)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1283, N'Urbiztondo', 61, 1283)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1284, N'Urdaneta City', 61, 1284)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1285, N'Villasis', 61, 1285)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1286, N'Agdangan', 62, 1286)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1287, N'Alabat', 62, 1287)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1288, N'Atimonan', 62, 1288)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1289, N'Buenavista', 62, 1289)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1290, N'Burdeos', 62, 1290)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1291, N'Calauag', 62, 1291)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1292, N'Candelaria', 62, 1292)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1293, N'Catanauan', 62, 1293)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1294, N'Dolores', 62, 1294)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1295, N'General Luna', 62, 1295)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1296, N'General Nakar', 62, 1296)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1297, N'Guinayangan', 62, 1297)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1298, N'Gumaca', 62, 1298)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1299, N'Infanta', 62, 1299)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1300, N'Jomalig', 62, 1300)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1301, N'Lopez', 62, 1301)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1302, N'Lucban', 62, 1302)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1303, N'Lucena City', 62, 1303)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1304, N'Macalelon', 62, 1304)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1305, N'Mauban', 62, 1305)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1306, N'Mulanay', 62, 1306)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1307, N'Padre Burs', 62, 1307)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1308, N'Pagbilao', 62, 1308)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1309, N'Panukulan', 62, 1309)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1310, N'Patnanungan', 62, 1310)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1311, N'Perez', 62, 1311)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1312, N'Pito', 62, 1312)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1313, N'Plaridel', 62, 1313)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1314, N'Polillo', 62, 1314)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1315, N'Quezon', 62, 1315)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1316, N'Real', 62, 1316)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1317, N'Sampaloc', 62, 1317)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1318, N'San Andres', 62, 1318)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1319, N'San Antonio', 62, 1319)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1320, N'San Francisco (Aurora)', 62, 1320)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1321, N'San Narciso', 62, 1321)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1322, N'Sariaya', 62, 1322)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1323, N'Tagkawayan', 62, 1323)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1324, N'Tayabas', 62, 1324)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1325, N'Tiaong', 62, 1325)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1326, N'Unisan', 62, 1326)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1327, N'Aglipay', 63, 1327)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1328, N'Cabarroguis', 63, 1328)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1329, N'Diffun', 63, 1329)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1330, N'Maddela', 63, 1330)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1331, N'Nagtipunan', 63, 1331)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1332, N'Saguday', 63, 1332)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1333, N'Anno', 64, 1333)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1334, N'Antipolo City', 64, 1334)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1335, N'Baras', 64, 1335)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1336, N'Binannan', 64, 1336)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1337, N'Cainta', 64, 1337)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1338, N'Cardona', 64, 1338)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1339, N'Jala-Jala', 64, 1339)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1340, N'Morong', 64, 1340)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1341, N'Pililla', 64, 1341)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1342, N'Rodriguez (Montalban)', 64, 1342)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1343, N'San Mateo', 64, 1343)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1344, N'Tanay', 64, 1344)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1345, N'Taytay', 64, 1345)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1346, N'Teresa', 64, 1346)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1347, N'Alcantara', 65, 1347)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1348, N'Banton', 65, 1348)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1349, N'Cajidiocan', 65, 1349)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1350, N'Calatrava', 65, 1350)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1351, N'Concepcion', 65, 1351)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1352, N'Corcuera', 65, 1352)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1353, N'Ferrol', 65, 1353)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1354, N'Looc', 65, 1354)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1355, N'Magdiwang', 65, 1355)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1356, N'Odiongan', 65, 1356)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1357, N'Romblon', 65, 1357)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1358, N'San Agustin', 65, 1358)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1359, N'San Andres', 65, 1359)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1360, N'San Fernando', 65, 1360)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1361, N'San Jose', 65, 1361)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1362, N'Santa Fe', 65, 1362)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1363, N'Santa Maria', 65, 1363)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1364, N'Almagro', 66, 1364)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1365, N'Basey', 66, 1365)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1366, N'Calbiga', 66, 1366)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1367, N'Catbalogan', 66, 1367)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1368, N'Daram', 66, 1368)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1369, N'Gandara', 66, 1369)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1370, N'Hinabangan', 66, 1370)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1371, N'Jiabong', 66, 1371)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1372, N'Marabut', 66, 1372)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1373, N'Matuguinao', 66, 1373)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1374, N'Motiong', 66, 1374)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1375, N'Pagsanghan', 66, 1375)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1376, N'Paranas (Wright)', 66, 1376)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1377, N'Pinabacdao', 66, 1377)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1378, N'San Jorge', 66, 1378)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1379, N'San Jose De Buan', 66, 1379)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1380, N'San Sebastian', 66, 1380)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1381, N'Santa Margarita', 66, 1381)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1382, N'Santa Rita', 66, 1382)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1383, N'Santo Niño', 66, 1383)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1384, N'Tagapul-an', 66, 1384)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1385, N'Talalora', 66, 1385)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1386, N'Tarangnan', 66, 1386)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1387, N'Villareal', 66, 1387)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1388, N'Zumarraga', 66, 1388)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1389, N'Calbayog', 66, 1389)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1390, N'Alabel', 67, 1390)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1391, N'Glan', 67, 1391)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1392, N'Kiamba', 67, 1392)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1393, N'Maasim', 67, 1393)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1394, N'Maitum', 67, 1394)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1395, N'Malapatan', 67, 1395)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1396, N'Malunn', 67, 1396)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1397, N'Enrique Villanueva', 68, 1397)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1398, N'Larena', 68, 1398)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1399, N'Lazi', 68, 1399)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1400, N'Maria', 68, 1400)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1401, N'San Juan', 68, 1401)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1402, N'Siquijor', 68, 1402)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1403, N'Barcelona', 69, 1403)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1404, N'Bulan', 69, 1404)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1405, N'Bulusan', 69, 1405)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1406, N'Casiguran', 69, 1406)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1407, N'Castilla', 69, 1407)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1408, N'Donsol', 69, 1408)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1409, N'Gubat', 69, 1409)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1410, N'Irosin', 69, 1410)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1411, N'Juban', 69, 1411)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1412, N'Magallanes', 69, 1412)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1413, N'Matnog', 69, 1413)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1414, N'Pilar', 69, 1414)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1415, N'Prieto Diaz', 69, 1415)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1416, N'Santa Magdalena', 69, 1416)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1417, N'Sorson City', 69, 1417)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1418, N'Banga', 70, 1418)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1419, N'General Santos City', 70, 1419)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1420, N'Koronadal City', 70, 1420)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1421, N'Lake Sebu', 70, 1421)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1422, N'Norala', 70, 1422)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1423, N'Polomolok', 70, 1423)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1424, N'Santo Nino', 70, 1424)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1425, N'Surallah', 70, 1425)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1426, N'Tampakan', 70, 1426)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1427, N'Tantangan', 70, 1427)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1428, N'T''boli', 70, 1428)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1429, N'Tupi', 70, 1429)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1430, N'Anahawan', 71, 1430)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1431, N'Bontoc', 71, 1431)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1432, N'Hinunangan', 71, 1432)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1433, N'Hinundayan', 71, 1433)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1434, N'Liban', 71, 1434)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1435, N'Liloan', 71, 1435)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1436, N'Limasawa', 71, 1436)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1437, N'Maasin City', 71, 1437)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1438, N'Macrohon', 71, 1438)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1439, N'Malitbog', 71, 1439)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1440, N'Padre Burs', 71, 1440)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1441, N'Pintuyan', 71, 1441)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1442, N'Saint Bernard', 71, 1442)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1443, N'San Francisco', 71, 1443)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1444, N'San Juan (Cabalian)', 71, 1444)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1445, N'San Ricardo', 71, 1445)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1446, N'Sila', 71, 1446)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1447, N'Sod', 71, 1447)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1448, N'Tomas Oppus', 71, 1448)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1449, N'Bagumbayan', 72, 1449)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1450, N'Columbio', 72, 1450)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1451, N'Esperanza', 72, 1451)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1452, N'Isulan', 72, 1452)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1453, N'Kalamansig', 72, 1453)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1454, N'Lambayong (Mariano Marcos)', 72, 1454)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1455, N'Lebak', 72, 1455)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1456, N'Lutayan', 72, 1456)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1457, N'Palimbang', 72, 1457)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1458, N'President Quirino', 72, 1458)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1459, N'Sen. Ninoy Aquino', 72, 1459)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1460, N'Tacurong City', 72, 1460)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1461, N'Hadji Panglima Tahil', 73, 1461)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1462, N'Indanan', 73, 1462)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1463, N'Jolo', 73, 1463)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1464, N'Kalingalan Caluang', 73, 1464)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1465, N'Lugus', 73, 1465)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1466, N'Luuk', 73, 1466)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1467, N'Maimbung', 73, 1467)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1468, N'Old Panamao', 73, 1468)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1469, N'Pandami', 73, 1469)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1470, N'Panglima Estino (New Panamao)', 73, 1470)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1471, N'Pangutaran', 73, 1471)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1472, N'Parang', 73, 1472)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1473, N'Pata', 73, 1473)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1474, N'Patikul', 73, 1474)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1475, N'Siasi', 73, 1475)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1476, N'Talipao', 73, 1476)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1477, N'Tapul', 73, 1477)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1478, N'Tongkil', 73, 1478)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1479, N'Alegria', 74, 1479)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1480, N'Bacuag', 74, 1480)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1481, N'Basilisa (Rizal)', 74, 1481)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1482, N'Burs', 74, 1482)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1483, N'Cagdianao', 74, 1483)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1484, N'Claver', 74, 1484)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1485, N'Dapa', 74, 1485)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1486, N'Del Carmen', 74, 1486)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1487, N'Dinagat', 74, 1487)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1488, N'General Luna', 74, 1488)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1489, N'Gigaquit', 74, 1489)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1490, N'Libjo (Albor)', 74, 1490)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1491, N'Loreto', 74, 1491)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1492, N'Mainit', 74, 1492)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1493, N'Malimono', 74, 1493)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1494, N'Pilar', 74, 1494)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1495, N'Placer', 74, 1495)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1496, N'San Benito', 74, 1496)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1497, N'San Francisco (Anao-Aon)', 74, 1497)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1498, N'San Isidro', 74, 1498)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1499, N'San Jose', 74, 1499)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1500, N'Santa Monica', 74, 1500)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1501, N'Sison', 74, 1501)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1502, N'Socorro', 74, 1502)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1503, N'Surigao City', 74, 1503)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1504, N'Tagana-An', 74, 1504)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1505, N'Tubajon', 74, 1505)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1506, N'Tubod', 74, 1506)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1507, N'Siargao Island', 74, 1507)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1508, N'Barobo', 75, 1508)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1509, N'Bayabas', 75, 1509)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1510, N'Bislig City', 75, 1510)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1511, N'Cagwait', 75, 1511)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1512, N'Cantilan', 75, 1512)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1513, N'Carmen', 75, 1513)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1514, N'Carrascal', 75, 1514)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1515, N'Cortes', 75, 1515)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1516, N'Hinatuan', 75, 1516)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1517, N'Lanuza', 75, 1517)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1518, N'Lianga', 75, 1518)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1519, N'Lingig', 75, 1519)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1520, N'Madrid', 75, 1520)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1521, N'Marihatag', 75, 1521)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1522, N'San Agustin', 75, 1522)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1523, N'San Miguel', 75, 1523)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1524, N'Tagbina', 75, 1524)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1525, N'Ta', 75, 1525)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1526, N'Tandag', 75, 1526)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1527, N'Anao', 76, 1527)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1528, N'Bamban', 76, 1528)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1529, N'Camiling', 76, 1529)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1530, N'Capas', 76, 1530)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1531, N'Concepcion', 76, 1531)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1532, N'Gerona', 76, 1532)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1533, N'Lapaz', 76, 1533)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1534, N'Mayantoc', 76, 1534)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1535, N'Paniqui', 76, 1535)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1536, N'Pura', 76, 1536)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1537, N'Ramos', 76, 1537)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1538, N'San Clemente', 76, 1538)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1539, N'San Jose', 76, 1539)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1540, N'San Manuel', 76, 1540)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1541, N'Santa Ignacia', 76, 1541)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1542, N'Tarlac City', 76, 1542)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1543, N'Victoria', 76, 1543)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1544, N'Bongao', 77, 1544)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1545, N'Languyan', 77, 1545)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1546, N'Mapun (Cagayan De Tawi-Tawi)', 77, 1546)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1547, N'Panglima Sugala (Balimbing)', 77, 1547)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1548, N'Sapa-Sapa', 77, 1548)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1549, N'Simunul', 77, 1549)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1550, N'Sitangkai', 77, 1550)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1551, N'South Ubian', 77, 1551)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1552, N'Tandubas', 77, 1552)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1553, N'Turtle Islands', 77, 1553)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1554, N'Botolan', 78, 1554)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1555, N'Cabangan', 78, 1555)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1556, N'Candelaria', 78, 1556)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1557, N'Castillejos', 78, 1557)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1558, N'Iba', 78, 1558)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1559, N'Masinloc', 78, 1559)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1560, N'Olonggapo City', 78, 1560)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1561, N'Palauig', 78, 1561)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1562, N'San Antonio', 78, 1562)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1563, N'San Felipe', 78, 1563)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1564, N'San Marcelino', 78, 1564)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1565, N'San Narciso', 78, 1565)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1566, N'Santa Cruz', 78, 1566)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1567, N'Subic', 78, 1567)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1568, N'Bacungan', 79, 1568)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1569, N'Baliguian', 79, 1569)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1570, N'Dapitan City', 79, 1570)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1571, N'Dipolog City', 79, 1571)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1572, N'dod', 79, 1572)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1573, N'Gutalac', 79, 1573)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1574, N'Jose Dalman (Ponot)', 79, 1574)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1575, N'Kalawit', 79, 1575)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1576, N'Katipunan', 79, 1576)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1577, N'La Libertad', 79, 1577)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1578, N'Labason', 79, 1578)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1579, N'Liloy', 79, 1579)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1580, N'Manukan', 79, 1580)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1581, N'Mutia', 79, 1581)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1582, N'Pinan (New Pinan)', 79, 1582)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1583, N'Polanco', 79, 1583)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1584, N'Pres. Manuel A. Roxas', 79, 1584)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1585, N'Rizal', 79, 1585)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1586, N'Salug', 79, 1586)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1587, N'Sergio Osmena Sr.', 79, 1587)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1588, N'Siayan', 79, 1588)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1589, N'Sibuco', 79, 1589)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1590, N'Sibutad', 79, 1590)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1591, N'Sindangan', 79, 1591)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1592, N'Siocon', 79, 1592)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1593, N'Sirawai', 79, 1593)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1594, N'Tampilisan', 79, 1594)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1595, N'Aurora', 80, 1595)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1596, N'Bayog', 80, 1596)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1597, N'Dimataling', 80, 1597)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1598, N'Dinas', 80, 1598)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1599, N'Dumingag', 80, 1599)
GO
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1600, N'Guipos', 80, 1600)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1601, N'Josefina', 80, 1601)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1602, N'Kumalarang', 80, 1602)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1603, N'Labangan', 80, 1603)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1604, N'Lakewood', 80, 1604)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1605, N'Lapuyan', 80, 1605)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1606, N'Mahayag', 80, 1606)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1607, N'Marsatubig', 80, 1607)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1608, N'Midsalip', 80, 1608)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1609, N'Molave', 80, 1609)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1610, N'Pagadian City', 80, 1610)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1611, N'Pito', 80, 1611)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1612, N'Ramon Magsaysay (Liar)', 80, 1612)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1613, N'San Miguel', 80, 1613)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1614, N'San Pablo', 80, 1614)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1615, N'Sominot (Don Mariano Marcos)', 80, 1615)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1616, N'Tabina', 80, 1616)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1617, N'Tambulig', 80, 1617)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1618, N'Tigbao', 80, 1618)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1619, N'Tukuran', 80, 1619)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1620, N'Vincenzo A. Sagun', 80, 1620)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1621, N'Zamboanga City', 80, 1621)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1622, N'Alicia', 81, 1622)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1623, N'Buug', 81, 1623)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1624, N'Diplahan', 81, 1624)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1625, N'Imelda', 81, 1625)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1626, N'Ipil', 81, 1626)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1627, N'Kabasalan', 81, 1627)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1628, N'Mabuhay', 81, 1628)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1629, N'Malangas', 81, 1629)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1630, N'Naga', 81, 1630)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1631, N'Olutanga', 81, 1631)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1632, N'Payao', 81, 1632)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1633, N'Roseller Lim', 81, 1633)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1634, N'Siay', 81, 1634)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1635, N'Talusan', 81, 1635)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1636, N'Titay', 81, 1636)
INSERT [quarry].[Towns] ([Id], [Name], [ProvinceId], [SortOrder]) VALUES (1637, N'Tungawan', 81, 1637)
SET IDENTITY_INSERT [quarry].[Towns] OFF
SET IDENTITY_INSERT [quarry].[TransactionSags] ON 

INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1, N'0055cc0d-539c-40b9-8f1f-5ba4b788f45d', 1, 25.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (7, N'8175c0ad-b0f3-4638-bb07-44f417ce377b', 1, 25.0000, 50, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (8, N'0055cc0d-539c-40b9-8f1f-5ba4b788f45d', 1, 25.0000, 60, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (9, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 1, 20.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (10, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 4, 25.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (11, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 5, 30.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (12, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 8, 35.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (13, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 6, 50.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (14, N'1955a78f-bdbd-48fc-93ca-b99e134471b7', 7, 70.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (15, N'bd16056c-ee04-4e41-8e35-57153374cd47', 1, 20.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (16, N'bd16056c-ee04-4e41-8e35-57153374cd47', 4, 25.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (17, N'bd16056c-ee04-4e41-8e35-57153374cd47', 5, 30.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (18, N'bd16056c-ee04-4e41-8e35-57153374cd47', 8, 35.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (19, N'bd16056c-ee04-4e41-8e35-57153374cd47', 6, 50.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (20, N'bd16056c-ee04-4e41-8e35-57153374cd47', 7, 70.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1009, N'88d60245-1346-4057-bf5f-1f8db38a1a9c', 1, 20.0000, 50, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1010, N'88d60245-1346-4057-bf5f-1f8db38a1a9c', 4, 25.0000, 50, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1011, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 1, 20.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1012, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 4, 25.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1013, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 5, 30.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1014, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 6, 50.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1015, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 7, 70.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1016, N'c99708a2-9f03-4d00-94eb-0281d64f4187', 8, 35.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1017, N'122a65ed-e0c7-4ee0-be07-84e4b91b367f', 7, 70.0000, 1, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1018, N'884cfab6-aacc-48e3-b89e-add160008928', 1, 20.0000, 10, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1019, N'884cfab6-aacc-48e3-b89e-add160008928', 4, 25.0000, 10, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1020, N'884cfab6-aacc-48e3-b89e-add160008928', 5, 30.0000, 10, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1021, N'884cfab6-aacc-48e3-b89e-add160008928', 8, 35.0000, 10, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1022, N'884cfab6-aacc-48e3-b89e-add160008928', 6, 50.0000, 10, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1023, N'884cfab6-aacc-48e3-b89e-add160008928', 7, 70.0000, 10, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1024, N'e7feeef5-7ebc-447d-9d5a-00b9c4de911d', 1, 20.0000, 100, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1025, N'e7feeef5-7ebc-447d-9d5a-00b9c4de911d', 4, 25.0000, 50, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1026, N'e7feeef5-7ebc-447d-9d5a-00b9c4de911d', 5, 30.0000, 30, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1027, N'e7feeef5-7ebc-447d-9d5a-00b9c4de911d', 6, 50.0000, 20, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1028, N'e7feeef5-7ebc-447d-9d5a-00b9c4de911d', 7, 70.0000, 30, NULL, NULL, NULL, NULL)
INSERT [quarry].[TransactionSags] ([Id], [TransactionId], [SagId], [UnitCost], [Quantity], [CreatedBy], [ModifiedBy], [CreatedAt], [ModifiedAt]) VALUES (1029, N'e7feeef5-7ebc-447d-9d5a-00b9c4de911d', 8, 35.0000, 60, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [quarry].[TransactionSags] OFF
SET IDENTITY_INSERT [quarry].[UnitMeasurements] ON 

INSERT [quarry].[UnitMeasurements] ([Id], [UnitMeasure]) VALUES (1, N'site/s')
INSERT [quarry].[UnitMeasurements] ([Id], [UnitMeasure]) VALUES (2, N'CU')
INSERT [quarry].[UnitMeasurements] ([Id], [UnitMeasure]) VALUES (3, N'pc')
INSERT [quarry].[UnitMeasurements] ([Id], [UnitMeasure]) VALUES (4, N'unit')
SET IDENTITY_INSERT [quarry].[UnitMeasurements] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Permitees]    Script Date: 9/5/2019 2:47:51 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Permitees] ON [dbo].[Permitees]
(
	[AccreditationNumber] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_UserClaims_Users]    Script Date: 9/5/2019 2:47:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserClaims_Users] ON [dbo].[UserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_UserLogins_Users]    Script Date: 9/5/2019 2:47:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserLogins_Users] ON [dbo].[UserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_UsersInRoles_Users]    Script Date: 9/5/2019 2:47:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UsersInRoles_Users] ON [dbo].[UsersInRoles]
(
	[Users_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Facilities]  WITH CHECK ADD  CONSTRAINT [FK_Facilities_Vehicles] FOREIGN KEY([PermiteeId])
REFERENCES [dbo].[Vehicles] ([Id])
GO
ALTER TABLE [dbo].[Facilities] CHECK CONSTRAINT [FK_Facilities_Vehicles]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Categories]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_UnitMeasurements] FOREIGN KEY([UnitMeasureId])
REFERENCES [quarry].[UnitMeasurements] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_UnitMeasurements]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_Users]
GO
ALTER TABLE [dbo].[Permitees]  WITH CHECK ADD  CONSTRAINT [FK_Permitees_PermiteeTypes] FOREIGN KEY([PermiteeTypeId])
REFERENCES [dbo].[PermiteeTypes] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permitees] CHECK CONSTRAINT [FK_Permitees_PermiteeTypes]
GO
ALTER TABLE [dbo].[ProgramOfWorks]  WITH CHECK ADD  CONSTRAINT [FK_ProgramOfWorks_Permitees] FOREIGN KEY([PermitteeId])
REFERENCES [dbo].[Permitees] ([Id])
GO
ALTER TABLE [dbo].[ProgramOfWorks] CHECK CONSTRAINT [FK_ProgramOfWorks_Permitees]
GO
ALTER TABLE [dbo].[QuariesInPermitees]  WITH CHECK ADD  CONSTRAINT [FK_QuariesInPermitees_Quarries] FOREIGN KEY([QuarrieId])
REFERENCES [dbo].[Quarries] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuariesInPermitees] CHECK CONSTRAINT [FK_QuariesInPermitees_Quarries]
GO
ALTER TABLE [dbo].[QuariesInPermitees]  WITH CHECK ADD  CONSTRAINT [FK_QuariesInPermites_Permitees] FOREIGN KEY([PermiteeId])
REFERENCES [dbo].[Permitees] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuariesInPermitees] CHECK CONSTRAINT [FK_QuariesInPermites_Permitees]
GO
ALTER TABLE [dbo].[QuarriesInTowns]  WITH CHECK ADD  CONSTRAINT [FK_QuarriesInTowns_Quarries] FOREIGN KEY([QuarryId])
REFERENCES [dbo].[Quarries] ([Id])
GO
ALTER TABLE [dbo].[QuarriesInTowns] CHECK CONSTRAINT [FK_QuarriesInTowns_Quarries]
GO
ALTER TABLE [dbo].[QuarriesInTowns]  WITH CHECK ADD  CONSTRAINT [FK_QuarriesInTowns_Towns] FOREIGN KEY([TownId])
REFERENCES [quarry].[Towns] ([Id])
GO
ALTER TABLE [dbo].[QuarriesInTowns] CHECK CONSTRAINT [FK_QuarriesInTowns_Towns]
GO
ALTER TABLE [dbo].[SummaryProgramOfWorks]  WITH CHECK ADD  CONSTRAINT [FK_SummaryProgramOfWorks_Particulars] FOREIGN KEY([ParticularId])
REFERENCES [dbo].[Particulars] ([Id])
GO
ALTER TABLE [dbo].[SummaryProgramOfWorks] CHECK CONSTRAINT [FK_SummaryProgramOfWorks_Particulars]
GO
ALTER TABLE [dbo].[SummaryProgramOfWorks]  WITH CHECK ADD  CONSTRAINT [FK_SummaryProgramOfWorks_ProgramOfWorks] FOREIGN KEY([ProgramOfWorkId])
REFERENCES [dbo].[ProgramOfWorks] ([Id])
GO
ALTER TABLE [dbo].[SummaryProgramOfWorks] CHECK CONSTRAINT [FK_SummaryProgramOfWorks_ProgramOfWorks]
GO
ALTER TABLE [dbo].[SummaryProgramOfWorks]  WITH CHECK ADD  CONSTRAINT [FK_SummaryProgramOfWorks_Sags] FOREIGN KEY([SagId])
REFERENCES [quarry].[Sags] ([Id])
GO
ALTER TABLE [dbo].[SummaryProgramOfWorks] CHECK CONSTRAINT [FK_SummaryProgramOfWorks_Sags]
GO
ALTER TABLE [dbo].[TransactionDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionDetails_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
ON DELETE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TransactionDetails] NOCHECK CONSTRAINT [FK_TransactionDetails_Items]
GO
ALTER TABLE [dbo].[TransactionDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionDetails_Transactions] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transactions] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TransactionDetails] NOCHECK CONSTRAINT [FK_TransactionDetails_Transactions]
GO
ALTER TABLE [dbo].[TransactionFacilities]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionFacilities_Facilities] FOREIGN KEY([FacilitiesId])
REFERENCES [dbo].[Facilities] ([Id])
ON DELETE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TransactionFacilities] NOCHECK CONSTRAINT [FK_TransactionFacilities_Facilities]
GO
ALTER TABLE [dbo].[TransactionFacilities]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionFacilities_Transactions] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transactions] ([Id])
ON DELETE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TransactionFacilities] NOCHECK CONSTRAINT [FK_TransactionFacilities_Transactions]
GO
ALTER TABLE [dbo].[TransactionPenalties]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionPenalties_Transactions] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transactions] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TransactionPenalties] NOCHECK CONSTRAINT [FK_TransactionPenalties_Transactions]
GO
ALTER TABLE [dbo].[Transactions]  WITH NOCHECK ADD  CONSTRAINT [FK_Transactions_Permittees] FOREIGN KEY([PermiteeId])
REFERENCES [dbo].[Permitees] ([Id])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Permittees]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_TransactionTypes] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[TransactionTypes] ([Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_TransactionTypes]
GO
ALTER TABLE [dbo].[TransactionVehicles]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionVehicles_Transactions] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transactions] ([Id])
ON DELETE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TransactionVehicles] NOCHECK CONSTRAINT [FK_TransactionVehicles_Transactions]
GO
ALTER TABLE [dbo].[TransactionVehicles]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionVehicles_Vehicles] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicles] ([Id])
ON DELETE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TransactionVehicles] NOCHECK CONSTRAINT [FK_TransactionVehicles_Vehicles]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_Users]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersInRoles_UserRoles] FOREIGN KEY([UserRoles_Id])
REFERENCES [dbo].[UserRoles] ([Id])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [FK_UsersInRoles_UserRoles]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersInRoles_Users] FOREIGN KEY([Users_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [FK_UsersInRoles_Users]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_Permittees] FOREIGN KEY([PermiteeId])
REFERENCES [dbo].[Permitees] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK_Vehicles_Permittees]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_VehicleTypes] FOREIGN KEY([VehicleTypeId])
REFERENCES [dbo].[VehicleTypes] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK_Vehicles_VehicleTypes]
GO
ALTER TABLE [quarry].[Productions]  WITH CHECK ADD  CONSTRAINT [FK_Productions_Permitees] FOREIGN KEY([PermiteeId])
REFERENCES [dbo].[Permitees] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [quarry].[Productions] CHECK CONSTRAINT [FK_Productions_Permitees]
GO
ALTER TABLE [quarry].[Productions]  WITH CHECK ADD  CONSTRAINT [FK_Productions_Quarries] FOREIGN KEY([QuarriesId])
REFERENCES [dbo].[Quarries] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [quarry].[Productions] CHECK CONSTRAINT [FK_Productions_Quarries]
GO
ALTER TABLE [quarry].[Productions]  WITH CHECK ADD  CONSTRAINT [FK_Productions_Sags] FOREIGN KEY([SagId])
REFERENCES [quarry].[Sags] ([Id])
GO
ALTER TABLE [quarry].[Productions] CHECK CONSTRAINT [FK_Productions_Sags]
GO
ALTER TABLE [quarry].[Productions]  WITH CHECK ADD  CONSTRAINT [FK_Productions_Vehicles] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicles] ([Id])
GO
ALTER TABLE [quarry].[Productions] CHECK CONSTRAINT [FK_Productions_Vehicles]
GO
ALTER TABLE [quarry].[Receipts]  WITH CHECK ADD  CONSTRAINT [FK_Receipts_Receipts] FOREIGN KEY([PermiteeId])
REFERENCES [dbo].[Permitees] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [quarry].[Receipts] CHECK CONSTRAINT [FK_Receipts_Receipts]
GO
ALTER TABLE [quarry].[Sags]  WITH CHECK ADD  CONSTRAINT [FK_Sags_UnitMeasurements] FOREIGN KEY([UnitMeasurementId])
REFERENCES [quarry].[UnitMeasurements] ([Id])
GO
ALTER TABLE [quarry].[Sags] CHECK CONSTRAINT [FK_Sags_UnitMeasurements]
GO
ALTER TABLE [quarry].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Towns] FOREIGN KEY([ProvinceId])
REFERENCES [quarry].[Provinces] ([Id])
GO
ALTER TABLE [quarry].[Towns] CHECK CONSTRAINT [FK_Towns_Towns]
GO
ALTER TABLE [quarry].[TransactionSags]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionSags_Transactions] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transactions] ([Id])
NOT FOR REPLICATION 
GO
ALTER TABLE [quarry].[TransactionSags] NOCHECK CONSTRAINT [FK_TransactionSags_Transactions]
GO
ALTER TABLE [quarry].[TransactionSags]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionSags_TransactionSags] FOREIGN KEY([SagId])
REFERENCES [quarry].[Sags] ([Id])
NOT FOR REPLICATION 
GO
ALTER TABLE [quarry].[TransactionSags] NOCHECK CONSTRAINT [FK_TransactionSags_TransactionSags]
GO
USE [master]
GO
ALTER DATABASE [quarry] SET  READ_WRITE 
GO
