drop table member
cascade constraints;

create table member (
	id varchar2(50) primary key,
	pwd varchar2(50) not null,
	name varchar2(50) not null,
	email varchar2(50) unique,
	auth number(1) not null
)