

--SELECT 기본
SELECT
  certi_cd,certi_nm
FROM tb_certi;

SELECT
  certi_cd,certi_nm,issue_insti_nm
FROM tb_certi;

SELECT
  *
FROM tb_emp;

SELECT
  emp_no,emp_nm,addr
FROM tb_emp;

--SELECT ALL자동으로 들어감
--DISTINCT: 중복값 제외
SELECT ALL
    issue_insti_nm
FROM tb_certi;

SELECT DISTINCT
    issue_insti_nm
FROM tb_certi;

--둘 다 같아야 중복 제거
SELECT DISTINCT
    issue_insti_nm,certi_nm
FROM tb_certi;


--별칭(ALIAS) 지정
SELECT
 certi_cd AS "자격증코드"
 , certi_nm AS "자격증명"
 , issue_insti_nm AS "발급기관명"
FROM tb_certi;
--별칭은 ""
--띄어쓰기 들어가면 ""쌍따옴표 무조건
--AS는 생략 가능


--결합연산자(||)을 통한 컬럼문자열 결합

SELECT
    certi_nm ||'('||certi_cd||')-'||issue_insti_nm AS "자격증 정보"
FROM tb_certi;

--더미 테이블(dual):단순 연산결과를 조회할 때 사용
SELECT
    3*7 AS "연산 결과"
FROM dual;


--WHERE 조건절:조회 결과를 제한하는 조건절

SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd = 2
;

--WHERE 조건절에 PK컬럼을 사용하면 무조건 단일행이 조회됨
SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE emp_no = 1000000003
;

--비교연산자
SELECT
    emp_no, emp_nm, birth_de, tel_no
FROM tb_emp
WHERE birth_de >='19900101'
    AND birth_de <='19991231'
;

--BETWEEN 연산자
SELECT
    emp_no, emp_nm, birth_de, tel_no
FROM tb_emp
WHERE birth_de BETWEEN '19900101' AND '19991231'
;

SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd = '100004'
    OR dept_cd = '100006'
;

--IN 연산자
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd IN('100004','100006')
;

--'100004','100006'빼고 조회
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd NOT IN('100004','100006')
;

--LIKE연산자
--검색시 사용
--와일드카드 매핑 
-- % : 0 글자 이상
-- _ : 단 1 글자
SELECT
    emp_no, emp_nm   
FROM tb_emp
WHERE emp_nm LIKE '이%'
;

SELECT
    emp_no, emp_nm   
FROM tb_emp
WHERE emp_nm LIKE '%심'
;

SELECT
    emp_no, emp_nm, addr 
FROM tb_emp
WHERE addr LIKE '%용인%'
;

SELECT
    emp_no, emp_nm   
FROM tb_emp
WHERE emp_nm LIKE '_정%'
;


SELECT
    emp_no,
    emp_nm, 
    birth_de, 
    dept_cd 
FROM tb_emp
WHERE emp_nm LIKE '김%'
    AND dept_cd IN ('100003','100004','100006')
    AND birth_de BETWEEN '19900101' AND '19991231'
;

--부정 비교연산자
SELECT
    emp_no,
    emp_nm,
    sex_cd
FROM tb_emp
WHERE sex_cd <> 1
    AND emp_nm NOT LIKE '이%'
;

--NULL 값 조회
SELECT
    emp_no, emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS null
;

SELECT
    emp_no, emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT null
;


SELECT
    emp_no,
    emp_nm, 
    birth_de, 
    dept_cd,
    addr
FROM tb_emp
WHERE 1=1
    AND emp_nm LIKE '김%'
    AND(addr LIKE '%수원%' OR addr LIKE '%일산%')
  --AND addr LIKE '%수원%' OR addr LIKE '%일산%'
;

















