

--SELECT �⺻
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

--SELECT ALL�ڵ����� ��
--DISTINCT: �ߺ��� ����
SELECT ALL
    issue_insti_nm
FROM tb_certi;

SELECT DISTINCT
    issue_insti_nm
FROM tb_certi;

--�� �� ���ƾ� �ߺ� ����
SELECT DISTINCT
    issue_insti_nm,certi_nm
FROM tb_certi;


--��Ī(ALIAS) ����
SELECT
 certi_cd AS "�ڰ����ڵ�"
 , certi_nm AS "�ڰ�����"
 , issue_insti_nm AS "�߱ޱ����"
FROM tb_certi;
--��Ī�� ""
--���� ���� ""�ֵ���ǥ ������
--AS�� ���� ����


--���տ�����(||)�� ���� �÷����ڿ� ����

SELECT
    certi_nm ||'('||certi_cd||')-'||issue_insti_nm AS "�ڰ��� ����"
FROM tb_certi;

--���� ���̺�(dual):�ܼ� �������� ��ȸ�� �� ���
SELECT
    3*7 AS "���� ���"
FROM dual;


--WHERE ������:��ȸ ����� �����ϴ� ������

SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd = 2
;

--WHERE �������� PK�÷��� ����ϸ� ������ �������� ��ȸ��
SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE emp_no = 1000000003
;

--�񱳿�����
SELECT
    emp_no, emp_nm, birth_de, tel_no
FROM tb_emp
WHERE birth_de >='19900101'
    AND birth_de <='19991231'
;

--BETWEEN ������
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

--IN ������
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd IN('100004','100006')
;

--'100004','100006'���� ��ȸ
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd NOT IN('100004','100006')
;

--LIKE������
--�˻��� ���
--���ϵ�ī�� ���� 
-- % : 0 ���� �̻�
-- _ : �� 1 ����
SELECT
    emp_no, emp_nm   
FROM tb_emp
WHERE emp_nm LIKE '��%'
;

SELECT
    emp_no, emp_nm   
FROM tb_emp
WHERE emp_nm LIKE '%��'
;

SELECT
    emp_no, emp_nm, addr 
FROM tb_emp
WHERE addr LIKE '%����%'
;

SELECT
    emp_no, emp_nm   
FROM tb_emp
WHERE emp_nm LIKE '_��%'
;


SELECT
    emp_no,
    emp_nm, 
    birth_de, 
    dept_cd 
FROM tb_emp
WHERE emp_nm LIKE '��%'
    AND dept_cd IN ('100003','100004','100006')
    AND birth_de BETWEEN '19900101' AND '19991231'
;

--���� �񱳿�����
SELECT
    emp_no,
    emp_nm,
    sex_cd
FROM tb_emp
WHERE sex_cd <> 1
    AND emp_nm NOT LIKE '��%'
;

--NULL �� ��ȸ
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
    AND emp_nm LIKE '��%'
    AND(addr LIKE '%����%' OR addr LIKE '%�ϻ�%')
  --AND addr LIKE '%����%' OR addr LIKE '%�ϻ�%'
;
















