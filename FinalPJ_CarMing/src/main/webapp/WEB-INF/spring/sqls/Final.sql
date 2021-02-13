/****************************************************************
                      MEMBER
*****************************************************************/	

DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP SEQUENCE MEMSEQ ;


CREATE SEQUENCE MEMSEQ;
CREATE TABLE MEMBER(
   MEMNO NUMBER PRIMARY KEY,
   MEMNICK VARCHAR2(100) UNIQUE NOT NULL,
   MEMID VARCHAR2(100) UNIQUE NOT NULL,
   MEMPW VARCHAR2(100) NOT NULL,
   MEMNAME VARCHAR2(100) NOT NULL,
   MEMZIP VARCHAR2(100) NOT NULL,
   MEMADDR VARCHAR2(1000) NOT NULL,
   MEMADDR2 VARCHAR2(100),
   MEMPHONE VARCHAR2(100) NOT NULL,
   MEMBIRTH DATE NOT NULL,
   MEMGENDER NUMBER NOT NULL,
   MEMCHK VARCHAR2(1) DEFAULT 'N' NOT NULL,
   MEMCODE NUMBER DEFAULT '2' NOT NULL,
   MEMFILE VARCHAR2(2000)
);

ALTER TABLE MEMBER 
ADD CONSTRAINT MEMGENDER_CHK CHECK (MEMGENDER IN (1, 2));
ALTER TABLE MEMBER ADD CONSTRAINT MEMCHK_CHK CHECK (MEMCHK IN ('Y', 'N'));
ALTER TABLE MEMBER ADD CONSTRAINT MEMCODE_CHK CHECK (MEMGENDER IN (1, 2));

SELECT * FROM MEMBER;



UPDATE MEMBER SET MEMCODE=1 WHERE MEMNO=1;
DELETE FROM MEMBER WHERE MEMNO=1;

INSERT INTO MEMBER (MEMNO, MEMNICK, MEMID, MEMPW, MEMNAME, MEMZIP, MEMADDR, MEMADDR2, MEMPHONE, MEMBIRTH, MEMGENDER, MEMCHK) 
VALUES(MEMSEQ.NEXTVAL, '펭귄', 'user1', 'pass1', '홍길동', '06234', '서울특별시 강남구', '남도빌딩 4층', '01012345678', DATE '2013-02-17', '2', 'Y');

INSERT INTO MEMBER 
VALUES(MEMSEQ.NEXTVAL, '관리자', 'admin1', 'adminpass1', '김유리', '54678', '경기도 화성시', '어딘가', '01078941234', DATE '2013-02-17', '1', 'N',1,NULL);

----------------------------------------------------------------------------------------------------------------------------
/****************************************************************
                      	캠핑 토크(BOARD)
*****************************************************************/	

DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP SEQUENCE BRDNOSEQ;

CREATE SEQUENCE BRDNOSEQ;
CREATE TABLE BOARD(
    BRDNO NUMBER PRIMARY KEY,                                       				--게시글 번호
    BCATEGORYNO NUMBER NOT NULL,                                    				--카테고리 번호 참조
    BRDWRITER VARCHAR2(100) NOT NULL,                              			 		--게시글 작성자 (Session이용)
    BRDFILE VARCHAR2(2000) NOT NULL,                                				--파일명
    BRDVIDEO VARCHAR2(2000) DEFAULT 'N' NOT NULL,                                		--동영상
    BRDCONTENT VARCHAR2(2000) NOT NULL,                                       		--게시글 내용    
    BRDCOUNT NUMBER NOT NULL,                                       				--게시글 조회수
    BRDDATE DATE NOT NULL,                                          				--게시글 작성 날짜
    BRDPRIVATE VARCHAR2(1) CHECK(BRDPRIVATE IN('Y','N')) NOT NULL,  				--나만보기 체크 여부(Y:체크/N:체크x)
    MEMNO NUMBER NOT NULL,															--memno
    FOREIGN KEY (BCATEGORYNO) REFERENCES BCATEGORY(BCATEGORYNO) ON DELETE CASCADE,
    FOREIGN KEY (MEMNO) REFERENCES MEMBER(MEMNO) ON DELETE CASCADE
);

SELECT * FROM BOARD;
INSERT INTO BOARD
VALUES(BRDNOSEQ.NEXTVAL, 5, (SELECT MEMNICK FROM MEMBER WHERE MEMNO=1),'mycamp18.JPG','게시글 내용2',0,SYSDATE,'N',(SELECT MEMNO FROM MEMBER WHERE MEMNO=1));
INSERT INTO BOARD
VALUES(BRDNOSEQ.NEXTVAL, 4, (SELECT MEMNICK FROM MEMBER WHERE MEMNO=1),'carcamp14-1.jpg','게시글 내용3',0,SYSDATE,'N',(SELECT MEMNO FROM MEMBER WHERE MEMNO=1));
INSERT INTO BOARD
VALUES(BRDNOSEQ.NEXTVAL, 4, (SELECT MEMNICK FROM MEMBER WHERE MEMNO=2),'carcamp17.png','게시글 내용4',0,SYSDATE,'Y',(SELECT MEMNO FROM MEMBER WHERE MEMNO=2));
SELECT * FROM BOARD ORDER BY BRDDATE,BRDNO DESC;

SELECT 
	B.*,
	BC.BCATEGOFYNAME
FROM BOARD B
JOIN BCATEGORY BC
ON B.BCATEGORYNO = BC.BCATEGORYNO

SELECT
	MEMBER.MEMNICK,
	INQUIRYLIST.*,     
	INQUIRYCATEGORY.CATEGORYNAME
	FROM INQUIRYLIST
	JOIN MEMBER
	ON INQUIRYLIST.MEMNO = MEMBER.MEMNO
	JOIN INQUIRYCATEGORY
	ON INQUIRYLIST.CATEGORYNO = INQUIRYCATEGORY.CATEGORYNO
	WHERE INQUIRYNO = 8;		
		
SELECT * FROM BOARD;
/****************************************************************
                     --캠핑 토크 카테고리(BCATEGORY)
*****************************************************************/	

DROP TABLE BCATEGORY CASCADE CONSTRAINTS; 
DROP SEQUENCE BCGNOSEQ;

CREATE SEQUENCE BCGNOSEQ;
CREATE TABLE BCATEGORY(
	BCATEGORYNO NUMBER PRIMARY KEY,				--카테고리 번호
	BCATEGORYNAME VARCHAR2(100) NOT NULL		--카테고리명
);

INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '일반 캠핑');
INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '카라반');
INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '글램핑');
INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '차박');
INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '나만의 캠핑');

SELECT * FROM BCATEGORY;


ALTER TABLE BCATEGORY UPDATE BCATEGOFY

MODIFY BCATEGOFYNAME BCATEGORYNAME;
ALTER TABLE BCATEGORY
RENAME COLUMN "BCATEGOFYNAME" TO "BCATEGORYNAME";

ADD PPATH VARCHAR2(1000) NULL;

/****************************************************************
                     --지도(MAPLOCATION)
*****************************************************************/	


DROP TABLE MAPLOCATION CASCADE CONSTRAINTS;
DROP SEQUENCE MAPNOSEQ;

CREATE SEQUENCE MAPNOSEQ;
CREATE TABLE MAPLOCATION(
    MAPNO NUMBER PRIMARY KEY,                                       --지도 위치 번호
    MAPNAME VARCHAR2(100) NOT NULL,                                 --위치명
    MAPLATITUDE VARCHAR2(1000) NOT NULL,                            --위도
    MAPLONGTITUDE VARCHAR2(1000) NOT NULL,                          --경도
    CARMAPCHK VARCHAR2(1) CHECK(CARMAPCHK IN('Y','N')) NOT NULL,    --차박명소 등록 체크 동의(Y:동의/N:비동의)
    MEMNO NUMBER NOT NULL,                                          --회원번호 (Session이용)
    BRDNO NUMBER NOT NULL,
    FOREIGN KEY (MEMNO) REFERENCES MEMBER(MEMNO) ON DELETE CASCADE,
    FOREIGN KEY (BRDNO) REFERENCES BOARD(BRDNO) ON DELETE CASCADE
);

INSERT INTO MAPLOCATION 
VALUES (MAPNOSEQ.NEXTVAL, '차박', '위도1', '경도1', 'Y', 2, 1);
INSERT INTO MAPLOCATION 
VALUES (MAPNOSEQ.NEXTVAL, '카밍캠핑장', '위도2', '경도2', 'N',3, 2);

SELECT * FROM MAPLOCATION;


/* BOARD ONE SELECT(BRDNO=1) */
SELECT *
FROM BOARD B, MAPLOCATION M
WHERE B.BRDNO = M.BRDNO AND B.BRDNO = 1;

/* 나만의 캠핑맵 SELECT */
SELECT M.*, B.BRDNO
FROM BOARD B, MAPLOCATION M
WHERE B.BRDNO = M.BRDNO AND M.MEMNO = 1;


/****************************************************************
                    --캠핑 토크 댓글(BCOMMENT)
*****************************************************************/	

DROP SEQUENCE BCOMNOSEQ;
DROP TABLE BCOMMENT  CASCADE CONSTRAINTS ;

CREATE SEQUENCE BCOMNOSEQ;
CREATE TABLE BCOMMENT(
	COMNO NUMBER PRIMARY KEY NOT NULL,		--댓글 번호
	COMWRITER VARCHAR2(100) NOT NULL,		--댓글 작성자 (Session 이용)
	COMCONTEXT VARCHAR2(1000) NOT NULL,		--댓글 내용
	COMDATE DATE DEFAULT SYSDATE NOT NULL,	--댓글 작성 날짜
	BRDNO NUMBER NOT NULL,					--캠핑토크 게시글 번호
	FOREIGN KEY (BRDNO) references BOARD(BRDNO) ON DELETE CASCADE

);



/* (BRDNO=1)인 게시글에 댓글 달기 */
INSERT INTO BCOMMENT
VALUES(BCOMNOSEQ.NEXTVAL, (SELECT MEMNICK FROM MEMBER WHERE MEMNO=2), '게시글1-댓글1', SYSDATE, 1);
INSERT INTO BCOMMENT
VALUES(BCOMNOSEQ.NEXTVAL, (SELECT MEMNAME FROM MEMBER WHERE MEMNO=3), '게시글1-댓글2', SYSDATE, 1);

/* (BRDNO=2)인 게시글에 댓글 달기 */
INSERT INTO BCOMMENT
VALUES(BCOMNOSEQ.NEXTVAL, (SELECT MEMNAME FROM MEMBER WHERE MEMNO=2), '게시글2-댓글1', SYSDATE, 2);

/* 각 게시글의 모든 댓글  */
SELECT * FROM BCOMMENT WHERE BRDNO = 1;
SELECT * FROM BCOMMENT WHERE BRDNO = 2;

SELECT * FROM BCOMMENT;


DELETE BCOMMENT
WHERE COMNO=1;

--DM
DROP TABLE DM CASCADE CONSTRAINTS;
DROP SEQUENCE DMNOSEQ;

CREATE SEQUENCE DMNOSEQ;
CREATE TABLE DM(
    DMNO NUMBER PRIMARY KEY,            --고유 번호
    FROMID VARCHAR2(100) NOT NULL,     	--보내는 사람
    TOID VARCHAR2(100) NOT NULL,     	--받는 사람
    DMCONTENT VARCHAR2(1000) NOT NULL,  --DM 내용
    DMTIME DATE NOT NULL,               --DM 보낸 시간
	DMREAD NUMBER NULL					--0: 읽음 / 1: 읽지 않음
);

SELECT * FROM DM;


/****************************************************************
                      CHATBOT
*****************************************************************/	
DROP TABLE MEMBER;
DROP SEQUENCE MEMSEQ;

CREATE SEQUENCE MEMSEQ;
CREATE TABLE MEMBER(
   MEMNO NUMBER PRIMARY KEY,
   MEMNICK VARCHAR2(100) UNIQUE NOT NULL,
   MEMID VARCHAR2(100) UNIQUE NOT NULL,
   MEMPW VARCHAR2(100) NOT NULL,
   MEMNAME VARCHAR2(100) NOT NULL,
   MEMZIP VARCHAR2(100) NOT NULL,
   MEMADDR VARCHAR2(1000) NOT NULL,
   MEMADDR2 VARCHAR2(100),
   MEMPHONE VARCHAR2(100) NOT NULL,
   MEMBIRTH DATE NOT NULL,
   MEMGENDER NUMBER NOT NULL,
   MEMCHK VARCHAR2(1) DEFAULT 'N' NOT NULL,
   MEMCODE NUMBER DEFAULT '2' NOT NULL,
   MEMFILE VARCHAR2(2000)
);

ALTER TABLE MEMBER 
ADD CONSTRAINT MEMGENDER_CHK CHECK (MEMGENDER IN (1, 2));
ALTER TABLE MEMBER ADD CONSTRAINT MEMCHK_CHK CHECK (MEMCHK IN ('Y', 'N'));
ALTER TABLE MEMBER ADD CONSTRAINT MEMCODE_CHK CHECK (MEMGENDER IN (1, 2));

delete from member;
select * from member;

insert  into member
values(memseq.nextval, '나나콘', 'tyu4778@gmail.com', 'qwer1234', '나찬곤', '57310', '충청남도 천안시 서북구 두정동 1663-3번지', '태정타운 401호', '010-1111-2234', '1996-12-24', 1, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(memseq.nextval, '키위', 'soso@gmail.com', 'qwer1234', '김남기', '12345', '경주시 경주로', '불국사아파트 202호', '010-1543-4234', '96/08/16', 1, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(memseq.nextval, '가로수', '3@naver.com', 'qwer1234', '김망태', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-2234-2234', '02/12/31', 1, 'N', 2, 'PROFILE.JPG');

insert  into member
values(memseq.nextval, '홈키파', '4@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 1, 'Y', 2, 'PROFILE.JPG');


insert  into member
values(memseq.nextval, '레모나', '5@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 1, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(memseq.nextval, '캠핑킹', '6@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 1, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(memseq.nextval, '라비', '7@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 1, 'N', 2, 'PROFILE.JPG');

insert  into member
values(memseq.nextval, '레이', '8@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 1, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(memseq.nextval, '로빈', '9@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 1, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(memseq.nextval, '록키', '10@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 1, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(memseq.nextval, '지단원', '11@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 1, 'N', 2, 'PROFILE.JPG');

insert  into member
values(memseq.nextval, '아서', '12@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 1, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(memseq.nextval, '캐모마일', '13@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 1, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(memseq.nextval, '아론', '14@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 1, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(memseq.nextval, '카라반소', '15@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 1, 'N', 2, 'PROFILE.JPG');

insert  into member
values(memseq.nextval, '인텔코어', '16@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 1, 'Y', 2, 'PROFILE.JPG');


insert  into member
values(seqmem.nextval, '리사', 'g1@gmail.com', 'qwer1234', '나찬곤', '57310', '충청남도 천안시 서북구 두정동 1663-3번지', '태정타운 401호', '010-1111-2234', '1996-12-24', 2, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '로제', 'g2@gmail.com', 'qwer1234', '김남기', '12345', '경주시 경주로', '불국사아파트 202호', '010-1543-4234', '96/08/16', 2, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '지수', 'g3@naver.com', 'qwer1234', '김망태', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-2234-2234', '02/12/31', 2, 'N', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '제니', 'g4@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 2, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '캐시', 'g5@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 2, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '버디', 'g6@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 2, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '벨라', 'g7@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 2, 'N', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '조이', 'g8@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 2, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '아이린', 'g9@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 2, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '켈시', 'g10@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 2, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '키티', 'g11@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 2, 'N', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '리라', 'g12@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 2, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '리나', 'g13@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 2, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '린다', 'g14@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 2, 'Y', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '로티루시', 'g15@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 2, 'N', 2, 'PROFILE.JPG');

insert  into member
values(seqmem.nextval, '롤리폴리', 'g16@naver.com', 'qwer1234', '김상사', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1434-2234', '02/12/31', 2, 'Y', 2, 'PROFILE.JPG');

--insert  into member
--values(seqmem.nextval, '이서', 'j@naver.com', 'qwer1234', '조이서', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1534-2234', '02/12/31', 1, 'N', 2, 'PROFILE.JPG');
--
--insert  into member
--values(seqmem.nextval, '수근', 'a@naver.com', 'qwer1234', '이수근', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1214-2234', '02/12/31', 1, 'N', 2, 'PROFILE.JPG');
--
--insert  into member
--values(seqmem.nextval, '피오', 'fio@naver.com', 'qwer1234', '표지훈', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1224-2234', '02/12/31', 1, 'Y', 2, 'PROFILE.JPG');
--
--insert  into member
--values(seqmem.nextval, '마이노', 'mino@naver.com', 'qwer1234', '김민호', '13579', '강원도 삼척시', '삼척경찰서 2호', '010-1224-2234', '02/12/31', 1, 'Y', 2, 'PROFILE.JPG');



-- survey
drop table survey;

CREATE TABLE SURVEY(
    MEMNO NUMBER PRIMARY KEY,
    SURVEY1 VARCHAR2(100) NOT NULL,
    SURVEY2 VARCHAR2(100) NOT NULL,
    SURVEY3 VARCHAR2(100) NOT NULL,
    SURVEY4 VARCHAR2(100) NOT NULL,
    SURVEY5 VARCHAR2(100) NOT NULL,
    
    FOREIGN KEY(MEMNO) REFERENCES MEMBER(MEMNO)
    ON DELETE CASCADE
);

-- 1.  남자 동성 -> 남자 동성
INSERT INTO SURVEY
VALUES(1, 'male', 'same', 'two', 'normal', 'mountain');

-- Y
INSERT INTO SURVEY
VALUES(3, 'male', 'same', 'two', 'normal', 'mountain');

-- N
INSERT INTO SURVEY
VALUES(4, 'male', 'same', 'two', 'normal', 'mountain');

INSERT INTO SURVEY
VALUES(5, 'male', 'same', 'two', 'normal', 'mountain');

--++
INSERT INTO SURVEY
VALUES(10, 'male', 'same', 'two', 'normal', 'mountain');

INSERT INTO SURVEY
VALUES(11, 'male', 'same', 'two', 'normal', 'mountain');

INSERT INTO SURVEY
VALUES(12, 'male', 'same', 'two', 'normal', 'mountain');

INSERT INTO SURVEY
VALUES(13, 'male', 'same', 'two', 'normal', 'mountain');


-- 남자 이성 -> 여자 이성
INSERT INTO SURVEY
VALUES(6, 'male', 'opposite', 'two', 'normal', 'mountain');

-- Y
INSERT INTO SURVEY
VALUES(7, 'male', 'opposite', 'two', 'normal', 'mountain');

-- N
INSERT INTO SURVEY
VALUES(8, 'male', 'opposite', 'two', 'normal', 'mountain');

INSERT INTO SURVEY
VALUES(9, 'male', 'opposite', 'two', 'normal', 'mountain');

--++
INSERT INTO SURVEY
VALUES(14, 'male', 'opposite', 'two', 'normal', 'mountain');

INSERT INTO SURVEY
VALUES(15, 'male', 'opposite', 'two', 'normal', 'mountain');

INSERT INTO SURVEY
VALUES(16, 'male', 'opposite', 'two', 'normal', 'mountain');

INSERT INTO SURVEY
VALUES(17, 'male', 'opposite', 'two', 'normal', 'mountain');


-- 3.여자 동성 -> 여자 동성
INSERT INTO SURVEY
VALUES(34, 'female', 'same', 'threefour', 'glamping', 'mountain');

-- Y
INSERT INTO SURVEY
VALUES(35, 'female', 'same', 'threefour', 'glamping', 'mountain');

-- N
INSERT INTO SURVEY
VALUES(36, 'female', 'same', 'threefour', 'glamping', 'mountain');

INSERT INTO SURVEY
VALUES(37, 'female', 'same', 'threefour', 'normal', 'mountain');

--++
INSERT INTO SURVEY
VALUES(42, 'female', 'same', 'threefour', 'glamping', 'mountain');

INSERT INTO SURVEY
VALUES(43, 'female', 'same', 'threefour', 'glamping', 'mountain');

INSERT INTO SURVEY
VALUES(44, 'female', 'same', 'threefour', 'glamping', 'mountain');

INSERT INTO SURVEY
VALUES(45, 'female', 'same', 'threefour', 'normal', 'mountain');


-- 여자 이성 -> 남자 이성
INSERT INTO SURVEY
VALUES(38, 'female', 'opposite', 'two', 'normal', 'mountain');

-- Y
INSERT INTO SURVEY
VALUES(39, 'female', 'opposite', 'two', 'normal', 'mountain');

-- N 
INSERT INTO SURVEY
VALUES(40, 'female', 'opposite', 'two', 'normal', 'mountain');


INSERT INTO SURVEY
VALUES(41, 'female', 'opposite', 'four', 'normal', 'mountain');

INSERT INTO SURVEY
VALUES(46, 'female', 'opposite', 'two', 'normal', 'mountain');

INSERT INTO SURVEY
VALUES(47, 'female', 'opposite', 'two', 'normal', 'mountain');

INSERT INTO SURVEY
VALUES(48, 'female', 'opposite', 'two', 'normal', 'mountain');

INSERT INTO SURVEY
VALUES(49, 'female', 'opposite', 'four', 'normal', 'mountain');

select * from survey order by memno;

commit;




/****************************************************************
                     	캠핑렌트 DB
*****************************************************************/	

--[렌트 상태 테이블]--

--RENTSTATE 테이블, 시퀀스 유무 확인
DROP TABLE RENTSTATE cascade constraint;
DROP SEQUENCE RENTSTATE_SEQ;

--RENTSTATE 테이블 시퀀스 생성
CREATE TABLE RENTSTATE(
    STATENO NUMBER NOT NULL,
    STATENAME VARCHAR2(100) NOT NULL,
    CONSTRAINT STATENO_PK PRIMARY KEY(STATENO)
);

CREATE SEQUENCE RENTSTATE_SEQ;

--데이터 삽입
INSERT INTO RENTSTATE
VALUES(RENTSTATE_SEQ.NEXTVAL, '장바구니');
INSERT INTO RENTSTATE
VALUES(RENTSTATE_SEQ.NEXTVAL, '결제 완료');
INSERT INTO RENTSTATE
VALUES(RENTSTATE_SEQ.NEXTVAL, '대여중');
INSERT INTO RENTSTATE
VALUES(RENTSTATE_SEQ.NEXTVAL, '반납 신청');
INSERT INTO RENTSTATE
VALUES(RENTSTATE_SEQ.NEXTVAL, '반납 완료');
INSERT INTO RENTSTATE
VALUES(RENTSTATE_SEQ.NEXTVAL, '반납일 초과'); 

--테이블 전체 조회
SELECT * FROM RENTSTATE;


/****************************************************************
                     	[캠핑렌트 카테고리 테이블]
*****************************************************************/	

--PCATEGORY 테이블, 시퀀스 유무 확인 구문
DROP TABLE PCATEGORY cascade constraint;
DROP SEQUENCE PCATEGORY_SEQ;

--PCATEGORY 테이블, 시퀀스 생성
CREATE TABLE PCATEGORY(
    PCATEGORYNO NUMBER NOT NULL,
    PCATEGORYNAME VARCHAR2(100) NOT NULL,
    CONSTRAINT PCATEGORYNO_PK PRIMARY KEY(PCATEGORYNO)
);

CREATE SEQUENCE PCATEGORY_SEQ;

--데이터 삽입
INSERT INTO PCATEGORY
VALUES(PCATEGORY_SEQ.NEXTVAL, '텐트 / 타프');
INSERT INTO PCATEGORY
VALUES(PCATEGORY_SEQ.NEXTVAL, '매트 / 침낭');
INSERT INTO PCATEGORY
VALUES(PCATEGORY_SEQ.NEXTVAL, '코펠 / 버너 / 취사');
INSERT INTO PCATEGORY
VALUES(PCATEGORY_SEQ.NEXTVAL, '체어 / 테이블');
INSERT INTO PCATEGORY
VALUES(PCATEGORY_SEQ.NEXTVAL, '화로대 / BBQ');

--COMMENT(주석) 설정--
COMMENT ON COLUMN PCATEGORY.PCATEGORYNO IS '상품카테고리 번호';
COMMENT ON COLUMN PCATEGORY.PCATEGORYNAME IS '상품카테고리 이름';

--테이블 전체 조회
SELECT * FROM PCATEGORY;

--데이터 삭제
DELETE FROM PCATEGORY
WHERE PCATEGORYNO = 3;

/****************************************************************
					--[캠핑렌트  상품 테이블]--
*****************************************************************/	


--PRODUCT 테이블, 시퀀스 유무 확인 구문
DROP TABLE PRODUCT cascade constraint;
DROP SEQUENCE PRODUCT_SEQ;

--PRODUCT 테이블, 시퀀스 생성
CREATE TABLE PRODUCT(
    PNO NUMBER NOT NULL,
    PCATEGORYNO NUMBER NOT NULL,
    PNAME VARCHAR2(100) NOT NULL,
    PPRICE NUMBER NOT NULL,
    PDESC VARCHAR2(1000) NOT NULL,
    PFILE VARCHAR2(1000) NOT NULL,
    PAMOUNT NUMBER NOT NULL,
    PPATH VARCHAR2(1000) NULL,
    CONSTRAINT PNO_PK PRIMARY KEY(PNO),
    CONSTRAINT CATEGORYNO_FK FOREIGN KEY(PCATEGORYNO) REFERENCES PCATEGORY(PCATEGORYNO) ON DELETE CASCADE
);

CREATE SEQUENCE PRODUCT_SEQ;
--데이터 삽입
INSERT INTO PRODUCT
VALUES(PRODUCT_SEQ.NEXTVAL, 3, '겨울 나기 텐트', 15000, '이것은 이미지입니다', '파일입니다.', 50, 'spring');
--데이터 삭제
DELETE 
FROM PRODUCT
WHERE PCATEGORYNO=1;
--컬럼 추가(파일 경로)
ALTER TABLE PRODUCT ADD PPATH VARCHAR2(1000) NULL;
--테이블 전체 조회
SELECT * FROM PRODUCT;

--[캠핑렌트 리뷰]--

--REVIEW 테이블 시퀀스 유무 확인
DROP TABLE REVIEW cascade constraint;
DROP SEQUENCE REVIEW_SEQ;

--REVIEW 테이블 시퀀스 생성
CREATE TABLE REVIEW(
    REVIEWNO NUMBER NOT NULL,
    PNO NUMBER NOT NULL,
    REVIEWCONTEXT LONG NOT NULL,
    REVIEWDATE DATE NOT NULL,
    REVIEWWRITER VARCHAR2(200) NOT NULL,
    REVIEWSTAR NUMBER NOT NULL,
    CONSTRAINT REVIEWNO_PK PRIMARY KEY(REVIEWNO),
    CONSTRAINT REVIEW_PNO_FK FOREIGN KEY(PNO) REFERENCES PRODUCT(PNO) ON DELETE CASCADE
);

CREATE SEQUENCE REVIEW_SEQ;

--데이터 삽입

--테이블 전체 조회
SELECT * FROM REVIEW;

--[캠핑렌트 장바구니]--

--CART 테이블 시퀀스 유무 확인
DROP TABLE CART CASCADE CONSTRAINT;
DROP SEQUENCE CART_SEQ;

--CART 테이블 시퀀스 생성
CREATE TABLE CART(
    CARTNO NUMBER NOT NULL,
    CAMOUNT NUMBER NOT NULL,
    STARTDATE DATE NULL,
    ENDDATE DATE NULL,
    MEMNO NUMBER NOT NULL,
    PNO NUMBER NOT NULL,
    STATENO NUMBER NOT NULL,
    PCATEGORYNO NUMBER NOT NULL,
    CONSTRAINT CARTNO_PK PRIMARY KEY(CARTNO),
    CONSTRAINT PCATEGORYNO_FK FOREIGN KEY (PCATEGORYNO) REFERENCES PCATEGORY (PCATEGORYNO) ON DELETE CASCADE,
    CONSTRAINT CART_PNO_FK FOREIGN KEY(PNO) REFERENCES PRODUCT(PNO) ON DELETE CASCADE,
    CONSTRAINT STATENO_FK FOREIGN KEY(STATENO) REFERENCES RENTSTATE(STATENO) ON DELETE CASCADE    
);

CREATE SEQUENCE CART_SEQ;

--데이터 삽입
INSERT INTO CART
VALUES(CART_SEQ.NEXTVAL,'1',DATE '2021-01-23',DATE '2021-01-24',(SELECT MEMNO FROM MEMBER WHERE MEMNO=3),(SELECT PNO FROM PRODUCT WHERE PNO =1),5,3)

SELECT * FROM CART;

	SELECT
		C.*,
		M.MEMNICK,
		RS.STATENAME,
		P.PNAME,
		PC.PCATEGORYNAME
		
		
		FROM CART C
		JOIN MEMBER M
		ON C.MEMNO = M.MEMNO
		JOIN RENTSTATE RS
		ON C.STATENO = RS.STATENO
		JOIN PRODUCT P
		ON C.PNO = P.PNO
		JOIN PCATEGORY PC
		ON C.PCATEGORYNO = PC.PCATEGORYNO
		
		
		PY.PAYNO,
		PY.TOTALPRICE
		JOIN PAY PY
		ON C.CARTNO = PY.CARTNO
		
		SELECT
			ROW_NUMBER() OVER(ORDER BY C.CARTNO DESC),
			C.CARTNO, C.CAMOUNT, C.STARTDATE, C.ENDDATE, C.MEMNO, C.PNO, C.STATENO,
			P.PAMOUNT, P.PPRICE, P.PNAME, P.PFILE
		FROM CART C	INNER JOIN PRODUCT P ON	C.PNO = P.PNO

		select* from member
		select* from cart
		select * from rentsate
		select * from product alter
		select * from pcategory
		select * from pay




UPDATE CART
SET STATENO = 3
WHERE CARTNO = 3

--테이블 전체 조회
SELECT * FROM CART; 

DELETE FROM CART WHERE CARTNO = 1;
--[캠핑렌트 결제 테이블]--

--PAY 테이블 시퀀스 유무 확인
DROP TABLE PAY cascade constraint;
DROP SEQUENCE PAY_SEQ;

--PAY 테이블 시퀀스 생성
CREATE TABLE PAY(
    PAYNO NUMBER NOT NULL,
    CARTNO NUMBER NOT NULL,
    METHOD VARCHAR2(100) NOT NULL,
    ADDR VARCHAR2(1000) NOT NULL,
    TOTALPRICE NUMBER NOT NULL,
    PAYDAY DATE NOT NULL,
    CONSTRAINT PAYNO_PK PRIMARY KEY(PAYNO),
    CONSTRAINT PAY_CARTNO_FK FOREIGN KEY(CARTNO) REFERENCES CART(CARTNO) ON DELETE CASCADE
);

CREATE SEQUENCE PAY_SEQ;

SELECT * FROM PAY;

--데이터 삽입
INSERT INTO PAY
VALUES(PAY_SEQ.NEXTVAL,7,'카드','주소',1200,SYSDATE)

--테이블 전체 조회
SELECT * FROM PAY;


/****************************************************************
                        INQUIRY
*****************************************************************/

DROP SEQUENCE SEQINQUIRY;
DROP TABLE INQUIRYLIST CASCADE CONSTRAINTS;

CREATE SEQUENCE SEQINQUIRY;
CREATE TABLE INQUIRYLIST(
	INQUIRYNO NUMBER PRIMARY KEY NOT NULL,
	MEMNO NUMBER NOT NULL,
	INQUIRYFILENAME VARCHAR2(2000) NULL,
	INQUIRYCONTENT LONG NOT NULL,
	INQUIRYDATE DATE DEFAULT SYSDATE NOT NULL,
	CATEGORYNO NUMBER NOT NULL,
	CONSTRAINT FK_MEMNO FOREIGN KEY (MEMNO) references MEMBER(MEMNO) ON DELETE CASCADE,
    CONSTRAINT FK_CATEGORYNO FOREIGN KEY (CATEGORYNO) references INQUIRYCATEGORY(CATEGORYNO) ON DELETE CASCADE
	 
);

INSERT INTO INQUIRYLIST
VALUES(SEQINQUIRY.NEXTVAL,(SELECT MEMNO FROM MEMBER WHERE MEMNO=2),'문의 파일명','문의 내용', DEFAULT, 3);
INSERT INTO INQUIRYLIST
VALUES(SEQINQUIRY.NEXTVAL,(SELECT MEMNO FROM MEMBER WHERE MEMNO=1),'문의 파일명','문의 내용', DEFAULT, 3);

DELETE FROM INQUIRYLIST WHERE MEMNO=7;

SELECT * FROM INQUIRYLIST;
/****************************************************************
                       INQUIRYCATEGORY
*****************************************************************/
DROP SEQUENCE SEQINQCATEGORY;
DROP TABLE INQUIRYCATEGORY CASCADE CONSTRAINTS;

CREATE SEQUENCE SEQINQCATEGORY;
CREATE TABLE INQUIRYCATEGORY(
	CATEGORYNO NUMBER PRIMARY KEY NOT NULL,
	CATEGORYNAME VARCHAR2(1000) NOT NULL
);

INSERT INTO INQUIRYCATEGORY
VALUES(SEQINQCATEGORY.NEXTVAL,'상품 및 배송');
INSERT INTO INQUIRYCATEGORY
VALUES(SEQINQCATEGORY.NEXTVAL,'교환 및 반품');
INSERT INTO INQUIRYCATEGORY
VALUES(SEQINQCATEGORY.NEXTVAL,'기타');

SELECT * FROM INQUIRYCATEGORY;

/****************************************************************
                      REPORT
*****************************************************************/
DROP SEQUENCE SEQREPORT;
DROP TABLE REPORTLIST CASCADE CONSTRAINTS;

CREATE SEQUENCE SEQREPORT;
CREATE TABLE REPORTLIST(
	REPORTNO NUMBER PRIMARY KEY NOT NULL,
	REPORTWRITER VARCHAR2(100) NOT NULL,
	MEMNO NUMBER NOT NULL,
	REPORTFILENAME VARCHAR2(2000) NULL,
	REPORTCONTENT LONG NOT NULL,
	REPORTDATE DATE DEFAULT SYSDATE NOT NULL,
	CATEGORYNO NUMBER NOT NULL,
	TARGETNO NUMBER NOT NULL,
	TARGETTYPENO NUMBER NOT NULL,
	CONSTRAINT FK_MEMNO_REPORT FOREIGN KEY (MEMNO) references MEMBER(MEMNO) ON DELETE CASCADE,
    CONSTRAINT FK_CATEGORYNO_REPORT FOREIGN KEY (CATEGORYNO) references REPORTCATEGORY(CATEGORYNO) ON DELETE CASCADE
    );


INSERT INTO  REPORTLIST
VALUES(SEQREPORT.NEXTVAL,'닉네임',(SELECT MEMNO FROM MEMBER WHERE MEMNO=1),'신고파일명','신고 내용',SYSDATE,
	   (SELECT CATEGORYNO FROM REPORTCATEGORY WHERE CATEGORYNO=1),'1','1');	
	
SELECT * FROM REPORTLIST;

/****************************************************************
                      REPORTCATEGORY
*****************************************************************/	
DROP SEQUENCE SEQREPCATEGORY;
DROP TABLE REPORTCATEGORY CASCADE CONSTRAINTS;

CREATE SEQUENCE SEQREPCATEGORY;
CREATE TABLE REPORTCATEGORY(
	CATEGORYNO NUMBER PRIMARY KEY NOT NULL,
	CATEGORYNAME VARCHAR2(1000) NOT NULL
);

INSERT INTO REPORTCATEGORY
VALUES(SEQREPCATEGORY.NEXTVAL,'지나친 광고성 게시물');
INSERT INTO REPORTCATEGORY
VALUES(SEQREPCATEGORY.NEXTVAL,'욕설/비방이 심함');
INSERT INTO REPORTCATEGORY
VALUES(SEQREPCATEGORY.NEXTVAL,'기타');

SELECT * FROM REPORTCATEGORY;

/****************************************************************
                   TARGETCATEGORY
*****************************************************************/	
DROP SEQUENCE SEQTARCATEGORY;
DROP TABLE TARGETCATEGORY CASCADE CONSTRAINTS;

CREATE SEQUENCE SEQTARCATEGORY;
CREATE TABLE TARGETCATEGORY(
	TARGETNO NUMBER PRIMARY KEY NOT NULL,
	TARGETNAME VARCHAR2(1000) NOT NULL
);

INSERT INTO TARGETCATEGORY
VALUES(SEQTARCATEGORY.NEXTVAL,'게시글');
INSERT INTO TARGETCATEGORY
VALUES(SEQTARCATEGORY.NEXTVAL,'댓글');
INSERT INTO TARGETCATEGORY
VALUES(SEQTARCATEGORY.NEXTVAL,'회원');

SELECT * FROM TARGETCATEGORY;



