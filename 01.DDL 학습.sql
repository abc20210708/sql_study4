

--SQL�� ��/�ҹ��ڸ� �������� ����

select sysdate from dual;
SELECT SYSDATE FROM DUAL;

--DDL : ������ ���Ǿ�
--CREATE TABLE
--������ ctrl + enter
--���� ���� 2����Ʈ 
--������ �ʼ���� NOT NULL
--NOT NULL ���ϸ� �⺻�� NULL
--������ �� ����
CREATE TABLE BOARD (
    BNO NUMBER(10),
    TITLE VARCHAR2(200) NOT NULL,
    CONTENT VARCHAR2(2000),
    WRITER VARCHAR2(50) NOT NULL,
    REG_DATE DATE
);
--NOT NULL �̸鼭 UNIQUE=PRIMARY KEY
--ALTER:�����ͺ��̽��� ������ ����
ALTER TABLE BOARD 
ADD CONSTRAINT pk_board_bno
PRIMARY KEY(BNO);

--������ �߰�
--SYSDATE ����ð�
INSERT INTO BOARD
 (bno, title, content, writer, reg_date)
 VALUES
 (2, '�ȳ�ȳ�', '���볻��', '��ö��', SYSDATE);

SELECT * FROM board;

--��� ���̺� ����
CREATE TABLE REPLY (
    RNO NUMBER(10),
    R_CONTENT VARCHAR2(500),
    R_WRITER VARCHAR2(50),
    BNO NUMBER(10)
);

--�������� ����: BOARD���̺�� REPLY���̺� ���� ���� ����
ALTER TABLE REPLY
ADD CONSTRAINT fk_reply_bno
FOREIGN KEY(BNO)
REFERENCES BOARD (BNO);




