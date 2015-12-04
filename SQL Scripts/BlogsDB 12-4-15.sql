USE [master]
GO
/****** Object:  Database [Blogs]    Script Date: 12/4/2015 12:02:22 PM ******/
CREATE DATABASE [Blogs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Blogs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\Blogs.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Blogs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\Blogs_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Blogs] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Blogs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Blogs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Blogs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Blogs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Blogs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Blogs] SET ARITHABORT OFF 
GO
ALTER DATABASE [Blogs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Blogs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Blogs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Blogs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Blogs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Blogs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Blogs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Blogs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Blogs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Blogs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Blogs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Blogs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Blogs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Blogs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Blogs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Blogs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Blogs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Blogs] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Blogs] SET  MULTI_USER 
GO
ALTER DATABASE [Blogs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Blogs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Blogs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Blogs] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Blogs] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Blogs]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BlogPostHashtags]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogPostHashtags](
	[BlogPostID] [int] NOT NULL,
	[HashtagID] [int] NOT NULL,
 CONSTRAINT [PK_BlogPostHashtags] PRIMARY KEY CLUSTERED 
(
	[BlogPostID] ASC,
	[HashtagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BlogPosts]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogPosts](
	[BlogPostID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[BlogPostTitle] [nvarchar](100) NOT NULL,
	[BlogPostText] [text] NOT NULL,
	[TimeCreated] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[Status] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogPostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryTitle] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hashtags]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hashtags](
	[HashtagID] [int] IDENTITY(1,1) NOT NULL,
	[HashtagTitle] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HashtagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaticPages]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaticPages](
	[StaticPageID] [int] IDENTITY(1,1) NOT NULL,
	[StaticPageTitle] [nvarchar](100) NOT NULL,
	[StaticPageText] [text] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[TimeCreated] [datetime] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StaticPageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201512012036027_UserNames', N'Blog.UI.Migrations.Configuration', 0x1F8B0800000000000400DD5CDB6EE436127D5F20FF20E869B3705ABEEC0C668DEE093C6D3B6BC4374CDB837D1BB025765B18895224CAB111E4CBF2904FCA2F2C295117DE24AA5B7D71102098268BA78AC52AB2582AFAAF3FFE1CFFF81206D6334C523F4213FB6874685B10B991E7A3E5C4CEF0E2870FF68F1FBFFBC7F8C20B5FAC2F25DD09A52323513AB19F308E4F1D27759F6008D251E8BB4994460B3C72A3D0015EE41C1F1EFEC7393A722081B00996658D3F6708FB21CC7F909FD308B930C619086E220F06296B273DB31CD5BA05214C63E0C289FD298896A3C7AB5141695B67810F881433182C6C0B20146180898CA78F299CE12442CB594C1A40F0F01A4342B700410A99ECA735B9E9340E8FE9349C7A6009E566298EC29E8047274C2F8E387C25EDDA95DE88E62E8886F12B9D75AEBD897DE5C1BCE973141005880C4FA741428927F64DC5E22C8D6F211E95034705E46542E07E8D926FA326E281653CEEA0B2A3E3D121FDEFC09A6601CE12384130C309080EACFB6C1EF8EECFF0F521FA06D1E4E468BE38F9F0EE3DF04EDEFF1B9EBC6BCE94CC95D0710DA4E93E89629810D9E0A29ABF6D39FC38471C580D6B8C29B4426C89B8846DDD80976B8896F88938CBF107DBBAF45FA057B630E37A443EF12032082719F9799B05019807B0EA775A79D2FFB7703D7EF77E10AEB7E0D95FE64B2FF0278E9310BFFA0C83BC377DF2E3C2BDB8F5FECAC82E9328A4BF79FB2A7ABFCEA22C71E964222DC903489610F3D28D9DDA788D4C9A420D6FD625EAFE9B369554366F25299DD02A9E50B2D8B63794F26E96AFB1C59DC53159BCDCB4A846DA0C8E3FA846C2C8038BF5D72673646A32884CE5EFBC035EFA498A3BB641F24F23D6ED9CAEC196185D84C00F06D8D50DB890606AE12721AC16EE53447C08A0DECB700FD2946C6ADE7F41FAB47105CDA09B25C4D7661884F1C6B9DD3F4508DE66E19CBAF0F6780DB6340FBF4697C0C5517281E8A8B5F1AE23F75B94E10BE49D030C1FB15B02D29F0F7E680E30883867AE0BD3F4921833F4A611B92B948057089F1CF786A3FBEDAEA3AA6900FC501D560927C3D792B40EADD4145278A5215385586DA25E474B1F99895A92EA452D283A4565647D45A5606692324ABDA03941A79C05D560416BBE42C347AD39ECFE87ADEBC523BABDA0A1C619D921E14F10C1846C63DE3DC01826A85E01937D6317F14FBE7C94E9C6CFA69CD317106443B35AC91BF24D60786FC861F7DF1B723149F3B3EFD1A8C4E02E57121378237AF535B1DBE704C9B6ED0EDC34B7CD7C3B7B80CE5DCED23472FDDC0B14593C9683E1E527319CD59D902966232675C8C488A1FBF4C8232D646EB6685477E81C061043EBCC2DB29C5390BAC093D54826E4F510AC3C511582D5C91D5EB87F493C89A5C3840E02F41294124FF51196DDC247AE1F83A0534BC248C3238CCEBDE221F69CC31822CAB0531326CCD5B91C2A40C54758942E0D8D9D86C5B51BA2266AD5AD7957085BAFBB9462D98A4D76C4CE1ABB64F1DB460CB35D635B30CE76959808A0CD4BEEC240D95DC5D400C48BCBBE19A87063D218280BA9B662A0BCC67660A0BC4ADE9C81165754D3F517EEABFB669EFC4579FBC77AABBA76609B9C3EF6CC348BD8938CC164044C64F33C9FD34EF8821597332227BB9FA52CD4154D8482CF20E6533675BCAB8C439D7610D188DA006B43EB00655F342520C9A17A0857E6F25AA56351440FD832EFD60ACBF67E01B661033276F3CB6E8350FFFD57344EA3DB4735B3CA1A242337BA2C34701406216E5EFCC40D94A2CBCBCA8A318985FB44C38D89B1C568515047E4AA51523999C1B5549A66B7965401599F906C2D2D09E193464BE56406D712B3D16E252982821E61C15A2AE28FF0819CADCC7454A74DD537768A622FD63076345561E31B10C73E5A36AAC4588B352B4AC4A63FCCFAD74F850586E3A68A32AA4ADA8A138E12B084422F614D24CD3F5F9F030CE680E679A65E289129CF56CDF65FB26C1E9FF22296E740494DFF5D8C10EA10B873560E44D8F84B32BB904633790A5DB1F6EAE116ADD80301481459FB69146421D20757FAD1C5B7BBE6F8A24546183B82FC52F024694A0A7179B51B2D8AEC10032C5015B7ACBE487A089DAACBA8B3A96C5D24AA472913534D145DB26A678BA60B608C174A8C0BFBAF5327C266FCA9515FD30469349B63D515344DA8BAD51C8995C8346158534F8C46958504D6E83347E50B619A987C8F39A250EDD28414BA7A48D9AC69E1846C76AC84A7D1A89AC29C835CC5D244977B7B58A55CCFC299A7DCBD02B64266B1CF1C5551F2D20456749B63D7F52FE2B6BEC7E7A8F60EB5D2415A5CB1D73B4935189BD9A38739881B95044DA046734F2C562B2081B1F6BDB424ED3D73254B2AB22AEB59920643BFE370DFDFF90DA7B568408FC97D54E736F5B6A2023D5E3F7BDDA85548574C91A4E25E5D35852BE5985DEFBA5F2349F7BD82C4B64A359203FD35C5301C5182D1EC97601AF8906EDF25C10D40FE02A6B82824B18F0F8F8E85474DFBF3C0C849532F505C8F75AF8CF835DB424D187A0689FB0412B942638D473835A894FCBE421E7C99D8BFE5A34EF33C0AFD57DE7C605DA58FC8FF25231D0F4906ADDFE58AD3611E25B45FF7F6F40989B956AFFEF7B5187A60DD25C4634EAD434197ABAC30FFB0A49734C5D035A459F9B9C9DB7528E94D4789FCCF10BC7CDF845BE5DDC65A60DCDB0CE584055F5DFD29C6DCC7833CC3586BBECAA7166B212A9E530C8537880A75CF2556C1D23E95F0C84F9C3F95E869CBCAA713AB88A67D36E1A3FE60E2A309F31DB21CB9C353507155DBC66E99EBB9B3E87CAD0AD45D1F9B526DFA5A8E2ED79FF7805BA3C67C05CB7863E5D9831DDC8AEAEBC1B07769DA1B2FB9DE972AEBBAFE65B7C5D5DBACA76EF976F6B72AA3DE83C23F4521D3EE8BA5B76D6BBAF4F29E579CF62B89DE336363E56DBB2F7CDEB6B1E932D07B6E6CBDCA9BF7CCD676757EEED8D28C8FD09D172BCB75579ACF44AA347557317291D32737FC79448CA088288B37A4EAEAB7B6CADD0E8635899EA9BEEC4E642C398EC457A26867DB6FAEECC06F9D2CA36967AB29566DE3CDF6FF56DE8CA69DB7A604741765D4CA224C55697BC73ED65629F696CAA6B9997454E977C5ACADDFFCDF5295F4204AE1BC47F3F9FAED14450FA292215DA74711B4FC259A9C9D8DBF9E49CEEFD45FD610F46F6922E872A766457385165179780B1295244286E60662E09123F52CC1FE02B89874D31C73FE083ECFDBD12F1D73E85DA1BB0CC719265386E13CE0125E340868E39F577AF3328FEFE2FCEFB90C310522A64F73F377E853E6075E25F7A52227A481A0D105CBE8D2B5C434B3BB7CAD906E236408C4D45705450F308C030296DEA1197886ABC846CCEF1A2E81FB5A67007520DD0BC1AB7D7CEE836502C29461D4E3C94F62C35EF8F2F1FF756C73E244560000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'0', N'Default')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'PR')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1bc9eb33-82eb-4caf-9445-76f11b5cae4f', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'76edd973-bd4a-462e-9d15-88d7904898a9', N'0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'aef7943d-d5da-4570-98b5-378a077ecfa6', N'2')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1bc9eb33-82eb-4caf-9445-76f11b5cae4f', N'JS', N'Date', N'admin@jsdate.com', 0, N'AAfjdwZYXuX2GeXDo0hBkyiBKLa48RD9/gw8jRVOjQAhNTox7thPOowMOEYl/WbdXQ==', N'96c053b8-4dee-47c1-9d4b-bbebb5485942', NULL, 0, 0, NULL, 1, 0, N'admin@jsdate.com')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'76edd973-bd4a-462e-9d15-88d7904898a9', N'Regular', N'User', N'user@jsdate.com', 0, N'AOQRxX/cOM40Qvfxdw6ab6du6px2BCdyNTvpXSn6XSUfae7LqGCW0JSzkGm5xTgpKA==', N'7e2390f4-7dfd-4003-a5fe-c9392e374607', NULL, 0, 0, NULL, 1, 0, N'user@jsdate.com')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'aef7943d-d5da-4570-98b5-378a077ecfa6', N'Public', N'Relations', N'pr@jsdate.com', 0, N'AJDh0OBWHNSMYQkV8FNktTCYJBkPezk4YD01brq94n22JvGJbxPx6k0fv69BFDd56A==', N'696efa57-60ba-41f2-9ed7-deafc863980b', NULL, 0, 0, NULL, 1, 0, N'pr@jsdate.com')
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (2, 1)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (3, 2)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (3, 3)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (3, 4)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (3, 5)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (3, 6)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (4, 7)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (4, 8)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (4, 9)
SET IDENTITY_INSERT [dbo].[BlogPosts] ON 

INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID]) VALUES (2, N'1bc9eb33-82eb-4caf-9445-76f11b5cae4f', N'PATS DATE GUIDE', N'<p><span style="font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span><span style="font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span><span style="font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span><span style="font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span><span style="font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span></p>', CAST(N'2015-12-03 18:11:40.640' AS DateTime), NULL, 1, 5)
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID]) VALUES (3, N'1bc9eb33-82eb-4caf-9445-76f11b5cae4f', N'Dean''s Top 3 cities', N'<ol>
<li>Seoul</li>
<li>Cleveland</li>
<li>Akron</li>
</ol>', CAST(N'2015-12-03 18:19:24.230' AS DateTime), NULL, 1, 7)
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID]) VALUES (4, N'1bc9eb33-82eb-4caf-9445-76f11b5cae4f', N'Pat''s Girl', N'<p>Already have one.</p>', CAST(N'2015-12-03 18:21:32.033' AS DateTime), NULL, 1, 5)
SET IDENTITY_INSERT [dbo].[BlogPosts] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryTitle]) VALUES (1, N'Events')
INSERT [dbo].[Categories] ([CategoryID], [CategoryTitle]) VALUES (2, N'Expert Advice')
INSERT [dbo].[Categories] ([CategoryID], [CategoryTitle]) VALUES (3, N'Food & Drink')
INSERT [dbo].[Categories] ([CategoryID], [CategoryTitle]) VALUES (4, N'News')
INSERT [dbo].[Categories] ([CategoryID], [CategoryTitle]) VALUES (5, N'Opinions')
INSERT [dbo].[Categories] ([CategoryID], [CategoryTitle]) VALUES (6, N'Promotions')
INSERT [dbo].[Categories] ([CategoryID], [CategoryTitle]) VALUES (7, N'"Pull" Requests')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Hashtags] ON 

INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (1, N'pinions')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (2, N'dean')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (3, N'seoul')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (4, N'cleveland')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (5, N'akron')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (6, N'scg')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (7, N'Patrick')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (8, N'slick')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (9, N'deals')
SET IDENTITY_INSERT [dbo].[Hashtags] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/4/2015 12:02:22 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/4/2015 12:02:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/4/2015 12:02:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/4/2015 12:02:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/4/2015 12:02:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/4/2015 12:02:22 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BlogPostHashtags]  WITH CHECK ADD  CONSTRAINT [FK_BlogPostHashTags_BlogPosts] FOREIGN KEY([BlogPostID])
REFERENCES [dbo].[BlogPosts] ([BlogPostID])
GO
ALTER TABLE [dbo].[BlogPostHashtags] CHECK CONSTRAINT [FK_BlogPostHashTags_BlogPosts]
GO
ALTER TABLE [dbo].[BlogPostHashtags]  WITH CHECK ADD  CONSTRAINT [FK_BlogPostHashTags_Hashtags] FOREIGN KEY([HashtagID])
REFERENCES [dbo].[Hashtags] ([HashtagID])
GO
ALTER TABLE [dbo].[BlogPostHashtags] CHECK CONSTRAINT [FK_BlogPostHashTags_Hashtags]
GO
ALTER TABLE [dbo].[BlogPosts]  WITH CHECK ADD  CONSTRAINT [FK_BlogPosts_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[BlogPosts] CHECK CONSTRAINT [FK_BlogPosts_Categories]
GO
ALTER TABLE [dbo].[StaticPages]  WITH CHECK ADD  CONSTRAINT [FK_StaticPages_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[StaticPages] CHECK CONSTRAINT [FK_StaticPages_Categories]
GO
/****** Object:  StoredProcedure [dbo].[AddBlogPostHashtags]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AddBlogPostHashtags]
(
	@BlogPostID int,
	@HashtagID int
)
as
begin

insert into BlogPostHashtags(BlogPostID, HashtagID)
values (@BlogPostID, @HashtagID)

end


GO
/****** Object:  StoredProcedure [dbo].[AddNewBlogPost]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AddNewBlogPost]
(
	@BlogPostID int output,
	@UserID nvarchar(128),
	@BlogPostTitle nvarchar(100),
	@BlogPostText text,
	@TimeCreated datetime,
	@Status int,
	@CategoryID int
)
as
begin

insert into BlogPosts(UserID, BlogPostTitle, BlogPostText, TimeCreated, [Status], CategoryID)
values (@UserID, @BlogPostTitle, @BlogPostText, @TimeCreated, @Status, @CategoryID)

set @BlogPostID = SCOPE_IDENTITY();

end


GO
/****** Object:  StoredProcedure [dbo].[AddNewHashtag]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AddNewHashtag]
(
	@HashtagID int output,
	@HashtagTitle nvarchar(30)
)
as
begin
insert into Hashtags(HashtagTitle)
values(@HashtagTitle)

set @HashtagID = SCOPE_IDENTITY();

end


GO
/****** Object:  StoredProcedure [dbo].[GetAllBlogPosts]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetAllBlogPosts]
as
begin

select b.BlogPostID, b.BlogPostTitle, b.BlogPostText, b.CategoryID, c.CategoryTitle,
b.TimeCreated, b.ExpirationDate, b.Status, b.UserID, u.Email, u.FirstName, u.LastName,
u.UserName, ur.RoleId
	from BlogPosts b
	inner join Categories c
	on b.CategoryID = c.CategoryID
	inner join aspnetusers u
	on b.UserID = u.Id
	inner join AspNetUserRoles ur
	on u.Id = ur.UserId

end


GO
/****** Object:  StoredProcedure [dbo].[GetAllStaticPages]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Paaaaaaaaaaaat>
-- Create date: <12/3/2015>
-- Description:	<Get all static pages. all of them>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllStaticPages]
AS
BEGIN

select p.StaticPageID, p.StaticPageTitle, p.StaticPageText, p.UserID, p.TimeCreated, p.CategoryID, p.Status, c.CategoryTitle, u.UserName, r.RoleId
from StaticPages p
inner join Categories c
on p.CategoryID = c.CategoryID
inner join AspNetUsers u
on p.UserID = u.Id
inner join AspNetUserRoles r
on u.Id = r.UserId

END


GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetAllUsers] as
begin
select u.Id as UserID, u.FirstName, u.LastName, u.Email, u.UserName, r.Id as RoleID, r.Name as RoleName
	from AspNetUsers u
	inner join AspNetUserRoles ur
	on u.Id = ur.UserId
	inner join AspNetRoles r
	on ur.RoleId = r.Id
end


GO
/****** Object:  StoredProcedure [dbo].[GetBlogPostByID]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<PAAAAAAAT>
-- Create date: <12/3/2015>
-- Description:	<Getting Blog Post by ID>
-- =============================================
CREATE PROCEDURE [dbo].[GetBlogPostByID]
(
@BlogPostID int
)
AS
BEGIN
select b.BlogPostID, b.UserID, b.BlogPostTitle, b.BlogPostText, b.TimeCreated, b.ExpirationDate, b.Status, b.CategoryID,
		bh.HashtagID, h.HashtagTitle, c.CategoryTitle, u.UserName, r.RoleId
	from blogPosts b
	inner join BlogPosthashtags bh
	on b.BlogPostID = bh.BlogPostID
	inner join Hashtags h
	on h.HashtagID = bh.HashtagID
	inner join Categories c
	on c.CategoryID = b.CategoryID
	inner join AspNetUsers u
	on b.UserID = u.Id
	inner join AspNetUserRoles r
	on r.UserId = u.Id
	where b.BlogPostID = @BlogPostID

END



GO
/****** Object:  StoredProcedure [dbo].[GetHashtagByBlogPostID]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetHashtagByBlogPostID]
(
@BlogPostID int
)
as
begin

select h.HashtagID, h.HashtagTitle
	from Hashtags h
	inner join BlogPostHashtags bh
	on h.HashtagID = bh.HashtagID
	where bh.BlogPostID = @BlogPostID

end


GO
/****** Object:  StoredProcedure [dbo].[GetPageByID]    Script Date: 12/4/2015 12:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Pat>
-- Create date: <12/3/2015>
-- Description:	<Getting Pages by their ID>
-- =============================================
CREATE PROCEDURE [dbo].[GetPageByID]
	-- Add the parameters for the stored procedure here
(
@staticPageId int
)
AS
BEGIN

select p.StaticPageID, p.StaticPageTitle, p.StaticPageText, p.UserID, p.TimeCreated, p.CategoryID, p.Status, c.CategoryTitle, u.UserName, r.RoleId
from StaticPages p
inner join Categories c
on p.CategoryID = c.CategoryID
inner join AspNetUsers u
on p.UserID = u.Id
inner join AspNetUserRoles r
on u.Id = r.UserId
where p.StaticPageID = @staticPageId

END


GO
USE [master]
GO
ALTER DATABASE [Blogs] SET  READ_WRITE 
GO
