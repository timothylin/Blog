USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[UpdateRoleByUserID]    Script Date: 12/6/2015 4:56:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[UpdateRoleByUserID]
(
@UserID nvarchar(128),
@RoleID nvarchar(128)
)
as
begin

update AspNetUserRoles
	set RoleId = @RoleID
	where UserId = @UserID

exec GetUserByID @UserID
end
GO

