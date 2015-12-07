USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[UpdateStatus]    Script Date: 12/7/2015 11:48:59 AM ******/
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

