
drop table talk_board ;
select * from talk_board;

create table talk_board(
	T_NO NUMBER primary key,
	T_TITLE VARCHAR2(500),
	T_WRITER VARCHAR2(500),
	T_REGDATE TIMESTAMP,
	T_HIT NUMBER(30),
	T_CONTENTS VARCHAR2(4000)
);


drop sequence talk_board_seq;
create sequence talk_board_seq;