USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[AddBlogPostHashtags]    Script Date: 12/3/2015 3:04:19 PM ******/
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

