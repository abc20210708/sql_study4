

-- �ǽ����� (JOIN)
-- 1. �����ȣ�� 103���� ����� �̸�(employee_name)�� �Ŵ��� �̸�(manager_name)�� ����ϼ���.
SELECT
    A.first_name AS ����̸�, B.first_name AS �Ŵ����̸�
FROM employees A INNER JOIN employees B
ON A.manager_id = B.employee_id
AND a.employee_id = 103
;
-------------------------------------------
SELECT
    A.first_name||''||A.last_name AS employee_name
    , B.first_name||''||B.last_name AS manager_name
FROM employees A
JOIN employees B
ON  A.manager_id = B.employee_id
WHERE A.employee_id = 103
;




-- 2. ��� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� ��ȸ�ϼ���.
-- employees, departments, locations 3�� ����
SELECT
    A.first_name, B.department_name, 
    (C.street_address || ',' || C.city || ',' || C.state_province) AS address
FROM
employees A 
JOIN departments B
ON A.department_id = B.department_id
JOIN locations C
ON B.location_id = C.location_id
;--�� �� LEFT JOIN�ϸ� ��� ����
--Ǯ�� INNER JOIN ���� ��
------------------------------------------------
SELECT
    E.first_name, D.department_name,
    L.street_address || ',' || L.city || ',' || L.state_province AS address
FROM employees E
LEFT JOIN departments D
ON E.department_id = D.department_id
LEFT JOIN locations L
ON D.location_id = L.location_id
;


SELECT 
    first_name, department_id
FROM employees
WHERE department_id IS NULL
;

SELECT COUNT(*) FROM employees;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;
    
-- 3. 103�� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.

SELECT
    E.first_name, D.department_name,
    L.street_address || ',' || L.city || ',' || L.state_province AS address
FROM employees E
LEFT JOIN departments D
ON E.department_id = D.department_id
LEFT JOIN locations L
ON D.location_id = L.location_id
WHERE E.employee_id = 103
;


-- 4. �μ� �̸��� IT�� �����ϴ� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.
SELECT 
    E.first_name, D.department_name
    , L.street_address || ',' || L.city || ',' || L.state_province AS address
FROM employees E
LEFT JOIN departments D
ON E.department_id = D.department_id
LEFT JOIN locations L
ON D.location_id = L.location_id
WHERE D.department_name LIKE 'IT%'
;




-- 5. jobs���̺��� ��� ���� id(job_id)�� ������(job_title)�� ��ȸ�ϴµ� 
--    ���� �������� �̷��� �ִٸ� �ش� �̷� ���� 
-- (start_date, end_date, job_id, employee_id, first_name, department_id, department_name)
--    �� �Բ� ��ȸ�ϼ���.

SELECT
    job_id, job_title,
    start_date, end_date, employee_id,
    first_name, department_id, department_name
FROM 
;
SELECT * FROM employees;--name--job id--dept_id--emp_id
SELECT * FROM job_history;--emp_id --dept_id,job_id
SELECT * FROM jobs;--job_id,job_title,



----------------------------------------------------------------
--H.job_id �����̷��� ���� job id
SELECT 
        J.job_id, J.job_title
        , H.start_date, H.end_date, H.job_id, H.employee_id
        , E.first_name, E.department_id, D.department_name
FROM jobs J
LEFT JOIN job_history H
ON J.job_id = H.job_id
LEFT JOIN employees E
ON H.employee_id = E.employee_id
LEFT JOIN departments D 
ON E.department_id = D.department_id
;



























