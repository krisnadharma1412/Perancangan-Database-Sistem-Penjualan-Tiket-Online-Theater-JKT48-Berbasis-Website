CREATE DATABASE FinalProject;

USE FinalProject;

CREATE TABLE tb_team
(
	TeamId CHAR (5) NOT NULL PRIMARY KEY,
	TeamName VARCHAR (10) NOT NULL,
	CONSTRAINT Check_TeamId CHECK (TeamId LIKE ('TM[0-9][0-9][0-9]'))
);

CREATE TABLE tb_member
(
	MemberId CHAR (5) NOT NULL PRIMARY KEY,
	MemberName VARCHAR (50) NOT NULL,
	MemberBirthday DATE DEFAULT GETDATE(),
	MemberCreated DATE DEFAULT GETDATE(),
	MemberPopularity NUMERIC (11,2) NOT NULL,
	TeamId CHAR (5) NOT NULL FOREIGN KEY REFERENCES tb_team (TeamId) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT Check_MemberId CHECK (MemberId LIKE ('MJ[0-9][0-9][0-9]'))
);

CREATE TABLE tb_setlist
(
	SetlistId CHAR (5) NOT NULL PRIMARY KEY,
	SetlistName VARCHAR (20) NOT NULL,
	TeamId CHAR (5) NOT NULL FOREIGN KEY REFERENCES tb_team (TeamId) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT Check_SetlistId CHECK (SetlistId LIKE ('SL[0-9][0-9][0-9]'))
);

CREATE TABLE tb_fans
(
	FansId CHAR (5) NOT NULL PRIMARY KEY,
	FansName VARCHAR (50) NOT NULL,
	FansGender VARCHAR (10) NOT NULL,
	FansBirthday DATE DEFAULT GETDATE(),
	FansAttand NUMERIC (11,2) NOT NULL,
	FansEmail VARCHAR (50) NOT NULL,
	FansPassword VARCHAR (50) NOT NULL,
	MemberId CHAR (5) NOT NULL FOREIGN KEY REFERENCES tb_member (MemberId) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT Check_FansId CHECK (FansId LIKE ('FJ[0-9][0-9][0-9]')),
	CONSTRAINT Check_FansGen CHECK (FansGender IN ('Male', 'Female'))
);

CREATE TABLE tb_staff(
	StaffId CHAR(5) NOT NULL,
	StaffName VARCHAR(50),
	StaffSalary INT,
	StaffPosition VARCHAR(20),
	PRIMARY KEY (StaffId),
	CONSTRAINT Check_StaffId CHECK(StaffId LIKE 'SJ[0-9][0-9][0-9]')
);

CREATE TABLE tb_schedule(
	ScheduleId CHAR(5) NOT NULL,
	DateHeld DATE,
	TimeHeld CHAR(15),
	ScheduleShow CHAR(1),
	ScheduleLimit INT,
	SetlistId CHAR(5) NOT NULL,
	PRIMARY KEY (ScheduleId),
	FOREIGN KEY (SetlistId) REFERENCES tb_setlist (SetlistId) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT Check_ScheduleId CHECK(ScheduleId LIKE 'SD[0-9][0-9][0-9]')
);

CREATE TABLE tb_header_transaction(
	TransId CHAR(5) NOT NULL,
	FansId CHAR(5) NOT NULL,
	TransDate DATE,
	TransType CHAR(10),
	PRIMARY KEY (TransId),
	CONSTRAINT Check_HeaderId CHECK(TransId LIKE 'HT[0-9][0-9][0-9]' AND (TransType LIKE 'Dewasa' OR TransType LIKE 'Pelajar'))
);

CREATE TABLE tb_detail_transaction(
	TransId CHAR(5) NOT NULL,
	ScheduleId CHAR(5) NOT NULL,
	FOREIGN KEY (TransId) REFERENCES tb_header_transaction (TransId) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (ScheduleId) REFERENCES tb_schedule (ScheduleId) ON UPDATE CASCADE ON DELETE CASCADE,	
);

CREATE TABLE tb_ticket(
	TicketId CHAR(5) NOT NULL,
	TicketType CHAR(10),
	TicketNo INT,
	TransId CHAR(5) NOT NULL,
	FOREIGN KEY (TransId) REFERENCES tb_header_transaction (TransId) ON UPDATE CASCADE ON DELETE CASCADE,
);

INSERT INTO tb_team (TeamId, TeamName)
VALUES
		('TM001', 'Team J'),
		('TM002', 'Team K3'),
		('TM003', 'Team T'),
		('TM004', 'Academy A');

INSERT INTO tb_member (MemberId, MemberName, MemberBirthday, MemberCreated, MemberPopularity, TeamId)
VALUES
		('MJ001', 'Viona Fadrin', '2000/11/08', '2019/12/09', '0', 'TM001'),
		('MJ002', 'Zhara Nur Khaulah', '2003/8/8', '2019/09/12', '0', 'TM001'),
		('MJ003', 'Nabila Yussi Fitriana', '2000/12/23', '2018/10/10', '0', 'TM001'),
		('MJ004', 'Riska Amelia Putri', '2000/03/18', '2019/05/10', '0', 'TM002'),
		('MJ005', 'Helisma Mauludzinia Putri Kurnia', '2000/06/12', '2018/03/10', '0', 'TM002'),
		('MJ006', 'Rinanda Syahputri', '2003/09/13', '2019/8/8', '0', 'TM002'),
		('MJ007', 'Anglina Christy', '2005/12/5' , '2019/5/5', '0', 'TM003'), 
		('MJ008', 'Anastasya Narwastu Tety Handuran', '2001/06/16', '2019/07/12', '0', 'TM003'),
		('MJ009', 'Sania Julia Montolalu', '2001/07/18', '2019/04/23', '0', 'TM004'),
		('MJ010', 'Fransisca Saraswati Puspa Dewi', '2000/02/24', '2019/08/19', '0', 'TM004');

INSERT INTO tb_setlist (SetlistId, SetlistName, TeamId)
VALUES 
		('SL001', 'High Tension', 'TM004'),
		('SL002', 'Saka Agari', 'TM001'),
		('SL003', 'Rapsodi', 'TM002'),
		('SL004', 'Idol no Yoake', 'TM003');

INSERT INTO tb_fans (FansId, FansName, FansGender, FansBirthday, FansAttand, FansEmail, FansPassword, MemberId)
VALUES
		('FJ001', 'Faiz Azmy', 'Male', '2001/05/02', '0', 'Faizgam1ng@gmail.com', 'iloveuveva', 'MJ001'),
		('FJ002', 'Veva Tudung', 'Female', '2001/03/10', '0', 'Vevatudung06@gmail.com', 'loveutoopais', 'MJ001'),
		('FJ003', 'Ucok Baba', 'Male', '2003/06/03', '0', 'Ucokzz200@gmail.com', 'babazucok16', 'MJ002'),
		('FJ004', 'Bambang Sugandi', 'Male', '1998/12/12', '0', 'Bambangtamvan98@gmail.com', 'tamvanbingit', 'MJ003'),
		('FJ005', 'Emalia Dewi', 'Female', '2000/01/21', '0', 'Dewiliaaa3@gmail.com', 'liapakek3a', 'MJ004'),
 		('FJ006', 'Ryan Nixon Salim', 'Male', '2001/08/24', '0', 'Salimibu@gmail.com', 'salimbapa', 'MJ005'),
		('FJ007', 'Rido Wikana', 'Male', '2002/02/14', '0', 'Wii11kan@gmail.com', 'ikankubanyak', 'MJ007'),
		('FJ008', 'Lemonia Saputri', 'Female', '2004/05/18', '0', 'lemonku10@gmail.com', 'maulemonbro', 'MJ008'),
		('FJ009', 'Putri Nungsep', 'Female', '2001/01/01', '0', 'putri010@gmail.com', 'parahnungsep', 'MJ010'), 
		('FJ010', 'Hapis Nopal', 'Male', '1999/06/06', '0', 'empisnopel@gmail.com', 'imapucekboy', 'MJ009');

INSERT INTO tb_staff (StaffId, StaffName, StaffSalary, StaffPosition)
VALUES
		('SJ001', 'Hafiz Naufal', 15000000, 'sibos'),
		('SJ002', 'Putu Krisna', 12000000, 'cobos'),
		('SJ003', 'Bagus Rama', 5000000, 'krocos');

INSERT INTO tb_schedule (ScheduleId, DateHeld, TimeHeld, ScheduleShow, ScheduleLimit, SetlistId)
VALUES
		('SD001', '2021/02/15', '19:00:00 PM', '1', '50', 'SL001'),
		('SD002', '2021/02/16', '21:00:00 PM', '2', '50', 'SL002'),
		('SD003', '2021/02/19', '13:00:00 AM', '1', '50', 'SL003'),
		('SD004', '2021/02/19', '20:30:00 PM', '2', '50', 'SL004');

INSERT INTO tb_header_transaction (TransId, FansId, TransDate, TransType)
VALUES
		('HT001', 'FJ001', '2020/12/20', 'Pelajar'),
		('HT002', 'FJ002', '2020/12/20', 'Pelajar'),
		('HT003', 'FJ003', '2020/12/20', 'Pelajar'),
		('HT004', 'FJ004', '2020/12/6', 'Dewasa'),
		('HT005', 'FJ005', '2020/12/7', 'Dewasa'),
		('HT006', 'FJ006', '2020/12/20', 'Pelajar'),
		('HT007', 'FJ007', '2020/12/19', 'Pelajar'),
		('HT008', 'FJ008', '2020/12/19', 'Pelajar'),
		('HT009', 'FJ009', '2020/12/19', 'Pelajar'),
		('HT010', 'FJ010', '2020/12/4', 'Dewasa');

INSERT INTO tb_detail_transaction(TransId, ScheduleId)
VALUES
		('HT001', 'SD001'),
		('HT002', 'SD001'),
		('HT003', 'SD001'),
		('HT004', 'SD003'),
		('HT005', 'SD004'),
		('HT006', 'SD003'),
		('HT007', 'SD002'),
		('HT008', 'SD002'),
		('HT009', 'SD002'),
		('HT010', 'SD004');

INSERT INTO tb_ticket (TicketId, TicketType, TicketNo, TransId)
VALUES		
		('TJ001', 'Ijo', '1', 'HT001'),
		('TJ002', 'Ijo', '2', 'HT002'),
		('TJ003', 'Ijo', '3', 'HT003'),
		('TJ004', 'Biru', '4', 'HT004'),
		('TJ005', 'Biru', '5', 'HT005'),
		('TJ006', 'Ijo', '6', 'HT006'),
		('TJ007', 'Ijo', '7','HT007'),
		('TJ008', 'Ijo', '8', 'HT008'),
		('TJ009', 'Ijo', '9', 'HT009'),
		('TJ010', 'Biru', '10', 'HT010');


CREATE VIEW ticket_sales AS
SELECT *
FROM (SELECT YEAR(TransDate) [Year],
	   tb_detail_transaction.ScheduleId,
       DATENAME(MONTH, TransDate) [Month], 
       COUNT(1) [Sales Count]
      FROM tb_header_transaction
	  INNER JOIN tb_detail_transaction ON tb_detail_transaction.TransId = tb_header_transaction.TransId
      GROUP BY tb_detail_transaction.ScheduleId,
	  YEAR(TransDate),
      DATENAME(MONTH, TransDate)) AS MontlySalesData
PIVOT( SUM([Sales Count])   
    FOR Month IN ([January],[February],[March],[April],[May],
    [June],[July],[August],[September],[October],[November],
    [December])) AS MNamePivot

CREATE VIEW view_member_name AS
SELECT * FROM tb_member ORDER BY MemberName ASC

CREATE VIEW view_member_birthday AS
SELECT * FROM tb_member ORDER BY MemberBirthday ASC

CREATE VIEW view_member_created_dated AS
SELECT * FROM tb_member ORDER BY MemberCreated ASC

CREATE VIEW fans_type_validation AS
SELECT FansName [Name], FansGender [Gender], DATEDIFF(hour,FansBirthday,GETDATE())/8766 [Age],
CASE
	WHEN FansGender = 'Female' THEN 'Pelajar/Wanita'
	WHEN DATEDIFF(hour,FansBirthday,GETDATE())/8766 < 18 THEN 'Pelajar/Wanita'
	ELSE 'Dewasa'
END [Status]
FROM tb_fans

SELECT *
FROM (SELECT 
	   tb_member.MemberName AS [Nama Member],
       DATENAME(WEEK, TransDate) [Month], 
       COUNT(1) [Member Count]
      FROM tb_member
	  INNER JOIN tb_fans ON tb_fans.MemberId = tb_member.MemberId
	  INNER JOIN tb_header_transaction ON tb_header_transaction.FansId = tb_fans.FansId
      GROUP BY tb_member.MemberName, tb_header_transaction.TransDate,
      DATENAME(WEEK, TransDate)) AS MemberCount
PIVOT( SUM([Member Count])   
    FOR WEEK IN ([Senin],[Selasa],[Rabu],[Kamis],[Jumat],
    [Sabtu],[Minggu])) AS MNamePivot	

CREATE PROCEDURE login_JKT48 (
                              @FansEmail VARCHAR(50),
                              @FansPassword VARCHAR(50),
                              @FansName VARCHAR(50),
                              @ret INT OUTPUT
                             )
AS
  BEGIN
       SET @ret=0
       SELECT @ret=1 
       FROM tb_fans 
       WHERE (FansName=ISNULL(@FansName,NULL) OR FansEmail=ISNULL(@FansEmail,NULL) 
             AND [Password]=@FansPassword
  END
EXEC login_JKT48

CREATE PROCEDURE update_fans_presence
AS
UPDATE FansAttand SET FansAttand = FansAttand + 1 AND
UPDATE MemberPopularity SET MemberPopularity = MemberPopularity + 1
FROM tb_fans
INNER JOIN tb_member ON tb_member.MemberId = tb_fans.MemberId

EXEC update_fans_presence

