--Display the current home value for each property in question a)--
Select p.Name AS [Property Names],
       op.propertyid AS [Property Id],
	   pf.CurrentHomeValue AS [Current Home Value],
	   op.OwnerId AS OwnerId
From property p 
inner Join OwnerProperty op ON p.Id = op.PropertyId
inner Join PropertyFinance pf ON p.Id = pf.PropertyId
Where op.OwnerId ='1426'