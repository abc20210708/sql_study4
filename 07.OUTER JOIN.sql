
-- OUTER JOIN �ǽ�ȯ�� ����
INSERT INTO tb_dept VALUES ('100014', '4�����������', '999999');
INSERT INTO tb_dept VALUES ('100015', '����Ʈ�ڷγ���', '999999');
COMMIT;

SELECT * FROM tb_dept;

ALTER TABLE tb_emp DROP CONSTRAINT fk_fb_emp01;

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000041', '�̼���', '19811201', '1', '��⵵ ���ν� ������ ����1�� 435', '010-5656-7878',
        NULL, '006', '003', '114-554-223433', '000000', 'N');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000042', '�����', '19820402', '1', '��⵵ ����� ���籸 ȭ���� 231', '010-4054-6547',
        NULL, '004', '001', '110-223-553453', '000000', 'Y');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000043', '������', '19850611', '1', '��⵵ ������ �ȴޱ� ��ź�� 553', '010-1254-1116',
        NULL, '004', '001', '100-233-664234', '000000', 'N');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000044', '�庸��', '19870102', '1', '��⵵ ������ �д籸 ���ڵ� 776', '010-1215-8784',
        NULL, '004', '002', '180-345-556634', '000000', 'Y');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000045', '������', '19880824', '1', '��⵵ ����� �ϻ꼭�� �鼮�� 474', '010-3687-1245',
        NULL, '004', '002', '325-344-45345', '000000', 'Y');
        
COMMIT;
    
 
SELECT * FROM tb_emp ORDER BY emp_no DESC;
SELECT emp_no, emp_nm, dept_cd FROM tb_emp ORDER BY emp_no DESC;

SELECT * FROM tb_dept;

-- # OUTER JOIN
-- 1. ���� ������ �������� �ʴ� ��鵵 ��ȸ�� �� ����ϴ� ���α���Դϴ�.
-- 2. OUTER���� ������ ��ȣ�� (+)��ȣ�Դϴ�.
-- 3. INNER������ ���� ������ �������� ������ �ش� ���� ��ȸ���� �ʽ��ϴ�
--   �׷��� OUTER JOIN�� ����(LEFT, RIGHT, FULL)�� �°� ���ǿ� ��Ī���� 
--   �ʴ� ��鵵 ��� NULL�� ó���ؼ� ��ȸ�մϴ�.

-- # LEFT OUTER JOIN
-- ���εǴ� ���� ���̺��� ��� ��ȸ�ϰ�, 
--������ ���̺��� �������ǿ� ��Ī�� �͸� ��ȸ�մϴ�.

-- ���� ��������� �ϴ� �� ���� ������ 
-- Ȥ�� �μ����̺����� �μ��ڵ尡 ��Ī�Ǹ�
-- ���ʽ��� �μ��̸��� ������

SELECT
 A.emp_no, A.emp_nm, A.dept_cd, B.dept_nm
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
;

--ANSI ǥ��
SELECT
 A.emp_no, A.emp_nm, A.dept_cd, B.dept_nm
FROM tb_emp A --ó���� �������̺� (�������)
LEFT OUTER JOIN tb_dept B --�ι�°�� ������ ���̺�
ON A.dept_cd = B.dept_cd
;

SELECT
 A.emp_no, A.emp_nm, A.dept_cd, B.dept_nm
FROM tb_emp A --ó���� �������̺� (�������)
LEFT JOIN tb_dept B --�ι�°�� ������ ���̺�
ON A.dept_cd = B.dept_cd
;

--Oracle
SELECT
 A.emp_no, A.emp_nm, A.dept_cd, B.dept_nm
FROM tb_emp A, tb_dept B 
WHERE A.dept_cd = B.dept_cd(+)
;

SELECT
 B.emp_no, B.emp_nm, B.dept_cd, A.dept_nm
FROM tb_dept A
RIGHT JOIN  tb_emp B
ON A.dept_cd = B.dept_cd
;

-- # RIGTH OUTER JOIN
-- ���εǴ� ������ ���̺��� ��� ��ȸ�ϰ�, 
-- ���� ���̺��� �������ǿ� ��Ī�� �͸� ��ȸ�մϴ�.

--ANSI ǥ��
SELECT
 A.emp_no, A.emp_nm, A.dept_cd, B.dept_nm
FROM tb_emp A --ó���� �������̺� (�������)
RIGHT OUTER JOIN tb_dept B --�ι�°�� ������ ���̺�
ON A.dept_cd = B.dept_cd
;

SELECT
 A.emp_no, A.emp_nm, A.dept_cd, B.dept_nm
FROM tb_emp A --ó���� �������̺� (�������)
RIGHT JOIN tb_dept B --�ι�°�� ������ ���̺�
ON A.dept_cd = B.dept_cd
;

--Oracle
SELECT
 A.emp_no, A.emp_nm, A.dept_cd, B.dept_nm
FROM tb_emp A, tb_dept B 
WHERE A.dept_cd(+) = B.dept_cd
;

--# FULL OUTER JOIN
SELECT
 A.emp_no, A.emp_nm, A.dept_cd, B.dept_nm
FROM tb_emp A --ó���� �������̺� (�������)
FULL OUTER JOIN tb_dept B --�ι�°�� ������ ���̺�
ON A.dept_cd = B.dept_cd
;

--#SELF JOIN
--1.�ڱ� �ڽ��� ���̺����� �����ϴ� ����Դϴ�.
--2.�ڱ� ���̺��� �÷����� ��Ī�Ͽ� ��ȸ�մϴ�.

SELECT
 A.emp_no, A.emp_nm, A.direct_manager_emp_no,B.emp_nm --����̸�
FROM tb_emp A 
LEFT JOIN tb_emp B
ON A.direct_manager_emp_no = B.emp_no
ORDER BY A.emp_no
;
















