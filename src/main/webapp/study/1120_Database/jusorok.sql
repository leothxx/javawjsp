show tables;
show databases;
select * from sungjuk;
desc sungjuk;

select * from test1;

create table jusorok (
	idx int not null auto_increment primary key, /* 고유번호 */
	mid varchar(20) not null, /* 아이디 */
	pwd varchar(20) not null, /* 비밀번호 */
	name varchar(20) not null, /* 이름 */
	point int default 100,  /* 포인트 */
	lastDate datetime default now()  /* 최근 방문일자 */
);

desc jusorok;

insert into jusorok values (default, 'admin','1234','관리자',default,default);

select * from jusorok;