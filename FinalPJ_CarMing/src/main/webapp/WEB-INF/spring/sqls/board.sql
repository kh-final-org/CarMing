--캠핑 토크(BOARD)
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP SEQUENCE BRDNOSEQ;

CREATE SEQUENCE BRDNOSEQ;
CREATE TABLE BOARD(
    BRDNO NUMBER PRIMARY KEY,                                       				--게시글 번호
    BCATEGORYNO NUMBER NOT NULL,                                    				--카테고리 번호 참조
    BRDWRITER VARCHAR2(100) NOT NULL,                              			 		--게시글 작성자 (Session이용)
    BRDFILE VARCHAR2(2000) NOT NULL,                                				--파일명
    BRDCONTENT LONG NOT NULL,                                       				--게시글 내용    
    BRDCOUNT NUMBER NOT NULL,                                       				--게시글 조회수
    BRDCOMCOUNT NUMBER NOT NULL,                                    				--게시글 댓글수
    BRDDATE DATE NOT NULL,                                          				--게시글 작성 날짜
    BRDPRIVATE VARCHAR2(1) CHECK(BRDPRIVATE IN('Y','N')) NOT NULL,  				--나만보기 체크 여부(Y:체크/N:체크x)
    FOREIGN KEY (BCATEGORYNO) REFERENCES BCATEGORY(BCATEGORYNO) ON DELETE CASCADE
);
--FOREIGN KEY (MEMNO) REFERENCES MEMBER(MEMNO) ON DELETE CASCADE

INSERT INTO BOARD
VALUES(BRDNOSEQ.NEXTVAL, 2, (SELECT MEMNICK FROM MEMBER WHERE MEMNO=1),'caravan7-1.jpg','게시글 내용1',0,0,SYSDATE,'N');
INSERT INTO BOARD
VALUES(BRDNOSEQ.NEXTVAL, 5, (SELECT MEMNICK FROM MEMBER WHERE MEMNO=2),'mycamp18.JPG','게시글 내용2',0,0,SYSDATE,'Y');
INSERT INTO BOARD
VALUES(BRDNOSEQ.NEXTVAL, 4, (SELECT MEMNICK FROM MEMBER WHERE MEMNO=1),'carcamp14-1.jpg','게시글 내용3',0,0,SYSDATE,'N');
INSERT INTO BOARD
VALUES(BRDNOSEQ.NEXTVAL, 4, (SELECT MEMNICK FROM MEMBER WHERE MEMNO=2),'carcamp17.png','게시글 내용4',0,0,SYSDATE,'Y');
INSERT INTO BOARD
VALUES(BRDNOSEQ.NEXTVAL, 3, (SELECT MEMNICK FROM MEMBER WHERE MEMNO=2),'glam10.jpg','게시글 내용5',0,0,SYSDATE,'N');

SELECT * FROM BOARD ORDER BY BRDNO DESC;





-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--캠핑 토크 카테고리(BCATEGORY)
DROP TABLE BCATEGORY CASCADE CONSTRAINTS; 
DROP SEQUENCE BCGNOSEQ;

CREATE SEQUENCE BCGNOSEQ;
CREATE TABLE BCATEGORY(
	BCATEGORYNO NUMBER PRIMARY KEY,				--카테고리 번호
	BCATEGOFYNAME VARCHAR2(100) NOT NULL		--카테고리명
);

INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '일반 캠핑');
INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '카라반');
INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '글램핑');
INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '차박');
INSERT INTO BCATEGORY VALUES(BCGNOSEQ.NEXTVAL, '나만의 캠핑');

SELECT * FROM BCATEGORY;





-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

/* 각 게시글의 모든 댓글  */
SELECT * FROM BCOMMENT WHERE BRDNO = 1;
SELECT * FROM BCOMMENT WHERE BRDNO = 2;

SELECT * FROM BCOMMENT;





-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
    FOREIGN KEY (MEMNO) REFERENCES MEMBER(MEMNO) ON DELETE CASCADE,
    FOREIGN KEY (BRDNO) REFERENCES BOARD(BRDNO) ON DELETE CASCADE
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





-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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





