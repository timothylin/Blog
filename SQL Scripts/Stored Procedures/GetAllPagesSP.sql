USE [Blogs]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Paaaaaaaaaaaat>
-- Create date: <12/3/2015>
-- Description:	<Get all static pages. all of them>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllStaticPages]
AS
BEGIN

select p.StaticPageID, p.StaticPageTitle, p.StaticPageText, p.UserID, p.TimeCreated, p.CategoryID, p.Status, c.CategoryTitle, u.UserName, r.RoleId
from StaticPages p
inner join Categories c
on p.CategoryID = c.CategoryID
inner join AspNetUsers u
on p.UserID = u.Id
inner join AspNetUserRoles r
on u.Id = r.UserId

END
GO
