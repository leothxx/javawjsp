show tables;

CREATE TABLE schedule (
	idx INT NOT NULL auto_increment PRIMARY KEY,
	mid VARCHAR(20) NOT NULL, /* 회원 아이디(일정검색시 필요) */
	sDate DATETIME NOT NULL,  /* 일정 등록 날짜 */
	part VARCHAR(10) NOT NULL, /* 1.모임, 2.업무, 3.학습, 4.여행, 5.기타 */
	content TEXT NOT NULL    /* 일정 상세 내역 */
);

desc schedule;


INSERT INTO schedule VALUES (default,'leothx_x','2022-12-08','학습','프로젝트 계획서 완료');
INSERT INTO schedule VALUES (default,'leothx_x','2022-12-09','기타','집안일');
INSERT INTO schedule VALUES (default,'leothx_x','2022-12-12','여행','오사카 여행');
INSERT INTO schedule VALUES (default,'leothx_x','2022-12-25','모임','가족 점심모임');
INSERT INTO schedule VALUES (default,'leothx_x','2022-12-25','학습','오전10시 스터디카페');
INSERT INTO schedule VALUES (default,'leothx_x','2022-12-25','모임','크리스마스 약속');
INSERT INTO schedule VALUES (default,'leothx_x','2022-12-31','모임','연말 술자리');
INSERT INTO schedule VALUES (default,'leothx_x','2023-01-05','학습','Spring 설정 공부');
INSERT INTO schedule VALUES (default,'admin','2022-12-15','기타','프로젝트 회원관리 완성');
INSERT INTO schedule VALUES (default,'admin','2022-12-25','모임','크리스마스 약속');

SELECT * FROM schedule ORDER BY sDate DESC;
SELECT * FROM schedule WHERE mid = 'leothx_x' ORDER BY sDate DESC;
SELECT * FROM schedule WHERE mid = 'leothx_x' AND sDate = '2022-12-25' ORDER BY sDate DESC;
SELECT * FROM schedule WHERE mid = 'leothx_x' AND date_format(sDate,'%Y-%m') = '2022-12' ORDER BY sDate DESC;
SELECT * FROM schedule WHERE mid = 'leothx_x' AND date_format(sDate,'%Y-%m') = '2023-1' ORDER BY sDate DESC; -- 에러 발생함. 01로 표기해야함.
SELECT * FROM schedule WHERE mid = 'leothx_x' AND date_format(sDate,'%Y-%m') = '2023-01' ORDER BY sDate DESC;
SELECT * FROM schedule WHERE mid = 'leothx_x' AND date_format(sDate,'%Y-%m') = '2022-12' GROUP BY part ORDER BY sDate DESC;
SELECT *,count(*) FROM schedule WHERE mid = 'leothx_x' AND sDate= '2022-12-25' GROUP BY part ORDER BY sDate DESC;

SELECT *,count(*) as partCnt FROM schedule WHERE mid = 'leothx_x' AND date_format(sDate, '%Y-%m') = '2022-12' GROUP BY sDate ORDER BY sDate DESC;
SELECT * FROM schedule WHERE mid = 'leothx_x' AND date_format(sDate, '%Y-%m') = '2022-12' ORDER BY sDate,part DESC;