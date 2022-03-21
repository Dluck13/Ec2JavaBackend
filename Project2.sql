
--create database Project2;

--\c Project2;



--drops procedures
drop procedure if exists  approve_request;
drop procedure if exists  employee_login;

--drops view
drop view if exists all_reimbursements;
drop view if exists v_employees;
drop view if exists v_employee_permissions;
drop view if exists v_employee_login;

-- drops tables
drop table if exists reimbursement_updates;
drop table if exists employee_permissions;
drop table if exists reimbursements;
drop table if exists employees; 
drop table if exists job_titles;
drop table if exists permissions;
drop table if exists reimbursement_statuss;
drop table if exists reimbursement_types;


-- all manual entry tables do not have autogenerated ID's all dynamic tables have generated ID's
-- any tables keeping track of money or allowences, or anything else that may effect an 

-------------------------------------------------
-- Tables
-------------------------------------------------

-- seperates jobtitles from roles, allows more options than manager and allows types of employees
-- employees have 1 job title
-- floating table do to ORM
Create Table job_titles(
	job_title_id		Integer,
	job_title			varchar(30),
	primary key(job_title_id)
);

-- Can have a users table linked for non employees, not included here, employee name 
Create Table employees (
	employee_id 		Integer,
	job_title			varchar(30),  -- change for object relation mapping
	first_name			varchar(30),
	last_name			varchar(30),
	email				varchar(30),
	phone				varchar(30),
	user_name			varchar(30),
	user_password		varchar(30),
	primary key(employee_id)
);

-- lists the permissions type, can have a table connectiong default permissions to role,
-- since that would only be used if we could register employees, it is not included
-- floating table to to ORM
Create Table permissions (
	permission_id		Integer,  
	permission_type		varchar(30),
	primary key(permission_id)
);

-- edited to fit ORM
Create Table employee_permissions(
	employee_permission_id 	Integer generated always as identity,
	employee_id 			Integer not null,
	permission_id			Integer not null, -- id kept 
	permission_type			varchar(30), -- redundant, here for ORM 
	primary key(employee_permission_id),
	Constraint fk_employees_p_employees Foreign Key(employee_id) References employees(employee_id),
	Constraint fk_employees_p_permissions Foreign Key(permission_id) References permissions(permission_id)
);

-- floating table for ORM, can still be used as dropdowns/ect.
Create Table reimbursement_statuss(
	status_id		Integer,
	status			varchar(30),
	primary key(status_id)
) ;

-- travel/hotel, food, work supplies, replacements, ect. would help with approval/denial option
Create Table reimbursement_types(
	type_id				Integer,
	reimbursement_type	varchar(30),		
	primary key(type_id)
);

-- comment variables can be there own table as well, but that would be a little much for the scope of this project
-- date of last update effectivily removed, can be used elseware to show all updates to a reimbursement.
Create Table reimbursements(
	reimbursement_id 	Integer generated always as identity,
	employee_id			Integer not null,
	status_id			Integer	not null,
	status				varchar(30)	not null,
	reimbursement_type	varchar(30)	not null,
	date_of_transaction	varchar(30)	not null,
	date_of_submission	varchar(30)	not null,
	amount				numeric	not null,
	details				varchar(200),
	merchant			varchar(30),
	primary key(reimbursement_id),
	Constraint fk_reimbursements_employees Foreign Key(employee_id) References employees(employee_id)
);

-- recordsd updates, date submitted and resalved goes here
Create Table reimbursement_updates(
	update_id			Integer generated always as identity,
	reimbursement_id	Integer not null,
	status				varchar(30) not null,
	update_comment		varchar(200),
	date_of_update		varchar(30)	not null,
	primary key(update_id),
	Constraint fk_update_reimbursement Foreign Key(reimbursement_id) References reimbursements(reimbursement_id)
);

-- any extra tables added (if any) are only tangentially related and may simulate features of an production environment

-------------------------------------------------
-- INSERTS
-------------------------------------------------
-- initial data, includes initial data
insert into job_titles(job_title_id, job_title)
	values  (1,'Finance manager'),
			(2,'Associate'),
			(3,'Sales Representative'), 
			(4,'Human Relations');

-- only reimbursment approve included atm, can add permission to claim reimbursment as well
insert into permissions(permission_id,permission_type)
	values	(0,'standard employee'), -- not giving to the finance manager atm, unless we allow finance manager to make and approve their own reimbursments
			(1,'reimbursment approval');
	

insert into reimbursement_statuss(status_id, status)
	values	(1,'new'),
			(2,'request canceled'),
			(3,'updated'),
			(4,'approved'),
			(5,'denied');
	
insert into reimbursement_types(type_id,reimbursement_type)
	values	(1, 'travel'),
			(2, 'office supplies'),
			(3, 'repairs and maintenance'),
			(4, 'equitment'),
			(5, 'legal');
			
insert into employees(employee_id, job_title,first_name,last_name,email,phone,user_name,user_password)
	values	(1,'Associate','normal','employee','normal.employee@busness.com','(123) 123-1234','1','1'),
			(2,'Sales Representative','sales','man','sales.man@busness.com','(123) 321-1234','2','2'),
			(3,'Sales Representative','sales','woman','sales.woman@busness.com','(123) 123-1231','3','3'),
			(4,'Finance manager','mr','manager','mr.manager@busness.com','(123) 123-4567','4','4');


insert into employee_permissions(employee_id, permission_id,permission_type)
	values	(4,1,'reimbursment approval'),
			(1,0,'standard employee'),
			(2,0,'standard employee'),
			(3,0,'standard employee');
			
	-- status + status ID redundant, but kept for ORM =/
insert into reimbursements(employee_id,status_id,status,reimbursement_type,date_of_transaction,amount,details,merchant,date_of_submission)
	values	(2,4,'Approved','travel','2020-01-10',150,'hotel','mariot','2020-01-14'),
			(2,4,'Approved','travel','2020-01-10',30,'gas','speedway','2020-01-14'),
			(2,5,'Denied','travel','2020-01-10',300,'fancy restraunt','food place','2020-01-14'),
			(1,4,'Approved',4,'2020-02-25',1200,'ohh new machinery','Bobs hardware','2020-02-25'),
			(1,1,'New',5,'2020-02-26',3000,'worker injury compensation hospital visit','hospital','2020-02-26'),
			(3,1,'New',3,'2020-02-27',140,'replace broken chair','furniture place','2020-02-28');


insert into reimbursement_updates(reimbursement_id,status,date_of_update,update_comment)
	values	(1,'New','2020-01-14','reimbursement request submitted'),   --comment text can be changed for default comment
			(2,'New','2020-01-14','reimbursement request submitted'),
			(3,'New','2020-01-14','reimbursement request submitted'),
			(1,'Approved','2020-01-16','approved'),
			(2,'Approved','2020-01-16','approved'),
			(3,'Denied','2020-01-16','denied, excessive cost'),
			(4,'New','2020-02-25','reimbursement request submitted'),
			(4,'Approved','2020-02-26','approved'),
			(5,'New','2020-02-26','reimbursement request submitted'),
			(6,'New','2020-02-27','reimbursement request submitted');


-- procedure and views comment out for ORM for now

-------------------------------------------------
-- Views
-------------------------------------------------
-- gets all reimbursements and all relevent information from them.
--create view all_reimbursements(db_reimbursement_id,db_status_id,db_employee_id,employee,status,r_type,amount,details,current_comment,date_of_transaction,date_submited,date_of_update,merchant)
--	as select 
--		reimbursements.reimbursement_id as db_reimbursement_id, 
--		reimbursements.status_id	as db_status_id,
--		employees.employee_id as db_employee_id,
--		concat(employees.first_name, ' ',employees.last_name) as employee,
--		reimbursement_statuss.status as status,
--		reimbursement_types.reimbursement_type as r_type,
--		reimbursements.amount as amount,
--		reimbursements.details as details,
--		current_update.update_comment as current_comment,
--		reimbursements.date_of_transaction as date_of_transaction,
--		initial_update.date_of_update as date_submitted,
--		current_update.date_of_update as date_of_update,
--		reimbursements.merchant
--	from reimbursements
--	inner join reimbursement_statuss 
--	on reimbursements.status_id = reimbursement_statuss.status_id
--	inner join reimbursement_types
--	on reimbursements.type_id = reimbursement_types.type_id
--	inner join employees 
--	on reimbursements.employee_id = employees.employee_id
--	inner join reimbursement_updates as current_update
--	on	reimbursements.reimbursement_id = current_update.reimbursement_id 
--	and reimbursements.status_id = current_update.status_id
--	inner join reimbursement_updates as initial_update
--	on	reimbursements.reimbursement_id = initial_update.reimbursement_id 
--	and initial_update.status_id = 1;
	
	-- view for viewing employees
/*create view v_employees(employee_id,full_name,email,phone,job_title)
	as select employee_id, 
	concat(employees.first_name, ' ',employees.last_name) as full_name, 
	email,
	phone,
	job_title
	from employees
	inner join job_titles
	on employees.job_title_id = job_titles.job_title_id;
	*/
/*create view v_employee_permissions(employee_id,permission_id,permission_type)
	as select employee_id, permissions.permission_id, employee_permissions.permission_type as permission_type
	from permissions
	inner join employee_permissions
	on permissions.permission_id = employee_permissions.permission_id;
	
*/	
	-- view for login relevant info
/*create view v_employee_login(employee_id,full_name,email,phone,job_title,first_name,last_name,user_name,user_password)
	as select employee_id, 
	concat(employees.first_name, ' ',employees.last_name) as full_name, 
	email,
	phone,
	job_title,
	first_name,
	last_name,
	user_name,
	user_password
	from employees
	inner join job_titles
	on employees.job_title_id = job_titles.job_title_id;

	*/

-------------------------------------------------
-- procedures
-------------------------------------------------	
	
/*
CREATE PROCEDURE approve_request(IN reim_id integer, IN stat_id integer, IN com varchar(200))
LANGUAGE 'sql'
AS $BODY$
insert into  reimbursement_updates(reimbursement_id,status_id,date_of_update,update_comment)
	values	(reim_id,stat_id,current_date,com);
update reimbursements
	set status_id = stat_id
	where reimbursement_id = reim_id;
$BODY$;
ALTER PROCEDURE public.approve_request(integer, integer, character varying)
    OWNER TO postgres;

*/

/*
CREATE PROCEDURE employee_login(IN u_name varchar(30), 
								IN u_password varchar(30), 
								out  first_name varchar(30),
								out last_name varchar(30),
								out full_name varchar(30),
								out job_title varchar(30),
								out email varchar(30),
								out phone varchar(30),
							   	out employee_id integer)
LANGUAGE 'sql'
AS $BODY$
	select 
		first_name,
		last_name,
		full_name,
		job_title,
		email,
		phone,
		employee_id
	from v_employee_login
	where u_name = user_name and u_password = user_password;
$BODY$;
ALTER PROCEDURE public.approve_request(integer, integer, character varying)
    OWNER TO postgres;

*/









