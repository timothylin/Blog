USE [Blogs]

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

