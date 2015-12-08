USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[GetAllBlogPosts]    Script Date: 12/8/2015 12:39:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[GetAllBlogPosts]
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

