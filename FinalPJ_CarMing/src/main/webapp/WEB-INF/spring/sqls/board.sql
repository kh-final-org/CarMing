--회원(MEMBER)
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP SEQUENCE SEQMEM;

CREATE SEQUENCE MEMNOSEQ;
CREATE TABLE MEMBER(
    MEMNO NUMBER PRIMARY KEY NOT NULL,          --회원번호
    MEMNICK VARCHAR2(100) NOT NULL UNIQUE,      --닉네임(프로필명)
    MEMID VARCHAR2(100) NOT NULL UNIQUE,        --이메일
    MEMPW VARCHAR2(100) NOT NULL,               --비밀번호
    MEMNAME VARCHAR2(100) NOT NULL,             --이름(본명)
    MEMZIP VARCHAR2(100) NOT NULL,              --우편번호
    MEMADDR VARCHAR2(1000) NOT NULL,            --기본주소
    MEMADDR2 VARCHAR2(100) NULL,                --상세주소
    MEMPHONE VARCHAR2(100) NOT NULL,            --핸드폰 번호
    MEMBIRTH DATE NOT NULL,                     --생년월일
    MEMGENDER NUMBER NOT NULL,                  --1:남자/2:여자
    MEMCHK VARCHAR2(1) DEFAULT 'N' NOT NULL,    --친구 찾기 동의 여부(Y:동의/N:비동의)
    MEMCODE NUMBER DEFAULT '2' NOT NULL,        --1:관리자/2:일반회원
    MEMFILE VARCHAR2(2000)                      --프로필 사진
);

INSERT INTO MEMBER
VALUES(MEMNOSEQ.NEXTVAL,'nick1','user1@naver.com','pw1','사용자1',
        '우편번호','기본주소','상세주소','010-1111-2222','1999-09-09','1','N','2',NULL);

SELECT * FROM MEMBER; 




----------------------------------------------------------------------------------------------------------------------------
--캠핑 토크(BOARD)
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP SEQUENCE BRDNOSEQ;

CREATE SEQUENCE BRDNOSEQ;
CREATE TABLE BOARD(
    BRDNO NUMBER PRIMARY KEY,                                       --게시글 번호
    BCATEGORYNO NUMBER NOT NULL,                                    --카테고리 번호 참조
    BRDWRITER VARCHAR2(100) NOT NULL,                               --게시글 작성자 (Session이용)
    BRDFILE VARCHAR2(2000) NOT NULL,                                --파일명
    BRDCONTENT LONG NOT NULL,                                       --게시글 내용    
    BRDCOUNT NUMBER NOT NULL,                                       --게시글 조회수
    BRDDATE DATE NOT NULL,                                          --게시글 작성 날짜
    BRDPRIVATE VARCHAR2(1) CHECK(BRDPRIVATE IN('Y','N')) NOT NULL,  --나만보기 체크 여부(Y:체크/N:체크x)
    FOREIGN KEY (BCATEGORYNO) REFERENCES BCATEGORY(BCATEGORYNO)
);

INSERT INTO BOARD
VALUES(BRDNOSEQ.NEXTVAL, 2, (SELECT MEMNICK FROM MEMBER WHERE MEMNO=1),'사진1.jpg','게시글 내용1',0,SYSDATE,'N');
INSERT INTO BOARD
VALUES(BRDNOSEQ.NEXTVAL, 5, (SELECT MEMNICK FROM MEMBER WHERE MEMNO=1),'사진2.jpg','게시글 내용2',0,SYSDATE,'Y');


SELECT * FROM BOARD;





--캠핑 토크 카테고리(BCATEGORY)
DROP TABLE BCATEGORY CASCADE CONSTRAINTS; 
DROP SEQUENCE BCGNOSEQ;

CREATE SEQUENCE BCGNOSEQ;
CREATE TABLE BCATEGORY(
	BCATEGORYNO NUMBER PRIMARY KEY,				--카테고리 번호
	BCATEGOFYNAME VARCHAR2(100) NOT NULL		--카테고리명
);

INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '일반 캠핑');
INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '오토 캠핑');
INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '카라반');
INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '글램핑');
INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '차박');
INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '나만의 캠핑');

SELECT * FROM BCATEGORY;





--지도(MAPLOCATION)
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
    BRDNO NUMBER NOT NULL,                                          --캠핑토크 게시글 번호
    FOREIGN KEY (MEMNO) REFERENCES MEMBER(MEMNO),
    FOREIGN KEY (BRDNO) REFERENCES BOARD(BRDNO)
);

INSERT INTO MAPLOCATION 
VALUES (MAPNOSEQ.NEXTVAL, '차박', '위도1', '경도1', 'Y', 1, 1);
INSERT INTO MAPLOCATION 
VALUES (MAPNOSEQ.NEXTVAL, '카밍캠핑장', '위도2', '경도2', 'N', 1, 2);

SELECT * FROM MAPLOCATION;


/* BOARD ONE SELECT(BRDNO=1) */
SELECT *
FROM BOARD B, MAPLOCATION M
WHERE B.BRDNO = M.BRDNO AND B.BRDNO = 1;

/* 나만의 캠핑맵 SELECT */
SELECT M.*, B.BRDNO
FROM BOARD B, MAPLOCATION M
WHERE B.BRDNO = M.BRDNO AND M.MEMNO = 1;





--캠핑 토크 댓글(BCOMMENT)
DROP TABLE BCOMMENT CASCADE CONSTRAINTS;
DROP SEQUENCE COMNOSEQ;

CREATE SEQUENCE COMNOSEQ;
CREATE TABLE BCOMMENT(
    COMNO NUMBER PRIMARY KEY,               		--댓글 번호
    COMWRITER VARCHAR2(100) NOT NULL,       		--댓글 작성자 (Session 이용)
    COMCONTEXT VARCHAR2(1000) NOT NULL,     		--댓글 내용
    COMDATE DATE NOT NULL,                  		--댓글 작성 날짜
    BRDNO NUMBER NOT NULL,                 			--캠핑토크 게시글 번호
    FOREIGN KEY (BRDNO) REFERENCES BOARD(BRDNO)
);

/* (BRDNO=1)인 게시글에 댓글 달기 */
INSERT INTO BCOMMENT
VALUES(COMNOSEQ.NEXTVAL, (SELECT MEMNAME FROM MEMBER WHERE MEMNO=1), '게시글1-댓글1', SYSDATE, 1);
INSERT INTO BCOMMENT
VALUES(COMNOSEQ.NEXTVAL, (SELECT MEMNAME FROM MEMBER WHERE MEMNO=1), '게시글1-댓글2', SYSDATE, 1);

/* (BRDNO=2)인 게시글에 댓글 달기 */
INSERT INTO BCOMMENT
VALUES(COMNOSEQ.NEXTVAL, (SELECT MEMNAME FROM MEMBER WHERE MEMNO=1), '게시글2-댓글1', SYSDATE, 2);

/* BRDNO = 1인 게시글의 모든 댓글  */
SELECT * FROM BCOMMENT WHERE BRDNO = 1;
SELECT * FROM BCOMMENT WHERE BRDNO = 2;

SELECT * FROM BCOMMENT;
















