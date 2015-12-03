USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[AddNewHashtag]    Script Date: 12/3/2015 3:04:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AddNewHashtag]
(
	@HashtagID int output,
	@HashtagTitle nvarchar(30)
)
as
begin
insert into Hashtags(HashtagTitle)
values(@HashtagTitle)

set @HashtagID = SCOPE_IDENTITY();

end
GO

