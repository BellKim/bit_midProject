drop table bbs
cascade constraint;

drop sequence seq_bbs;

create table bbs(
	seq number(8) primary key,
	id varchar2(50) not null,
	
	ref number(8) not null,
	step number(8) not null,
	depth number(8) not null,
	
	title varchar2(200) not null,
	content varchar2(4000) not null,
	wdate date not null,
	
	del number(1) not null,
	readcount number(8) not null
);


create sequence seq_bbs
start with 1
increment by 1;

alter table bbs
add constraint fk_bbs_id foreign key (id)
references member(id);



select * from bbs

