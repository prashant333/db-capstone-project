use db_capstone_project;
select Name from menu where MenuID=any (select MenuID from orders where quantity>2) 