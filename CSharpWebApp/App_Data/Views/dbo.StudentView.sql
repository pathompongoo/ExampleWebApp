CREATE VIEW [dbo].[StudentView]
	AS 
	SELECT p.Id, p.FirstName_TH, p.LastName_TH, gd.Name_TH 
	FROM People p 
	join People_Student ps on p.Id = ps.Id
	join GenderSet gd on p.Gender_Id = gd.Id
