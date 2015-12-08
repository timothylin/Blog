USE [Blogs]
GO

<<<<<<< HEAD
/****** Object:  StoredProcedure [dbo].[UpdateStaticPageStatusSP]    Script Date: 12/7/2015 11:48:59 AM ******/
=======
/****** Object:  StoredProcedure [dbo].[UpdateStaticPageStatus]    Script Date: 12/8/2015 1:42:03 PM ******/
>>>>>>> 46fbccff3c420da3d24d1b976f5d8cd5af55597c
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

<<<<<<< HEAD
=======

>>>>>>> 46fbccff3c420da3d24d1b976f5d8cd5af55597c
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

