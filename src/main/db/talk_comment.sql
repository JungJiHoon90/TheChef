create table talk_comment(
	T_NO NUMBER,
	COMMENT_SEQ VARCHAR2(50),
	COMMENT_NAME VARCHAR2(50),
	COMMENT_COMM VARCHAR2(500),
	COMMENT_REGDATE DATE,
	CONSTRAINT FK_talk_comment FOREIGN KEY(T_NO)
	REFERENCES talk_board(T_NO)	
);
drop sequence  COMMENT_SEQ_seq;
create sequence COMMENT_SEQ;


 select * from talk_comment, talk_board where talk_comment.T_NO = talk_board.T_NO;

select * from TALK_COMMENT;
drop table talk_comment;

