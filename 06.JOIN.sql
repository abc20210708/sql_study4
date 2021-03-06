
--JOIN 기초

SELECT
    emp_no, emp_nm, addr , dept_cd
FROM tb_emp
;

SELECT
    dept_cd, dept_nm
FROM tb_dept
;

SELECT
    emp_no, emp_nm, addr , tb_emp.dept_cd ,dept_nm
FROM tb_emp, tb_dept
WHERE tb_emp.dept_cd = tb_dept.dept_cd
;--컬럼명이 같아서 테이블 명을 써야함! 안 쓰면 오류

SELECT
    E.emp_no, E.emp_nm, E.addr , E.dept_cd ,D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
;


--조인 기초 테스트 데이터

CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY
    , content VARCHAR2(200)
);
CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY
    , reply VARCHAR2(100)
    , a_id NUMBER(10)
);

INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, 'ㄱㄱㄱ', 1);
INSERT INTO TEST_B  VALUES (2, 'ㄴㄴㄴ', 1);
INSERT INTO TEST_B  VALUES (3, 'ㄷㄷㄷ', 2);
INSERT INTO TEST_B  VALUES (4, 'ㄹㄹㄹ', 3);
COMMIT;


SELECT * FROM TEST_A;
SELECT * FROM TEST_B;

SELECT
    id, content, reply
FROM test_a,test_b
WHERE test_a.id = test_b.a_id --조인조건
;

--자격증 관련 테이블
SELECT * FROM tb_emp_certi;

SELECT * FROM tb_certi;


SELECT
    A.emp_no, A.certi_cd, B.certi_nm, A.acqu_de
FROM tb_emp_certi A, tb_certi B
WHERE A.certi_cd = B.certi_cd
;


--3개의 테이블 조인
SELECT
    A.emp_no, C.emp_nm, A.certi_cd, B.certi_nm, A.acqu_de
FROM tb_emp_certi A, tb_certi B, tb_emp C
WHERE A.certi_cd = B.certi_cd
    AND A.emp_no = C.emp_no
;

--4개의 테이블
SELECT
    A.emp_no, C.emp_nm, C.dept_Cd, D.dept_nm, A.certi_cd, B.certi_nm, A.acqu_de
FROM tb_emp_certi A, tb_certi B, tb_emp C, tb_dept D
WHERE A.certi_cd = B.certi_cd
    AND A.emp_no = C.emp_no
    AND C.dept_cd = D.dept_cd
;

--부서별 자격증 수
SELECT
    C.dept_cd, COUNT(*)
FROM tb_emp_certi A, tb_certi B, tb_emp C, tb_dept D
WHERE A.certi_cd = B.certi_cd
    AND A.emp_no = C.emp_no
    AND C.dept_cd = D.dept_cd
GROUP BY C.dept_cd
;


--3개의 테이블 조인 + 2019년에 취득한 자격증 정보만 제한 조회
SELECT
    A.emp_no, C.emp_nm, A.certi_cd, B.certi_nm, A.acqu_de
FROM tb_emp_certi A, tb_certi B, tb_emp C
WHERE A.certi_cd = B.certi_cd
    AND A.emp_no = C.emp_no
    AND A.acqu_de BETWEEN '20190101' AND '20191231'
    AND C.emp_nm LIKE '이%'
ORDER BY A.acqu_de
;




-- # INNER JOIN
-- 1. 2개 이상의 테이블이 공통된 컬럼에 의해 논리적으로 결합되는 조인기법입니다.
-- 2. WHERE절에 사용된 컬럼들이 동등연산자(=)에 의해 조인됩니다.

SELECT 
    E.emp_no, E.emp_nm, E.addr, E.dept_cd, D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd--조인조건
    AND addr LIKE '%용인%'--일반조건
ORDER BY E.emp_no
;

SELECT 
    *
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
    AND addr LIKE '%용인%'
ORDER BY E.emp_no
;


SELECT 
    A.emp_no, A.emp_nm, A.dept_cd, B.dept_nm
FROM tb_emp A , tb_dept B
WHERE A.dept_cd = B.dept_cd
;
-- # NATURAL JOIN
-- 1. NATURAL JOIN은 동일한 이름을 갖는 컬럼들에 대해 자동 조인하는 기법입니다.
-- 2. 즉, 자동으로 2개 이상의 테이블에서 같은 이름을 가진 컬럼을 찾아 INNER조인을 수행합니다.
-- 3. 이 때 조인되는 동일 이름의 컬럼은 데이터 타입이 같아야 하며, ALIAS나 테이블명을 붙일 수 없습니다.
-- 4. SELECT * 문법을 사용하면, 공통 컬럼으로 자동 조인하며 결과집합에서 한번만 표기됩니다.
SELECT --B.dept_cd 식별자 사용 ㄴㄴ ,where 안 써도 오류 ㄴ
    A.emp_no, A.emp_nm, dept_cd, B.dept_nm
FROM tb_emp A NATURAL JOIN tb_dept B
;


SELECT 
    A.emp_no, A.emp_nm, A.dept_cd, B.dept_nm
FROM tb_emp A , tb_dept B
;

SELECT 
    *
FROM tb_emp A NATURAL JOIN tb_dept B
;--DEPT_CD 중복되서 안 나옴!



-- # USING절 조인
-- 1. NATURAL조인에서는 자동으로 이름이 일치하는 모든 컬럼에 대해 조인이
--    일어나지만 USING을 사용하면 원하는 컬럼에 대해서만 선택적으로 조인이 가능합니다.
-- 2. USING절에서도 조인 컬럼에 대해 ALIAS나 테이블명을 붙일 수 없습니다.

SELECT 
    A.emp_no, A.emp_nm, dept_cd, B.dept_nm
FROM tb_emp A JOIN tb_dept B
USING(dept_cd)
;


-- # JOIN ON절
-- 1. 조인 조건 서술부(ON절)와 일반 조건 서술부(WHERE절)를 분리해서 작성하는 방법입니다.
-- 2. ON절을 사용하면 JOIN이후에 논리 연산이나 서브쿼리와 같은 추가 서술을 할 수 있습니다.

SELECT 
    E.emp_no, E.emp_nm, E.addr, E.dept_cd, D.dept_nm
FROM tb_emp E JOIN tb_dept D
ON E.dept_cd = D.dept_cd --조인조건
WHERE addr LIKE '%용인%' --일반조건
ORDER BY E.emp_no
;


SELECT --N개 테이블 조인 , 조인 조건은 (N-1)개
    A.emp_no, C.emp_nm, C.dept_Cd, D.dept_nm, A.certi_cd, B.certi_nm, A.acqu_de
FROM tb_emp_certi A, tb_certi B, tb_emp C, tb_dept D
WHERE A.certi_cd = B.certi_cd
    AND A.emp_no = C.emp_no
    AND C.dept_cd = D.dept_cd
    AND C.birth_de BETWEEN '19800101' AND '19891231'
;


SELECT --N개 테이블 조인 , 조인 조건은 (N-1)개
    A.emp_no, C.emp_nm, C.dept_Cd, D.dept_nm, A.certi_cd, B.certi_nm, A.acqu_de
FROM tb_emp_certi A -- ,를 JOIN으로 우선 바꿔주고
JOIN tb_certi B 
ON A.certi_cd = B.certi_cd --추가 조건있으면 AND걸어주고
JOIN tb_emp C 
ON A.emp_no = C.emp_no
JOIN tb_dept D --D랑 JOIN할 조건을 밑에다가 작성
ON C.dept_cd = D.dept_cd
WHERE C.birth_de BETWEEN '19800101' AND '19891231'
;
-- SELECT [DISTINCT] { 열이름 .... } 
-- FROM  테이블 또는 뷰 이름
-- JOIN  테이블 또는 뷰 이름
-- ON    조인 조건
-- WHERE 조회 조건
-- GROUP BY  열을 그룹화
-- HAVING    그룹화 조건 
-- ORDER BY  정렬할 열 [ASC | DESC];
-- HAVING,GROUP BY 두 개는 순서가 바뀌어도 상관없음!















