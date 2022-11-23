show tables;

create table guest(
	idx int not null auto_increment primary key, /* 고유번호 */
	name varchar(20) not null, /* 방문자 성명 20자이내 */
	email varchar(60), /* 이메일 주소 */
	homePage varchar(60), /* 홈페이지 주소 */
	visitDate datetime default now(), /* 방문일자 el표기법에서 첫번째 다음글자가 대문자면 첫글자로 대문자료 표시함. */
	hostIp varchar(50) not null, /* 방문자 IP */
	content text not null /* 방문 내용 */
);

desc guest;

insert into guest values(default,'관리자','shn2769@naver.com','https://www.wity.im/leothx_x',default,'192.168.50.67','방명록 서비스 오픈!');

select * from guest;