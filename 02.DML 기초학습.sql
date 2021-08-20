
--DML: 데이터 조작어
--SELECT, INSERT, UPDATE, DELETE

INSERT INTO BOARD
 (bno,title,content,writer,reg_date)
 VALUES
 (1,'안녕','재밌는 내용입니다.','마이콜',SYSDATE);
 --문자는 '' 홑따옴표, 순서는 내 마음
 
 --NOT NULL 제약조건에 위반(오류)
 INSERT INTO BOARD
 (bno,content,writer,reg_date)
 VALUES
 (2,'재밌는 내용입니다2.','둘리',SYSDATE);
 
 --PK 제약조건 위반
  INSERT INTO BOARD
 (bno,title,content,writer,reg_date)
 VALUES
 (1,'새로운 글이야','재밌는 내용입니다3.','둘리',SYSDATE);
 
INSERT INTO BOARD
 (bno,title,writer,reg_date)
 VALUES
 (3,'새로운 글이야','둘리',SYSDATE);
 
 --테이블의 모든 컬럼을 채워서 삽일할 경우
 --컬럼지정을 생략할 수 있음
 INSERT INTO BOARD
 VALUES
 (4,'안녕4','재밌는 내용입니다4.','고길동',SYSDATE);
 
 
 
 --데이터 수정
 UPDATE board
 SET title = '수정된 제목'
 WHERE bno = 3;
 --where 조건절
 
UPDATE board
 SET content = '굿애프터눈';
 WHERE bno = 3;
 --where 조건절
 
UPDATE board
 SET title = '메롱메롱'
    ,content='야호야호'
    ,writer='박영희'
 WHERE bno = 1;
 
 --WHERE절을 생략할 경우
 --전체 행이 수정되므로 주의!
 UPDATE board
 SET writer = '관리자';
 --ex)
 --UPDATE member
--SET age = age + 1;
  
 --데이터 삭제
 DELETE FROM board
 WHERE bno = 1;
  
INSERT INTO BOARD
 (bno,title,content,writer,reg_date)
 VALUES
 (3,'안녕','재밌는 내용입니다.','마이콜',SYSDATE);  
  
COMMIT;

INSERT INTO BOARD
 (bno,title,content,writer,reg_date)
 VALUES
 (4,'안녕','재밌는 내용입니다.','마이콜',SYSDATE);
 
ROLLBACK;
--마지막 커밋 시점으로 돌아가는 

SELECT * FROM BOARD;
  

 --전체 데이터 삭제
 --1.WHERE절을 생략한 DELETE
 --(ROLLBACK가능, 수동커밋 가능,로그 남기기 가능)
DELETE FROM board;
ROLLBACK; 

--2.TRUNCATE TABLE 휴지통 비우기
--(롤백 불가능, 자동커밋, 로그 남지 않음,
-- 테이블 생성 초기 상태로 돌아감)
 TRUNCATE TABLE board;
 
--3.DROP TABLE(롤백 불가, 자동커밋,
--로그 남지 않음, 테이블 구조가 완전 삭제)
DROP TABLE board;
 
 
 
 
 
 
 