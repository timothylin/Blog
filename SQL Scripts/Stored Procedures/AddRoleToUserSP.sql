USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[AddRoleToUser]    Script Date: 12/6/2015 4:57:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AddRoleToUser]
(
	@UserID nvarchar(128),
	@RoleID nvarchar(128)
)
as

begin

insert into [dbo].AspNetUserRoles(UserId, RoleId)
values (@UserID, @RoleID)

exec GetUserByID @UserID

end
GO

