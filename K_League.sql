-- 각 테이블 명을 삭제(DROP)하면서 동시에 해당 테이블을 참조하고 있는 제약사항들도 모두 삭제(CASCADE)
DROP TABLE PLAYER CASCADE CONSTRAINT;
DROP TABLE TEAM CASCADE CONSTRAINT; 
DROP TABLE STADIUM CASCADE CONSTRAINT;
DROP TABLE SCHEDULE CASCADE CONSTRAINT;

-- 테이블 초기화 -> 테이블 명(칼럼 명, 데이터 타입, NOT NULL 조건)
CREATE TABLE STADIUM (
STADIUM_ID    CHAR(3) NOT NULL,
STADIUM_NAME  VARCHAR2(40) NOT NULL,
HOMETEAM_ID   CHAR(3),
SEAT_COUNT    NUMBER,
ADDRESS       VARCHAR2(60),
DDD           VARCHAR2(3),
TEL           VARCHAR2(10),

-- 추가 제약 조건 -> 제약조건 이름, 제약조건 옵션, 적용할 대상 키
CONSTRAINT STADIUM_PK PRIMARY KEY (STADIUM_ID)
);


CREATE TABLE TEAM (
TEAM_ID     CHAR(3) NOT NULL,
REGION_NAME VARCHAR2(8) NOT NULL,
TEAM_NAME   VARCHAR2(40) NOT NULL,
E_TEAM_NAME VARCHAR2(50),
ORIG_YYYY   CHAR(4),
STADIUM_ID  CHAR(3) NOT NULL,
ZIP_CODE1   CHAR(3),
ZIP_CODE2   CHAR(3),
ADDRESS     VARCHAR2(80),
DDD         VARCHAR2(3),
TEL         VARCHAR2(10),
FAX         VARCHAR2(10),
HOMEPAGE    VARCHAR2(50),
OWNER       VARCHAR2(10),
CONSTRAINT TEAM_PK PRIMARY KEY (TEAM_ID),
-- 외래키 설정 -> (적용할 대상 컬럼) REFERENCES 참조할 테이블 이름(참조할 칼럼 이름)
CONSTRAINT TEAM_FK FOREIGN KEY (STADIUM_ID) REFERENCES STADIUM(STADIUM_ID)
);


CREATE TABLE   PLAYER (
PLAYER_ID      CHAR(7) NOT NULL,
PLAYER_NAME    VARCHAR2(20) NOT NULL,
TEAM_ID        CHAR(3) NOT NULL,
E_PLAYER_NAME  VARCHAR2(40),
NICKNAME       VARCHAR2(30),
JOIN_YYYY      CHAR(4),
POSITION       VARCHAR2(10),
BACK_NO        NUMBER(2),
NATION         VARCHAR2(20),
BIRTH_DATE     DATE,
SOLAR          CHAR(1),
HEIGHT         NUMBER(3),
WEIGHT         NUMBER(3),
CONSTRAINT PLAYER_PK PRIMARY KEY (PLAYER_ID),
CONSTRAINT PLAYER_FK FOREIGN KEY (TEAM_ID) REFERENCES TEAM(TEAM_ID) 
);


CREATE TABLE SCHEDULE (
STADIUM_ID   CHAR(3) NOT NULL,
SCHE_DATE    CHAR(8) NOT NULL,
GUBUN        CHAR(1) NOT NULL,
HOMETEAM_ID  CHAR(3) NOT NULL,
AWAYTEAM_ID  CHAR(3) NOT NULL,
HOME_SCORE   NUMBER(2),
AWAY_SCORE   NUMBER(2),
CONSTRAINT SCHEDULE_PK PRIMARY KEY (STADIUM_ID, SCHE_DATE),
CONSTRAINT SCHEDULE_FK FOREIGN KEY (STADIUM_ID) REFERENCES STADIUM(STADIUM_ID)
);


-- Insert STADIUM 20 Records and TEAM 15 Records 

INSERT ALL

INTO STADIUM VALUES ('D03','전주월드컵경기장','K05',28000,'전북 전주시 덕진구 반월동 763-1','063','273-1763')
INTO STADIUM VALUES ('B02','성남종합운동장','K08',27000,'경기도 성남시 분당구 야탑동 486','031','753-3956')
INTO STADIUM VALUES ('C06','포항스틸야드','K03',25000,'경북 포항시 남구 괴동 1','054','282-2002')
INTO STADIUM VALUES ('D01','광양전용경기장','K07',20009,'전남 광양시 금호동 700','061','792-5600')
INTO STADIUM VALUES ('B05','서울월드컵경기장','K09',66806,'서울특별시 마포구 난지도길 66','02','2128-2973')
INTO STADIUM VALUES ('B01','인천월드컵경기장','K04',35000,'인천광역시 남구 문학동 482','031','666-0496')
INTO STADIUM VALUES ('C05','창원종합운동장','K11','27085','경남 창원시 두대동 145','055','6644-8468')
INTO STADIUM VALUES ('C04','울산문수경기장','K01',46102,'울산광역시 남구 옥산 산5','052','220-2468')
INTO STADIUM VALUES ('D02','대전월드컵경기장','K10',41000,'대전광역시 유성구 노은동 270','042','252-2002')
INTO STADIUM VALUES ('B04','수원월드컵경기장','K02',50000,'수원시 팔달구 우만1동 228번지','031','259-2150')
INTO STADIUM VALUES ('A02','광주월드컵경기장','K12','40245','광주광역시 서구 풍암동 423-2','062','2468-8642')
INTO STADIUM VALUES ('C02','부산아시아드경기장','K06',30000,'부산광역시 서구 서대신동 3가 210번지','051','247-5771')
INTO STADIUM VALUES ('A03','강릉종합경기장','K13',33000,'강원 강릉시 교동 산58','033','459-3631')
INTO STADIUM VALUES ('A04','제주월드컵경기장','K14',42256,'제주 서귀포시 법환동','064','3631-2460')
INTO STADIUM VALUES ('A05','대구월드컵경기장','K15',66422,'대구광역시 수성구 대흥동 504','053','602-2011')
INTO STADIUM VALUES ('F01','대구시민경기장','',30000,'대구광역시','054','')
INTO STADIUM VALUES ('F02','부산시민경기장','',30000,'부산광역시','051','')
INTO STADIUM VALUES ('F03','일산경기장','',20000,'경기도 일산시','031','')
INTO STADIUM VALUES ('F04','마산경기장','',20000,'경남 마산시','055','')
INTO STADIUM VALUES ('F05','안양경기장','',20000,'경기도 안양시','031','')

INTO TEAM VALUES ('K05','전북','현대모터스','CHUNBUK HYUNDAI MOTORS FC','1995','D03','560','190','전북 전주시 덕진구 반월동 763-1 전주월드컵경기장 내','063','273-1763','273-1762','http://www.hyundai-motorsfc.com','')
INTO TEAM VALUES ('K08','성남','일화천마','SEONGNAM ILHWA CHUNMA FC','1988','B02','462','130','경기도 성남시 분당구 야탑동 486번지 성남 제2종합운동장 내','031','753-3956','753-4443','http://www.esifc.com','')
INTO TEAM VALUES ('K03','포항','스틸러스','FC POHANG STEELERS','1973','C06','790','050','경북 포항시 죽도동 614-8 동양빌딩 7층','054','282-2002','282-5955','http://www.steelers.co.kr','')
INTO TEAM VALUES ('K07','전남','드래곤즈','CHUNNAM DRAGONS FC','1994','D01','544','010','전남 광양시 중동 1318-5 신한은행빌딩 2층','061','792-5600','792-5605','http://www.dragons.co.kr','')
INTO TEAM VALUES ('K09','서울','FC서울','FOOTBALL CLUB SEOUL','1983','B05','138','221','서울 마포구 성산동 515 월드컵 경기장 내','02','2005-5746','2005-5802','http://www.fcseoul.com','')
INTO TEAM VALUES ('K04','인천','유나이티드','INCHEON UNITED FC','2004','B01','110','728','인천광역시 남구 문학동 482 인천월드컵경기장 내','032','2121-5271','2121-5276','http://www.incheonutd.com','')
INTO TEAM VALUES ('K11','경남','경남FC','GYEONGNAM FC','2006','C05','111','222','경남 창원시 두대동 145 창원종합운동장','055','6644-8468','6644-8488','http://www.gsndfc.co.kr','')
INTO TEAM VALUES ('K01','울산','울산현대','ULSAN HYUNDAI FC','1986','C04','682','060','울산광역시 동구 서부동 산137-1 현대스포츠클럽하우스','052','230-6141','230-6145','http://www.uhfc.tv','')
INTO TEAM VALUES ('K10','대전','시티즌','DAEJEON CITIZEN FC','1996','D02','301','030','대전광역시 유성구 노은동 270 대전월드컵경기장 서관 3층','042','252-2002','221-0669','http://www.dcfc.co.kr','')
INTO TEAM VALUES ('K02','수원','삼성블루윙즈','SUWON SAMSUNG BLUEWINGS FC','1995','B04','440','220','수원시 팔달구 우만1동 228 수원월드컵경기장 4층','031','247-2002','257-0766','http://www.bluewings.kr','')
INTO TEAM VALUES ('K12','광주','광주상무','GWANGJU SANGMU FC','1984','A02','450','419','광주광역시 서구 풍암동 423-2 광주월드컵경기장 내','062','777-5180','777-5181','http://www.gwangjusmfc.co.kr','')
INTO TEAM VALUES ('K06','부산','아이파크','BUSAN IPARK FC','1983','C02','570','050','부산광역시 강서구 대저1동 2155번지 강서체육공원 내','051','555-7101','555-7103','http://www.busanipark.co.kr','')
INTO TEAM VALUES ('K13','강원','강원FC','GANGWON FC','2008','A03','333','444','강원 춘천시 중앙로 7 강원도 개발공사 빌딩 내','033','459-3631','459-3630','http://www.gangwon-fc.com','')
INTO TEAM VALUES ('K14','제주','제주유나이티드FC','JEJU UNITED FC','1982','A04','555','666','제주 서귀포시 강정동 3355-5','064','3631-2460','3631-2468','http://www.jeju-utd.com','')
INTO TEAM VALUES ('K15','대구','대구FC','DAEGU FC','2002','A05','777','888','대구광역시 수성구 대흥동 504 대구스타디움 내','053','5566-3967','5566-3970','http://www.daegufc.co.kr','')

SELECT * FROM DUAL;


-- Insert PLAYER 100 Records  

INSERT ALL

INTO player VALUES ('2009175','우르모브','K06','','','2009','DF','4','유고',TO_DATE('30-AUG-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','70')
INTO player VALUES ('2007188','윤희준','K06','','','2005','DF','15','',TO_DATE('01-NOV-1982','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','74')
INTO player VALUES ('2012073','김규호','K06','','','2011','DF','23','',TO_DATE('13-JUL-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','72')
INTO player VALUES ('2007178','김민성','K06','','','','DF','20','',TO_DATE('23-JUN-1983','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','182','73')
INTO player VALUES ('2007191','김장관','K06','','배추도사,작은삼손','2007','DF','18','',TO_DATE('05-JUN-1984','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','170','61')
INTO player VALUES ('2008384','김정효','K06','','깜둥이,통키통','2008','DF','19','',TO_DATE('23-JUL-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','174','68')
INTO player VALUES ('2008395','장대일','K06','','달구','2010','DF','7','',TO_DATE('09-MAR-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','184','79')
INTO player VALUES ('2011050','박상수','K06','','꼬마홍길동','2011','DF','36','',TO_DATE('14-JUN-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','173','65')
INTO player VALUES ('2007189','정재영','K06','','제리','2006','MF','6','',TO_DATE('02-SEP-1983','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','187','75')
INTO player VALUES ('2011049','정태민','K06','','킹카','2011','MF','38','',TO_DATE('25-MAY-1992','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','71')
INTO player VALUES ('2010107','정현우','K06','','','2010','MF','37','',TO_DATE('04-JUN-1991','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','178','70')
INTO player VALUES ('2011043','송종국','K06','','썰렁왕자','2011','MF','24','',TO_DATE('20-FEB-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','73')
INTO player VALUES ('2011044','오정석','K06','','서경석','2011','MF','13','',TO_DATE('08-SEP-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','178','74')
INTO player VALUES ('2012137','이고르','K06','이골 실바 데 페리이따스','이골','2012','MF','21','브라질',TO_DATE('25-OCT-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','181','76')
INTO player VALUES ('2007200','김용하','K06','','용식이','2007','MF','26','',TO_DATE('15-DEC-1983','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','173','66')
INTO player VALUES ('2012072','전상배','K06','','','2012','MF','14','',TO_DATE('22-MAR-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','176','67')
INTO player VALUES ('2009038','전우근','K06','','에너자이져','2009','MF','11','',TO_DATE('25-FEB-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','175','68')
INTO player VALUES ('2008365','이태성','K06','','','2011','MF','30','',TO_DATE('16-JUN-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','64')
INTO player VALUES ('2011047','황철민','K06','','사다리맨','2011','MF','35','',TO_DATE('20-NOV-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','175','68')
INTO player VALUES ('2008235','정관규','K06','','','','FW','39','',TO_DATE('10-OCT-1986','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','178','71')
INTO player VALUES ('2011048','정기종','K06','','','2011','FW','25','',TO_DATE('22-MAY-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','182','78')
INTO player VALUES ('2012074','정창오','K06','','임땡','2012','FW','27','',TO_DATE('10-JAN-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','186','82')
INTO player VALUES ('2012127','디디','K06','Sebastiao Pereira do Nascimento','','2012','FW','8','브라질',TO_DATE('24-FEB-1986','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','179','78')
INTO player VALUES ('2007182','마니치','K06','','바람의 아들','2006','FW','9','',TO_DATE('16-JAN-1982','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','184','80')
INTO player VALUES ('2007195','우성용','K06','','따따','2006','FW','22','',TO_DATE('18-AUG-1983','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','191','76')
INTO player VALUES ('2010103','장기봉','K06','','짝팔','2010','FW','12','',TO_DATE('08-JUL-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','71')
INTO player VALUES ('2012075','이광수','K06','','','2012','FW','29','',TO_DATE('25-SEP-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','73')
INTO player VALUES ('2010087','하리','K06','','','2010','FW','10','콜롬비아',TO_DATE('14-MAY-1984','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','168','65')
INTO player VALUES ('2000017','박상남','K06','','','2008','FW','32','',TO_DATE('07-SEP-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','188','80')
INTO player VALUES ('2000018','빅토르','K06','','빅토르','2011','FW','28','나이지리아',TO_DATE('05-JAN-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','183','79')
INTO player VALUES ('2000021','이윤겸','K04','LEE, YOONGYUM','','2002','DF','','',TO_DATE('','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'','178','80')
INTO player VALUES ('2000022','하재훈','K04','HA, JAEHON','','2002','DF','','',TO_DATE('','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'','174','67')
INTO player VALUES ('2000023','김충호','K04','KIM, CHUNGHO','','2009','DF','','',TO_DATE('','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'','185','83')
INTO player VALUES ('2000024','임기한','K04','LIM, GIHAN','','2004','DF','','',TO_DATE('','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'','177','85')
INTO player VALUES ('2000025','김경태','K04','KIM, KYOUNGTAE','','','DF','','',TO_DATE('','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'','','')
INTO player VALUES ('2012054','남현우','K04','','','','','31','',TO_DATE('20-APR-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','180','72')
INTO player VALUES ('2008499','김충호','K04','','','','GK','60','',TO_DATE('04-JUL-1978','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','185','83')
INTO player VALUES ('2011021','이현','K04','','','','GK','1','',TO_DATE('07-NOV-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','192','85')
INTO player VALUES ('2012052','한동진','K04','','','','GK','21','',TO_DATE('25-AUG-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','183','78')
INTO player VALUES ('2012126','다오','K04','','','','DF','61','',TO_DATE('25-SEP-1992','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','190','80')
INTO player VALUES ('2008182','최철','K04','','','','DF','15','',TO_DATE('20-AUG-1983','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','176','77')
INTO player VALUES ('2010112','송창남','K04','','','','DF','23','',TO_DATE('31-DEC-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','175','67')
INTO player VALUES ('2008424','조승호','K04','','','','DF','2','',TO_DATE('13-MAY-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','179','70')
INTO player VALUES ('2008450','윤중희','K04','','','','DF','5','',TO_DATE('08-DEC-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','75')
INTO player VALUES ('2011022','김범직','K04','','','','DF','25','',TO_DATE('11-FEB-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','182','75')
INTO player VALUES ('2012053','김상홍','K04','','','','','30','',TO_DATE('04-FEB-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','178','68')
INTO player VALUES ('2000001','김태호','K10','','','','DF','','',TO_DATE('29-JAN-1971','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','','')
INTO player VALUES ('2000002','정상수','K10','JEONG, SAMSOO','','','DF','','',TO_DATE('08-FEB-1973','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','','')
INTO player VALUES ('2000003','유동우','K10','YOU, DONGWOO','','','DF','40','',TO_DATE('07-MAR-1978','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','70')
INTO player VALUES ('2000004','전기현','K10','JEON, GIHYUN','','','DF','','',TO_DATE('06-JUN-1975','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','','')
INTO player VALUES ('2012047','강성일','K10','KANG, SUNGIL','','2012','GK','30','',TO_DATE('04-JUN-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','182','80')
INTO player VALUES ('2010057','김승준','K10','KIM, SEUNGJUN','개구멍','2010','GK','1','',TO_DATE('01-SEP-1982','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','183','77')
INTO player VALUES ('2007298','이은성','K10','LEE, EUNSUNG','수호천황','2007','GK','21','',TO_DATE('05-APR-1981','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','184','82')
INTO player VALUES ('2007312','정대수','K10','JEONG, DAESOO','','2007','DF','15','',TO_DATE('20-MAR-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','184','74')
INTO player VALUES ('2012051','정민기','K10','','','','DF','3','',TO_DATE('25-APR-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','171','65')
INTO player VALUES ('2010110','정성근','K10','JEONG, SUNGKEUN','','2010','DF','33','',TO_DATE('20-JUN-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','73')
INTO player VALUES ('2011098','정영근','K10','JEONG, YOUNGKWEN','','2011','DF','5','',TO_DATE('12-OCT-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','70')
INTO player VALUES ('2007301','정정수','K10','JEONG, JUNGSOO','','2002','DF','36','',TO_DATE('17-JAN-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','180','74')
INTO player VALUES ('2007309','김창엽','K10','KIM, CHANGYUP','','2007','DF','6','',TO_DATE('19-NOV-1984','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','174','64')
INTO player VALUES ('2007299','장철우','K10','JANG, CHULWOO','폭주기관차','2010','DF','7','',TO_DATE('01-APR-1981','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','172','65')
INTO player VALUES ('2011116','콜리','K10','OMAR PAPA COLY','검은낙타(Black Camel)','2011','DF','29','세네갈',TO_DATE('20-MAY-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','182','75')
INTO player VALUES ('2007313','홍광철','K10','HONG, KWANGCHUL','','2007','DF','4','',TO_DATE('09-OCT-1984','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','172','65')
INTO player VALUES ('2008461','강정훈','K10','KANG, JUNGHOON','','2008','MF','38','',TO_DATE('20-FEB-1986','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','175','65')
INTO player VALUES ('2007306','공오균','K10','KONG, OHKYUN','CROW','2007','MF','22','',TO_DATE('10-AUG-1984','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','177','72')
INTO player VALUES ('2012049','정국진','K10','JEONG, KOOKJIN','','2012','MF','16','',TO_DATE('09-FEB-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','172','62')
INTO player VALUES ('2011099','정동선','K10','JEONG, DONGSUN','','2011','MF','9','',TO_DATE('15-MAR-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','170','65')
INTO player VALUES ('2010109','최경규','K10','CHOI, KUNGGUY','','2010','MF','10','',TO_DATE('10-MAR-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','72')
INTO player VALUES ('2010111','최내철','K10','CHOI, RAECHEOL','','2010','MF','24','',TO_DATE('20-AUG-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','71')
INTO player VALUES ('2012048','배성재','K10','BAE, SUNGJAE','','2012','MF','28','',TO_DATE('01-JUL-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','178','74')
INTO player VALUES ('2012121','샴','K10','','','','MF','25','',TO_DATE('30-APR-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','174','69')
INTO player VALUES ('2012136','오비나','K10','','','','MF','26','',TO_DATE('03-JUN-1990','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','169','70')
INTO player VALUES ('2010056','김관우','K10','KIM, KWANWOO','SIRIUS','2010','MF','8','',TO_DATE('25-FEB-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','175','69')
INTO player VALUES ('2012050','김광진','K10','KIM, KWANGJIN','','2012','MF','13','',TO_DATE('27-MAY-1982','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','175','75')
INTO player VALUES ('2010113','김상규','K10','KIM, SANGKYU','','2010','MF','27','',TO_DATE('05-SEP-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','175','65')
INTO player VALUES ('2009151','임영주','K10','LIM, YOUNGJOO','','2009','MF','23','',TO_DATE('08-MAR-1986','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','176','68')
INTO player VALUES ('2011101','박영훈','K10','PARK, YOUNGHOON','','2011','MF','12','',TO_DATE('01-MAY-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','174','73')
INTO player VALUES ('2008178','한정국','K10','HAN, JUNGKOOK','','2011','MF','19','',TO_DATE('19-JUL-1981','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','179','71')
INTO player VALUES ('2012046','정광선','K10','JEONG, KWANGSUN','','2012','FW','32','',TO_DATE('17-JUN-1993','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','175','68')
INTO player VALUES ('2007315','정은중','K10','JEONG, EUNJUNG','샤프(SHARP)','2007','FW','18','',TO_DATE('08-APR-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','184','72')
INTO player VALUES ('2009152','정찬중','K10','JEONG. CHANJOONG','','2009','FW','17','',TO_DATE('14-JUN-1986','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','182','72')
INTO player VALUES ('2011032','김석','K10','KIM, SEOK','','2012','FW','20','',TO_DATE('01-FEB-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','194','85')
INTO player VALUES ('2011100','탁준석','K10','TAK, JUNSUK','','2011','FW','11','',TO_DATE('24-MAR-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','178','69')
INTO player VALUES ('2000011','정호곤','K06','','','2010','DF','','',TO_DATE('26-MAR-1971','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','172','77')
INTO player VALUES ('2000012','최경훈','K06','','','','DF','','',TO_DATE('19-JAN-1971','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','','')
INTO player VALUES ('2000013','정동훈','K06','','','2010','DF','','',TO_DATE('11-JUN-1975','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','88')
INTO player VALUES ('2000014','정남표','K06','','','2005','DF','','',TO_DATE('27-JAN-1974','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','180','77')
INTO player VALUES ('2000015','정광재','K06','','','2005','DF','','',TO_DATE('30-MAY-1978','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','180','75')
INTO player VALUES ('2000016','권혁준','K06','','','2006','DF','','',TO_DATE('22-MAY-1980','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','173','82')
INTO player VALUES ('2011052','정경진','K06','','임꺽정','2011','GK','41','',TO_DATE('07-FEB-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','186','78')
INTO player VALUES ('2012076','정용대','K06','','','2012','GK','40','',TO_DATE('11-OCT-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','189','83')
INTO player VALUES ('2010108','정지혁','K06','','','2010','GK','31','',TO_DATE('22-NOV-1991','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','187','77')
INTO player VALUES ('2010059','박유석','K06','','터프가이','2010','GK','1','',TO_DATE('10-JUN-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','186','78')
INTO player VALUES ('2011053','정진우','K06','','터프가이','2011','DF','33','',TO_DATE('28-FEB-1993','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','76')
INTO player VALUES ('2007185','정학철','K06','','','2005','DF','3','',TO_DATE('07-NOV-1982','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','176','73')
INTO player VALUES ('2007193','류병훈','K06','','','2005','DF','17','',TO_DATE('03-JUL-1986','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','184','68')
INTO player VALUES ('2011055','최준홍','K06','','말머리','2011','DF','2','',TO_DATE('13-APR-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','178','70')
INTO player VALUES ('2011046','서용혁','K06','','터프가이','2011','DF','34','',TO_DATE('02-JUL-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','183','79')
INTO player VALUES ('2010058','심재원','K06','','도날드 덕','2010','DF','5','',TO_DATE('11-MAR-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','184','77')
INTO player VALUES ('2007123','김임생','K04','','','','DF','20','',TO_DATE('17-NOV-1981','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','183','80')
INTO player VALUES ('2007022','장형석','K04','','','','DF','36','',TO_DATE('07-JUL-1982','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','181','72')


SELECT * FROM DUAL;


-- Insert SCHEDULE 180 Records 

INSERT ALL

INTO schedule VALUES ('C02','20120501','Y','K06','K10','2','0')
INTO schedule VALUES ('B04','20120505','Y','K02','K01','1','2')
INTO schedule VALUES ('B05','20120505','Y','K09','K08','1','3')
INTO schedule VALUES ('B02','20120512','Y','K08','K01','1','1')
INTO schedule VALUES ('C02','20120707','Y','K06','K01','1','2')
INTO schedule VALUES ('B02','20120707','Y','K08','K03','3','2')
INTO schedule VALUES ('D03','20120707','Y','K05','K09','2','1')
INTO schedule VALUES ('D01','20120707','Y','K07','K10','1','0')
INTO schedule VALUES ('B04','20120710','Y','K02','K01','2','1')
INTO schedule VALUES ('D03','20120710','Y','K05','K03','1','1')
INTO schedule VALUES ('D02','20120710','Y','K10','K04','0','2')
INTO schedule VALUES ('C02','20120710','Y','K06','K08','3','1')
INTO schedule VALUES ('D01','20120710','Y','K07','K09','0','0')
INTO schedule VALUES ('C06','20120713','Y','K03','K06','2','1')
INTO schedule VALUES ('B05','20120714','Y','K09','K02','3','0')
INTO schedule VALUES ('B01','20120714','Y','K04','K07','1','0')
INTO schedule VALUES ('D02','20120714','Y','K10','K08','1','1')
INTO schedule VALUES ('D01','20120717','Y','K07','K01','0','0')
INTO schedule VALUES ('C06','20120717','Y','K03','K02','2','0')
INTO schedule VALUES ('B02','20120717','Y','K08','K04','2','1')
INTO schedule VALUES ('C02','20120717','Y','K06','K05','1','2')
INTO schedule VALUES ('B05','20120717','Y','K09','K10','1','1')
INTO schedule VALUES ('D01','20120720','Y','K07','K03','1','1')
INTO schedule VALUES ('B04','20120721','Y','K02','K06','2','2')
INTO schedule VALUES ('D03','20120721','Y','K05','K08','2','2')
INTO schedule VALUES ('B01','20120721','Y','K04','K09','1','3')
INTO schedule VALUES ('D03','20120724','Y','K05','K02','1','1')
INTO schedule VALUES ('D02','20120724','Y','K10','K03','1','1')
INTO schedule VALUES ('C02','20120724','Y','K06','K07','0','1')
INTO schedule VALUES ('B02','20120724','Y','K08','K09','1','1')
INTO schedule VALUES ('C06','20120727','Y','K03','K04','2','1')
INTO schedule VALUES ('D01','20120727','Y','K07','K05','2','1')
INTO schedule VALUES ('C02','20120727','Y','K06','K10','3','0')
INTO schedule VALUES ('B05','20120728','Y','K09','K01','1','1')
INTO schedule VALUES ('B04','20120728','Y','K02','K08','2','2')
INTO schedule VALUES ('B02','20120731','Y','K08','K01','2','0')
INTO schedule VALUES ('B05','20120731','Y','K09','K03','3','1')
INTO schedule VALUES ('D02','20120731','Y','K10','K05','1','0')
INTO schedule VALUES ('B01','20120731','Y','K04','K06','3','2')
INTO schedule VALUES ('B04','20120731','Y','K02','K07','1','2')
INTO schedule VALUES ('B02','20120803','Y','K08','K07','1','0')
INTO schedule VALUES ('C02','20120803','Y','K06','K09','2','1')
INTO schedule VALUES ('D02','20120804','Y','K10','K02','0','3')
INTO schedule VALUES ('D03','20120804','Y','K05','K04','2','1')
INTO schedule VALUES ('B01','20120811','Y','K04','K02','0','2')
INTO schedule VALUES ('B05','20120811','Y','K09','K05','0','1')
INTO schedule VALUES ('C06','20120811','Y','K03','K08','2','0')
INTO schedule VALUES ('D01','20120811','Y','K07','K10','1','1')
INTO schedule VALUES ('D03','20120818','Y','K05','K01','0','2')
INTO schedule VALUES ('C02','20120818','Y','K06','K03','3','1')
INTO schedule VALUES ('B01','20120818','Y','K04','K07','1','0')
INTO schedule VALUES ('B04','20120818','Y','K02','K09','1','2')
INTO schedule VALUES ('B02','20120818','Y','K08','K10','3','1')
INTO schedule VALUES ('B04','20120824','Y','K02','K01','1','1')
INTO schedule VALUES ('D03','20120824','Y','K05','K03','3','3')
INTO schedule VALUES ('B02','20120824','Y','K08','K06','4','3')
INTO schedule VALUES ('D02','20120825','Y','K10','K04','1','1')
INTO schedule VALUES ('B05','20120825','Y','K09','K07','1','1')
INTO schedule VALUES ('C06','20120828','Y','K03','K02','0','0')
INTO schedule VALUES ('C02','20120828','Y','K06','K05','1','1')
INTO schedule VALUES ('B01','20120828','Y','K04','K08','2','3')
INTO schedule VALUES ('B05','20120828','Y','K09','K10','2','0')
INTO schedule VALUES ('D02','20120901','Y','K10','K01','2','3')
INTO schedule VALUES ('D01','20120901','Y','K07','K03','0','1')
INTO schedule VALUES ('B04','20120901','Y','K02','K06','1','1')
INTO schedule VALUES ('D03','20120901','Y','K05','K08','3','3')
INTO schedule VALUES ('B01','20120901','Y','K04','K09','2','1')
INTO schedule VALUES ('D01','20120911','N','K07','K05','','')
INTO schedule VALUES ('B05','20120911','N','K09','K01','','')
INTO schedule VALUES ('B04','20120911','N','K02','K08','','')
INTO schedule VALUES ('B01','20120911','N','K04','K03','','')
INTO schedule VALUES ('D02','20120911','N','K10','K06','','')
INTO schedule VALUES ('C02','20120914','N','K06','K04','','')
INTO schedule VALUES ('C06','20120914','N','K03','K09','','')
INTO schedule VALUES ('B02','20120914','N','K08','K01','','')
INTO schedule VALUES ('D01','20120914','N','K07','K02','','')
INTO schedule VALUES ('D03','20120915','N','K05','K10','','')
INTO schedule VALUES ('D02','20120918','N','K10','K02','','')
INTO schedule VALUES ('B02','20120918','N','K08','K07','','')
INTO schedule VALUES ('B05','20120918','N','K09','K06','','')
INTO schedule VALUES ('D03','20120918','N','K05','K04','','')
INTO schedule VALUES ('B04','20120925','N','K02','K10','','')
INTO schedule VALUES ('C06','20120925','N','K03','K01','','')
INTO schedule VALUES ('B01','20120925','N','K04','K05','','')
INTO schedule VALUES ('D01','20120925','N','K07','K08','','')
INTO schedule VALUES ('B05','20120925','N','K09','K06','','')
INTO schedule VALUES ('D01','20121019','N','K07','K02','','')
INTO schedule VALUES ('C06','20121019','N','K03','K09','','')
INTO schedule VALUES ('D02','20121020','N','K10','K05','','')
INTO schedule VALUES ('C02','20121020','N','K06','K04','','')
INTO schedule VALUES ('C06','20121023','N','K03','K04','','')
INTO schedule VALUES ('D03','20121023','N','K05','K07','','')
INTO schedule VALUES ('C02','20121023','N','K06','K10','','')
INTO schedule VALUES ('B02','20121023','N','K08','K02','','')
INTO schedule VALUES ('D01','20121026','N','K07','K06','','')
INTO schedule VALUES ('D02','20121027','N','K10','K03','','')
INTO schedule VALUES ('B01','20121027','N','K04','K01','','')
INTO schedule VALUES ('B05','20121027','N','K09','K08','','')
INTO schedule VALUES ('B04','20121027','N','K02','K05','','')
INTO schedule VALUES ('B04','20121030','N','K02','K04','','')
INTO schedule VALUES ('D02','20121030','N','K10','K08','','')
INTO schedule VALUES ('C06','20121102','N','K03','K07','','')
INTO schedule VALUES ('B05','20121103','N','K09','K04','','')
INTO schedule VALUES ('C02','20121103','N','K06','K02','','')
INTO schedule VALUES ('B02','20121103','N','K08','K05','','')
INTO schedule VALUES ('D03','20121106','N','K05','K06','','')
INTO schedule VALUES ('D01','20121106','N','K07','K01','','')
INTO schedule VALUES ('D02','20121106','N','K10','K09','','')
INTO schedule VALUES ('B01','20121106','N','K04','K08','','')
INTO schedule VALUES ('B04','20121106','N','K02','K03','','')
INTO schedule VALUES ('C06','20121109','N','K03','K05','','')
INTO schedule VALUES ('B05','20121110','N','K09','K07','','')
INTO schedule VALUES ('B01','20121110','N','K04','K10','','')
INTO schedule VALUES ('B02','20121110','N','K08','K06','','')
INTO schedule VALUES ('D01','20121113','N','K07','K04','','')
INTO schedule VALUES ('C02','20121113','N','K06','K03','','')
INTO schedule VALUES ('B04','20121113','N','K02','K09','','')
INTO schedule VALUES ('D03','20121113','N','K05','K01','','')
INTO schedule VALUES ('B05','20121117','N','K09','K05','','')
INTO schedule VALUES ('D02','20121117','N','K10','K07','','')
INTO schedule VALUES ('C06','20121117','N','K03','K08','','')
INTO schedule VALUES ('B01','20121117','N','K04','K02','','')
INTO schedule VALUES ('C04','20120508','Y','K01','K08','1','3')
INTO schedule VALUES ('C04','20120713','Y','K01','K05','0','0')
INTO schedule VALUES ('C04','20120720','Y','K01','K10','0','0')
INTO schedule VALUES ('C04','20120724','Y','K01','K04','1','1')
INTO schedule VALUES ('C04','20120803','Y','K01','K03','3','0')
INTO schedule VALUES ('C04','20120811','Y','K01','K06','0','0')
INTO schedule VALUES ('C04','20120828','Y','K01','K07','0','1')
INTO schedule VALUES ('C04','20120918','N','K01','K03','','')
INTO schedule VALUES ('C04','20121019','N','K01','K08','','')
INTO schedule VALUES ('C04','20121023','N','K01','K09','','')
INTO schedule VALUES ('C04','20121102','N','K01','K10','','')
INTO schedule VALUES ('C04','20121110','N','K01','K02','','')
INTO schedule VALUES ('C04','20121117','N','K01','K06','','')
INTO schedule VALUES ('C04','20121124','N','K01','K08','','')
INTO schedule VALUES ('C06','20120317','Y','K03','K02','1','2')
INTO schedule VALUES ('B02','20120317','Y','K08','K04','6','0')
INTO schedule VALUES ('D02','20120317','Y','K10','K06','2','1')
INTO schedule VALUES ('C05','20120317','Y','K11','K09','2','2')
INTO schedule VALUES ('D01','20120320','Y','K07','K01','1','2')
INTO schedule VALUES ('D03','20120320','Y','K05','K03','1','0')
INTO schedule VALUES ('B04','20120320','Y','K02','K08','2','3')
INTO schedule VALUES ('B05','20120320','Y','K09','K10','2','0')
INTO schedule VALUES ('B04','20120323','Y','K02','K05','2','0')
INTO schedule VALUES ('C02','20120324','Y','K06','K01','1','2')
INTO schedule VALUES ('B01','20120324','Y','K04','K03','1','1')
INTO schedule VALUES ('B05','20120324','Y','K09','K07','1','0')
INTO schedule VALUES ('D01','20120327','Y','K07','K06','2','1')
INTO schedule VALUES ('C06','20120327','Y','K03','K08','1','0')
INTO schedule VALUES ('C05','20120327','Y','K11','K10','0','1')
INTO schedule VALUES ('D03','20120406','Y','K05','K04','3','2')
INTO schedule VALUES ('B01','20120410','Y','K04','K02','2','0')
INTO schedule VALUES ('B02','20120410','Y','K08','K05','2','1')
INTO schedule VALUES ('D02','20120410','Y','K10','K07','1','1')
INTO schedule VALUES ('C02','20120410','Y','K06','K09','1','4')
INTO schedule VALUES ('D02','20120414','Y','K10','K01','0','2')
INTO schedule VALUES ('B02','20120414','Y','K08','K03','1','1')
INTO schedule VALUES ('B01','20120414','Y','K04','K05','1','0')
INTO schedule VALUES ('C02','20120414','Y','K06','K07','2','0')
INTO schedule VALUES ('D03','20120420','Y','K05','K08','2','2')
INTO schedule VALUES ('D01','20120420','Y','K07','K10','0','1')
INTO schedule VALUES ('B04','20120421','Y','K02','K04','3','2')
INTO schedule VALUES ('B05','20120421','Y','K09','K06','1','0')
INTO schedule VALUES ('B02','20120424','Y','K08','K02','1','1')
INTO schedule VALUES ('C06','20120424','Y','K03','K05','1','2')
INTO schedule VALUES ('C05','20120424','Y','K11','K07','1','2')
INTO schedule VALUES ('D02','20120424','Y','K10','K09','1','3')
INTO schedule VALUES ('C06','20120427','Y','K03','K04','0','3')
INTO schedule VALUES ('C05','20120427','Y','K11','K06','5','2')
INTO schedule VALUES ('D01','20120427','Y','K07','K09','0','1')
INTO schedule VALUES ('D03','20120428','Y','K05','K02','1','2')
INTO schedule VALUES ('B05','20120501','Y','K09','K01','0','0')
INTO schedule VALUES ('B04','20120501','Y','K02','K03','1','2')
INTO schedule VALUES ('B01','20120501','Y','K04','K08','2','2')
INTO schedule VALUES ('D03','20120904','Y','K05','K02','1','2')
INTO schedule VALUES ('B02','20120904','Y','K08','K09','1','0')
INTO schedule VALUES ('C05','20120904','Y','K11','K04','2','2')
INTO schedule VALUES ('C06','20120904','Y','K03','K10','0','0')
INTO schedule VALUES ('C02','20120904','Y','K06','K07','2','2')

SELECT * FROM DUAL;