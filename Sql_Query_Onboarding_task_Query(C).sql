--For each property in question a), return the following:                                                                      
--Using rental payment amount, rental payment frequency, tenant start date and tenant end date to write a query that returns the sum of all payments from start date to end date. 
--Display the yield.
Select p.Name AS [Property Names],
       op.propertyid AS [Property Id],
	   pf.CurrentHomeValue AS [Current Home Value],
	   prp.Amount AS [Rental Payment Amount],
	    tpf.code AS [Rental payment Frequency],
	    Sum(Case When tpf.Code ='weekly' Then (DATEDIFF(WEEK,tp.startdate,tp.enddate)*prp.Amount)
	            when tpf.code ='Fortnightly' Then (((DATEDIFF(Month,tp.startdate,tp.enddate)+1)*2)*prp.Amount)
				when tpf.code ='Monthly' Then ((DateDiff(Month,tp.startdate,tp.enddate)+1)*prp.Amount)
			END) AS Sumofallyear,
	   tp.StartDate AS [Tenant Start Date],
	   tp.EndDate AS [Tenant End Date],
	   Sum(Case When tpf.Code ='weekly' Then (((DATEDIFF(WEEK,tp.startdate,tp.enddate)*prp.Amount)/pf.currenthomevalue)*100)
	            when tpf.code ='Fortnightly' Then (((((DATEDIFF(Month,tp.startdate,tp.enddate)+1)*2)*prp.Amount)/pf.currenthomevalue)*100)
				when tpf.code ='Monthly' Then ((((DateDiff(Month,tp.startdate,tp.enddate)+1)*prp.Amount)/pf.currenthomevalue)*100)
			END) AS Yield,
	   op.OwnerId AS OwnerId
From property p 
 Join OwnerProperty op ON p.Id = op.PropertyId
 Join PropertyFinance pf ON p.Id = pf.PropertyId
 --Join (select PropertyId,Sum(Amount) AS [sum of all year]
       --from PropertyRentalPayment
	-- **group by PropertyId) as prp ON op.PropertyId = prp.PropertyId
 join PropertyRentalPayment as prp ON op.PropertyId = prp.PropertyId
 Join TenantProperty tp ON prp.PropertyId = tp.PropertyId
 join TenantPaymentFrequencies tpf ON prp.FrequencyType = tpf.Id
Where op.OwnerId ='1426' 
Group By (p.Name),(op.PropertyId),(pf.CurrentHomeValue),(tp.StartDate),(tp.EndDate),pf.Yield,(op.OwnerId),prp.Amount,tpf.Code

