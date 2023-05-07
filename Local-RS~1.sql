ALTER session set "_ORACLE_SCRIPT"=true;
DROP RM UNIV CASCADE; 
   -- CASCADE option 
CREATE USER RS IDENTIFIED BY 1234
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP;
GRANT connect, resource, dba TO RS; 

--
CREATE TABLE userinfo (
    userid  VARCHAR(15) PRIMARY KEY,
    userpw  VARCHAR(15),
    username CHAR(10),
    userphone CHAR(11)
);

CREATE TABLE restaurant (
    resname   VARCHAR(15) PRIMARY KEY,
    resfoodinfo   VARCHAR(15),
    resavgstars   NUMBER(3,2),
    resreviews   INT
);
alter table restaurant modify(resfoodinfo char(6));
CREATE TABLE food(
    foodname   NCHAR(15) PRIMARY KEY,
    maincatagory   VARCHAR(6),
    middleclass CHAR(10),
    resname   VARCHAR(15),
    FOREIGN KEY(resname) REFERENCES restaurant(resname)
);

CREATE TABLE review(
    viewnum   INT PRIMARY KEY,
    viewcontents   NCHAR(40),
    Stars      NUMBER(3,2),
    userid      VARCHAR(15),
    resname   VARCHAR(15),
    FOREIGN KEY(userid) REFERENCES userinfo(userid),
    FOREIGN KEY(resname) REFERENCES restaurant(resname)
);

CREATE TABLE favorite (
    favnum      INT PRIMARY KEY,
    userid      VARCHAR(15),
    resname   VARCHAR(15),
    FOREIGN KEY(userid) REFERENCES userinfo(userid),
    FOREIGN KEY(resname) REFERENCES restaurant(resname)
);

--userinfo
INSERT INTO userinfo VALUES('moon', '1234', '������', '010-9089');
INSERT INTO userinfo VALUES('yuha', '1212', '���Ͽ�', '010-1234');
INSERT INTO userinfo VALUES('gangu', '123123', '���ѱ�', '010-4241');
INSERT INTO userinfo VALUES('sangmi', '2323', '�̻��', '010-5383');
INSERT INTO userinfo VALUES('yujin', '0099', '������', '010-1542');
INSERT INTO userinfo VALUES('sujin', '1441', '�����', '010-1415');
INSERT INTO userinfo VALUES('minsuk', '12312', '���μ�', '010-1344');
INSERT INTO userinfo VALUES('sangmok', '9281', '�̻��', '010-4151');
INSERT INTO userinfo VALUES('gukin', '0081', '�ѱ���', '010-4151','');



--restaurant
INSERT INTO restaurant VALUES('���̳׽Ĵ�','���',0,0);
INSERT INTO restaurant VALUES('����Ľ�Ÿ','���',0,0);
INSERT INTO restaurant VALUES('�Ѹ��Ľ�Ÿ','���',0,0);
INSERT INTO restaurant VALUES('���ڽ�Ʈ��','���',0,0);
INSERT INTO restaurant VALUES('�������','�ѽ�',0,0);
INSERT INTO restaurant VALUES('��������','�ѽ�',0,0);
INSERT INTO restaurant VALUES('�λ�����','�ѽ�',0,0);
INSERT INTO restaurant VALUES('������','�߽�',0,0);
INSERT INTO restaurant VALUES('ȫ�����','�߽�',0,0);
INSERT INTO restaurant VALUES('¥�̷�','�߽�',0,0);
INSERT INTO restaurant VALUES('û����Ƚ��','�Ͻ�',0,0);
INSERT INTO restaurant VALUES('���̳�','�Ͻ�',0,0);
INSERT INTO restaurant VALUES('�ٴ�Ƚ��','�Ͻ�',0,0);
INSERT INTO restaurant VALUES('�ص��','�Ͻ�',0,0);

---food
--�ѽ�

INSERT INTO food VALUES('�����', '�ѽ�', '����','��������');
INSERT INTO food VALUES('���Ա�ġ�', '�ѽ�', '����','�λ�����');
INSERT INTO food VALUES('������ġ�', '�ѽ�', '����','��������');
INSERT INTO food VALUES('�δ��', '�ѽ�', '����','��������');
INSERT INTO food VALUES('û����','�ѽ�', '����','��������');
INSERT INTO food VALUES('���߱�', '�ѽ�', '����','�λ�����');
INSERT INTO food VALUES('�Ұ�⹫��', '�ѽ�', '����','��������');
INSERT INTO food VALUES('�����̿���', '�ѽ�', '����','�λ�����');
INSERT INTO food VALUES('��ū�ᳪ����', '�ѽ�', '����','�������');
INSERT INTO food VALUES('�ñ�ġ���屹', '�ѽ�', '����','��������');
INSERT INTO food VALUES('��������', '�ѽ�', '��','�λ�����');
INSERT INTO food VALUES('��ġġ�����', '�ѽ�', '��','�������');
INSERT INTO food VALUES('��ġ���䵤��', '�ѽ�', '��','�λ�����');
INSERT INTO food VALUES('���Ը��䵤��', '�ѽ�', '��','�������');
INSERT INTO food VALUES('����ġ���', '�ѽ�', '��','�λ�����');
INSERT INTO food VALUES('�������������', '�ѽ�', '��','�������');
INSERT INTO food VALUES('�ø�', '�ѽ�', '��','�λ�����');
INSERT INTO food VALUES('��ū���', '�ѽ�', '��','��������');
INSERT INTO food VALUES('ġ����', '�ѽ�', '��','�������');
INSERT INTO food VALUES('�ᱹ��', '�ѽ�', '��','��������');
INSERT INTO food VALUES('�и�', '�ѽ�', '��','�λ�����');
INSERT INTO food VALUES('������', '�ѽ�', '��','��������');
INSERT INTO food VALUES('������', '�ѽ�', '���','�������');
INSERT INTO food VALUES('�Ұ��', '�ѽ�', '���','�λ�����');
INSERT INTO food VALUES('�����', '�ѽ�', '���','��������');
INSERT INTO food VALUES('�Ķ��̵�ġŲ', '�ѽ�', '���','�������');
--���
INSERT INTO food VALUES('�˸����ø���', '���', '��','�Ѹ��Ľ�Ÿ');
INSERT INTO food VALUES('�������', '���', '��','����Ľ�Ÿ');
INSERT INTO food VALUES('�ع��Ľ�Ÿ', '���', '��','�Ѹ��Ľ�Ÿ');
INSERT INTO food VALUES('�Ի���̽����Ľ�Ÿ', '���', '��','�Ѹ��Ľ�Ÿ');
INSERT INTO food VALUES('����ũ���Ľ�Ÿ', '���', '��','���ڽ�Ʈ��');
INSERT INTO food VALUES('��������Ľ�Ÿ', '���', '��','���̳׽Ĵ�');
INSERT INTO food VALUES('�丶�佺�İ�Ƽ', '���', '��','����Ľ�Ÿ');
INSERT INTO food VALUES('ũ�����İ�Ƽ', '���', '��','���ڽ�Ʈ��');
INSERT INTO food VALUES('�丶���Ľ�Ÿ', '���', '��','�Ѹ��Ľ�Ÿ');
INSERT INTO food VALUES('�ع�������', '���', '��','���̳׽Ĵ�');
INSERT INTO food VALUES('�Ի���̽����Ľ�Ÿ', '���', '��','�Ѹ��Ľ�Ÿ');
INSERT INTO food VALUES('����ʶ���', '���', '��','�Ѹ��Ľ�Ÿ');
INSERT INTO food VALUES('����������', '���', '����','���̳׽Ĵ�');
INSERT INTO food VALUES('��ġ�ʶ���', '���', '��','����Ľ�Ÿ');
INSERT INTO food VALUES('�ع�������', '���', '��','�Ѹ��Ľ�Ÿ');
INSERT INTO food VALUES('��콺����ũ', '���', '���','����Ľ�Ÿ');
INSERT INTO food VALUES('�Ƚɽ�����ũ', '���', '���','���̳׽Ĵ�');
INSERT INTO food VALUES('����', '���', '���','�Ѹ��Ľ�Ÿ');
INSERT INTO food VALUES('Ƽ��������ũ', '���', '���','����Ľ�Ÿ');
INSERT INTO food VALUES('����������ũ', '���', '���','���̳׽Ĵ�');
INSERT INTO food VALUES('�丶ȣũ������ũ', '���', '���','�Ѹ��Ľ�Ÿ');
INSERT INTO food VALUES('�÷����̾�', '���', '���','���̳׽Ĵ�');
INSERT INTO food VALUES('������������', '���', '����','�Ѹ��Ľ�Ÿ');
INSERT INTO food VALUES('����δ�����', '���', '����','���ڽ�Ʈ��');
INSERT INTO food VALUES('��������', '���', '����','���ڽ�Ʈ��');
INSERT INTO food VALUES('������������', '���', '����','���̳׽Ĵ�');
INSERT INTO food VALUES('�ع�����', '���', '����','���ڽ�Ʈ��');


--�Ͻ�
INSERT INTO food VALUES('����', '�Ͻ�', '��','û����Ƚ��');
INSERT INTO food VALUES('�Ե�', '�Ͻ�', '��','���̳�');
INSERT INTO food VALUES('������', '�Ͻ�', '��','û����Ƚ��');
INSERT INTO food VALUES('���ϱ⸮', '�Ͻ�', '��','���̳�');
INSERT INTO food VALUES('��Ǫ��', '�Ͻ�', 'Ƣ��','�ٴ�Ƚ��');
INSERT INTO food VALUES('ġ�����', '�Ͻ�', 'Ƣ��','û����Ƚ��');
INSERT INTO food VALUES('�Ƚɵ�����', '�Ͻ�', 'Ƣ��','�ٴ�Ƚ��');
INSERT INTO food VALUES('�ص������', '�Ͻ�', 'Ƣ��','���̳�');
INSERT INTO food VALUES('����������', '�Ͻ�', 'Ƣ��','û����Ƚ��');
INSERT INTO food VALUES('�ſ����', '�Ͻ�', 'Ƣ��','���̳�');
INSERT INTO food VALUES('����ư�', '�Ͻ�', 'Ƣ��','û����Ƚ��');
INSERT INTO food VALUES('���þ߸�', '�Ͻ�', '����','���̳�');
INSERT INTO food VALUES('���', '�Ͻ�', '����','�ٴ�Ƚ��');
INSERT INTO food VALUES('Ƣ��쵿', '�Ͻ�', '����','û����Ƚ��');
INSERT INTO food VALUES('ī�ɿ쵿', '�Ͻ�', '����','�ٴ�Ƚ��');
INSERT INTO food VALUES('������', '�Ͻ�', '����','���̳�');
INSERT INTO food VALUES('��ī�ɿ쵿', '�Ͻ�', '��','�ص��');
INSERT INTO food VALUES('�ÿ����', '�Ͻ�', '��','û����Ƚ��');
INSERT INTO food VALUES('���ɸ�', '�Ͻ�', '��','�ص��');
INSERT INTO food VALUES('�ҹ�', '�Ͻ�', '��','û����Ƚ��');
INSERT INTO food VALUES('��Ǫ��ҹ�', '�Ͻ�', '��','���̳�');
INSERT INTO food VALUES('�������', '�Ͻ�', '����','�ص��');
INSERT INTO food VALUES('��Ű�丮', '�Ͻ�', '���','û����Ƚ��');
INSERT INTO food VALUES('��Ű����', '�Ͻ�', '���','�ص��');

--�߽�
INSERT INTO food VALUES('¥���', '�߽�','��','������');
INSERT INTO food VALUES('«��', '�߽�', '��','ȫ�����');
INSERT INTO food VALUES('����«��', '�߽�', '��','������');
INSERT INTO food VALUES('�߽Ŀ쵿', '�߽�', '��','¥�̷�');
INSERT INTO food VALUES('�⽺��', '�߽�', '��','ȫ�����');
INSERT INTO food VALUES('�Ｑ¥���', '�߽�', '��','¥�̷�');
INSERT INTO food VALUES('����������','�߽�', '�丮','������');
INSERT INTO food VALUES('�Ϲ�������','�߽�', '�丮','ȫ�����');
INSERT INTO food VALUES('���ĵκ�', '�߽�', '�丮','¥�̷�');
INSERT INTO food VALUES('���꽽', '�߽�', '�丮','������');
INSERT INTO food VALUES('��ǳ��', '�߽�', '�丮','¥�̷�');
INSERT INTO food VALUES('�Ⱥ�ä', '�߽�', '�丮','������');
INSERT INTO food VALUES('��ä������', '�߽�', '��','¥�̷�');
INSERT INTO food VALUES('�Ｑ������', '�߽�', '��','������');
INSERT INTO food VALUES('���캺����', '�߽�', '��','¥�̷�');
INSERT INTO food VALUES('������������', '�߽�', '��','������');
INSERT INTO food VALUES('«�͹�', '�߽�', '��','������');
INSERT INTO food VALUES('������ä��', '�߽�', '��','ȫ�����');
INSERT INTO food VALUES('������', '�߽�', '����','������');
INSERT INTO food VALUES('�𸸵�', '�߽�', '����','ȫ�����');
INSERT INTO food VALUES('������', '�߽�', '����','¥�̷�');
INSERT INTO food VALUES('�ɻ�', '�߽�', '����','������');

--favorite
CREATE SEQUENCE favnumSEQ --�������� ���ã���ȣ�ޱ��
   START WITH 1
   INCREMENT BY 1;

INSERT INTO favorite VALUES(favnumSEQ.NEXTVAL, 'moon', '���̳׽Ĵ�');
INSERT INTO favorite VALUES(favnumSEQ.NEXTVAL, 'yuha', '�Ѹ��Ľ�Ÿ');
INSERT INTO favorite VALUES(favnumSEQ.NEXTVAL, 'sangmi', '�λ�Ĵ�');
INSERT INTO favorite VALUES(favnumSEQ.NEXTVAL, 'gangu', '��������');

--review
CREATE SEQUENCE viewnumSEQ --�������� �����ȣ�ޱ��
   START WITH 1
   INCREMENT BY 1;

--review
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '���־���.',5, 'moon','���̳׽Ĵ�' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL,  '�ָ��Ѹ�.',3, 'yuha','���̳׽Ĵ�' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL,  '�ʹ�¥�� ���� ������ �ߴ�.',3, 'yujin','���̳׽Ĵ�' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL,  'ȯ���Ǹ�', 5 , 'sujin','������' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '���� ���־���. �� ���Ѹ��� ���� ����',5, 'sangmi','������' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '�� ������ ����.',4, 'yujin','����Ľ�Ÿ' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '��ģ���� �� ���� ���������� ',2, 'sujin','�������' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '����� �Ͻ���',3, 'yuha','�ص��' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '������ ȸ ���� �̽��ϰ� ������.',5, 'yujin','û����Ƚ��' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '���� ����',1, 'moon','¥�̷�' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '���� ���־���. ���� ����Ե� ģ��.',5, 'sujin','¥�̷�' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '«���� ���� �� ��Ÿ��',4, 'yujin','ȫ�����' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '������ �߱��� ',3, 'sangmi','ȫ�����' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '���� ���־���. �� ���� ���� ��',5, 'yuha','�������' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '�Ϲ����� �ѽ��� ',3, 'sujin','�������' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '¥����� ����Ÿ�� ���־���.',4, 'gangu','������' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '������ ���� �� ',3, 'minsuk','������' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '�񸰸��� �ʹ� ���ϰ� ��û��',1, 'minsuk','�ٴ�Ƚ��' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '�絵 �ʹ� ���� ��ģ��.',1, 'sangmok','�ٴ�Ƚ��' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '������ ���� �� �����Ҵ�. ',3, 'moon','�ٴ�Ƚ��' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '�絵 �ʹ� ���� ��ģ��.',1, 'sangmok','���ڽ�Ʈ��' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '������ ���� �� �����Ҵ�. ',3, 'moon','���ڽ�Ʈ��' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '������ ���� ���� ���־���. ',4, 'yuha','��������' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '���� ���־��� �λ����� ',5, 'yuha','�λ�����' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '�� ������ ����.',4, 'yujin','�Ѹ��Ľ�Ÿ' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '���� ���־���. �ѹ��� �� �ø��� ��',4, 'sangmok','�Ѹ��Ľ�Ÿ' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '���� ����',1, 'minsuk','¥�̷�' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '���� ���־��� ��� ���� ��',4, 'sangmi','¥�̷�' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '������ ���� ��',3, 'yujin','¥�̷�' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, 'Ȯ���� ���ִ� ��',5, 'gangu','�ص��' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '���־��� �� ��Ÿ��',4, 'sangmok','�ص��' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '������ ȸ ���� �̽��ϰ� ������.',5, 'sangmi','û����Ƚ��' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '����.',5, 'moon','û����Ƚ��' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '����3',4, 'moon','���̳׽Ĵ�' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '����1',3, 'moon','���̳׽Ĵ�' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, '����2',5, 'moon','���̳׽Ĵ�' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, 'NOPE',5, 'gukin','û����Ƚ��' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, 'GOOD',4, 'gukin','¥�̷�' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, 'GOOD',3, 'gukin','�Ѹ��Ľ�Ÿ' );
INSERT INTO review VALUES(viewnumSEQ.NEXTVAL, 'EXECllent',5, 'gukin','�λ�����' );

-- ������  Ʈ���� ---
CREATE or REPLACE TRIGGER TRIGGER_Star
 BEFORE INSERT OR DELETE
 ON review
 FOR EACH ROW
BEGIN
    IF INSERTING THEN        
        UPDATE restaurant SET resreviews = resreviews + 1 WHERE :NEW.resname = restaurant.resname;
    ELSIF DELETING  THEN   
        UPDATE restaurant SET resreviews = resreviews - 1 WHERE :NEW.resname = restaurant.resname;
    END IF;
END;

--���Ը� ���� Ʈ����- 
CREATE or REPLACE TRIGGER TRIGGER_resName
 AFTER UPDATE
 ON restaurant
 FOR EACH ROW
BEGIN
    IF UPDATING THEN        
        UPDATE review SET resname = :NEW.resname where :OLD.resname = review.resname;
        UPDATE food SET resname = :NEW.resname where :OLD.resname = food.resname;
        UPDATE favorite SET resname = :NEW.resname where :OLD.resname = favorite.resname;
    END IF;
END;

--��պ���Ʈ����--
CREATE or REPLACE TRIGGER avgStar 
BEFORE INSERT OR DELETE 
ON review 
FOR EACH ROW
DECLARE
    tot int := 0;
    totres  int := 0;
    avgs int := 0;
BEGIN
    IF INSERTING THEN
        BEGIN
            select sum(stars) INTO tot from review where resname = :NEW.resname;
            select count(resname) INTO totres from review where resname = :NEW.resname;
            avgs := (tot/totres);
            UPDATE restaurant SET resavgstars = avgs where restaurant.resname = :NEW.resname;
        END;
    ELSIF DELETING THEN
        BEGIN
            select sum(stars) INTO tot from review where resname=:OLD.resname;
            select count(resname) INTO totres from review where resname = :OLD.resname;
            avgs := (tot/totres);
            UPDATE restaurant SET resavgstars = avgs where restaurant.resname = :OLD.resname;
        END;
    END IF;
END;

DROP PRO

--���ν���--
CREATE OR REPLACE PROCEDURE review_number as

V_ID varchar(10); --ȸ�� ���̵� 
V_count NUMBER (10) := 0; --�����ۼ��� ����
V_grade VARCHAR2 (20); -- ȸ����� 

CURSOR C IS
    SELECT REVIEW.USERID, COUNT(*)
    FROM  REVIEW, USERINFO
    WHERE USERINFO.USERID = REVIEW.USERID
    GROUP BY REVIEW.USERID;
BEGIN
    OPEN C;
    LOOP
        FETCH C INTO V_ID, V_count;
        EXIT WHEN C%NOTFOUND;
        CASE 
            WHEN (V_count >=5) THEN V_grade := '�����';
            WHEN (V_count >=3) THEN V_grade := '�Ϲݰ�';
            ELSE  V_grade := '���ɰ�';
        END CASE;
        UPDATE USERINFO SET USERGRADE = V_grade WHERE USERINFO.USERID = V_ID;
    END LOOP;
    CLOSE C;
END;
EXEC review_number;   
ALTER TABLE USERINFO ADD USERGRADE VARCHAR2(20);

SELECT USERID, USERNAME, USERGRADE
FROM userinfo;

SELECT USERID, USERNAME, USERGRADE
FROM userinfo;
commit;