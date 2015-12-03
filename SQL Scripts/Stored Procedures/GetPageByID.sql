select p.StaticPageID, p.StaticPageTitle, p.StaticPageText, p.UserID, p.TimeCreated, p.CategoryID, p.Status, c.CategoryTitle, u.UserName, r.RoleId
from StaticPages p
inner join Categories c
on p.CategoryID = c.CategoryID
inner join AspNetUsers u
on p.UserID = u.Id
inner join AspNetUserRoles r
on u.Id = r.UserId


