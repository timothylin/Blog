USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[UpdateStaticPageStatus]    Script Date: 12/8/2015 1:42:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[UpdateStaticPageStatus]
(
	@Status int,
	@StaticPageID int
)
as
begin

update StaticPages
	set [Status] = @Status
	where StaticPageID = @StaticPageID

exec GetPageByID @StaticPageID

end

GO

