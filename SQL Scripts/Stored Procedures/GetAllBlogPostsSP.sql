USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[GetAllBlogPosts]    Script Date: 12/2/2015 5:59:30 PM ******/
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

