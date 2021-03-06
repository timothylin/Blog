USE [Blogs]
GO
/****** Object:  StoredProcedure [dbo].[AddBlogPostHashtags]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddNewBlogPost]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddNewHashtag]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddNewStaticPage]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddRoleToUser]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteBlogPostHashtagsByBlogPostID]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditBlogPost]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditStaticPage]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllBlogPosts]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllStaticPages]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetBlogPostByID]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetCategoryByID]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetHashtagByBlogPostID]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetHashtagByID]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPageByID]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetUserByID]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateRoleByUserID]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateStaticPageStatus]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateStatus]    Script Date: 12/10/2015 3:44:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateUserAccountStatus]    Script Date: 12/10/2015 3:44:48 PM ******/
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
