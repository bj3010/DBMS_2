create database Product_info

select * from Products

--part a

--1
declare 
	@Product_id int ,
	@Product_Name varchar(250),
	@Price decimal(10,2);
declare cursor_product cursor
for 
	select 
		Product_id,
		Product_Name,
		Price
	from
		Products
open cursor_product;
fetch next from cursor_product into 
	@Product_id,
	@Product_Name,
	@Price;
while @@FETCH_STATUS=0
	begin 
		print cast(@product_id as varchar(50))+'-'++@product_Name+'-'+cast(@price as varchar(50))
fetch next from cursor_product into 
	@Product_id,
	@Product_Name,
	@Price;
end;
close cursor_product;
deallocate cursor_product;



--2
declare 
	@Product_id int ,
	@Product_Name varchar(250);
	
declare cursor_product cursor
for 
	select 
		Product_id,
		Product_Name
	
	from
		Products
open cursor_product;
fetch next from cursor_product into 
	@Product_id,
	@Product_Name;

while @@FETCH_STATUS=0
	begin 
		print cast(@product_id as varchar(50))+'_'++@product_Name;
fetch next from cursor_product into 
	@Product_id,
	@Product_Name;

end;
close cursor_product;
deallocate cursor_product;





--3
declare 
	@Product_id int;
declare cursor_product cursor
for 
	select 
		Product_id
	from
		Products;
open cursor_product;
fetch next from cursor_product into 
	@Product_id;
while @@FETCH_STATUS=0
	begin 
		delete from products
		where product_id=@Product_id
		
		fetch next from cursor_product into 
	@Product_id;
	
end;
close cursor_product;
deallocate cursor_product;


--Part – B
--4. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increasesthe price by 10


--4

declare 
	@Product_id int ,
	@Price decimal(10,2);
declare cursor_product cursor
for 
	select 
		Product_id,
		Price
	from
		Products;
open cursor_product;
fetch next from cursor_product into 
	@Product_id,
	@Price;
while @@FETCH_STATUS=0
	begin 
		update Products
		set
			Price=@Price+@Price/10
	where Product_id=@Product_id
fetch next from cursor_product into 
	@Product_id,
	@Price;
end;
close cursor_product;
deallocate cursor_product;

select *from products






--Part – C
--5. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop” 
--(Note: Create NewProducts table first with same fields as Products table)
declare 
	@Product_id int ,
	@product_Name varchar(250),
	@Price decimal(10,2);
declare 