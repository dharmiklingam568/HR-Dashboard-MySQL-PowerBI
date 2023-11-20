/*-----------------------------------------------Data Cleaning-----------------------------------------*/
/*describe of the hr table*/
desc hr;

/* selecting all columns of the hr table*/
select * from hr;

/* alter the column name from ï»¿id to emp_id using DDL commnand*/
alter table hr 
change column ï»¿id emp_id varchar(20) null;

/* updating the birthdate columns value to date format using DML command and case statment */
update hr 
set birthdate = case 
	when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
    when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
    else null
    end;

/*alter the birthdate column datetype to date datatype using DDL command */
alter table hr 
modify column birthdate date;


/*updating the hire_date column to date format using DML command*/
update hr 
set hire_date = case 
	when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
    when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
    else null
    end;


/*updating the termdate column to date format using DML command */
update hr
set termdate =date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate !='';

/*updating the termadate columns wehre the null values are present replacing with 0000-00-00 format*/
update hr
set termdate ='0000-00-00'
where termdate ='';

/*alter the termdate column to date datatype*/
alter table hr
modify column termdate date;

/*alter the hire_date column to date datatype*/
alter table hr
modify column hire_date date;

/*Adding the new column age in hr table using the DDL command with int datatype*/
alter table hr
add column age int;

/*updating the age column with timestampdiff function using birthdate column and using currdate function to adding the age of each customer*/
update hr 
set age=timestampdiff(year,birthdate,curdate());

/*Deleting the customer who's age is less than 18*/
delete from hr 
where age < 18;

