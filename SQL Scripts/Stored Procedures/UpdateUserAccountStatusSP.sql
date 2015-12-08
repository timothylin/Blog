USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[UpdateUserAccountStatus]    Script Date: 12/8/2015 12:21:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[UpdateUserAccountStatus]
(
@UserID nvarchar(128),
@AccountStatus int
)
as
begin

update AspNetUsers
	set AccountStatus = @AccountStatus
	where Id = @UserID

exec GetUserByID @UserID

end
GO

