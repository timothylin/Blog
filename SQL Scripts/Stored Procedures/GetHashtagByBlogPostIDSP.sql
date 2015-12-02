USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[GetHashtagByBlogPostID]    Script Date: 12/2/2015 5:59:44 PM ******/
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

