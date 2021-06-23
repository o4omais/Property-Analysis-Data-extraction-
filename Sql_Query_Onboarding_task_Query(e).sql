

--Display all property names, current tenants first and last names and rental payments per week/ fortnight/month for the properties in question a). 
Select p.Name AS [Property Names],
       op.OwnerId AS OwnerId,
       pr.FirstName AS [Tenant first Name],
	   pr.LastName AS [Tenant Last Name],
	   tp.PaymentAmount,
	   tp.StartDate AS [Tenant Start Date],
	   tp.EndDate AS [Tenant End Date],
	   tp.IsActive
       --op.propertyid AS [Property Id],
	   
FROM Person pr
INNER JOIN Tenant t
ON pr.PhysicalAddressId = t.ResidentialAddress
INNER JOIN TenantProperty tp
ON t.Id = tp.TenantId
INNER JOIN Property p
ON tp.PropertyId = p.Id
INNER JOIN OwnerProperty o
ON p.Id = o.PropertyId
INNER JOIN OwnerProperty op ON p.Id = op.PropertyId
WHERE op.OwnerId = 1426 AND tp.IsActive = 1
