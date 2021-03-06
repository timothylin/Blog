USE [master]
GO
/****** Object:  Database [Blogs]    Script Date: 12/10/2015 2:53:27 PM ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/10/2015 2:53:27 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/10/2015 2:53:27 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/10/2015 2:53:27 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/10/2015 2:53:27 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/10/2015 2:53:27 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/10/2015 2:53:27 PM ******/
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
	[AccountStatus] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BlogPostHashtags]    Script Date: 12/10/2015 2:53:27 PM ******/
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
/****** Object:  Table [dbo].[BlogPosts]    Script Date: 12/10/2015 2:53:27 PM ******/
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
	[Description] [nvarchar](250) NOT NULL,
	[CoverImageUrl] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogPostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/10/2015 2:53:27 PM ******/
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
/****** Object:  Table [dbo].[Hashtags]    Script Date: 12/10/2015 2:53:27 PM ******/
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
/****** Object:  Table [dbo].[StaticPages]    Script Date: 12/10/2015 2:53:27 PM ******/
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
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StaticPageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201512012036027_UserNames', N'Blog.UI.Migrations.Configuration', 0x1F8B0800000000000400DD5CDB6EE436127D5F20FF20E869B3705ABEEC0C668DEE093C6D3B6BC4374CDB837D1BB025765B18895224CAB111E4CBF2904FCA2F2C295117DE24AA5B7D71102098268BA78AC52AB2582AFAAF3FFE1CFFF81206D6334C523F4213FB6874685B10B991E7A3E5C4CEF0E2870FF68F1FBFFBC7F8C20B5FAC2F25DD09A52323513AB19F308E4F1D27759F6008D251E8BB4994460B3C72A3D0015EE41C1F1EFEC7393A722081B00996658D3F6708FB21CC7F909FD308B930C619086E220F06296B273DB31CD5BA05214C63E0C289FD298896A3C7AB5141695B67810F881433182C6C0B20146180898CA78F299CE12442CB594C1A40F0F01A4342B700410A99ECA735B9E9340E8FE9349C7A6009E566298EC29E8047274C2F8E387C25EDDA95DE88E62E8886F12B9D75AEBD897DE5C1BCE973141005880C4FA741428927F64DC5E22C8D6F211E95034705E46542E07E8D926FA326E281653CEEA0B2A3E3D121FDEFC09A6601CE12384130C309080EACFB6C1EF8EECFF0F521FA06D1E4E468BE38F9F0EE3DF04EDEFF1B9EBC6BCE94CC95D0710DA4E93E89629810D9E0A29ABF6D39FC38471C580D6B8C29B4426C89B8846DDD80976B8896F88938CBF107DBBAF45FA057B630E37A443EF12032082719F9799B05019807B0EA775A79D2FFB7703D7EF77E10AEB7E0D95FE64B2FF0278E9310BFFA0C83BC377DF2E3C2BDB8F5FECAC82E9328A4BF79FB2A7ABFCEA22C71E964222DC903489610F3D28D9DDA788D4C9A420D6FD625EAFE9B369554366F25299DD02A9E50B2D8B63794F26E96AFB1C59DC53159BCDCB4A846DA0C8E3FA846C2C8038BF5D72673646A32884CE5EFBC035EFA498A3BB641F24F23D6ED9CAEC196185D84C00F06D8D50DB890606AE12721AC16EE53447C08A0DECB700FD2946C6ADE7F41FAB47105CDA09B25C4D7661884F1C6B9DD3F4508DE66E19CBAF0F6780DB6340FBF4697C0C5517281E8A8B5F1AE23F75B94E10BE49D030C1FB15B02D29F0F7E680E30883867AE0BD3F4921833F4A611B92B948057089F1CF786A3FBEDAEA3AA6900FC501D560927C3D792B40EADD4145278A5215385586DA25E474B1F99895A92EA452D283A4565647D45A5606692324ABDA03941A79C05D560416BBE42C347AD39ECFE87ADEBC523BABDA0A1C619D921E14F10C1846C63DE3DC01826A85E01937D6317F14FBE7C94E9C6CFA69CD317106443B35AC91BF24D60786FC861F7DF1B723149F3B3EFD1A8C4E02E57121378237AF535B1DBE704C9B6ED0EDC34B7CD7C3B7B80CE5DCED23472FDDC0B14593C9683E1E527319CD59D902966232675C8C488A1FBF4C8232D646EB6685477E81C061043EBCC2DB29C5390BAC093D54826E4F510AC3C511582D5C91D5EB87F493C89A5C3840E02F41294124FF51196DDC247AE1F83A0534BC248C3238CCEBDE221F69CC31822CAB0531326CCD5B91C2A40C54758942E0D8D9D86C5B51BA2266AD5AD7957085BAFBB9462D98A4D76C4CE1ABB64F1DB460CB35D635B30CE76959808A0CD4BEEC240D95DC5D400C48BCBBE19A87063D218280BA9B662A0BCC67660A0BC4ADE9C81165754D3F517EEABFB669EFC4579FBC77AABBA76609B9C3EF6CC348BD8938CC164044C64F33C9FD34EF8821597332227BB9FA52CD4154D8482CF20E6533675BCAB8C439D7610D188DA006B43EB00655F342520C9A17A0857E6F25AA56351440FD832EFD60ACBF67E01B661033276F3CB6E8350FFFD57344EA3DB4735B3CA1A242337BA2C34701406216E5EFCC40D94A2CBCBCA8A318985FB44C38D89B1C568515047E4AA51523999C1B5549A66B7965401599F906C2D2D09E193464BE56406D712B3D16E252982821E61C15A2AE28FF0819CADCC7454A74DD537768A622FD63076345561E31B10C73E5A36AAC4588B352B4AC4A63FCCFAD74F850586E3A68A32AA4ADA8A138E12B084422F614D24CD3F5F9F030CE680E679A65E289129CF56CDF65FB26C1E9FF22296E740494DFF5D8C10EA10B873560E44D8F84B32BB904633790A5DB1F6EAE116ADD80301481459FB69146421D20757FAD1C5B7BBE6F8A24546183B82FC52F024694A0A7179B51B2D8AEC10032C5015B7ACBE487A089DAACBA8B3A96C5D24AA472913534D145DB26A678BA60B608C174A8C0BFBAF5327C266FCA9515FD30469349B63D515344DA8BAD51C8995C8346158534F8C46958504D6E83347E50B619A987C8F39A250EDD28414BA7A48D9AC69E1846C76AC84A7D1A89AC29C835CC5D244977B7B58A55CCFC299A7DCBD02B64266B1CF1C5551F2D20456749B63D7F52FE2B6BEC7E7A8F60EB5D2415A5CB1D73B4935189BD9A38739881B95044DA046734F2C562B2081B1F6BDB424ED3D73254B2AB22AEB59920643BFE370DFDFF90DA7B568408FC97D54E736F5B6A2023D5E3F7BDDA85548574C91A4E25E5D35852BE5985DEFBA5F2349F7BD82C4B64A359203FD35C5301C5182D1EC97601AF8906EDF25C10D40FE02A6B82824B18F0F8F8E85474DFBF3C0C849532F505C8F75AF8CF835DB424D187A0689FB0412B942638D473835A894FCBE421E7C99D8BFE5A34EF33C0AFD57DE7C605DA58FC8FF25231D0F4906ADDFE58AD3611E25B45FF7F6F40989B956AFFEF7B5187A60DD25C4634EAD434197ABAC30FFB0A49734C5D035A459F9B9C9DB7528E94D4789FCCF10BC7CDF845BE5DDC65A60DCDB0CE584055F5DFD29C6DCC7833CC3586BBECAA7166B212A9E530C8537880A75CF2556C1D23E95F0C84F9C3F95E869CBCAA713AB88A67D36E1A3FE60E2A309F31DB21CB9C353507155DBC66E99EBB9B3E87CAD0AD45D1F9B526DFA5A8E2ED79FF7805BA3C67C05CB7863E5D9831DDC8AEAEBC1B07769DA1B2FB9DE972AEBBAFE65B7C5D5DBACA76EF976F6B72AA3DE83C23F4521D3EE8BA5B76D6BBAF4F29E579CF62B89DE336363E56DBB2F7CDEB6B1E932D07B6E6CBDCA9BF7CCD676757EEED8D28C8FD09D172BCB75579ACF44AA347557317291D32737FC79448CA088288B37A4EAEAB7B6CADD0E8635899EA9BEEC4E642C398EC457A26867DB6FAEECC06F9D2CA36967AB29566DE3CDF6FF56DE8CA69DB7A604741765D4CA224C55697BC73ED65629F696CAA6B9997454E977C5ACADDFFCDF5295F4204AE1BC47F3F9FAED14450FA292215DA74711B4FC259A9C9D8DBF9E49CEEFD45FD610F46F6922E872A766457385165179780B1295244286E60662E09123F52CC1FE02B89874D31C73FE083ECFDBD12F1D73E85DA1BB0CC719265386E13CE0125E340868E39F577AF3328FEFE2FCEFB90C310522A64F73F377E853E6075E25F7A52227A481A0D105CBE8D2B5C434B3BB7CAD906E236408C4D45705450F308C030296DEA1197886ABC846CCEF1A2E81FB5A67007520DD0BC1AB7D7CEE836502C29461D4E3C94F62C35EF8F2F1FF756C73E244560000, N'6.1.3-40302')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201512080514401_AccountStatus', N'Blog.UI.Migrations.Configuration', 0x1F8B0800000000000400DD5CDB6EE338127D5F60FE41F0D3CE226325CE76A337B067907692596373433B19EC5B839668476889F2485426C162BF6C1FE693E617B62851122FA22EB6623B83061A91583C552C5691C552D17FFCEFF7F14F2F816F3DE328F64232199C0C8F0716264EE87A6435192474F9C3A7C14F3F7EF797F1A51BBC58BFE474A78C0E7A92783278A2747D66DBB1F38403140F03CF89C2385CD2A113063672437B747CFC0FFBE4C4C60031002CCB1A7F4908F5029C3EC0E334240E5ED304F937A18BFD98BF8796798A6ADDA200C76BE4E0C9E0B31FAE868FB3614639B0CE7D0F811473EC2F07162224A488828C678F319ED32824ABF91A5E20FFE1758D816E89FC1873D9CF4AF2B6C3381EB161D865C71CCA49621A061D014F4EB95E6CB5FB46DA1D147A03CD5D8286E92B1B75AABDC960E6E2F4D597D00705A80CCFA67EC48827839B82C579BCBEC57498771C66905711C0FD1646DF8622E291D5BADF516147A3E131FB77644D139F26119E109CD008F947D67DB2F03DE75FF8F521FC86C9E4F464B13CFDF4E123724F3FFE1D9F7E10470A63053AE905BCBA8FC2358E4036BC2CC63FB06CB99FAD762CBA097D32AD802D814B0CAC1BF4728DC98A3E81B38C3E0DAC2BEF05BBF91B6E5C8FC4030F824E344AE0F136F17DB4F071D16ED7F264FFD7701D7DF8D80BD75BF4ECADD2A957F883E344E0575FB09FB6C64FDE3A732F69BEBF72B2AB280CD8B36C5F59EBD77998440E1B4C68247940D10A5359BAB15D1A6F2B936650FD9B758E7AF8A6CD24D5CDBB92940D68134FC859ECDA1B7279DF966F6B8B3B5FAF61F252D3621AA933B874A3CA76A9A1D2EDC8121A4B9B39696B3304C6F2675E02AFBC28A60DEB20FCD98A753DA76BB42346E78E1342D033072B49E2821B5B5595968EAABA0C90E7F7B05DB4E00251DAD28B025C18C4E7109C1391CE32DFA33886D5D2FD278A9FDE5CF173EC24113831E83758BF39B7FBA790E0DB2458B0B56177BC7A9B9A87DFC22BE4D030BA24ACD7D678D7A1F32D4CE825712F10C58FD4C901D9E38317B407E8451CF0351CC75760CCD89D32AFCB0167849E8E3AC3B1B57CDFE1DAD4475E501DAF29BBCED79CB48CD9AA29B4B8CD405615BBD5897A1DAE3CD24ED49CD42C6A46D1282A27EB2A2A036B2729A7340B9A1234CA9951F5160DA733D47F389CC21E7E3CBC5D9C635A0B0435CE6185C43F63822358C6DC7B44298E4839036DD68D7DC455E9F431A66FBE37A59C7E417ED237AB8DBC215D04FAF78614F6F0BD2115135E3F7B2E8B4A5A1C127362806F455F7DFE6CF63945B25DBB8334CC5D33DFCD1A60769724108FB5F21964165FF96855664B5B1E7245905E8EB83054981EFF1554232ECDB25E6F308B808B8150EF19244E971ED0A1360B12F58517F3B092D38F74ED657A125F9EC771E878A9222A52AB3C31267385F8D76ACE9295674239577B03BAF258B8006FD8985487BC2317D8C7145B6CF42CF53C45B1835CDD0461386E07C1F268A442B032E3260BF7378D27AC1238629D103B40C630D91EA1FA92E211C75B23BF514B4ACF96DB3F1B7BC1436DB9C06B4C18C3464DB4615E9D606302147C944969D2D0D8162CAEDE100D11BF69CE9BC27F2149A1E6BD7662930DE70E835DF2D8F74D0CB35E633B30CE7A95B411C0982CDE8781F2735E5B03500F7D8766A0CA69D360A03C1CDD8981CA1ADB8381CA2A7977069A1DEFDBCEBF72D63F34F394930CBBDFD66BD5B507DB94F47160A699C5EDD087428F32BE2D4770B1608DF88556C4E720270FD1637E4C504D8481CF3195D35DE559A1320EB5EB415423AA032C0DAD01947F66D6803487EA205C9E07AD958E47111D60F39C652D2C5FFB1558C106746CF173BB4068FE28AF1A67ABD34731B2C21A34236F755810702A0C425DBCE481B7508A29A7AD2BA64D2CDC251A1606C627A346410D91AB4149F9607AD7526E9ACD5AAA0AC8BA84645B6949099F0C5ACA07D3BB96B88D362BA92228E810166CA522790BEFC9D9F22C51B1DB146D633BABC0E32FC6B6A1546F7C83D66B8FAC84D23DFEC69A67757BD31FE6DD8BDA820CC376E28ADAB642DA82130D23B4C24A2BB00649D392820B44D102B18CD6D40D34B2CABDD5B0FCE72CC5ED539FC47C1FC8A9D9DF590FB98A51DE67F54084F7BF82D1052C9A493F3F54CC7D75778B9551221F45155F3CA6A19F04C41C5C997B67DF3DC5FED91B1D616C2BF26BC193A6292DC495D5DE6A527487E861828AB865F349324398549D479DA2B24D91A819254F4C8928A664D5DE26CD14C0B49E28352EEC3E4F8D086FE34F42CD930822BC6E8F5556358950E5DBF648CA8701114E696A8FC94B96442CFEAA238650F5A281096DED51E5C22411536E698FA8541F89904A530729C51A234948B161233C8346AB29DA73D0AB8A4474BDB583A5EBF54592C9EBCD1B6057C8ACB675F228B50449F12AB5B93D76598FA46E1507BC371BCF651B6DCED9B17DBBDDD980F136EB7E3F9BBB50D9210209AF3B62F1DA0D0D8CBF3F484B329E5D37B2A42C53B39D251930CC2B8E540F212F38B5451C664CA9C8415AD4EB8A3CCC78DDECF54DAD423BB6AA2405F7E2F8AA1C53C7FCC8D87CED4C3B436624032B57236CE8AF31C5C190110CE7BFFA53DFC36CF9CE096E10F19638A6597DC360747C32526EAF1DCE4D323B8E5DBFE2C86DBA4E26CFD90E6AF4C8338A9C2714E915335BDCB62A41B584FA8CB8F86532F84FDAEB2CCDCDB0BFD2D747D62C7E24DEAF09343C4409B6FEAB5700F773FBA4FE0879A07785DA6B75F6EFAF59D723EB2E028F39B38E155D6E32C3F20DA24ED2645DB79066E37B45EFD7A1B4BB3B39F25F03F4F2BD08B7C9FD9CADC02AEFE0786C8DDEE6D24DA5E614A7DFFC8ECDC2EB2E5ED5FD9AAD14577987662BC48A7B327DE1F5A242D33D984DB08C77605C78A4E91D988E4E5179276613D18CF76136F10AF5364CFBA536EFB9C7EDB4E2CCB78B6537D573E36D82AD4A8BF7BDFF6A970EB67274FD624107B82D2E0F6C6019EFACEEBEB708A0A2ACBE37EC7D9AB6C97A7AAB073F9412F0B23867BF95DFBB2CF6AEF9B0F7A7AAF13E80AAC48A2AABFD5772EFDAD64C79EA032F87ED56AF7D60C6C66BEFF65F95BD6B6333A5B20FDCD83AD55E1F98ADED6BFFDCB3A5B5DE42F75E49AD178519BE3755E5BB9B2AA5B38F0370C25F8460045944995D0EAE2ECDAB2B2B6E60589298999A6B0255C69AE3687C358A7AB6DDC6CA37FCDAC1729A7AB6864ADA3ADE7CFDAFE5CD69EA791BEA53F751E35D59215A5577DFB08ED595B1BDA79A6E69240D57089A62D6DAE281F754C2DD8B5224EF317C077F3F15DBBDA8A44FD7E950A1AD7FD286BD53F8BD55D8BF636F5542B05F5F25D89176CD8266469661BE792B12E5244A86E60653E4C2967A1E516F891C0ACD2CC79CFEBA01BF657F192CB03B2377095D2714868C83852F25BC581050C73F2D4397651EDFADD953DCC710404C8FE5E6EFC8E7C4F3CB5F07B8AAC80919205874C133BA6C2E29CBECAE5E0BA4DB90B404E2EA2B82A2071CAC7D008BEFC81C09BF74D0413630BF6BBC42CE6B99013481344F84ACF6F1858756110A628E51F68747B0613778F9F1FF3B10390176580000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'0', N'Default')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'PR')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'06c53da2-4bfe-4a1f-86ad-cf045b593317', N'0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1bc9eb33-82eb-4caf-9445-76f11b5cae4f', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2ee5771a-f120-453f-8995-de7652ddd30d', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3840d5cd-a7de-4a9d-9c12-4c8791ea36bf', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'74e60034-4ccf-4421-96cd-847d1aa2908a', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'76edd973-bd4a-462e-9d15-88d7904898a9', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'aef7943d-d5da-4570-98b5-378a077ecfa6', N'2')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [AccountStatus]) VALUES (N'06c53da2-4bfe-4a1f-86ad-cf045b593317', N'Test', N'Account', N'testaccount@jsdate.com', 0, N'ACXOj/QoiuaK+vj8OYsnse/fhv+nJMWs3zzEfpQbqpzuPuNxO5zJW2dhxK7YLwMy0w==', N'267b810e-e3c3-40ea-adcc-e98f9264c52f', NULL, 0, 0, NULL, 1, 0, N'testaccount@jsdate.com', 1)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [AccountStatus]) VALUES (N'1bc9eb33-82eb-4caf-9445-76f11b5cae4f', N'JS', N'Date', N'admin@jsdate.com', 0, N'ALiXmybcXlhs9fSyz18LNuZr4CS6WIahikfA3p3qjVaL1ned2wie+dyfg8IiX18FZg==', N'764ed272-85e2-4c7e-8828-65e0a7882359', NULL, 0, 0, NULL, 1, 0, N'admin@jsdate.com', 1)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [AccountStatus]) VALUES (N'2ee5771a-f120-453f-8995-de7652ddd30d', N'Timothy', N'Lin', N'tim@jsdate.com', 0, N'AFCLcnMFHZEQxQINzvIUvdNDVSvi2cH5MT2M4RyGeheNEFRFtJbBhiJ2lkb4kDKAXg==', N'1cc16e7d-11ad-4705-ab68-2f4a457403fa', NULL, 0, 0, NULL, 1, 0, N'tim@jsdate.com', 1)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [AccountStatus]) VALUES (N'3840d5cd-a7de-4a9d-9c12-4c8791ea36bf', N'Patrick', N'Tighe', N'pat@jsdate.com', 0, N'ACqQONL0WaaxRWMpf+Far6B9vPtzA+GNdxl6wwezFP+tvNCNxoj12pCZtAH1Iuli4Q==', N'fa155e05-2f95-4754-9b05-55b997a5a516', NULL, 0, 0, NULL, 1, 0, N'pat@jsdate.com', 1)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [AccountStatus]) VALUES (N'74e60034-4ccf-4421-96cd-847d1aa2908a', N'Dean', N'Choi', N'dean@jsdate.com', 0, N'AENXGtEkKdCeumAiPSnzblDSd4o13yGr/7fnpiHCsuV1ZsYby6RQ70M+vypuHAUYeQ==', N'2fdb42fc-220e-4a52-a959-efaa982181d9', NULL, 0, 0, NULL, 1, 0, N'dean@jsdate.com', 1)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [AccountStatus]) VALUES (N'76edd973-bd4a-462e-9d15-88d7904898a9', N'Regular', N'User', N'user@jsdate.com', 0, N'AOQRxX/cOM40Qvfxdw6ab6du6px2BCdyNTvpXSn6XSUfae7LqGCW0JSzkGm5xTgpKA==', N'7e2390f4-7dfd-4003-a5fe-c9392e374607', NULL, 0, 0, NULL, 1, 0, N'user@jsdate.com', 1)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [AccountStatus]) VALUES (N'aef7943d-d5da-4570-98b5-378a077ecfa6', N'Public', N'Relations', N'pr@jsdate.com', 0, N'AJDh0OBWHNSMYQkV8FNktTCYJBkPezk4YD01brq94n22JvGJbxPx6k0fv69BFDd56A==', N'696efa57-60ba-41f2-9ed7-deafc863980b', NULL, 0, 0, NULL, 1, 0, N'pr@jsdate.com', 1)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (1, 1)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (1, 2)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (1, 3)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (1, 4)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (2, 1)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (2, 3)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (2, 5)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (2, 6)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (3, 1)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (3, 3)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (3, 6)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (3, 7)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (3, 8)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (4, 1)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (4, 2)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (4, 9)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (4, 10)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (5, 11)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (5, 12)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (5, 13)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (5, 14)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (5, 15)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (6, 11)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (6, 16)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (6, 17)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (6, 18)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (7, 11)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (7, 19)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (7, 20)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (7, 21)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (8, 22)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (8, 23)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (8, 24)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (8, 25)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (8, 26)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (9, 22)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (9, 24)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (9, 26)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (9, 27)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (9, 28)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (10, 22)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (10, 29)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (10, 30)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (10, 31)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (10, 32)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (10, 33)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (11, 1)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (11, 10)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (11, 11)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (11, 22)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (11, 34)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (11, 35)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (12, 22)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (12, 24)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (12, 26)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (12, 27)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (12, 36)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (12, 37)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (13, 12)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (13, 22)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (13, 38)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (13, 39)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (14, 27)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (14, 40)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (14, 41)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (14, 42)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (15, 43)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (15, 44)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (15, 45)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (15, 46)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (16, 1)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (16, 47)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (16, 48)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (16, 49)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (16, 50)
INSERT [dbo].[BlogPostHashtags] ([BlogPostID], [HashtagID]) VALUES (16, 51)
SET IDENTITY_INSERT [dbo].[BlogPosts] ON 

INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (1, N'2ee5771a-f120-453f-8995-de7652ddd30d', N'Tim''s Top 3 Cities', N'<p>1. &nbsp;Kaohsiung, Taiwan</p>
<p><img src="http://p1-news.yamedia.tw/MTA3Mjc4NG5ld3M=/d7551d6961dea5a6.jpg" alt="Kaohsiung" width="516" height="417" /></p>
<p>2. &nbsp;Taichung, Taiwan</p>
<p><img src="https://travel.yam.com/DATA/ARTICLE/20140715143433380.jpg" alt="Taichung" width="517" height="343" /></p>
<p>3. &nbsp;Tokyo, Japan</p>
<p><img src="https://ict.swisscom.ch/wp-content/uploads/2015/09/tokyo.jpg" alt="Tokyo" width="524" height="262" /></p>', CAST(N'2015-12-07 12:01:39.170' AS DateTime), NULL, 1, 3, N'Gotta love traveling!', N'http://p1-news.yamedia.tw/MTA3Mjc4NG5ld3M=/d7551d6961dea5a6.jpg')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (2, N'2ee5771a-f120-453f-8995-de7652ddd30d', N'Tim''s favorite K-Pop group', N'<p>From Wikipedia:</p>
<p><strong>Twice</strong> (<a title="Hangul" href="https://en.wikipedia.org/wiki/Hangul">Hangul</a>:&nbsp;<span lang="ko-Hang">????</span>, stylized as <strong>TWICE</strong>) is a <a title="International" href="https://en.wikipedia.org/wiki/International">multi-national</a> <a title="K-pop" href="https://en.wikipedia.org/wiki/K-pop">K-pop</a> <a title="Girl group" href="https://en.wikipedia.org/wiki/Girl_group">girl group</a> formed by <a title="JYP Entertainment" href="https://en.wikipedia.org/wiki/JYP_Entertainment">JYP Entertainment</a> through the 2015 reality show <a title="Sixteen (TV series)" href="https://en.wikipedia.org/wiki/Sixteen_(TV_series)">Sixteen</a>. Selected from a pool of sixteen JYP trainees, the group includes five members from <a title="South Korea" href="https://en.wikipedia.org/wiki/South_Korea">South Korea</a>, three from<a title="Japan" href="https://en.wikipedia.org/wiki/Japan">Japan</a>, and one from <a title="Taiwan" href="https://en.wikipedia.org/wiki/Taiwan">Taiwan</a>. The group is composed of nine members: Nayeon, Jeongyeon, Momo, Sana, Jihyo, Mina, Dahyun, Chaeyoung and Tzuyu. The name Twice was chosen because members will be able to &ldquo;wow their fans once through their ears and twice through their eyes."</p>
<p>Personal bias: Tzuyu&nbsp;<strong>??</strong>(<a title="Hangul" href="https://en.wikipedia.org/wiki/Hangul">Hangul</a>:&nbsp;<span title="????"><span lang="ko" xml:lang="ko"><strong>??</strong></span></span><sup>&nbsp;<em><span class="Unicode" lang="ko-Latn" title="?????" xml:lang="ko-Latn"><strong>TzuYu</strong></span></em></sup>)</p>
<p><img src="http://jypestorage.blob.core.windows.net/twice/9.jpg" alt="Tzuyu" width="624" height="416" /></p>', CAST(N'2015-12-07 12:02:33.710' AS DateTime), NULL, 1, 3, N'Who is it?', N'http://cdn.koreaboo.com/wp-content/uploads/2015/10/TWICE-debut.jpg')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (3, N'2ee5771a-f120-453f-8995-de7652ddd30d', N'Tim''s favorite J-Pop group', N'<p>From Wikipedia:</p>
<p><strong>Scandal</strong> (<span class="t_nihongo_kanji" lang="ja" xml:lang="ja">??????</span> <em>Sukyandaru</em>, stylized as <strong>SCANDAL</strong>) is an all-female Japanese rock band from <a title="Osaka" href="https://en.wikipedia.org/wiki/Osaka">Osaka</a>. Formed in August 2006 by four high school girls, they played live street performances until they were noticed and signed to the <a title="Independent music" href="https://en.wikipedia.org/wiki/Independent_music">indie</a>label <a title="Kitty Films" href="https://en.wikipedia.org/wiki/Kitty_Films">Kitty Records</a>. In 2008, they released three singles and a mini-album while performing shows in the <a title="United States" href="https://en.wikipedia.org/wiki/United_States">United States</a>,<a title="France" href="https://en.wikipedia.org/wiki/France">France</a>, and <a title="Hong Kong" href="https://en.wikipedia.org/wiki/Hong_Kong">Hong Kong</a>. That October, Scandal released their major debut single, "<a title="Doll (Scandal song)" href="https://en.wikipedia.org/wiki/Doll_(Scandal_song)">Doll</a>", under <a title="Epic/Sony Records" href="https://en.wikipedia.org/wiki/Epic/Sony_Records">Epic Records Japan</a>.</p>
<p>The band has performed the theme songs for many <a title="Anime" href="https://en.wikipedia.org/wiki/Anime">anime</a>, including "<a title="Shojo S" href="https://en.wikipedia.org/wiki/Sh%C5%8Djo_S">Shojo S</a>" and "<a title="Harukaze (Scandal song)" href="https://en.wikipedia.org/wiki/Harukaze_(Scandal_song)">Harukaze</a>" for <em><a title="Bleach (manga)" href="https://en.wikipedia.org/wiki/Bleach_(manga)">Bleach</a></em> and "<a title="Shunkan Sentimental" href="https://en.wikipedia.org/wiki/Shunkan_Sentimental">Shunkan Sentimental</a>" for <em><a title="Fullmetal Alchemist: Brotherhood" href="https://en.wikipedia.org/wiki/Fullmetal_Alchemist:_Brotherhood">Fullmetal Alchemist: Brotherhood</a></em>. With numerous overseas performances and anime theme songs, Scandal has built a considerable international fanbase.</p>
<p><img src="http://www.jpopasia.com/i1/celebrities/1/22514-scandal-j263.jpg" alt="Scandal" width="603" height="300" /></p>', CAST(N'2015-12-07 12:03:17.160' AS DateTime), NULL, 1, 3, N'J-Pop~~~', N'http://ent2.excite.co.jp/music/special/2013/scandal3/images/history/prof19.jpg')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (4, N'2ee5771a-f120-453f-8995-de7652ddd30d', N'Timothy''s travels', N'<p>Beef Noodle Soup in Siziwan, Kaohsiung, Taiwan</p>
<p><img src="http://i.imgur.com/KSEGfjA.jpg" alt="Beef Noodle Soup" width="470" height="313" /></p>
<p>Brunch in Kaohsiung, Taiwan</p>
<p><img src="http://i.imgur.com/UpFGwCc.jpg" alt="Brunch" width="468" height="468" /></p>
<p>Longpan park in Kenting, Pingtung, Taiwan</p>
<p><img src="http://i.imgur.com/iZHYsuD.jpg" alt="Longpan" width="507" height="380" /></p>
<p>In-N-Out Burger, San Francisco, California</p>
<p><img src="http://i.imgur.com/aXWesH5.jpg" alt="In-N-Out" width="525" height="394" /></p>', CAST(N'2015-12-07 12:04:19.143' AS DateTime), NULL, 1, 5, N'Not Gulliver''s...', N'http://i.imgur.com/e3PSZsL.gif')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (5, N'3840d5cd-a7de-4a9d-9c12-4c8791ea36bf', N'BACK IN THE PARKS', N'<p><img style="display: block; margin-left: auto; margin-right: auto;" src="http://i.imgur.com/8y91kB6.jpg" alt="" width="186" height="186" /></p>
<p>Me and&nbsp;the&nbsp;lady went to the park. The big one in NYC, not sure what it''s called. The romance was out of control. We walked around and took pictures.&nbsp;</p>', CAST(N'2015-12-07 12:07:55.387' AS DateTime), NULL, 1, 5, N'The lady and I going parking. ', N'http://i.imgur.com/8y91kB6.jpg')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (6, N'3840d5cd-a7de-4a9d-9c12-4c8791ea36bf', N'Bikes by the Beach', N'<p>What&rsquo;s the best way to experience Atlantic City&rsquo;s iconic <a href="http://atlanticcitynj.com/visitors/thingstodo/attractions/boardwalk.aspx">Boardwalk</a>? Walking allows you to take it all in, but walking the whole four-mile boardwalk &ndash; and the return trip &ndash; could eat up a whole day. The rolling chairs are fun and comfortable but may be a little pricey. &nbsp;</p>
<p>Biking is the best of both worlds. Even a leisurely ride up and down the boardwalk can be done in less than two hours (even with the inevitable shopping and dining stops), and Atlantic City Boardwalk <a href="http://www.atlanticcitynj.com/explore/sports-outdoors/details.aspx?id=27231">bicycle rental rates</a> are very reasonable at $8 for the first hour and $1 for every additional 15 minutes thereafter.</p>
<p>There&rsquo;s plenty to catch your attention along the Great Wooden Way. Shoppers can browse and buy anything from trinkets in small souvenir shops to Louis Vuitton purses at the high-end <a href="http://www.atlanticcitynj.com/explore/shopping/pier-shops-caesars/">Pier Shops at Caesars</a>. If pedaling builds your appetite, you can savor some authentic saltwater taffy or feast on a gourmet breakfast on or right near the Boardwalk. Thirsty riders can also lock up their bikes and check out the Boardwalk&rsquo;s coffee shops and caf&eacute;s.</p>
<p>For a more passive form of entertainment, you can always park the bikes and sit back for some lovely sea views and some of the world&rsquo;s best people-watching.</p>
<p>A Boardwalk bicycle adventure is one of the best ways to experience what makes the Boardwalk so great &ndash; sea breezes, leisurely atmosphere and great shopping, dining and entertainment. Book your <a href="http://www.atlanticcitynj.com/explore/sports-outdoors/biking-running/" target="_blank">Atlantic City bike rental</a>today and get ready to saddle up!</p>', CAST(N'2015-12-07 12:09:28.373' AS DateTime), NULL, 1, 3, N'Bikes, sand, people, more bikes', N'http://i.imgur.com/ItpN2Lm.jpg')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (7, N'3840d5cd-a7de-4a9d-9c12-4c8791ea36bf', N'Announcement: I''m now a Doctor Woohoo!', N'<p>I, part-time creator of Js Date, have just earned my doctor degree. I''m all about surgery and caring for people. I want to thank everyone including my girlfriend&nbsp;who is a real life princess of Australia.&nbsp;</p>
<p>I was a physician employee, many times for many hospitals and clinics. I&rsquo;d stay a year or two, but eventually I&rsquo;d quit. Then, in 2005, I opened an ideal clinic designed by my patients. Ten years later, I still love private practice. Why? I&rsquo;m finally practicing medicine the way I had always imagined.</p>
<p>When I decided to open a private practice, I was determined to do things differently. I needed to know what my patients really wanted from me. So I led a series of town hall meetings where I invited my community to design an ideal medical clinic. I collected 100 pages of written testimony, adopted 90 percent of the feedback, and opened one month later. Now my job description is written by patients, not administrators. I&rsquo;m finally the doctor my patients had always imagined.</p>', CAST(N'2015-12-07 12:11:32.110' AS DateTime), NULL, 1, 2, N'I was a physician employee, many times for many hospitals and clinics. I’d stay a year or two, but eventually I’d quit. Then, in 2005, I opened an ideal clinic designed by my patients.', N'http://i.imgur.com/w3T5C6t.jpg')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (8, N'74e60034-4ccf-4421-96cd-847d1aa2908a', N'Dean''s favorite day out with the girl of his dreams...', N'<h3 style="text-align: center;"><img src="http://i.imgur.com/0ya2oAU.jpg" alt="" width="294" height="221" /></h3>
<h3><strong>This was an amazing night on the town. My buddies, all in santa clothes were reading to show the world that Duke was here to party. We represent everything that is good, innocent and gentle about our ever-evolving world. But there can only be one, Mrs. Kim.</strong></h3>
<h3><img style="display: block; margin-left: auto; margin-right: auto;" src="http://i.imgur.com/kSpwRHo.jpg" alt="" width="184" height="272" /></h3>', CAST(N'2015-12-07 12:14:39.530' AS DateTime), NULL, 1, 5, N'Dean finds true love for the first time. Now, is the love 2D or 3D... ? That is the real question. Here were are to find out today.', N' http://i.imgur.com/0ya2oAU.jpg')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (9, N'74e60034-4ccf-4421-96cd-847d1aa2908a', N'When I met the love of my life... by Dean Choi', N'<p>What I was waiting for my whole life had just come.</p>
<p>From across the sea, pirates, thieves, mothernature and others trying to disrupt our love. And NOW, my darling has finally arrived and I will be together for forever longer.</p>
<p>Misaka Mikoto. You mean the world to me. I''ll be you "Biri Biri" any day of the week. Will you agree to have your poster placed on my bedroom wall?</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="http://cdn.myanimelist.net/images/characters/10/185161.jpg" alt="" width="225" height="350" /></p>', CAST(N'2015-12-07 12:15:51.600' AS DateTime), NULL, 1, 5, N'The never before has been told a story of how the greatest and most beautiful romance between two unsuspecting friends. After that experience, they realize the true depths of their true feelings.', N'http://i.imgur.com/95scqmz.gif')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (10, N'74e60034-4ccf-4421-96cd-847d1aa2908a', N'DJ Deanzel is in the house performing at the 401 LOFTS TONIGHT!!!!!', N'<p style="text-align: left;"><img src="http://i.imgur.com/oWYDRX8.jpg" alt="" width="408" height="271" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src="http://i.imgur.com/Sglassf.jpg" alt="" width="172" height="307" /></p>
<h3 style="text-align: left;"><strong>The party was off the hook as it was led by the world-famous DJ Deanzel of Philadelphia fame. He rocked the ones and twos while showering women with all his newest serenades. This is the true pinnacle of entertainment achievement. &nbsp;A master at work.</strong></h3>', CAST(N'2015-12-07 12:16:56.140' AS DateTime), NULL, 1, 1, N'Rager of the century as we take in a performance by the new king of EDM, Dean "deanzel" Choi. A true gentleman and a scholar.', N'http://i.imgur.com/3ZTPf6u.jpg')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (11, N'74e60034-4ccf-4421-96cd-847d1aa2908a', N'Our Quaint Meetup Last Night... at McDonalds', N'<p>After a hard day of work, the founders enjoyed a late dinner at a place that was dear to their hearts.</p>
<p>Dean''s Order:</p>
<ul>
<li>2 McDoubles</li>
<li>1 McChicken</li>
<li>Free water</li>
</ul>
<p>Patrick''s Order:</p>
<ul>
<li>Sausage Biscuit</li>
<li>Soda</li>
<li>Sausage Burrito</li>
</ul>
<p>Tim''s Order:</p>
<ul>
<li>10 piece Chicken McNuggets meal</li>
<li>Lots of Dr Pepper</li>
</ul>
<p>&nbsp;</p>
<p>Our reaction:</p>
<p><img src="http://i.imgur.com/LcuCKWm.gif" alt="" width="248" height="187" /></p>', CAST(N'2015-12-07 12:17:59.183' AS DateTime), NULL, 1, 5, N'The founders of JSDate had a little pow-wow at a very exclusive fine dining establishment after a hard day of work.', N'http://i.imgur.com/fczTugH.jpg')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (12, N'74e60034-4ccf-4421-96cd-847d1aa2908a', N'Dean reconnects with an "Old Flame"', N'<p>I walked into the store. And there she was. Right in front of me again.</p>
<p>Memories came rushing back when I saw her face.</p>
<p>Great memories. Sad memories. Happy memories.</p>
<p>I''ll always remember her...</p>
<p><img src="http://cdn.myanimelist.net/images/characters/2/273799.jpg" alt="" width="184" height="287" /></p>', CAST(N'2015-12-07 12:19:13.467' AS DateTime), NULL, 1, 5, N'Dean stumbles upon an old flame from his past. What happens after?', N'http://i.imgur.com/aDcKcbg.gif')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (13, N'74e60034-4ccf-4421-96cd-847d1aa2908a', N'I met my hero the other day', N'<p>I was out in Cleveland last night and had the encounter of a lifetime.</p>
<p>I met "him".</p>
<p>The person that I admire most in the world. The person that I look up to and push myself to try to emulate. The greatest person that the city of Cleveland has ever seen.</p>
<p>I met "him".</p>
<p>Mathew. Dellavadova.</p>
<p><img src="http://i.imgur.com/JeALrO9.jpg" alt="" width="417" height="234" /></p>
<p>My life is now complete.</p>', CAST(N'2015-12-07 12:20:02.647' AS DateTime), NULL, 1, 2, N'Dean goes out on the town and meets the man who has inspired him his entire life.', N'http://i.imgur.com/mQhElWH.jpg')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (14, N'aef7943d-d5da-4570-98b5-378a077ecfa6', N'Coding or Love', N'<p>There is power in understanding the journey of others to help create your own. I have always drawn on my muses for inspiration. During my formative years living abroad in Italy, I&rsquo;d devour the VHS tapes of C#&nbsp;stars of the &rsquo;80s that my grandfather would send across the Atlantic. Later on, when I moved back to America and was the kid in school who dressed differently and had trouble reading and writing in English, Coding&nbsp;was my outlet, my source of power.</p>
<p>Coding&nbsp;is the vehicle through which I question myself. It&rsquo;s the vehicle in which I learn about myself.</p>
<p>Now, after 18 years in the CodingBA, I want to show you the journey. The pain, the sacrifice, the disappointments and the glory. I want to show you what it really means to chase greatness.</p>
<p>&nbsp;</p>', CAST(N'2015-12-07 12:21:27.243' AS DateTime), NULL, 1, 3, N'The other day I made a big life decision.', N'http://i.imgur.com/aooqCVq.png')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (15, N'74e60034-4ccf-4421-96cd-847d1aa2908a', N'I Will Remember You... ಥ_ಥ', N'<p>I was reminded of your beautiful smile...</p>
<p><img src="http://i.imgur.com/5oqFwsy.gif" alt="" width="245" height="194" /></p>
<p>I will remember you<br />Will you remember me?<br />Don''t let your life pass you by<br />Weep not for the memories</p>
<p>Remember the good times that we had?<br />I let them slip away from us when things got bad<br />How clearly I first saw you smilin'' in the sun<br />Wanna feel your warmth upon me, I wanna be the one</p>
<p>I will remember you<br />Will you remember me?<br />Don''t let your life pass you by<br />Weep not for the memories</p>
<p>I''m so tired but I can''t sleep<br />Standin'' on the edge of something much too deep<br />It''s funny how we feel so much but we cannot say a word<br />We are screaming inside, but we can''t be heard</p>
<p>But I will remember you<br />Will you remember me?<br />Don''t let your life pass you by<br />Weep not for the memories</p>
<p>I''m so afraid to love you, but more afraid to lose<br />Clinging to a past that doesn''t let me choose<br />Once there was a darkness, deep and endless night<br />You gave me everything you had, oh you gave me light</p>
<p>And I will remember you<br />Will you remember me?<br />Don''t let your life pass you by<br />Weep not for the memories</p>
<p>And I will remember you<br />Will you remember me?<br />Don''t let your life pass you by<br />Weep not for the memories<br />Weep not for the memories</p>
<p style="text-align: center;"><iframe src="//www.youtube.com/embed/nSz16ngdsG0" width="560" height="314" allowfullscreen="allowfullscreen"></iframe></p>', CAST(N'2015-12-09 22:21:22.440' AS DateTime), NULL, 1, 4, N'I was walking alone in the park and something reminded me of you...', N'http://i.imgur.com/6BFzuTX.gif')
INSERT [dbo].[BlogPosts] ([BlogPostID], [UserID], [BlogPostTitle], [BlogPostText], [TimeCreated], [ExpirationDate], [Status], [CategoryID], [Description], [CoverImageUrl]) VALUES (16, N'74e60034-4ccf-4421-96cd-847d1aa2908a', N'Tim''s Ideal Girl', N'<p>&nbsp;</p>
<p><img src="http://i.imgur.com/mM9BjnH.jpg" alt="" width="306" height="306" /></p>
<p>&nbsp;</p>
<p>She is on LinkedIn.</p>', CAST(N'2015-12-10 11:54:32.990' AS DateTime), NULL, 1, 3, N'Who is the girl of his dreams?', N'http://i.imgur.com/mM9BjnH.jpg')
SET IDENTITY_INSERT [dbo].[BlogPosts] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryTitle]) VALUES (1, N'Events')
INSERT [dbo].[Categories] ([CategoryID], [CategoryTitle]) VALUES (2, N'News')
INSERT [dbo].[Categories] ([CategoryID], [CategoryTitle]) VALUES (3, N'Opinions')
INSERT [dbo].[Categories] ([CategoryID], [CategoryTitle]) VALUES (4, N'Other')
INSERT [dbo].[Categories] ([CategoryID], [CategoryTitle]) VALUES (5, N'Recap')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Hashtags] ON 

INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (1, N'Tim')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (2, N'cities')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (3, N'favorites')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (4, N'dreams')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (5, N'k-pop')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (6, N'music')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (7, N'j-pop')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (8, N'girls')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (9, N'traveling')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (10, N'food')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (11, N'Patrick')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (12, N'Delly')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (13, N'parking')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (14, N'lady')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (15, N'loving')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (16, N'sellingout')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (17, N'biking')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (18, N'promotions')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (19, N'doctors')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (20, N'ballinhard')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (21, N'rollininbills')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (22, N'Dean')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (23, N'santa')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (24, N'dreamgirl')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (25, N'MrsKim')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (26, N'2Dor3D?')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (27, N'love')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (28, N'Biribiri')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (29, N'DJDeanzel')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (30, N'rager')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (31, N'401Lofts')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (32, N'party')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (33, N'EDM')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (34, N'McDonalds')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (35, N'fine-dining')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (36, N'formerflame')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (37, N'Ex')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (38, N'idol')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (39, N'hero')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (40, N'dream')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (41, N'coding')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (42, N'passion')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (43, N'MissingYou')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (44, N'SarahMcLaughlin')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (45, N'Crying')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (46, N'Lonely')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (47, N'DreamGirl')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (48, N'Love')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (49, N'LinkedIn')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (50, N'Girl')
INSERT [dbo].[Hashtags] ([HashtagID], [HashtagTitle]) VALUES (51, N'Asian')
SET IDENTITY_INSERT [dbo].[Hashtags] OFF
SET IDENTITY_INSERT [dbo].[StaticPages] ON 

INSERT [dbo].[StaticPages] ([StaticPageID], [StaticPageTitle], [StaticPageText], [UserID], [TimeCreated], [Status]) VALUES (1, N'About JSDate', N'<p><img src="http://i.imgur.com/s4ipWXf.jpg" alt="" width="176" height="96" /></p>
<p>From the creators of <strong><a title="JDate" href="https://jdate.com/" target="_blank">JDate</a></strong>, the premier online dating service for Jewish-singles, comes a new venture aimed at connecting hearts among individuals who share this one similar passion: coding.</p>
<p><img src="http://i.imgur.com/ft9MjT9.png" alt="" width="448" height="268" /></p>
<p>We are <strong>JSDate</strong> and we aim to "plug" you in with the coding &ldquo;partner&rdquo; of your dreams.</p>
<p>Get ready to take your &ldquo;paired-programming&rdquo; to the next level...</p>', N'74e60034-4ccf-4421-96cd-847d1aa2908a', CAST(N'2015-12-07 21:16:50.140' AS DateTime), 1)
INSERT [dbo].[StaticPages] ([StaticPageID], [StaticPageTitle], [StaticPageText], [UserID], [TimeCreated], [Status]) VALUES (2, N'About 2SB&Dean', N'<p style="text-align: left;"><img src="http://i.imgur.com/xEHVi7S.png" alt="" width="329" height="286" /></p>
<p><strong>"Two Sweet Boys and Dean"</strong> is a start-up dating service based in Akron, Ohio, founded by Dean Choi, Timothy Lin, and Patrick Tighe with the help of philantropist/entrepreneur/NBA-Finals-MVP-Runner-Up Matthew Dellavadova.</p>
<p>&nbsp;</p>
<p><img src="http://i.imgur.com/3ZTPf6u.jpg" alt="" width="285" height="213" /></p>
<p><strong>Dean</strong> is a struggling DJ with a hidden passion for Bootstrap.</p>
<p>&nbsp;</p>
<p><img src="http://i.imgur.com/KSEGfjA.jpg" alt="" width="293" height="195" /></p>
<p><strong>Tim</strong> is a sweet boy who dreams of one day moving to the big city... of Seattle.</p>
<p>&nbsp;</p>
<p><img src="http://i.imgur.com/XvWcQMe.jpg" alt="" width="195" height="195" /></p>
<p><strong>Patrick</strong> is also a sweet boy who can''t resist the "back-end".</p>
<p>&nbsp;</p>
<p><img src="http://i.imgur.com/mQhElWH.jpg" alt="" width="191" height="255" /></p>
<p><strong>Matthew Dellavadova</strong> is a basketball god and sex symbol from Australia.</p>
<p>Together, we are here to document their journey of finding the <em>"coding partners"</em> of their dreams.</p>', N'74e60034-4ccf-4421-96cd-847d1aa2908a', CAST(N'2015-12-07 21:20:10.970' AS DateTime), 1)
INSERT [dbo].[StaticPages] ([StaticPageID], [StaticPageTitle], [StaticPageText], [UserID], [TimeCreated], [Status]) VALUES (3, N'YOLO', N'<p>YOLO</p>', N'74e60034-4ccf-4421-96cd-847d1aa2908a', CAST(N'2015-12-10 11:56:34.757' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[StaticPages] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/10/2015 2:53:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/10/2015 2:53:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/10/2015 2:53:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/10/2015 2:53:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/10/2015 2:53:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/10/2015 2:53:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddBlogPostHashtags]    Script Date: 12/10/2015 2:53:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddNewBlogPost]    Script Date: 12/10/2015 2:53:27 PM ******/
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
	@CategoryID int,
	@Description nvarchar(250),
	@CoverImageUrl nvarchar(1000)
)
as
begin

insert into BlogPosts(UserID, BlogPostTitle, BlogPostText, TimeCreated, [Status], CategoryID, [Description], CoverImageUrl)
values (@UserID, @BlogPostTitle, @BlogPostText, @TimeCreated, @Status, @CategoryID, @Description, @CoverImageUrl)

set @BlogPostID = SCOPE_IDENTITY();

end








GO
/****** Object:  StoredProcedure [dbo].[AddNewHashtag]    Script Date: 12/10/2015 2:53:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddNewStaticPage]    Script Date: 12/10/2015 2:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AddNewStaticPage]
(
	@StaticPageID int output,
	@UserID nvarchar(128),
	@StaticPageTitle nvarchar(100),
	@StaticPageText text,
	@TimeCreated datetime,
	@Status int
)
as
begin

insert into StaticPages(UserID, StaticPageTitle, StaticPageText, TimeCreated, [Status])
values (@UserID, @StaticPageTitle, @StaticPageText, @TimeCreated, @Status)

set @StaticPageID = SCOPE_IDENTITY();

end



GO
/****** Object:  StoredProcedure [dbo].[AddRoleToUser]    Script Date: 12/10/2015 2:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddRoleToUser]
(
	@UserID nvarchar(128),
	@RoleID nvarchar(128)
)
as

begin

insert into [dbo].AspNetUserRoles(UserId, RoleId)
values (@UserID, @RoleID)

exec GetUserByID @UserID

end





GO
/****** Object:  StoredProcedure [dbo].[DeleteBlogPostHashtagsByBlogPostID]    Script Date: 12/10/2015 2:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteBlogPostHashtagsByBlogPostID]
(
@BlogPostID int
)
as
begin

delete BlogPostHashtags
	where BlogPostID = @BlogPostID

end

GO
/****** Object:  StoredProcedure [dbo].[EditBlogPost]    Script Date: 12/10/2015 2:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EditBlogPost]
(
@BlogPostID int,
@BlogPostTitle nvarchar(100),
@BlogPostText text,
@Status int,
@CategoryID int,
@Description nvarchar(250),
@CoverImageUrl nvarchar(1000)
)
as
begin

update BlogPosts
	set BlogPostTitle = @BlogPostTitle,
	BlogPostText = @BlogPostText,
	[Status] = @Status,
	CategoryID = @CategoryID,
	[Description] = @Description,
	CoverImageUrl = @CoverImageUrl
	where BlogPostID = @BlogPostID

end

GO
/****** Object:  StoredProcedure [dbo].[EditStaticPage]    Script Date: 12/10/2015 2:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EditStaticPage]
(
@StaticPageID int,
@StaticPageTitle nvarchar(100),
@StaticPageText text,
@Status int
)
as
begin

update StaticPages
	set StaticPageTitle = @StaticPageTitle,
	StaticPageText = @StaticPageText,
	[Status] = @Status
	where StaticPageID = @StaticPageID

end

GO
/****** Object:  StoredProcedure [dbo].[GetAllBlogPosts]    Script Date: 12/10/2015 2:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetAllBlogPosts]
as
begin

select b.BlogPostID, b.BlogPostTitle, b.BlogPostText, b.CategoryID, c.CategoryTitle,
b.TimeCreated, b.ExpirationDate, b.Status, b.UserID, u.Email, u.FirstName, u.LastName,
u.UserName, u.AccountStatus, ur.RoleId, b.CoverImageUrl, b.Description
	from BlogPosts b
	inner join Categories c
	on b.CategoryID = c.CategoryID
	inner join aspnetusers u
	on b.UserID = u.Id
	inner join AspNetUserRoles ur
	on u.Id = ur.UserId

end








GO
/****** Object:  StoredProcedure [dbo].[GetAllStaticPages]    Script Date: 12/10/2015 2:53:27 PM ******/
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

select p.StaticPageID, p.StaticPageTitle, p.StaticPageText, p.UserID, p.TimeCreated, p.Status,
u.UserName, r.RoleId, u.Email, u.FirstName, u.LastName, u.AccountStatus
from StaticPages p
inner join AspNetUsers u
on p.UserID = u.Id
inner join AspNetUserRoles r
on u.Id = r.UserId

END








GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 12/10/2015 2:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetAllUsers] as
begin
select u.Id as UserID, u.FirstName, u.LastName, u.Email, u.UserName, u.AccountStatus, r.Id as RoleID, r.Name as RoleName
	from AspNetUsers u
	inner join AspNetUserRoles ur
	on u.Id = ur.UserId
	inner join AspNetRoles r
	on ur.RoleId = r.Id
end








GO
/****** Object:  StoredProcedure [dbo].[GetBlogPostByID]    Script Date: 12/10/2015 2:53:27 PM ******/
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
select b.BlogPostID, b.UserID, b.BlogPostTitle, b.BlogPostText, b.TimeCreated, b.ExpirationDate, b.[Status], b.CategoryID,
		c.CategoryTitle, u.UserName, r.RoleId, b.[Description], b.CoverImageUrl,
		u.Email, u.FirstName, u.LastName, u.AccountStatus
	from blogPosts b
	inner join Categories c
	on c.CategoryID = b.CategoryID
	inner join AspNetUsers u
	on b.UserID = u.Id
	inner join AspNetUserRoles r
	on r.UserId = u.Id
	where b.BlogPostID = @BlogPostID

END








GO
/****** Object:  StoredProcedure [dbo].[GetCategoryByID]    Script Date: 12/10/2015 2:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetCategoryByID] 
(
@CategoryID int
)
as
begin

select *
	from Categories c
	where c.CategoryID = @CategoryID

end






GO
/****** Object:  StoredProcedure [dbo].[GetHashtagByBlogPostID]    Script Date: 12/10/2015 2:53:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetHashtagByID]    Script Date: 12/10/2015 2:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetHashtagByID] 
(
@HashtagID int
)
as
begin

select *
	from Hashtags h
	where h.HashtagID = @HashtagID

end






GO
/****** Object:  StoredProcedure [dbo].[GetPageByID]    Script Date: 12/10/2015 2:53:27 PM ******/
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

select p.StaticPageID, p.StaticPageTitle, p.StaticPageText, p.UserID, p.TimeCreated, p.Status,
u.UserName, r.RoleId, u.Email, u.FirstName, u.LastName, u.AccountStatus
from StaticPages p
inner join AspNetUsers u
on p.UserID = u.Id
inner join AspNetUserRoles r
on u.Id = r.UserId
where p.StaticPageID = @staticPageId

END








GO
/****** Object:  StoredProcedure [dbo].[GetUserByID]    Script Date: 12/10/2015 2:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetUserByID]
(
@UserID nvarchar(128)
)
as
begin
select u.Id as UserID, u.FirstName, u.LastName, u.Email, u.UserName, u.AccountStatus, r.Id as RoleID, r.Name as RoleName
	from AspNetUsers u
	inner join AspNetUserRoles ur
	on u.Id = ur.UserId
	inner join AspNetRoles r
	on ur.RoleId = r.Id
	where u.Id = @UserID
end





GO
/****** Object:  StoredProcedure [dbo].[UpdateRoleByUserID]    Script Date: 12/10/2015 2:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateRoleByUserID]
(
@UserID nvarchar(128),
@RoleID nvarchar(128)
)
as
begin

update AspNetUserRoles
	set RoleId = @RoleID
	where UserId = @UserID

exec GetUserByID @UserID
end





GO
/****** Object:  StoredProcedure [dbo].[UpdateStaticPageStatus]    Script Date: 12/10/2015 2:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[UpdateStaticPageStatus]
(
	@Status int,
	@StaticPageID int
)
as
begin

update StaticPages
	set [Status] = @Status
	where StaticPageID = @StaticPageID

exec GetPageByID @StaticPageID

end


GO
/****** Object:  StoredProcedure [dbo].[UpdateStatus]    Script Date: 12/10/2015 2:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[UpdateStatus]
(
	@Status int,
	@BlogPostID int
)
as
begin

update BlogPosts
	set [Status] = @Status
	where BlogPostID = @BlogPostID

exec GetBlogPostByID @BlogPostID

end




GO
/****** Object:  StoredProcedure [dbo].[UpdateUserAccountStatus]    Script Date: 12/10/2015 2:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateUserAccountStatus]
(
@UserID nvarchar(128),
@AccountStatus int
)
as
begin

update AspNetUsers
	set AccountStatus = @AccountStatus
	where Id = @UserID

exec GetUserByID @UserID

end

GO
USE [master]
GO
ALTER DATABASE [Blogs] SET  READ_WRITE 
GO
