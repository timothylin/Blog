USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[DeleteBlogPostHashtagsByBlogPostID]    Script Date: 12/8/2015 3:21:39 PM ******/
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

