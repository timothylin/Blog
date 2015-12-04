USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[GetHashtagByID]    Script Date: 12/4/2015 1:56:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetHashtagByID] 
(
@HashtagID int
)
as
begin

select *
	from Hashtags h
	where h.HashtagID = @HashtagID

end
GO

