USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[AddNewStaticPage]    Script Date: 12/3/2015 3:04:36 PM ******/
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

