

--Display all property names, current tenants first and last names and rental payments per week/ fortnight/month for the properties in question a). 
Select p.Name AS [Property Names],
       op.propertyid AS [Property Id],
	   op.OwnerId AS OwnerId
From property p 
Join OwnerProperty op ON p.Id = op.PropertyId
Where op.OwnerId ='1426'



select *
from property

select *
from OwnerProperty

