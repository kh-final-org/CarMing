/****************************************************************
                        RECIPE
*****************************************************************/


DROP TABLE RECIPE;

CREATE TABLE RECIPE(
	
	RECIPEFILE VARCHAR(4000) UNIQUE NOT NULL,
	RECIPETITLE VARCHAR(4000) NOT NULL,
	RECIPEWRITER VARCHAR(2000) NOT NULL,
	RECIPEWRITERURL VARCHAR(4000) NOT NULL,
	VIEWS NUMBER DEFAULT '0' NOT NULL,
	RECIPEURL VARCHAR(4000) UNIQUE NOT NULL
);

SELECT * FROM RECIPE;

INSERT INTO RECIPE VALUES('AAA',DEFAULT);

UPDATE RECIPE SET RECIPE_VIEWS = RECIPE_VIEWS + 1 WHERE URL = 'AAA';
/****************************************************************
                        TIP
*****************************************************************/

DROP TABLE TIP;
CREATE TABLE TIP(
	TIPTITLE VARCHAR(4000) NOT NULL,
	TIPURL VARCHAR(4000) UNIQUE NOT NULL,
	TIPFILE VARCHAR(4000) UNIQUE NOT NULL,
	VIEWS NUMBER DEFAULT '0' NOT NULL
);

SELECT * FROM TIP;

INSERT INTO RECIPE VALUES('AAA',DEFAULT);

UPDATE RECIPE SET RECIPE_VIEWS = RECIPE_VIEWS + 1 WHERE URL = 'AAA';

SELECT * FROM TIP WHERE TIPURL = '/?r=home&c=info/camptip&uid=1187';


CREATE TABLE





/****************************************************************
                        MEMBER
*****************************************************************/
DROP SEQUENCE SEQMEM;
DROP TABLE MEMBER CASCADE CONSTRAINTS;

CREATE SEQUENCE SEQMEM;
CREATE TABLE MEMBER(
    MEMNO NUMBER PRIMARY KEY NOT NULL,
    MEMNICK VARCHAR2(100) NOT NULL UNIQUE,
    MEMID VARCHAR2(100) NOT NULL UNIQUE,
    MEMPW VARCHAR2(100) NOT NULL,
    MEMNAME VARCHAR2(100) NOT NULL,
    MEMADDR VARCHAR2(1000) NOT NULL,
    MEMPHONE VARCHAR2(100) NOT NULL,
    MEMBIRTH DATE NOT NULL,
    MEMGENDER NUMBER NOT NULL,
    MEMCHK VARCHAR2(1) DEFAULT 'N' NOT NULL ,
    MEMCODE NUMBER DEFAULT '2' NOT NULL,
    MEMFILE VARCHAR2(2000) 

);

INSERT INTO  MEMBER 
VALUES(SEQMEM.NEXTVAL, 'camlove2', 'camlove2', '1234', ' Michael Holz', '12 GG 23 GG', '010-1234-1234', DATE '2013-02-17', 2, DEFAULT, DEFAULT, NULL);
SELECT * FROM MEMBER
DELETE FROM MEMBER WHERE MEMNICK = 'DD';

INSERT INTO  MEMBER 
VALUES(SEQMEM.NEXTVAL, 'cmaper', 'AA', '1234', 'FF', '12 GG 23 GG', '123455633',DATE '2013-02-17', 1, DEFAULT, DEFAULT, NULL);
DELETE FROM MEMBER WHERE MEMNO=7

SELECT * FROM MEMBER;
/****************************************************************
                        INQUIRY
*****************************************************************/

DROP SEQUENCE SEQINQUIRY;
DROP TABLE INQUIRYLIST cascade constraints;

CREATE SEQUENCE SEQINQUIRY;

CREATE TABLE INQUIRYLIST(
	INQUIRYNO NUMBER PRIMARY KEY NOT NULL,
	MEMNO NUMBER NOT NULL,
	INQUIRYFILE(name) VARCHAR2(2000) NULL,
	INQUIRYCONTENT LONG NOT NULL,
	INQUIRYDATE DATE DEFAULT SYSDATE NOT NULL,
	CATEGORYNO NUMBER NOT NULL,
	CONSTRAINT FK_MEMNO FOREIGN KEY (MEMNO) references MEMBER(MEMNO),
    CONSTRAINT FK_CATEGORYNO FOREIGN KEY (CATEGORYNO) references INQUIRYCATEGORY(CATEGORYNO)
	 
);

INSERT INTO INQUIRYLIST
VALUES(SEQINQUIRY.NEXTVAL,(SELECT MEMNO FROM MEMBER WHERE MEMNO=7),'DD','DD', DEFAULT, 3);

DELETE FROM INQUIRYLIST WHERE MEMNO=7;

SELECT * FROM INQUIRYLIST;

SELECT INQUIRYLIST.MEMNO, INQUIRYCATEGORY.CATEGORYNAME
FROM INQUIRYLIST
INNER JOIN INQUIRYCATEGORY ON INQUIRYCATEGORY.CATEGORYNO = INQUIRYLIST.CATEGORYNO;


SELECT MEMBER.MEMNICK, INQUIRYLIST.*
FROM INQUIRYLIST
INNER JOIN MEMBER ON INQUIRYLIST.MEMNO = MEMBER.MEMNO
WHERE MEMNICK = 'CC';

SELECT
	MEMBER.MEMNICK,
	INQUIRYLIST.*,     
	INQUIRYCATEGORY.CATEGORYNAME
	FROM INQUIRYLIST
	JOIN MEMBER
	ON INQUIRYLIST.MEMNO = MEMBER.MEMNO
	JOIN INQUIRYCATEGORY
	ON INQUIRYLIST.CATEGORYNO = INQUIRYCATEGORY.CATEGORYNO;
	
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
/****************************************************************
                       INQUIRYCATEGORY
*****************************************************************/
DROP SEQUENCE SEQINQCATEGORY;
DROP TABLE INQUIRYCATEGORY;

CREATE SEQUENCE SEQINQCATEGORY;
CREATE TABLE INQUIRYCATEGORY(
	CATEGORYNO NUMBER PRIMARY KEY NOT NULL,
	CATEGORYNAME VARCHAR2(1000) NOT NULL
);

INSERT INTO INQUIRYCATEGORY
VALUES(SEQINQCATEGORY.NEXTVAL,'물품정보');


INSERT INTO INQUIRYCATEGORY
VALUES(SEQINQCATEGORY.NEXTVAL,'거래');


INSERT INTO INQUIRYCATEGORY
VALUES(SEQINQCATEGORY.NEXTVAL,'언어');

DELETE FROM INQUIRYCATEGORY WHERE CATEGORYNO = 2;

SELECT * FROM INQUIRYCATEGORY ORDER BY CATEGORYNO ASC;

SELECT  MEMBER.MEMNICK, INQUIRYLIST.*,INQUIRYCATEGORY.CATEGORYNAME,
		FROM INQUIRYLIST
		INNER JOIN MEMBER ON INQUIRYLIST.MEMNO = MEMBER.MEMNO; AND 
		INNER JOIN INQUIRYCATEGORY ON INQUIRYLIST.CATEGORYNO = INQUIRYCATEGORY.CATEGORYNO;

		

SELECT
  MEMBER.MEMNICK,
  INQUIRYLIST.*,
  INQUIRYCATEGORY.CATEGORYNAME
FROM INQUIRYLIST
JOIN  MEMBER
  ON INQUIRYLIST.MEMNO = MEMBER.MEMNO
JOIN INQUIRYCATEGORY
  ON INQUIRYLIST.CATEGORYNO = INQUIRYCATEGORY.CATEGORYNO;
  
 SELECT
	MEMBER.MEMNICK,
	INQUIRYLIST.*,     
	INQUIRYCATEGORY.CATEGORYNAME
	FROM INQUIRYLIST
	
	JOIN MEMBER
	ON INQUIRYLIST.MEMNO = MEMBER.MEMNO
	JOIN INQUIRYCATEGORY
	ON INQUIRYLIST.CATEGORYNO = INQUIRYCATEGORY.CATEGORYNO
	WHERE INQUIRYNO = 4
	
/****************************************************************
                      REPORT
*****************************************************************/
DROP SEQUENCE SEQREPORT;
DROP TABLE REPORTLIST cascade constraints;

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
 	

INSERT INTO REPORTLIST
VALUES(SEQREPORT.NEXTVAL,(SELECT MEMNICK FROM MEMBER WHERE MEMNO=23),(SELECT MEMNO FROM MEMBER WHERE MEMNO=23),'DD','DD', DEFAULT, 1, 1, 1);	

SELECT * FROM REPORTLIST WHERE REPORTNO=26;
	JOIN BOARD
	ON REPORTLIST.TARGETNO = BOARD.BRDNO
BOARD.BRDWRITER
JOIN MEMBER
	ON REPORTLIST.MEMNO = MEMBER.MEMNO

	
	SELECT
	REPORTLIST.*,
	REPORTCATEGORY.CATEGORYNAME,
	TARGETCATEGORY.TARGETNAME
	FROM REPORTLIST
	JOIN REPORTCATEGORY
	ON REPORTLIST.CATEGORYNO = REPORTCATEGORY.CATEGORYNO
	JOIN TARGETCATEGORY
	ON REPORTLIST.TARGETTYPE = TARGETCATEGORY.TARGETNO
	WHERE REPORTNO = 10
	
	
	SELECT
	REPORTLIST.*,
	REPORTCATEGORY.CATEGORYNAME,
	TARGETCATEGORY.TARGETNAME,
	BOARD.BRDWRITER
	FROM REPORTLIST
	JOIN MEMBER
	ON REPORTLIST.MEMNO = MEMBER.MEMNO
	JOIN REPORTCATEGORY
	ON REPORTLIST.CATEGORYNO = REPORTCATEGORY.CATEGORYNO
	JOIN TARGETCATEGORY
	ON REPORTLIST.TARGETTYPE = TARGETCATEGORY.TARGETNO
	JOIN BOARD
	ON REPORTLIST.TARGETNO = BOARD.BRDNO
	WHERE REPORTNO = 10
	
	
	
	
	
	SELECT * FROM TARGETCATEGORY
	
SELECT
  REPORTLIST.*,
  REPORTCATEGORY.CATEGORYNAME,
  TARGETCATEGORY.TARGETNAME,
  BOARD.BOARDWRITER
FROM REPORTLIST
JOIN  MEMBER
  ON REPORTLIST.MEMNO = MEMBER.MEMNO
JOIN REPORTCATEGORY
  ON REPORTLIST.CATEGORYNO = REPORTCATEGORY.CATEGORYNO
JOIN TARGETCATEGORY
  ON REPORTLIST.TARGETTYPE = TARGETCATEGORY.TARGETNO
JOIN BOARD
  ON REPORTLIST.TARGETNO = BOARD.BOARDNO
  WHERE REPORTNO = 3
  ;
  
  
SELECT
	MEMBER.MEMNICK,
	REPORTLIST.*,     
	REPORTCATEGORY.CATEGORYNAME
	FROM REPORTLIST
	JOIN MEMBER
	ON REPORTLIST.MEMNO = MEMBER.MEMNO
	JOIN REPORTCATEGORY
	ON REPORTLIST.CATEGORYNO = REPORTCATEGORY.CATEGORYNO;
	
	
	
	SELECT M.*, R.*
 	FROM MEMBER M
 	LEFT JOIN REPORTLIST ON M.MEMNO = R.MEMNO 
 	WHERE MEMNO=7;
 	
 	
 	
 	DELETE FROM REPORTLIST WHERE REPORTNO = 2
 	
	
/****************************************************************
                      REPORTCATEGORY
*****************************************************************/	
DROP SEQUENCE SEQREPCATEGORY;
DROP TABLE REPORTCATEGORY cascade constraints;

CREATE SEQUENCE SEQREPCATEGORY;
CREATE TABLE REPORTCATEGORY(
	CATEGORYNO NUMBER PRIMARY KEY NOT NULL,
	CATEGORYNAME VARCHAR2(1000) NOT NULL
);

INSERT INTO REPORTCATEGORY
VALUES(SEQREPCATEGORY.NEXTVAL,'물품정보');


INSERT INTO REPORTCATEGORY
VALUES(SEQREPCATEGORY.NEXTVAL,'거래금지품록');


INSERT INTO REPORTCATEGORY
VALUES(SEQREPCATEGORY.NEXTVAL,'언어폭력');

INSERT INTO REPORTCATEGORY
VALUES(SEQREPCATEGORY.NEXTVAL,'기타사유');

SELECT * FROM REPORTCATEGORY;

/****************************************************************
                   TARGETCATEGORY
*****************************************************************/	
DROP SEQUENCE SEQTARCATEGORY;
DROP TABLE TARGETCATEGORY;

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

SELECT * FROM TARGETCATEGORY

/****************************************************************
                  BOARD
*****************************************************************/	
DROP SEQUENCE SEQBOARD;
DROP TABLE BOARD  CASCADE CONSTRAINTS ;

CREATE SEQUENCE SEQBOARD;
CREATE TABLE BOARD(
	BOARDNO NUMBER PRIMARY KEY NOT NULL,
	BOARDWRITER VARCHAR2(1000) NOT NULL
);

INSERT INTO BOARD
VALUES(SEQBOARD.NEXTVAL,'camLove');

SELECT * FROM BOARD;


		SELECT DISTINCT B.*, MP.MAPNAME
		FROM BOARD B
		INNER JOIN MAPLOCATION MP
		ON B.MEMNO = MP.MEMNO
		WHERE B.BRDNO = 2

select * from board;





SELECT
	MEMBER.MEMNICK,
	INQUIRYLIST.*,     
	INQUIRYCATEGORY.CATEGORYNAME
	FROM INQUIRYLIST
	
	JOIN MEMBER
	ON INQUIRYLIST.MEMNO = MEMBER.MEMNO
	JOIN INQUIRYCATEGORY
	ON INQUIRYLIST.CATEGORYNO = INQUIRYCATEGORY.CATEGORYNO
	WHERE INQUIRYNO = 6

	SELECT * FROM INQUIRYLIST
	
	SELECT * FROM MEMBER WHERE MEMNO =3


SELECT * FROM REPORTLIST

SELECT 
PCATEGORY.PCATEGORYNAME
PRODUCT .*
FROM PCATEGORY
LEFT JOIN PRODUCT
ON PRODUCT .PCATEGORYNO = PCATEGORY.PCATEGORYNO


SELECT * FROM PRODUCT;


SELECT 
PCATEGORY.PCATEGORYNAME
PRODUCT .*
FROM PCATEGORY
LEFT JOIN PRODUCT
ON PRODUCT .PCATEGORYNO = PCATEGORY.PCATEGORYNO


SELECT * FROM PRODUCT;





SELECT * FROM PCATEGORY;

SELECT
C.*,
M.MEMNICK,
RS.STATENAME,
P.PNAME,
PC.PCATEGORYNAME,
PY.PAYNO,
PY.TOTALPRICE
FROM CART C
JOIN MEMBER M
ON C.MEMNO = M.MEMNO
JOIN RENTSTATE RS
ON C.STATENO = RS.STATENO
JOIN PRODUCT P
ON C.PNO = P.PNO
JOIN PRODUCT P
ON C.PNO = P.PNO
JOIN PCATEGORY PC
ON C.PCATEGORYNO = PC.PCATEGORYNO
JOIN PAY PY
ON C.CARTNO = PY.CARTNO
WHERE C.CARTNO = 1;


SELECT * FROM MEMBER;
SELECT * FROM RENTSTATE;
SELECT * FROM PRODUCT;
SELECT * FROM PCATEGORY;
SELECT * FROM PAY;
SELECT * FROM CART;

/****************************************************************
                        Board Comment
*****************************************************************/

DROP SEQUENCE SEQBCOMMENT;
DROP TABLE BCOMMENT  CASCADE CONSTRAINTS ;

CREATE SEQUENCE SEQBCOMMENT;
CREATE TABLE BCOMMENT(
	COMNO NUMBER PRIMARY KEY NOT NULL,
	COMWRITER VARCHAR2(100) NOT NULL,
	COMCONTEXT VARCHAR2(1000) NOT NULL,
	COMDATE DATE DEFAULT SYSDATE NOT NULL,
	BRDNO NUMBER NOT NULL,
	FOREIGN KEY (BRDNO) references BOARD(BRDNO) ON DELETE CASCADE

);


SELECT * FROM PCATEGORY;

SELECT
C.*,
M.MEMNICK,
RS.STATENAME,
P.PNAME,
PC.PCATEGORYNAME,
PY.PAYNO,
PY.TOTALPRICE
FROM CART C
JOIN MEMBER M
ON C.MEMNO = M.MEMNO
JOIN RENTSTATE RS
ON C.STATENO = RS.STATENO
JOIN PRODUCT P
ON C.PNO = P.PNO
JOIN PRODUCT P
ON C.PNO = P.PNO
JOIN PCATEGORY PC
ON C.PCATEGORYNO = PC.PCATEGORYNO
JOIN PAY PY
ON C.CARTNO = PY.CARTNO
WHERE C.CARTNO = 1;


SELECT * FROM MEMBER;
SELECT * FROM RENTSTATE;
SELECT * FROM PRODUCT;
SELECT * FROM PCATEGORY;
SELECT * FROM PAY;
SELECT * FROM CART;

/****************************************************************
                        Board Comment
*****************************************************************/

DROP SEQUENCE SEQBCOMMENT;
DROP TABLE BCOMMENT  CASCADE CONSTRAINTS ;

CREATE SEQUENCE SEQBCOMMENT;
CREATE TABLE BCOMMENT(
	COMNO NUMBER PRIMARY KEY NOT NULL,
	COMWRITER VARCHAR2(100) NOT NULL,
	COMCONTEXT VARCHAR2(1000) NOT NULL,
	COMDATE DATE DEFAULT SYSDATE NOT NULL,
	BRDNO NUMBER NOT NULL,
	FOREIGN KEY (BRDNO) references BOARD(BRDNO) ON DELETE CASCADE

);

SELECT * FROM REPORTLIST;

SELECT
	REPORTLIST.*,     
	REPORTCATEGORY.CATEGORYNAME
	FROM REPORTLIST
	JOIN MEMBER
	ON REPORTLIST.MEMNO = MEMBER.MEMNO
	JOIN REPORTCATEGORY
	ON REPORTLIST.CATEGORYNO = REPORTCATEGORY.CATEGORYNO;
SELECT * FROM BCOMMENT;
SELECT
	REPORTLIST.*,
	REPORTCATEGORY.CATEGORYNAME,
	TARGETCATEGORY.TARGETNAME,
	BCOMMENT.COMWRITER,
	BCOMMENT.BRDNO
	FROM REPORTLIST
	JOIN MEMBER
	ON REPORTLIST.MEMNO = MEMBER.MEMNO
	JOIN REPORTCATEGORY
	ON REPORTLIST.CATEGORYNO = REPORTCATEGORY.CATEGORYNO
	JOIN TARGETCATEGORY
	ON REPORTLIST.TARGETTYPENO = TARGETCATEGORY.TARGETNO
	JOIN BCOMMENT
	ON REPORTLIST.TARGETNO = BCOMMENT.COMNO 
	WHERE REPORTNO = 2


	
	INSERT INTO BOARD VALUES(BRDNOSEQ.NEXTVAL,2,'CAMP','caravan9.jpg',DEFAULT,'게시글 내용',0,SYSDATE,'Y',1)
	
	INSERT INTO MAPLOCATION VALUES(MAPNOSEQ.NEXTVAL,'차박','위도1','경도1','Y',1,
	 (SELECT BRDNO FROM (SELECT * FROM BOARD ORDER BY BRDDATE DESC)	WHERE ROWNUM=1))
	
	
	
	
	
	SELECT * FROM BOARD;
	
	SELECT * FROM MAPLOCATION;
	
	
	INSERT INTO MAPLOCATION VALUES(MAPNOSEQ.NEXTVAL,'차박','위도1','경도1','Y',1,
	 (SELECT BRDNO FROM (
	SELECT * FROM BOARD ORDER BY BRDDATE DESC)
	WHERE ROWNUM=1;)
	
	
	INSERT ALL
	   	INTO BOARD 
	   	VALUES(BRDNOSEQ.NEXTVAL, #{bcategoryno},(SELECT MEMNICK FROM MEMBER WHERE MEMNO = #{memno}), #{brdfilename},
	   					  DEFAULT, #{brdcontent}, 0, SYSDATE, #{brdprivate}, #{memno} )
	   	INTO MAPLOCATION 
	   	VALUES(MAPNOSEQ.NEXTVAL, #{mapname}, #{maplatitude}, #{maplongtitude}, #{carmapchk}, #{memno},
	   	(SELECT BRDNO FROM BOARD WHERE ROWNUM<2 ORDER BY BRDDATE DESC))
	SELECT * FROM SYS.DUAL
	
	SELECT ROWNUM , B.BRDNO
	FROM BOARD B
	ORDER BY BRDDATE DESC;
	
	SELECT BRDNO FROM
	(SELECT 
	  ROW_NUMBER() OVER(ORDER BY BRDDATE DESC) AS ROW_NUM,
	  B.BRDNO
	FROM BOARD B
	ORDER BY BRDDATE DESC)
	WHERE ROW_NUM=1;	
	
	
	SELECT BRDNO FROM (
	SELECT * FROM BOARD ORDER BY BRDDATE DESC)
	WHERE ROWNUM=1;
	
	
	
	 INSERT INTO BOARD VALUES(BRDNOSEQ.NEXTVAL,2,'CAMP','caravan9.jpg',DEFAULT,'게시글 내용',0,SYSDATE,'Y',1);
	
	SELECT * FROM BOARD
	INSERT INTO BOARD VALUES(BRDNOSEQ.NEXTVAL,2,'CAMP','caravan9.jpg',DEFAULT,'게시글 내용',0,SYSDATE,'Y')
	
	
	SELECT * FROM BOARD;
	SELECT * FROM MAPLOCATION
	
	
		SELECT B.*, M.MEMNICK
  		FROM BOARD B
  		JOIN MEMBER M
  		ON B.BRDWRITER = M.MEMNICK
  		WHERE M.MEMNO = 1 AND B.BRDPRIVATE='N'
  		ORDER BY BRDDATE DESC
	
  		
 SELECT
	REPORTLIST.*,     
	REPORTCATEGORY.CATEGORYNAME
	FROM REPORTLIST
	JOIN MEMBER
	ON REPORTLIST.MEMNO = MEMBER.MEMNO
	JOIN REPORTCATEGORY
	ON REPORTLIST.CATEGORYNO = REPORTCATEGORY.CATEGORYNO 		
  		
  	SELECT
	REPORTLIST.*,
	REPORTCATEGORY.CATEGORYNAME,
	TARGETCATEGORY.TARGETNAME,
	BOARD.BRDWRITER
	FROM REPORTLIST
	JOIN MEMBER
	ON REPORTLIST.MEMNO = MEMBER.MEMNO
	JOIN REPORTCATEGORY
	ON REPORTLIST.CATEGORYNO = REPORTCATEGORY.CATEGORYNO
	JOIN TARGETCATEGORY
	ON REPORTLIST.TARGETTYPENO = TARGETCATEGORY.TARGETNO
	JOIN BOARD
	ON REPORTLIST.TARGETNO = BOARD.BRDNO
	WHERE REPORTNO = 1
	
	SELECT * FROM BCOMMENT
	SELECT * FROM BOARD
	SELECT * FROM REPORTLIST
	
	
	DELETE (SELECT DELETE REPORTLIST WHERE TARGETNO=2) BCOMMENT
  	WHERE COMNO=2
	
	
	
	DELETE BCOMMENT, REPORTLIST FROM BCOMMENT
	INNER JOIN REPORTLIST WHERE BCOMMENT.COMNO = REPORTLIST.TARGETNO 
	AND BCOMMENT.COMNO='2' 
	
	
	DELETE BCOMMENT.*, REPORTLIST.*
	FROM BCOMMENT
	LEFT JOIN REPORTLIST 
	ON BCOMMENT.COMNO = REPORTLIST.TARGETNO
	WHERE BCOMMENT.COMNO=2
	
	DELETE REPORTLIST 
	WHERE TARGETNO=2 AND TARGETTYPENO =2
	
	
	SELECT * FROM REPORTLIST
	
	SELECT COUNT(COMNO) COUNT FROM BCOMMENT WHERE BRDNO=28
	
	SELECT * FROM BOARD
	SELECT * FROM MAPLOCATION
		SELECT DISTINCT B.*, MP.MAPNAME
		FROM BOARD B
		JOIN MAPLOCATION MP
		ON B.MEMNO = MP.MEMNO
		WHERE B.BRDNO = 4
	
	
	
	SELECT * FROM MEMBER;
	
		SELECT (SELECT COUNT(COMNO) COUNT FROM  BCOMMENT WHERE BRDNO = 28) COUNT,  BCOMMENT.* FROM  BCOMMENT WHERE BRDNO = 28
  		ORDER BY COMNO
	
		SELECT DISTINCT (SELECT COUNT(COMNO) COUNT FROM  BCOMMENT WHERE BRDNO = 28) COUNT, B.*, MP.MAPNAME
		FROM BOARD B
		JOIN MAPLOCATION MP
		ON B.MEMNO = MP.MEMNO
		WHERE B.BRDNO = 28
	
		SELECT * FROM M	
		SELECT
		REPORTLIST.*,
		REPORTCATEGORY.CATEGORYNAME,
		TARGETCATEGORY.TARGETNAME,
		BOARD.BRDWRITER
		FROM REPORTLIST
		JOIN MEMBER
		ON REPORTLIST.MEMNO = MEMBER.MEMNO
		JOIN REPORTCATEGORY
		ON REPORTLIST.CATEGORYNO = REPORTCATEGORY.CATEGORYNO
		JOIN TARGETCATEGORY
		ON REPORTLIST.TARGETTYPENO = TARGETCATEGORY.TARGETNO
		JOIN BOARD
		ON REPORTLIST.TARGETNO = BOARD.BRDNO
		WHERE REPORTNO = 1
		
		
		SELECT * FROM 
		(SELECT ROWNUM AS RNUM, MEM.* 
		FROM (SELECT * FROM MEMBER WHERE MEMNICK LIKE '%' ||  #{search} || '%' OR MEMNAME LIKE '%' ||  '%'
		ORDER BY MEMNO DESC) MEM)
		
		WHERE RNUM BETWEEN 1 + (1 -1) * 10 AND 1 * 10
		
		
		
		SELECT (SELECT COUNT(COMNO) COUNT FROM  BCOMMENT WHERE BRDNO = 33) COUNT, B.*, MP.MAPNAME
		FROM BOARD B
		LEFT JOIN MAPLOCATION MP
		ON B.BRDNO = MP.BRDNO
		WHERE B.BRDNO = 33
		
		select * from maplocation where brdno=33
		select * from board
		
		
		delete maplocation where brdno =32
		
		delete from board where brdno=32
		
		select * from board where brdno =33
		
		SELECT COUNT(MEMNO) COUNT FROM
		(SELECT ROWNUM AS RNUM, INQ.*
		FROM 		
		(SELECT MEMBER.MEMNICK, INQUIRYLIST.*, INQUIRYCATEGORY.CATEGORYNAME, MEMBER.MEMFILE
		FROM INQUIRYLIST 
		JOIN MEMBER
		ON INQUIRYLIST.MEMNO = MEMBER.MEMNO
		JOIN INQUIRYCATEGORY
		ON INQUIRYLIST.CATEGORYNO = INQUIRYCATEGORY.CATEGORYNO
		WHERE CATEGORYNAME LIKE  '물품정보' OR MEMBER.MEMNICK LIKE 'camplove2'
		ORDER BY MEMBER.MEMNO DESC) INQ)
		WHERE RNUM BETWEEN 1 + (2 -1) * 6 AND 2 * 6
		
		
		SELECT COUNT(MEMNO) COUNT FROM
		(SELECT ROWNUM AS RNUM, INQ.*
		FROM (SELECT MEMBER.MEMNICK, INQUIRYLIST.*, INQUIRYCATEGORY.CATEGORYNAME, MEMBER.MEMFILE
		FROM INQUIRYLIST 
		JOIN MEMBER
		ON INQUIRYLIST.MEMNO = MEMBER.MEMNO
		JOIN INQUIRYCATEGORY
		ON INQUIRYLIST.CATEGORYNO = INQUIRYCATEGORY.CATEGORYNO
		
		WHERE MEMNICK LIKE '%' ||  #{search} || '%' OR MEMNAME LIKE '%' ||  #{search} || '%' 
		ORDER BY MEMNO) MEM)
		
		
			
	SELECT
	REPORTLIST.*,     
	REPORTCATEGORY.CATEGORYNAME,
	MEMBER.MEMFILE
	FROM REPORTLIST
	JOIN MEMBER
	ON REPORTLIST.MEMNO = MEMBER.MEMNO
	JOIN REPORTCATEGORY
	ON REPORTLIST.CATEGORYNO = REPORTCATEGORY.CATEGORYNO
		
		
		
		OR MEMBER.MEMNICK LIKE '%' ||  'camplove2' || '%'
		
		
		
		select * from inquiry
		
			SELECT MEMBER.MEMNICK, INQUIRYLIST.*, INQUIRYCATEGORY.CATEGORYNAME, MEMBER.MEMFILE
			FROM 
			(SELECT ROWNUM AS RNUM, INQUIRYLIST.* 
			FROM (SELECT MEMBER.MEMNICK, INQUIRYLIST.*, INQUIRYCATEGORY.CATEGORYNAME, MEMBER.MEMFILE FROM INQUIRYLIST 
			JOIN MEMBER
			ON INQUIRYLIST.MEMNO = MEMBER.MEMNO
			JOIN INQUIRYCATEGORY
			ON INQUIRYLIST.CATEGORYNO = INQUIRYCATEGORY.CATEGORYNO)
			
			WHERE INQUIRYCATEGORY.CATEGORYNAME '%' ||  "거래" || '%' OR MEMBER.MEMNICK LIKE '%' ||  "camplove" || '%'
			ORDER BY INQUIRYLIST.MEMNO DESC) )
		
	
	
		WHERE RNUM BETWEEN 1 + (1 -1) * 10 AND 2 * 10
		
		
		SELECT MEMBER.MEMNICK, INQUIRYLIST.*, INQUIRYCATEGORY.CATEGORYNAME, MEMBER.MEMFILE
		FROM INQUIRYLIST
		JOIN MEMBER
		ON INQUIRYLIST.MEMNO = MEMBER.MEMNO
		JOIN INQUIRYCATEGORY
		ON INQUIRYLIST.CATEGORYNO = INQUIRYCATEGORY.CATEGORYNO
		
		select * from inquirylist;
		select * from member;
		select * from INQUIRYCATEGORY
		SELECT * FROM REPORTLIST	
		
		
		SELECT * FROM 
	(SELECT ROWNUM AS RNUM, BRD.*
	FROM 		
	(SELECT B.*, BC.BCATEGORYNAME
	FROM BOARD B
	JOIN BCATEGORY BC
	ON B.BCATEGORYNO = BC.BCATEGORYNO
	ORDER BY BRDDATE DESC) BRD WHERE BRDPRIVATE='N')
	WHERE RNUM BETWEEN 1 + (#{page} -1) * 6 AND #{page}  * 6
		WHERE RNUM BETWEEN 1 + (1 -1) * 8 AND 1  * 8
		
--		WHERE CATEGORYNAME LIKE  '%' ||  #{search}  || '%' OR REPORTWRITER LIKE '%' ||  #{search}  || '%'
		
	SELECT * FROM 
		(SELECT ROWNUM AS RNUM, INQ.*
		FROM 		
		(SELECT MEMBER.MEMNICK, INQUIRYLIST.*, INQUIRYCATEGORY.CATEGORYNAME, MEMBER.MEMFILE
		FROM INQUIRYLIST 
		JOIN MEMBER
		ON INQUIRYLIST.MEMNO = MEMBER.MEMNO
		JOIN INQUIRYCATEGORY
		ON INQUIRYLIST.CATEGORYNO = INQUIRYCATEGORY.CATEGORYNO
		ORDER BY INQUIRYLIST.INQUIRYDATE DESC) INQ)
	
	
	
		SELECT * FROM 
		(SELECT ROWNUM AS RNUM, REN.*
		FROM 		
		(SELECT
		C.*,
		M.MEMNICK,
		M.MEMFILE,
		RS.STATENAME,
		P.PNAME,
		PC.PCATEGORYNAME,
		PY.PAYNO,
		PY.TOTALPRICE
		FROM CART C
		JOIN MEMBER M
		ON C.MEMNO = M.MEMNO
		JOIN RENTSTATE RS
		ON C.STATENO = RS.STATENO
		JOIN PRODUCT P
		ON C.PNO = P.PNO
		JOIN PCATEGORY PC
		ON C.PCATEGORYNO = PC.PCATEGORYNO
		JOIN PAY PY
		ON C.CARTNO = PY.CARTNO
		ORDER BY PY.PAYNO DESC) REN)
		
		
		
		
SELECT COUNT(BRDNO) COUNT FROM
	(SELECT ROWNUM AS RNUM, BRD.*
	FROM 		
	(SELECT B.*, BC.BCATEGORYNAME
	FROM BOARD B
	JOIN BCATEGORY BC
	ON B.BCATEGORYNO = BC.BCATEGORYNO
	
	ORDER BY BRDDATE DESC) BRD WHERE BRDPRIVATE='N')
	
	WHERE CATEGORYNAME LIKE  '%' ||  #{search}  || '%' OR REPORTWRITER LIKE '%' ||  #{search}  || '%'
		
	select * from bcategory	
		
		SELECT * FROM 
		(SELECT ROWNUM AS RNUM, PRD.*
		FROM 	
		(SELECT P.*, PC.PCATEGORYNO
		FROM PRODUCT P 
		JOIN PCATEGORY PC
		ON P.PCATEGORYNO = PC.PCATEGORYNO
		ORDER BY P.PNO DESC) PRD )
		WHERE RNUM BETWEEN 1 + (1 -1) * 8 AND 1  * 8
		
		
		
		
		SELECT COUNT(PNO) COUNT FROM
		(SELECT ROWNUM AS RNUM, PRD.*
		FROM 		
		(SELECT P.*, PC.PCATEGORYNAME
		FROM PRODUCT P 
		JOIN PCATEGORY PC
		ON P.PCATEGORYNO = PC.PCATEGORYNO
		ORDER BY P.PNO DESC) PRD)
		
		
		SELECT * FROM 
		(SELECT ROWNUM AS RNUM, PRD.*
		FROM 		
		(SELECT P.*, PC.PCATEGORYNAME
		FROM PRODUCT P 
		JOIN PCATEGORY PC
		ON P.PCATEGORYNO = PC.PCATEGORYNO
		ORDER BY P.PNO DESC) PRD)
		WHERE RNUM BETWEEN 1 + (#{page} -1) * 8 AND #{page}  * 8
		
		
		
		
		
		SELECT * FROM MEMBER WHERE MEMNO=2
		
		
	SELECT * FROM 
	(SELECT ROWNUM AS RNUM, BRD.*
	FROM 		
	(SELECT *
		FROM BOARD 
		
		WHERE MEMNO = 10
		ORDER BY BRDDATE DESC) BRD )
	WHERE RNUM BETWEEN 1 + (#{page} -1) * 6 AND #{page}  * 6
		
		
		SELECT * FROM 
	(SELECT ROWNUM AS RNUM, BRD.*
	FROM 		
	(SELECT B.*, BC.BCATEGORYNAME
	FROM BOARD B
	JOIN BCATEGORY BC
	ON B.BCATEGORYNO = BC.BCATEGORYNO
	AND BRDWRITER LIKE '%' ||  #{search}  || '%' OR BCATEGORYNAME LIKE  '%' ||  #{search}  || '%'
	ORDER BY BRDDATE DESC) BRD WHERE BRDPRIVATE='N')
	WHERE RNUM BETWEEN 1 + (#{page} -1) * 6 AND #{page}  * 6
		
	SELECT COUNT(BRDNO) COUNT FROM
	(SELECT ROWNUM AS RNUM, BRD.*
	FROM 		
	(SELECT * FROM BOARD 
	WHERE MEMNO = 10
	ORDER BY BRDDATE DESC) BRD)
	
	select * from member;
	
	
	
	
	
	SELECT COUNT(BRDNO) COUNT FROM
	(SELECT ROWNUM AS RNUM, BRD.*
	FROM 		
	(SELECT * FROM BOARD 
	WHERE MEMNO = 1 
	ORDER BY BRDDATE DESC) BRD)
	
	SELECT * FROM 
	(SELECT ROWNUM AS RNUM, BRD.*
	FROM 		
	(SELECT B.*, BC.BCATEGORYNAME
	FROM BOARD B
	JOIN BCATEGORY BC
	ON B.BCATEGORYNO = BC.BCATEGORYNO
	ORDER BY BRDDATE DESC) BRD WHERE BRDPRIVATE='N')
	WHERE RNUM BETWEEN 1 + (1 -1) * 6 AND 1  * 6
	
	select * from bcategory
	
	
	SELECT B.*, BC.BCATEGORYNAME
	FROM BOARD B
	JOIN BCATEGORY BC
	ON B.BCATEGORYNO = BC.BCATEGORYNO
	
	SELECT * FROM 
	(SELECT ROWNUM AS RNUM, BRD.*
	FROM 		
	(SELECT B.*
	FROM BOARD B
	JOIN BCATEGORY BC
	ON B.BCATEGORYNO = BC.BCATEGORYNO
	AND BRDWRITER LIKE '나나콘' OR B.BCATEGORYNAME LIKE '차박'
	ORDER BY BRDDATE DESC) BRD WHERE BRDPRIVATE='N')
	WHERE RNUM BETWEEN 1 + (1 -1) * 6 AND 1 * 6
	
	SELECT * FROM 
	(SELECT ROWNUM AS RNUM, BRD.*
	FROM 	
	(SELECT B.*, BC.BCATEGORYNAME
	FROM BOARD B 	
	LEFT JOIN BCATEGORY BC
	ON B.BCATEGORYNO = BC.BCATEGORYNO
	WHERE BRDWRITER LIKE '%%'  OR B.BCATEGORYNO LIKE '2' 
	ORDER BY BRDDATE DESC) BRD WHERE BRDPRIVATE='N')
	WHERE RNUM BETWEEN 1 + (1 -1) * 6 AND 1 * 6
	
	SELECT * FROM 
	(SELECT ROWNUM AS RNUM, BRD.*
	FROM 		
	(SELECT B.*, BC.BCATEGORYNAME
	FROM BOARD B
	JOIN BCATEGORY BC
	ON B.BCATEGORYNO = BC.BCATEGORYNO
	WHERE B.BCATEGORYNO LIKE 
	ORDER BY BRDDATE DESC) BRD WHERE BRDPRIVATE='N')
	WHERE RNUM BETWEEN 1 + (#{page} -1) * 6 AND #{page}  * 6
	
	SELECT * FROM 
	(SELECT ROWNUM AS RNUM, MEM.* 
	FROM (SELECT * FROM MEMBER WHERE MEMNICK LIKE '%' ||  #{search} || '%' OR MEMNAME LIKE '%' ||  #{search} || '%'
	ORDER BY MEMNO DESC) MEM)
	WHERE RNUM BETWEEN 1 + (#{page} -1) * 10 AND #{page} * 10
	
	
	
	SELECT COUNT(BRDNO) COUNT FROM
	(SELECT ROWNUM AS RNUM, BRD.*
	FROM 		
	(SELECT B.*, BC.BCATEGORYNAME
	FROM BOARD B
	JOIN BCATEGORY BC
	ON B.BCATEGORYNO = BC.BCATEGORYNO
	WHERE B.BCATEGORYNO LIKE  '%%' OR BRDWRITER LIKE '%%'
	ORDER BY BRDDATE DESC) BRD WHERE BRDPRIVATE='N')
	
	SELECT * FROM 
	(SELECT ROWNUM AS RNUM, BRD.*
	FROM 		
	(SELECT B.*, BC.BCATEGORYNAME
	FROM BOARD B
	JOIN BCATEGORY BC
	ON B.BCATEGORYNO = BC.BCATEGORYNO
	WHERE B.BCATEGORYNO LIKE  '%' ||  #{categoryNo}  || '%'
	ORDER BY BRDDATE DESC) BRD WHERE BRDPRIVATE='N')
	WHERE RNUM BETWEEN 1 + (#{page} -1) * 6 AND #{page}  * 6
	
	
	UPDATE MEMBER SET MEMCODE=1 WHERE MEMNO=1;
	
	SELECT * 
		FROM PRODUCT
		WHERE PNO = #{pNo}
	
	
	select * from product
	
	UPDATE PRODUCT SET PAMOUNT =3 WHERE PNO = 1
	
	
	SELECT * FROM 
	(SELECT ROWNUM AS RNUM, BRD.*
	FROM 		
	(SELECT B.*, BC.BCATEGORYNAME
	FROM BOARD B
	JOIN BCATEGORY BC
	ON B.BCATEGORYNO = BC.BCATEGORYNO
	WHERE B.BCATEGORYNO LIKE  '%2%' 
	ORDER BY BRDDATE DESC) BRD WHERE BRDPRIVATE='N')
	WHERE RNUM BETWEEN 1 + (#{page} -1) * 9 AND #{page}  * 9
	
	
	
	