USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[AddNewBlogPost]    Script Date: 12/3/2015 3:04:36 PM ******/
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

