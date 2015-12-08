USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[UpdateStaticPageStatusSP]    Script Date: 12/7/2015 11:48:59 AM ******/
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

