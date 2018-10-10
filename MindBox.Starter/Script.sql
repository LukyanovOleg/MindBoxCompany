select p.Name, C.Name  
	from Products P 
LEFT OUTER JOIN ProductInCategory PC
	on P.Id = PC.ProductId
LEFT OUTER JOIN Categories C 
	on PC.CategoryId = c.ID