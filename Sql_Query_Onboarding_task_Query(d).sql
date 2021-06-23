--Display all the jobs available
SELECT DISTINCT j.Id AS JobID , 
j.PropertyId ,
j.OwnerId , 
j.JobDescription , 
j.JobStartDate,
j.JobEndDate,
jm.IsActive 
FROM Job AS j 
INNER JOIN JobMedia AS jm ON j.Id=jm.JobId 
WHERE jm.IsActive=1
