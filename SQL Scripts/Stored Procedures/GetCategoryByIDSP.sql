USE [Blogs]
GO

/****** Object:  StoredProcedure [dbo].[GetCategoryByID]    Script Date: 12/4/2015 1:56:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetCategoryByID] 
(
@CategoryID int
)
as
begin

select *
	from Categories c
	where c.CategoryID = @CategoryID

end
GO

