USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[EditBlogPost]    Script Date: 12/8/2015 3:21:48 PM ******/
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

