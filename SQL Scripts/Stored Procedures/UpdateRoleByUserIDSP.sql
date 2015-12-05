USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[UpdateRoleByUserID]    Script Date: 12/5/2015 6:28:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[UpdateRoleByUserID]
(
@UserID nvarchar(128),
@roleID int
)
as
begin

update AspNetUserRoles
	set RoleId = @roleID
	where UserId = @UserID

exec GetUserByID @UserID
end
GO

