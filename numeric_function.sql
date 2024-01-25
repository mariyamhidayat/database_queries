/* numeric function*/
select log(2)

/* floor function pervious integer value that is smallest or equal to number */
 select floor(90.78)

 /* celling function return the next integer value that is bigger than or equal to number*/
  select CEILING(90.78)

  /* round function use round the specfied decimal number of places */
 select round(5.6890099789,3)

  /* mod function return the remainder  of the number divided by another number*/
   

  /*power(base,exponent) */
 select power(2,3)

  /* greatest number*/
  select GREATEST(34,66,88,33,24,12,77,44,99,10)

  /*smallest number*/
  select least(55,2,378,5,45,99,67,55)

  /* radius*/
 select RADIANS(180)

  /*square root*/
 select SQRT(196)

  /* rand*/
  select rand()

  /* ABS find absolute value */
  select abs(-67.900)



  /*String functin*/



  /* find ascii value*/
 select ASCII('A')
   /* find char */
   select char (65)

   /* CHARINDEX() Function search for the substring in the string and return the postion*/
  select CHARINDEX ('t','customor')
  
  /* difference function compare tw soundex value and return to the integer */
   select difference ('maryam','ayesha')
  
  /* left function return the left part of the character string with the specified number of the character*/
   select left('MARYAMHIDAYAt',6)
   
   /* right function return the right part of the character string with the specified number of the character*/
   select right('MARYAMHIDAYAt',7)
  
  /* len function return the total number of char*/
  select len('maryamhidayat')
  
  /*lower function*/
   select lower('MARYAMHIDAYAt')
	
	/*uper function*/
	select upper('maryamhidayat')

	/* rtrim ,ltrim function remove the left sie space */
	select ltrim('        maryma')
	
	/*nchar return the unidcode */
	select nchar('400')
	
	/*patindex  use to return the starting index  postion of the first accourance  in the string*/
	select patindex('a%','maryam')
	
	/*quotename return the unicode into string */
	select QUOTENAME(' i m a student','"')
	
	/*replace function existing string convert with new value*/
	select replace (' fetime','e','a')
	
	/* replicate function means repeat the string*/
	select replicate('maryma',3)
	select reverse(' i m a student')
	
	/*space function*/
	
	


	/* stuff delete a specfied length of the character and insert and another*/
	select stuff('maryam',2,1,'hidayat')

	/* substring count the char and spaces*/
	select substring ('maryam',1,5)



	/*data and time function*/

	/* getdate() return current date and time */
	select getdate()
	/* convert the time in 12 hours*/
	select convert(varchar,getdate(),100)
/* sysdatetime return current date and time and return the 7 precision seconds*/
	select SYSDATETIME();
	/*datename retrun the month name , year name */
	select datename(month,getdate())
	select datename(year,getdate())
	select datename(day,getdate())
	select datename(hour,getdate())
	select datename(year,'2009/6/8')
 /*diffdate return the difference between two dates*/
	select datediff( year,'2003-1-11',getdate())
	select datediff( month,'2003-1-11',getdate())
	select datediff( day,'2003-1-11',getdate())
	select datediff( hour,'2003-1-11',getdate())
/* adddate() add or sub a specfied time interval for a date*/
	select dateadd(day,2,getdate())
	select dateadd(day,-2,getdate())
/*datepart() */
	select datepart(year,getdate())
	select datepart(month,getdate())
	select datepart(day,getdate())

	/* current find only day ya date ya month*/
	select day(getdate())
	select month(getdate())
	select year(getdate())
	/* isdate() return the valid date */ 







   