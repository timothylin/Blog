USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[GetAllStaticPages]    Script Date: 12/8/2015 12:40:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Paaaaaaaaaaaat>
-- Create date: <12/3/2015>
-- Description:	<Get all static pages. all of them>
-- =============================================
ALTER PROCEDURE [dbo].[GetAllStaticPages]
AS
BEGIN

select p.StaticPageID, p.StaticPageTitle, p.StaticPageText, p.UserID, p.TimeCreated, p.Status,
u.UserName, r.RoleId, u.Email, u.FirstName, u.LastName, u.AccountStatus
from StaticPages p
inner join AspNetUsers u
on p.UserID = u.Id
inner join AspNetUserRoles r
on u.Id = r.UserId

END







GO

