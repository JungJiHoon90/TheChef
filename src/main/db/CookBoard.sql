drop table cook_recipe;

create table cook_recipe(
	k_title varchar2(1000),
	id varchar2(100),
	k_no varchar2(1000) primary key,
	k_contentFile varchar2(2000),
	k_thumbFile varchar2(2000),
	k_regdate date,
	k_category varchar2(100),
	k_src varchar2(100)
);
select * from cook_recipe;

create sequence cookrecipe_seq;
drop sequence cookrecipe_seq;

select * from(
select A.*, rownum r from (
select * from cook_recipe order by k_category) 
A) where r between 1 and 5
