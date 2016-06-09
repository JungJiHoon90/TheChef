drop table cook_comment;

create table cook_comment(
	K_NO NUMBER ,
	COMMENT_SEQ VARCHAR2(50),
	COMMENT_NAME VARCHAR2(50),
	COMMENT_COMM VARCHAR2(500),
	COMMENT_REGDATE DATE,
	CONSTRAINT FK_cook_comment FOREIGN KEY(K_NO)
	REFERENCES cook_board(K_NO)
);

drop sequence  COMMENT_SEQ_seq;
create sequence COMMENT_SEQ;

select * from cook_comment;

drop table board_comment;
s
insert into cook_comment values(notice_board_seq.nextVal, 'WRITER', 'COMMENT', sysdate )

select * from cook_comment, cook_board where cook_comment.E_NO = cook_board.E_NO;