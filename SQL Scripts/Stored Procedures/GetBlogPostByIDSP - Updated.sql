USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[GetBlogPostByID]    Script Date: 12/7/2015 11:57:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<PAAAAAAAT>
-- Create date: <12/3/2015>
-- Description:	<Getting Blog Post by ID>
-- =============================================
ALTER PROCEDURE [dbo].[GetBlogPostByID]
(
@BlogPostID int
)
AS
BEGIN
select b.BlogPostID, b.UserID, b.BlogPostTitle, b.BlogPostText, b.TimeCreated, b.ExpirationDate, b.[Status], b.CategoryID,
		c.CategoryTitle, u.UserName, r.RoleId, b.[Description], b.CoverImageUrl,
		u.Email, u.FirstName, u.LastName
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

