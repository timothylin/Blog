USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 12/1/2015 5:06:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetAllUsers] as
begin
select u.Id as UserID, u.FirstName, u.LastName, u.Email, u.UserName, r.Id as RoleID, r.Name as RoleName
	from AspNetUsers u
	inner join AspNetUserRoles ur
	on u.Id = ur.UserId
	inner join AspNetRoles r
	on ur.RoleId = r.Id
end
GO

