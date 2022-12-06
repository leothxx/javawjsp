show tables;

/* 파일이 하나면 문제가 없지만, 여러개를 올릴 수 있으니 파일 이름이 1,2,3 이렇게 나와야하는지 ?
   100개의 파일이 온다면 100번까지 갈텐데 어떻게 구현할 건가 ??
   /로 구분하겠음. 예를들어 1.jpg/2.jpg/3.jpg 이다.
   슬래시로 구분한다면 올라온 파일의 개수를 확인하는데 쉽지만, 문제점이 있다.
   파일 이름을 100자가 넘게 저장하는 사람이 있을 수 있기에, 길이를 얼마나 주어야 할지?? 그것이 관건이다.
   실무에서는 프론트 및 백에서 계속해서 파일에 있어 체크를 해야하지만, 공부삼아 올바른 파일명만 넘어온다 생각하여 200바이트만 주겠다.  */
CREATE TABLE pds (
	idx int not null auto_increment, /* 자료실 고유번호 */
	mid varchar(20) not null, /* 업로드한 아이디 */
	nickName varchar(20) not null, /* 업로드한 닉네임 */
	fName varchar(200) not null, /* 업로드시 파일명 */
	fSName varchar(200) not null, /* 실제 파일서버에 저장되는 파일명 */
	fSize int not null,           /* 파일의 총 사이즈 (누적해서 db에 넣으면 되기에 따로 작업해야할 건 없다) */
	title varchar(100) not null, /* 업로드 파일의 제목 */
	part varchar(20) not null, /* 파일 분류 */
	pwd varchar(100) not null, /* 비밀번호(암호화 - sha256암호화 처리) */
	fDate datetime default now(), /* 파일 업로드한 날짜 */
	downNum int default 0, /* 다운로드 횟수 */
	openSw char(6) default '공개', /* 파일 공개(비공개) 여부*/
	content text,                /* 업로드 파일의 상세설명 */
	hostIp varchar(50) not null, /* 업로더의 IP */
	primary key (idx) /* 기본키 : 자료실의 고유번호 */
);

desc pds;

select * from pds order by idx desc;