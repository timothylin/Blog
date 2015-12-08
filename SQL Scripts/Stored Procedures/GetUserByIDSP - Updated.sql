USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[GetUserByID]    Script Date: 12/8/2015 12:21:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[GetUserByID]
(
@UserID nvarchar(128)
)
as
begin
select u.Id as UserID, u.FirstName, u.LastName, u.Email, u.UserName, u.AccountStatus, r.Id as RoleID, r.Name as RoleName
	from AspNetUsers u
	inner join AspNetUserRoles ur
	on u.Id = ur.UserId
	inner join AspNetRoles r
	on ur.RoleId = r.Id
	where u.Id = @UserID
end




GO

