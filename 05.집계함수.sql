

--1.�����Լ�

--������ �Լ�:��� �� �ϳ��ϳ��� �Լ��� ����
SELECT
    SUBSTR(emp_nm,1,1)AS ����
FROM tb_emp;

--������ �Լ�:���� ���� ��� �Լ��� ����
SELECT * FROM tb_sal_his;

SELECT
    SUM(pay_amt) AS �����Ѿ�
    , AVG(pay_amt) AS ������޾�
    --TO_CHAR(pay_amt,'L999,999,999')
FROM tb_sal_his;

--�����Լ�
SELECT
    COUNT(emp_no) AS "�� �����"
    , MAX(birth_de) AS "�ֿ����� ����"
    , MIN(birth_de) AS "�ֿ����� ����"
FROM tb_emp;

SELECT
    COUNT(direct_manager_emp_no)
FROM tb_emp;

SELECT
    COUNT(*)
FROM tb_emp;

--2.GROUP BY

--�μ����� ���� ������ ����
--���� �������� ����
--�μ��� �� �������� ��ȸ
SELECT emp_nm, dept_cd, birth_de FROM tb_emp ORDER BY dept_cd;

SELECT 
    dept_cd
    , MAX(birth_de) AS "�ֿ����� ����"
    , MIN(birth_de) AS "�ֿ����� ����"
    , COUNT(emp_no) AS "������"
FROM tb_emp
GROUP BY dept_cd
ORDER BY dept_cd
;


--HAVING: �׷�ȭ�� ������� ������ �ɾ� �� ���� ����

SELECT 
    dept_cd
    , MAX(birth_de) AS "�ֿ����� ����"
    , MIN(birth_de) AS "�ֿ����� ����"
    , COUNT(emp_no) AS "������"
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT(*) >= 2
ORDER BY dept_cd
;


-- ������� ������ ���� ���� �޾��� �� �׼�
-- ���� ���� �޾��� �� �׼�
-- ��� �׼� ��ȸ
SELECT * FROM tb_sal_his
ORDER BY emp_no, pay_de;


SELECT
    emp_no
    ,MAX(pay_amt) AS "�ְ� ���ɾ�"
    ,MIN(pay_amt) AS "���� ���ɾ�"
    ,TO_CHAR(ROUND(AVG(pay_amt),2),'L999,999,999') AS "��� ���ɾ�"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no
;

--��� ���ɾ��� 450���� �̻��� ����� ��ȸ
SELECT
    emp_no
    ,MAX(pay_amt) AS "�ְ� ���ɾ�"
    ,MIN(pay_amt) AS "���� ���ɾ�"
    ,TO_CHAR(ROUND(AVG(pay_amt),2),'L999,999,999') AS "��� ���ɾ�"
FROM tb_sal_his
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;

--������� 2019�⵵ �ݿ����ɾ� �� �ְ���ɾ�,�������ɾ�,��ռ��ɾ�
SELECT
    emp_no
    ,MAX(pay_amt) AS "�ְ� ���ɾ�"
    ,MIN(pay_amt) AS "���� ���ɾ�"
    ,TO_CHAR(ROUND(AVG(pay_amt),2),'L999,999,999') AS "��� ���ɾ�"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no
;--WHERE�� FROM �ڿ� �ɴϴ�.

--������� 2019�⵵ ��ռ��ɾ��� 450���� �̻� ��ȸ
SELECT
    emp_no
    ,MAX(pay_amt) AS "�ְ� ���ɾ�"
    ,MIN(pay_amt) AS "���� ���ɾ�"
    ,TO_CHAR(ROUND(AVG(pay_amt),2),'L999,999,999') AS "��� ���ɾ�"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;
--HAVING�� ��谡 �� ���� ������

--�߰��� 2019�� ������ �߰��� ��ȸ
SELECT
    emp_no
    ,MAX(pay_amt) AS "�ְ� ���ɾ�"
    ,MIN(pay_amt) AS "���� ���ɾ�"
    ,TO_CHAR(ROUND(AVG(pay_amt),2),'L999,999,999') AS "��� ���ɾ�"
    ,TO_CHAR(SUM(pay_amt),'L999,999,999') AS "����"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no
;


--ORDER BY : ����
--ASC: ������ ����(�⺻��)//DESC: ������ ����
--�׻� SELECT���� �� ���ٿ� ��ġ
--������ 1 2 3 4 �� �� �� A B C
--������ 4 3 2 1 �� �� Ÿ Z Y X
SELECT emp_no, emp_nm, addr 
FROM tb_emp
ORDER BY emp_no --ASC ������
;

SELECT emp_no, emp_nm, addr 
FROM tb_emp
ORDER BY emp_nm DESC 
;

SELECT emp_no AS ���
    , emp_nm AS �̸�
    , addr AS �ּ�
FROM tb_emp
ORDER BY ��� DESC 
;

SELECT emp_no AS ��� --1
    , emp_nm AS �̸� --2
    , addr AS �ּ� --3
FROM tb_emp
ORDER BY 2 DESC 
;

SELECT emp_no AS ���
    , emp_nm AS �̸�
    , addr AS �ּ�
FROM tb_emp
ORDER BY emp_nm, emp_no DESC --emp_nm�� ������
;--1���� �̸� ����,2�������� �ߺ��ִ� �ֵ��� ��� ������

SELECT emp_no AS ��� --1
    , emp_nm AS �̸� --2
    , addr AS �ּ� --3
FROM tb_emp
ORDER BY 2,1 DESC
;

SELECT emp_no AS ��� --1
    , emp_nm AS �̸� --2
    , addr AS �ּ� --3
FROM tb_emp
ORDER BY �̸�,1 DESC --ȥ���ؼ��� ������
;

















