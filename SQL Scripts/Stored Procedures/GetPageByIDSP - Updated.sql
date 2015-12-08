USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[GetPageByID]    Script Date: 12/8/2015 12:42:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Pat>
-- Create date: <12/3/2015>
-- Description:	<Getting Pages by their ID>
-- =============================================
ALTER PROCEDURE [dbo].[GetPageByID]
	-- Add the parameters for the stored procedure here
(
@staticPageId int
)
AS
BEGIN

select p.StaticPageID, p.StaticPageTitle, p.StaticPageText, p.UserID, p.TimeCreated, p.Status,
u.UserName, r.RoleId, u.Email, u.FirstName, u.LastName, u.AccountStatus
from StaticPages p
inner join AspNetUsers u
on p.UserID = u.Id
inner join AspNetUserRoles r
on u.Id = r.UserId
where p.StaticPageID = @staticPageId

END







GO

