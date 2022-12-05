show tables;

create table board (
  idx  int  not null auto_increment,	/* 게시글의 고유번호 */
  nickName  varchar(20)  not null,		/* 게시글 올린사람의 닉네임 */
  title			varchar(100) not null,		/* 게시글의 글 제목 */
  email			varchar(50),							/* 글쓴이의 메일주소(회원가입시에 필수 입력처리 되어 있다.) */
  homePage  varchar(50),							/* 글쓴이의 홈페이지(블로그)주소 */
  content		text	not null,						/* 글 내용 */
  wDate			datetime	default now(),	/* 글 올린 날짜 */
  hostIp		varchar(50) not null,			/* 글 올린이의 접속 IP */
  readNum   int default 0,						/* 글 조회수 */
  good			int default 0,						/* '좋아요' 클릭 횟수 누적하기 */
  mid				varchar(20) not null,			/* 회원 아이디(내가 올린 게시글 전체 조회시체 사용) */
  primary key(idx)
);

desc board;

insert into board values (default,'관리맨','게시판 서비스를 시작합니다.','cjsk1126@naver.com','cjsk1126.tistory.com','이곳은 게시판입니다.',default,'192.168.50.20',default,default,'admin');

select * from board;

/* 날짜함수 처리 연습 */
select now(); -- now() : 오늘 날짜와 시간을 보여준다. --
select year(now()); -- year() : 년도 출력 --
select month(now()); -- month() : 월 출력 --
select day(now()); -- day() : 일 출력 --
select date(now()); -- date() : 년-월-일 출력 --
select weekday(now()); -- 요일 : 0(월요일), 1(화), 2(수), 3(목), 4(금), 5(토), 6(일)
select dayofweek(now()); -- 요일 : 1(일요일), 2(월), 3(화), 4(수), 5(목), 6(금), 7(토)
select hour(now()); -- hour() : 시
select minute(now()); -- minute() : 분
select second(now()); -- second() : 초

select year('2022-12-1');
select idx, year(wDate) from board;
select idx, month(wDate) from board;
select idx, day(wDate) as 날짜 from board;
select idx, wDate as 일자, weekday(wDate) as 요일 from board;

/* 날짜 연산 */
--date_add(date, interval 값 type) // add 와 sub는 반대이다.
select date_add(now(), interval 1 day); -- 오늘 날짜보다 +1일 출력
select date_add(now(), interval -1 day); -- 오늘 날짜보다 -1일 출력
select date_add(now(), interval 10 day_hour); -- 오늘 날짜보다 +10시간 출력
select date_add(now(), interval -10 day_hour); -- 오늘 날짜보다 -10시간 출력

--date_sub(date, interval 값 type) // add와 sub는 반대이다.
select date_sub(now(), interval 1 day); -- 오늘 날짜보다 -1일 출력
select date_add(now(), interval -1 day); -- 오늘 날짜보다 +1일 출력

select from_days(now());

라도레레 레미파파 파솔미미 레도도레
라도레레 레미파파 파솔미미 레도도레

select idx, wDate from board;
-- 년도(2자리):%y, 년도(4자리):%Y, 월(숫자):%m, 월(영문):%M, 일(숫자):%d, 일(st):%D, 시(12시간제):%h, 시(24시간제):%H, 분():%i, 분():%I, 초():%s, 초():%S,
select idx, date_format(wDate, "%y-%M-%d") from board; -- 대문자 M은 월을 영문으로 출력한다.
select idx, date_format(wDate, "%y-%m-%d") from board; -- 소문자 m은 월을 숫자로 출력한다.
select idx, date_format(wDate, "%y-%m-%D") from board; -- 소문자 m은 월을 숫자로 출력한다.
select idx, date_format(wDate, "%h-%i-%s") from board; -- 소문자 m은 월을 숫자로 출력한다.
select idx, date_format(wDate, "%H-%I-%S") from board; -- 소문자 m은 월을 숫자로 출력한다.

-- 현재부터 한달전의 날짜
select date_add(now(), interval -1 month);
select date_add(now(), interval 6 month);

-- 하루전 체크
select date_add(now(), interval -1 day);
select date_add(now(), interval -1 day), wDate from board;

-- 날짜차이 계산 :DATEDIFF(시작날짜, 마지막날짜)
select datediff("2022-11-30", "2022-12-01");
select datediff(now(), "2022-11-30");
select idx, wDate, datediff(now(), wDate) as day_diff from board;
select idx, wDate, datediff(now(), wDate) as day_diff from board;
select *, datediff(now(), wDate) as day_diff from board;

-- 시간 비교
select *, timestampdiff(hour, wDate, now()) as hour_diff, datediff(now(), wDate) as day_diff from board;

/* 이전글 다음글 체크 */
select * from board where idx < 4 order by idx desc limit 1; /* 여기서 rs.next()를 주면 가장 위에있는 idx 3번이 온다. 가장 idx가 큰거를 가져와야 하기에 desc 차순으로 정렬 후 가져옴 */
select * from board where idx > 4 limit 1; /* idx가 가장 작은것 부터 나오기 떄문에 rs.next() 한번만 주면 된당. limit1을 줘서 하나의 자료만 가져옴. */

/* 게시판에 댓글 달기 */
create table boardReply (
	idx int not null auto_increment, /* 댓글의 고유번호 */
	boardIdx int not null, /* 원본글의 고유번호 (외래키로 지정) */
	mid varchar(20) not null, /* 댓글 올린이의 아이디 */
	nickName varchar(20) not null, /* 댓글 작성자 */
	wDate datetime default now(), /* 댓글 작성 날짜 */
	hostIp varchar(50) not null, /* 댓글 작성자의 IP */
	content text not null, /* 댓글 내용 */
	primary key(idx),
	foreign key(boardIdx) references board(idx)
	/* on update cascade
	on delete restrict */
);
desc boardReply;

/* 댓글의 수를 전체 List에 출력하기 연습 */
select * from boardReply order by idx desc;
-- board테이블의 고유번호 29번 글에 딸려있는 댓글의 개수는 ?
select count(*) as replyCnt from boardReply where boardIdx = 29;
-- board테이블의 고유번호 29번 글에 딸려있는 댓글의 개수는 ?
-- 원본글의 고유번호와 함께 출력, 개수의 별명은 replyCnt
select boardIdx, count(*) as replyCnt from boardReply where boardIdx = 29;

-- board테이블의 고유번호 29번 글에 딸려있는 댓글의 개수는 ?
-- 원본글의 고유번호와 함께 출력, 개수의 별명은 replyCnt
-- 이때 원본글 작성자의 닉네임을 함께 출력하시오. 단, 닉네임은 board(원본글)테이블에서 가져와서 출력하시오.
select boardIdx, nickName,  count(*) as replyCnt from boardReply where boardIdx = 29;
SELECT boardIdx, (SELECT nickName FROM board WHERE idx = 29) AS nickName,  count(*) AS replyCnt FROM boardReply WHERE boardIdx = 29;

-- 앞의 문장을 부모테이블의 관점에서 보자.
SELECT mid, nickName FROM board WHERE idx = 29;
-- 앞의 닉네임을 자식(댓글)테이블(boardReply)에서 가져와서 보여준다면 ??
SELECT mid, (SELECT nickName FROM boardReply WHERE boardIdx = 29) AS nickName FROM board WHERE idx = 29; -- 부모 관점에서는 해당 idx에 자료가 한건이지만, 자식관점에서는 idx에 따른 nickName이 여러개가 나오기 때문에 이걸 수행 할 수 없다고 에러남.
-- 부모 관점(board)에서 고유번호 29번의 아이디와, 현재글에 달려있는 댓글의 개수 ?
SELECT mid, (SELECT count(*) FROM boardReply WHERE boardIdx = 29) AS replyCnt FROM board WHERE idx = 29;

-- 부모 관점(board)에서 board테이블의 모든 내용과, 현재글에 달려있는 댓글의 개수를 가져오되, 최근글 5개만 출력. 핵심 : board.idx 보드테이블에 있는 idx와 같아야한다는 뜻.
SELECT *, (SELECT count(*) FROM boardReply WHERE boardIdx = board.idx) AS replyCount FROM board ORDER BY idx DESC limit 5;
-- 각각의 테이블에 별명을 붙여서 앞의 내용을 변경시켜보자. board 테이블의 별명을 b로 줬다.
SELECT *, (SELECT count(*) FROM boardReply WHERE boardIdx = b.idx) AS replyCount FROM board b ORDER BY idx DESC limit 5;