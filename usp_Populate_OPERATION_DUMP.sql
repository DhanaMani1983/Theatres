USE [Cerner_CDS_Extract]
GO

/****** Object:  StoredProcedure [dbo].[usp_Populate_OPERATION_DUMP]    Script Date: 03/01/2019 22:28:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- Insert statements for procedure here
--IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OPERATION_DUMP]') AND type in (N'U'))
--DROP TABLE OPERATION_DUMP

CREATE procedure [dbo].[usp_Populate_OPERATION_DUMP]
 as
 Begin



TRUNCATE TABLE OPERATION_DUMP

INSERT INTO [dbo].[OPERATION_DUMP]
           ([Operation Admission Type]
           ,[Operation Anaesthetist Name]
           ,[Operation Cancellation Reason Code]
           ,[Operation Cancellation Reason Desc]
           ,[Operation Cancelled Type Clinical or Non Clinical]
           ,[Operation Consultant Name]
           ,[Operation Count]
           ,[Operation Date]
           ,[Operation DateTime A1 SentFor]
           ,[Operation DateTime A3 Into Suite]
           ,[Operation DateTime A4 Into AR]
           ,[Operation DateTime B1 Anaes Start]
           ,[Operation DateTime B2 Anaes Finish]
           ,[Operation DateTime C1 Into OR]
           ,[Operation DateTime C2 Knife to Skin]
           ,[Operation DateTime C3 Closure Ended]
           ,[Operation DateTime C4 OutOf OR]
           ,[Operation DateTime D1 Into RR]
           ,[Operation DateTime D2 Ready to Discharge]
           ,[Operation DateTime D3 Left RR]
           ,[Operation Division ID]
           ,[Operation Flag Cancelled]
           ,[Operation Flag Cancelled Clinical]
           ,[Operation Flag Cancelled Non Clinical]
           ,[Operation Flag Data Quality]
           ,[Operation Flag Not Cancelled]
           ,[Operation ID]
           ,[Operation List Position]
           ,[Operation Number]
           ,[Operation Patient ID#]
           ,[Operation Patient Name - Family#]
           ,[Operation Procedure Code]
           ,[Operation Procedure Text]
           ,[Operation Session ID]
           ,[Operation Specialty Desc]
           ,[Operation Specialty ID]
           ,[Operation Surgeon Name]
           ,[Operation Team (S/A/TL)]
           ,[Operation Theatre Code Actual]
           ,[Operation Theatre Code Planned]
           ,[Operation Theatre ID]
           ,[Operation Time Taken A Getting Patient]
           ,[Operation Time Taken AA Sent For - Into Suite]
           ,[Operation Time Taken AB Into Suite - Into AR]
           ,[Operation Time Taken AC Into AR - Anaes Start]
           ,[Operation Time Taken B Anaesthetic]
           ,[Operation Time Taken BA Anaes Start - Anaes End]
           ,[Operation Time Taken BB Anaes End - Into OR]
           ,[Operation Time Taken BC In Anaes + Operation]
           ,[Operation Time Taken BC In Anaes + Operation Within Planned]
           ,[Operation Time Taken C Operation]
           ,[Operation Time Taken C Operation Within Planned]
           ,[Operation Time Taken D Recovery]
           ,[Operation Time Taken DA Out of OR - Into RR]
           ,[Operation Time Taken DB Into RR - Ready to Discharge]
           ,[Operation Time Taken DC Ready To Discharge - Left RR]
           ,[Operation TimeGap Next Operation]
           ,[Operation TimeGap Next Operation Within Planned]
           ,[Operation TimeGap Next Patient]
           ,[Operation TimeGap Next Patient Within Planned]
           ,[Operation TimeGap Next Surgery Within Planned1700]
           ,[Operation TimeOverlap Previous Operation Within Planned]
           ,[Operation TimeOverlap Previous Patient]
           ,[Operation TimeOverlap Previous Patient Within Planned]
           ,[Operation Type Elective or Emergency]
           ,[Operation Type NHS or Private]
           ,[PK_OPERATION]
           ,[SURGICAL_CASE_ID]
           ,PERSON_ID
           ,[SCH_APPT_ID]
		   ,SURGICAL_CASE_SPECIALTY_CD
		   ,THEATRE_NBR_CD
		   ,PATIENT_TYPE_CD
		   ,CHECK_IN_DT_TM
		   ,SURGICAL_CASE_NBR_TXT
		   ,SLOT_START_DT_TM
		   ,ASA_Class
		  ,[Operation_Date]
		  ,Site
		  ,SCH_EVENT_ID
		   ,ENCNTR_ID
		   ,SCH_THEATRE_NBR_CD
		   ,[Site_Theatre]
		   ,CANCELLED_DT_TM
		  
           )
SELECT 
sc.PRIORITY_CD	as	'Operation Admission Type',
NULL	as				'Operation Anaesthetist Name',
sc.CANCELLED_REASON_CD	as			'Operation Cancellation Reason Code',
sc.CANCELLED_REASON_CD	as			'Operation Cancellation Reason Desc',
Null as 'Operation Cancelled Type Clinical or Non Clinical',
sc.PRIMARY_SURGEON_PRSNL_ID as		'Operation Consultant Name',
1	as			'Operation Count',
sc.SCH_SURGERY_START_DT_TM	as			'Operation Date',
Null	as			'Operation DateTime A1 SentFor',
sc.ARRIVAL_DT_TM		as		'Operation DateTime A3 Into Suite',
sc.TRANS_TO_ANAES_ROOM_DT_TM as		'Operation DateTime A4 Into AR',
sc.ANAES_INDUCTION_DT_TM	as	'Operation DateTime B1 Anaes Start',
sc.ANAES_STOP_DT_TM	as		'Operation DateTime B2 Anaes Finish',
sc.PATIENT_IN_OR_DT_TM	as		'Operation DateTime C1 Into OR',
sc.SURGERY_START_DT_TM	as		'Operation DateTime C2 Knife to Skin',
sc.SURGERY_STOP_DT_TM	as		'Operation DateTime C3 Closure Ended',
sc.PATIENT_OUT_OR_DT_TM as		'Operation DateTime C4 OutOf OR',
Null as	'Operation DateTime D1 Into RR',
Null as	'Operation DateTime D2 Ready to Discharge',
Null as	'Operation DateTime D3 Left RR',
sc.SURGICAL_CASE_SPECIALTY_CD as	'Operation Division ID',
sc.CANCELLED_REASON_CD as 'Operation Flag Cancelled',
Null as	 'Operation Flag Cancelled Clinical'				,
Null as	 'Operation Flag Cancelled Non Clinical'			,	
Null as	 'Operation Flag Data Quality'				,
Null as	 'Operation Flag Not Cancelled',
sc.SURGICAL_CASE_ID	as			'Operation ID',
Null as				'Operation List Position',
'MRN' AS 				'Operation Number',
'UKRWH_CDE_PERSON_PATIENT.MRN'	as			'Operation Patient ID#',
'UKRWH_CDE_PERSON_PATIENT_NAME.LAST_NAME_TXT'	as			'Operation Patient Name - Family#',
'WH_CLN_SURG_CASE_PROC.PROC_CD'  as 'Operation Procedure Code',
'WH_CLN_SURG_CASE_PROC.PROC_CD' as 'Operation Procedure Text',
'EDW_F_SESSION_TBL.SESSION_SK'	as			'Operation Session ID',
sc.SURGICAL_CASE_SPECIALTY_CD as			'Operation Specialty Desc',
sc.SURGICAL_CASE_SPECIALTY_CD as			'Operation Specialty ID',
'UKRWH_CDE_SURGICAL_CASE_ATTENDANCE.ATTENDEE_PRSNL_ID' as			'Operation Surgeon Name',
'UKRWH_CDE_SURGICAL_CASE_ATTENDANCE.ATTENDEE_PRSNL_ID' as			'Operation Team (S/A/TL)',
sc.THEATRE_NBR_CD	as			'Operation Theatre Code Actual',
sc.SCH_THEATRE_NBR_CD	as		'Operation Theatre Code Planned',
sc.THEATRE_NBR_CD 	as			'Operation Theatre ID',
Null as 'Operation Time Taken A Getting Patient',
Null as 'Operation Time Taken AA Sent For - Into Suite',
Null as 'Operation Time Taken AB Into Suite - Into AR',
Null as 'Operation Time Taken AC Into AR - Anaes Start',
Null as 'Operation Time Taken B Anaesthetic',
Null as 'Operation Time Taken BA Anaes Start - Anaes End',
Null as 'Operation Time Taken BB Anaes End - Into OR',
Null as 'Operation Time Taken BC In Anaes + Operation',
Null as	'Operation Time Taken BC In Anaes + Operation Within Planned',
Null as 'Operation Time Taken C Operation',
Null as 'Operation Time Taken C Operation Within Planned',
Null as 'Operation Time Taken D Recovery',
Null as 'Operation Time Taken DA Out of OR - Into RR',
Null as 'Operation Time Taken DB Into RR - Ready to Discharge',
Null as 'Operation Time Taken DC Ready To Discharge - Left RR',
Null as 'Operation TimeGap Next Operation',
Null as 'Operation TimeGap Next Operation Within Planned',
Null as 'Operation TimeGap Next Patient',
Null as 'Operation TimeGap Next Patient Within Planned',
Null as 'Operation TimeGap Next Surgery Within Planned1700',
Null as 'Operation TimeOverlap Previous Operation Within Planned',
Null as 'Operation TimeOverlap Previous Patient',
Null as 'Operation TimeOverlap Previous Patient Within Planned',
Null as 'Operation Type Elective or Emergency',
'UKRWH_CDE_CDS_EVENT.ADMIN_CATEGORY_NHS_CD_ALIAS' as			'Operation Type NHS or Private',
sc.SURGICAL_CASE_ID	as			'PK_OPERATION',
SC.SURGICAL_CASE_ID,
SC.PERSON_ID,
SC.SCH_APPT_ID,
sc.SURGICAL_CASE_SPECIALTY_CD,
sc.THEATRE_NBR_CD,
SC.PATIENT_TYPE_CD,
sc.CHECK_IN_DT_TM,
SURGICAL_CASE_NBR_TXT,
s.SLOT_START_DT_TM,
(SELECT CODE_DESC_TXT FROM UKRWH_CDE_CODE_VALUE_REF WHERE CODE_VALUE_CD= SC.ASA_CLASS_CD),
sc.SURGERY_START_DT_TM as [Operation_Date],
rtrim(ltrim([dbo].[fnsplitColumn](10,'-',s.SLOT_TEMPLATE_DESC_TXT))) as 'Site',
s.SCH_EVENT_ID,
s.ENCNTR_ID,
sc.SCH_THEATRE_NBR_CD,
(select distinct RESOURCE_DISP_TXT from UKRWH_CDE_RESOURCE_REF rr where s.RESOURCE_CD=rr.RESOURCE_CD)   as [Site Theatre] ,
sc.CANCELLED_DT_TM

FROM UKRWH_CDE_SURGICAL_CASE sc WITH (nolock) left outer join UKRWH_CDE_SCH_APPT_SLOTS s on sc.SCH_APPT_ID= s.SCH_APPT_ID
where (CHECK_IN_DT_TM > '9 march 2015' or CANCELLED_DT_TM is not null )
and (s.SLOT_TYPE_DESC_TXT like 'th%' )
and exists (select 1 from [Theatre_Area_To_Include_Actual] t where  t.SCH_THEATRE_NBR_CD = (select CODE_VALUE_CD from UKRWH_CDE_CODE_VALUE_REF where CODE_VALUE_CD= sc.SCH_THEATRE_NBR_CD) and t.include = 'Y')


--DERIVE COLUMN [Operation Admission Type],Operation Specialty Desc, Operation Specialty ID,Operation Type Elective or Emergency 
Update OPERATION_DUMP
Set [Operation Admission Type]=COALESCE(Cast((Select distinct Code_Desc_txt  from UKRWH_CDE_CODE_VALUE_REF WITH (nolock)  Where [Operation Admission Type]= CODE_VALUE_CD) as Varchar(500)),Null) ,
	[Operation Type NHS or Private]=COALESCE(Cast((Select distinct CODE_DESC_TXT  from UKRWH_CDE_CODE_VALUE_REF WITH (nolock)  Where [Operation Admission Type]= CODE_VALUE_CD) as Varchar(500)),Null) ,
	[Operation Cancellation Reason Desc]=COALESCE(Cast((Select distinct Code_Desc_txt  from UKRWH_CDE_CODE_VALUE_REF WITH (nolock)  Where [Operation Cancellation Reason Code]= CODE_VALUE_CD) as Varchar(500)),Null) ,
	[Operation Specialty Desc]=COALESCE(Cast((Select distinct Code_Desc_txt  from UKRWH_CDE_CODE_VALUE_REF WITH (nolock)  Where [Operation Specialty ID]= CODE_VALUE_CD) as Varchar(500)),Null) 	,
	PATIENT_TYPE=COALESCE(Cast((Select distinct ALIAS_NHS_CD_ALIAS  from UKRWH_CDE_CODE_VALUE_REF WITH (nolock)  Where PATIENT_TYPE_CD= CODE_VALUE_CD) as Varchar(500)),Null) 	
	

Update OPERATION_DUMP
Set Site= rtrim(ltrim([dbo].[fnsplitColumn](4,' ',[Site_Theatre])))

Update OPERATION_DUMP
Set Site= rtrim(ltrim([dbo].[fnsplitColumn](3,' ',[Site_Theatre])))
Where Site is null
	


--DERIVE COLUMN [Operation Anaesthetist Name]
Update OPERATION_DUMP
Set [Operation Anaesthetist Name]= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 9080510)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

-------DERIVE COLUMN [Operation Consultant Name]
----Update OPERATION_DUMP
----Set [Operation Consultant Name] = COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where [Operation Consultant Name]= PERSONNEL_ID ) as Varchar(500)),Null) 
----FROM OPERATION_DUMP AS O

Update OPERATION_DUMP
Set [Operation Consultant Name]= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) ,
	[Consultant_Surgeon_GMC_Code]= COALESCE(Cast((Select distinct HCP_NHS_CD_ALIAS_IDENT   from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID and  PHYSICIAN_IND= 1) as Varchar(500)),Null) 

FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 3069)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID



--Derive Operation DateTime A1 SentFor (Operation DateTime A1 SentFor)
Update OPERATION_DUMP
Set [Operation DateTime A1 SentFor]= COALESCE(q.RESPONSE_VALUE_DT_TM ,null)
FROM OPERATION_DUMP AS O INNER JOIN
(Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.SURGICAL_CASE_ID,dr.RESPONSE_VALUE_DT_TM from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%Patient Sent For%') Q 
On O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--Derive Operation DateTime A3 Into Suite (Operation DateTime A3 Into Suite)
Update OPERATION_DUMP
Set [Operation DateTime A3 Into Suite]= COALESCE(q.RESPONSE_VALUE_DT_TM ,null)
FROM OPERATION_DUMP AS O INNER JOIN
(Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.SURGICAL_CASE_ID,dr.RESPONSE_VALUE_DT_TM from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%Patient Arrived%') Q 
On O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID


--Derive: Operation DateTime A4 Into AR	 [Not Captured in Surginet. 23 Jan 2015 DT]

--Derive : [Operation DateTime B1 Anaes Start]
Update OPERATION_DUMP
Set [Operation DateTime B1 Anaes Start]= COALESCE(q.RESPONSE_VALUE_DT_TM ,null)
FROM OPERATION_DUMP AS O INNER JOIN
(Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.SURGICAL_CASE_ID,dr.RESPONSE_VALUE_DT_TM from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%Anaesthetic Start%') Q 
On O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--Derive : [Operation DateTime B2 Anaes Finish]
Update OPERATION_DUMP
Set [Operation DateTime B2 Anaes Finish]= COALESCE(q.RESPONSE_VALUE_DT_TM ,null)
FROM OPERATION_DUMP AS O INNER JOIN
(Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.SURGICAL_CASE_ID,dr.RESPONSE_VALUE_DT_TM from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%Ready for Surgery%') Q 
On O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--Derive : [Operation DateTime C1 Into OR]
Update OPERATION_DUMP
Set [Operation DateTime C1 Into OR]= COALESCE(q.RESPONSE_VALUE_DT_TM ,null)
FROM OPERATION_DUMP AS O INNER JOIN
(Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.SURGICAL_CASE_ID,dr.RESPONSE_VALUE_DT_TM from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%Time into Theatre%') Q 
On O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--Derive : [Operation DateTime C2 Knife to Skin]
Update OPERATION_DUMP
Set [Operation DateTime C2 Knife to Skin]= COALESCE(q.RESPONSE_VALUE_DT_TM ,null)
FROM OPERATION_DUMP AS O INNER JOIN
(Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.SURGICAL_CASE_ID,dr.RESPONSE_VALUE_DT_TM from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%SURGERY START%') Q 
On O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--Derive : [Operation DateTime C3 Closure Ended]
Update OPERATION_DUMP
Set [Operation DateTime C3 Closure Ended]= COALESCE(q.RESPONSE_VALUE_DT_TM ,null)
FROM OPERATION_DUMP AS O INNER JOIN
(Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.SURGICAL_CASE_ID,dr.RESPONSE_VALUE_DT_TM from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%SURGERY STOP%') Q 
On O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--Derive : [Operation DateTime C4 OutOf OR]
Update OPERATION_DUMP
Set [Operation DateTime C4 OutOf OR]= COALESCE(q.RESPONSE_VALUE_DT_TM ,null)
FROM OPERATION_DUMP AS O INNER JOIN
(Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.SURGICAL_CASE_ID,dr.RESPONSE_VALUE_DT_TM from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%OUT OF THEATRE%') Q 
On O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--Derive : [Operation DateTime D1 Into RR]
Update OPERATION_DUMP
Set [Operation DateTime D1 Into RR]= COALESCE(q.RESPONSE_VALUE_DT_TM ,null)
FROM OPERATION_DUMP AS O INNER JOIN
(Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.SURGICAL_CASE_ID,dr.RESPONSE_VALUE_DT_TM from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%INTO RECOVERY%') Q 
On O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--Derive : [Operation DateTime D2 Ready to Discharge]
Update OPERATION_DUMP
Set [Operation DateTime D2 Ready to Discharge]= COALESCE(q.RESPONSE_VALUE_DT_TM ,null)
FROM OPERATION_DUMP AS O INNER JOIN
(Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.SURGICAL_CASE_ID,dr.RESPONSE_VALUE_DT_TM from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%FIRST WARD CALL%') Q 
On O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--Derive : [Operation DateTime D3 Left RR]
Update OPERATION_DUMP
Set [Operation DateTime D3 Left RR]= COALESCE(q.RESPONSE_VALUE_DT_TM ,null)
FROM OPERATION_DUMP AS O INNER JOIN
(Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.SURGICAL_CASE_ID,dr.RESPONSE_VALUE_DT_TM from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%DISCH FROM REC%') Q 
On O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID



--Derive : [Operation Flag Cancelled] 

	----Update OPERATION_DUMP
	----Set [Operation Flag Cancelled] =
	----	(CASE 
	----		WHEN [Operation Cancellation Reason Code] IS NOT Null OR [Operation Cancellation Reason Code]<> '0'  THEN '1' 
	----		ELSE '0'
	----	  END)
	----From OPERATION_DUMP 


	----NEW LOGIC APPLIED
		Update OPERATION_DUMP
	Set [Operation Flag Cancelled] =
(CASE 
			WHEN [Operation Cancellation Reason Code] <> '0'  THEN '1' 
			--WHEN [Operation Cancellation Reason Code] IS not Null THEN '1'
			ELSE '0'
END)
	From OPERATION_DUMP 

--DERIVE :Operation Flag Cancelled Clinical [1 for clinical, 0 for not-clinical] (Need to be done)
--DERIVE :Operation Flag Cancelled Non Clinical [Opposite of row 117] (Need to be done)

--Derive : [Operation Flag NOT Cancelled] 

	----Update OPERATION_DUMP
	----Set [Operation Flag Not Cancelled] =
	----	(CASE 
	----		WHEN [Operation Cancellation Reason Code] IS NOT Null OR [Operation Cancellation Reason Code]<> '0'  THEN '0' 
	----		ELSE '1'
	----	  END)
	----From OPERATION_DUMP 

		----NEW LOGIC APPLIED
		Update OPERATION_DUMP
	Set [Operation Flag Not Cancelled] =
		(CASE 
			WHEN  [Operation Cancellation Reason Code] <> '0'  THEN '0' 
			--WHEN [Operation Cancellation Reason Code] IS NOT Null THEN '0' 
			ELSE '1'
		  END)
	From OPERATION_DUMP 



--DERIVE	:[Operation Number],[Operation Patient ID#],[Operation Patient Name - Family#]
--	Update OPERATION_DUMP
--	Set [Operation Number] =q.LOCAL_PATIENT_IDENT ,
--		[Operation Patient ID#]=q.LOCAL_PATIENT_IDENT,
--		[Operation Patient Name - Family#]=  q.LAST_NAME_TXT + ' , '+ q.FIRST_NAME_TXT, --COALESCE(Cast((Select  q.LAST_NAME_TXT  From UKRWH_CDE_CODE_VALUE_REF  Where q.PERSON_NAME_TYPE_CD= CODE_VALUE_CD and CODE_MEANING_TXT = 'CURRENT') as Varchar(500)),Null) + ' , ' + COALESCE(Cast((Select q.FIRST_NAME_TXT From UKRWH_CDE_CODE_VALUE_REF   Where q.PERSON_NAME_TYPE_CD= CODE_VALUE_CD and CODE_MEANING_TXT = 'CURRENT') as Varchar(500)),Null)
--		[Patient_Gender]= (select CODE_DISP_TXT from UKRWH_CDE_CODE_VALUE_REF where CODE_VALUE_CD= q.GENDER_CD),
--		Patient_Age_Text= DBO.AGE(Q.BIRTH_DT_TM,GETDATE()),
--		Patient_Age_Years= DBO.Age_In_Years(Q.BIRTH_DT_TM,GETDATE())	
--	FROM OPERATION_DUMP AS O inner join
--(SELECT     pn.FIRST_NAME_TXT, pn.LAST_NAME_TXT, 
--                      pn.PERSON_ID,pn.PERSON_NAME_TYPE_CD ,pn.TITLE_TXT,p.LOCAL_PATIENT_IDENT,p.BIRTH_DT_TM,p.GENDER_CD
--FROM         dbo.UKRWH_CDE_PERSON_PATIENT p WITH (nolock) INNER JOIN
--             dbo.UKRWH_CDE_PERSON_PATIENT_NAME  pn WITH (nolock) ON p.PERSON_ID = pn.PERSON_ID	
--             inner join UKRWH_CDE_CODE_VALUE_REF on PERSON_NAME_TYPE_CD= CODE_VALUE_CD
--Where  CODE_MEANING_TXT = 'CURRENT'             
--                      )q
--		ON O.PERSON_ID = q.PERSON_ID   

--DERIVE	:[Operation Number],[Operation Patient ID#],[Operation Patient Name - Family#]
	Update OPERATION_DUMP
	Set [Operation Number] =q.LOCAL_PATIENT_IDENT ,
		[Operation Patient ID#]=q.LOCAL_PATIENT_IDENT,
		[Operation Patient Name - Family#]=  q.LAST_NAME_TXT + ' , '+ q.FIRST_NAME_TXT, --COALESCE(Cast((Select  q.LAST_NAME_TXT  From UKRWH_CDE_CODE_VALUE_REF  Where q.PERSON_NAME_TYPE_CD= CODE_VALUE_CD and CODE_MEANING_TXT = 'CURRENT') as Varchar(500)),Null) + ' , ' + COALESCE(Cast((Select q.FIRST_NAME_TXT From UKRWH_CDE_CODE_VALUE_REF   Where q.PERSON_NAME_TYPE_CD= CODE_VALUE_CD and CODE_MEANING_TXT = 'CURRENT') as Varchar(500)),Null)
		[Patient_Gender]= (select CODE_DISP_TXT from UKRWH_CDE_CODE_VALUE_REF where CODE_VALUE_CD= q.GENDER_CD),
		Patient_Age_Text= DBO.AGE(Q.BIRTH_DT_TM,GETDATE()),
		Patient_Age_Years= DBO.Age_In_Years(Q.BIRTH_DT_TM,GETDATE())	
	FROM OPERATION_DUMP AS O inner join
(SELECT      p.LOCAL_PATIENT_IDENT, p.BIRTH_DT_TM, p.DECEASED_DT_TM, p.NHS_NBR_IDENT, 
							  p.NHS_NBR_STATUS_CD, p.GENDER_CD, p.ETHNIC_GROUP_CD, p.RELIGION_CD
							  , pr.LAST_NAME_TXT, 
							  pr.FIRST_NAME_TXT,
							  p.person_id
		FROM         dbo.UKRWH_CDE_PERSON_PATIENT AS p WITH (nolock)  INNER JOIN dbo.UKRWH_CDE_PERSON_PATIENT_NAME pr WITH (nolock)  ON p.PERSON_ID = pr.PERSON_ID  Inner Join UKRWH_CDE_CODE_VALUE_REF cv WITH (nolock) on  PERSON_NAME_TYPE_CD= CODE_VALUE_CD
		Where CODE_MEANING_TXT = 'CURRENT'  
		and exists(Select 1 from UKRWH_CDE_PERSON_PATIENT_NAME pn where pr.PERSON_ID=pn.PERSON_ID  and pn.PERSON_NAME_TYPE_CD=766
                   Having   max(pn.beg_effective_dt_tm)=pr.beg_effective_dt_tm)            
                      )q
		ON O.PERSON_ID = q.PERSON_ID   
--Derive : Operation Procedure Code,Operation Procedure Text

	Update OPERATION_DUMP
	Set [Operation Procedure Code]=q.SCH_PROC_CD ,
        [Operation Procedure Text]=q.CODE_DESC_TXT,
        Anaesthesia_Type= (Select CODE_DESC_TXT from UKRWH_CDE_CODE_VALUE_REF where CODE_VALUE_CD= q.ANAES_TYPE_CD),
        PROCEDURE_FREE_TXT= Q.PROC_TXT,
       LATERALITY = Q.[MODIFIER_TXT]
	FROM OPERATION_DUMP AS O INNER JOIN    
	(select [SURGICAL_CASE_ID],SCH_PROC_CD,n.CODE_DESC_TXT,S.PROC_TXT,S.[MODIFIER_TXT]
	,s.ANAES_TYPE_CD  FROM [dbo].[UKRWH_CDE_SURGICAL_CASE_PROCEDURE] s WITH (nolock) 
	INNER JOIN [dbo].UKRWH_CDE_CODE_VALUE_REF n WITH (nolock) on s.PROC_CD= n.CODE_VALUE_CD
	WHERE PRIMARY_PROC_IND= 1
	)q
		ON O.SURGICAL_CASE_ID = q.SURGICAL_CASE_ID   
		
--Derive : [Operation Session ID] Need to be done

--DERIVE COLUMN [Operation Surgeon Name]
--select * from UKRWH_CDE_CODE_VALUE_REF where CODE_SET_NBR='10170' (Lookup for Role Perform Code)
Update OPERATION_DUMP
Set [Operation Surgeon Name]= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) ,
	[Operation_Surgeon_GMC_Code]= COALESCE(Cast((Select distinct HCP_NHS_CD_ALIAS_IDENT   from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID and  PHYSICIAN_IND= 1) as Varchar(500)),Null) 

FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 3075)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID




--DERIVE COLUMN ODP

Update OPERATION_DUMP
Set ODP= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 51716213)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID


--DERIVE COLUMN Anaesthetist_Other

Update OPERATION_DUMP
Set Anaesthetist_Other= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) ,
[Anaesthetist_Other_GMC_Code]= COALESCE(Cast((Select distinct HCP_NHS_CD_ALIAS_IDENT   from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID and  PHYSICIAN_IND= 1) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 9080544)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID



--DERIVE COLUMN First_Assistant

Update OPERATION_DUMP
Set First_Assistant= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) ,
[First_Assistant_GMC_Code]= COALESCE(Cast((Select distinct HCP_NHS_CD_ALIAS_IDENT   from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID and  PHYSICIAN_IND= 1) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 3060)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID


--DERIVE COLUMN Radiographer

Update OPERATION_DUMP
Set Radiographer= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 9080504)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID


--DERIVE COLUMN Operating_Surgeon

Update OPERATION_DUMP
Set Operating_Surgeon= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 3075)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID


--DERIVE COLUMN Circulator_1

Update OPERATION_DUMP
Set Circulator_1= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 3061)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--DERIVE COLUMN Circulator_2

Update OPERATION_DUMP
Set Circulator_2= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 41461967)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--DERIVE COLUMN Circulator_3

Update OPERATION_DUMP
Set Circulator_3= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 41462124)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--DERIVE COLUMN Scrub_Practitioner

Update OPERATION_DUMP
Set Scrub_Practitioner= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 9080531)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID


--DERIVE COLUMN Anaesthetist_Main

Update OPERATION_DUMP
Set Anaesthetist_Main= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) ,
[Anaesthetist_Main_GMC_Code]= COALESCE(Cast((Select distinct HCP_NHS_CD_ALIAS_IDENT   from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID and  PHYSICIAN_IND= 1) as Varchar(500)),Null) 

FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 9080510)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--DERIVE COLUMN Second_Assistant

Update OPERATION_DUMP
Set Second_Assistant= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) ,
[Second_Assistant_GMC_Code]= COALESCE(Cast((Select distinct HCP_NHS_CD_ALIAS_IDENT   from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID and  PHYSICIAN_IND= 1) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 3072)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID


--DERIVE COLUMN Scrub_2

Update OPERATION_DUMP
Set Scrub_2= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 41462108)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--DERIVE COLUMN HCA

Update OPERATION_DUMP
Set HCA= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 51716467)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--DERIVE COLUMN Theatre_Support_Worker

Update OPERATION_DUMP
Set Theatre_Support_Worker= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 41461889)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

--DERIVE COLUMN Perfusionist

Update OPERATION_DUMP
Set Perfusionist= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 3068)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID


--DERIVE COLUMN [Operation Team (S/A/TL)]
Update OPERATION_DUMP
Set [Operation Team (S/A/TL)]= [Operation Surgeon Name] + '  /  '+ [Operation Anaesthetist Name] + '  /  ' +
COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where q.ATTENDEE_PRSNL_ID= PERSONNEL_ID ) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O INNER JOIN
(select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD
from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
where ROLE_PERFORM_CD= 9080531)Q
ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID

UPDATE OPERATION_DUMP
SET OPERATION_DUMP.BLOCK_INSTANCE_ID=aps.BLOCK_INSTANCE_ID,
	OPERATION_DUMP.Slot_Sequence_NBR=aps.Slot_Sequence_NBR,
	OPERATION_DUMP.FIRST_CASE=aps.FIRST_CASE,
	OPERATION_DUMP.LAST_CASE=aps.LAST_CASE,
	OPERATION_DUMP.Operation_SLOT_TYPE_DESC_TXT=aps.SLOT_TYPE_DESC_TXT
from UKRWH_CDE_SCH_APPT_SLOTS_WITH_SEQUENCE_FOR_SURGINET aps
Left outer join OPERATION_DUMP	 sc on sc.SCH_APPT_ID= aps.SCH_APPT_ID
where aps.BLOCK_INSTANCE_ID is not null

UPDATE OPERATION_DUMP
SET OPERATION_DUMP.BLOCK_INSTANCE_ID=aps.BLOCK_INSTANCE_ID,
	OPERATION_DUMP.Slot_Sequence_NBR=aps.Slot_Sequence_NBR,
	OPERATION_DUMP.FIRST_CASE=aps.FIRST_CASE,
	OPERATION_DUMP.LAST_CASE=aps.LAST_CASE,
	OPERATION_DUMP.Operation_SLOT_TYPE_DESC_TXT=aps.SLOT_TYPE_DESC_TXT
from UKRWH_CDE_SCH_APPT_REMOVED_THEATRE_SLOTS_WITH_SEQUENCE_FOR_SURGINET aps
Left outer join OPERATION_DUMP	 sc on sc.SCH_APPT_ID= aps.SCH_APPT_ID
where aps.BLOCK_INSTANCE_ID is not null


--Nullify Times for Cancelled patients if entered wrongly or mistakingly

Update OPERATION_DUMP
set [Operation Date] = null,
	[Operation DateTime A1 SentFor] = null,
	[Operation DateTime A3 Into Suite]= null,
	[Operation DateTime A4 Into AR]=NULL	,
	[Operation DateTime B1 Anaes Start] = null,
	[Operation DateTime B2 Anaes Finish]=NULL	,
	[Operation DateTime C1 Into OR]=null,
	[Operation DateTime C2 Knife to Skin]=NULL	,
	[Operation DateTime C3 Closure Ended]=NULL	,
	[Operation DateTime C4 OutOf OR]=NULL	,
	[Operation DateTime D1 Into RR]=NULL	,
	[Operation DateTime D2 Ready to Discharge]=NULL	,
	[Operation DateTime D3 Left RR]=NULL	
from OPERATION_DUMP
where [Operation Cancellation Reason Code] <> '0' and [Operation Cancellation Reason Code] is not null
and [Operation DateTime B1 Anaes Start] is not null	




Exec [usp_Time_Into_Theatre_Sequence_FOR_OPERATION_DUMP]

Update OPERATION_DUMP
Set [Operation List Position] = S.Time_Into_Theatre_Sequence_NBR,
	Actual_Sequence= S.Time_Into_Theatre_Sequence_NBR,
    [Operation Session ID]= s.BLOCK_INSTANCE_ID,
	[Operation DateTime B1 Anaes Start] = s.[Operation DateTime C1 Into OR]        
FROM OPERATION_DUMP INNER JOIN Time_Into_Theatre_Sequence_FOR_OPERATION_DUMP S ON OPERATION_DUMP.BLOCK_INSTANCE_ID= S.BLOCK_INSTANCE_ID
and OPERATION_DUMP.SCH_APPT_ID= s.SCH_APPT_ID and s.Time_Into_Theatre_Sequence_NBR=1

Exec [usp_Time_Into_Theatre_Sequence_FOR_OPERATION_DUMP]

Update OPERATION_DUMP
Set [Operation List Position] = S.Time_Into_Theatre_Sequence_NBR,
	Actual_Sequence= S.Time_Into_Theatre_Sequence_NBR,
    [Operation Session ID]= s.BLOCK_INSTANCE_ID,
	[Operation DateTime B1 Anaes Start] = s.[Operation DateTime C1 Into OR]        
FROM OPERATION_DUMP INNER JOIN Time_Into_Theatre_Sequence_FOR_OPERATION_DUMP S ON OPERATION_DUMP.BLOCK_INSTANCE_ID= S.BLOCK_INSTANCE_ID
and OPERATION_DUMP.SCH_APPT_ID= s.SCH_APPT_ID and s.Time_Into_Theatre_Sequence_NBR=1





--Derive :[Operation Time Taken A Getting Patient]
Update OPERATION_DUMP
Set [Operation Time Taken A Getting Patient]= DATEDIFF(MI,[Operation DateTime A1 SentFor],[Operation DateTime B1 Anaes Start])
FROM OPERATION_DUMP		

--Derive :[Operation Time Taken AA Sent For - Into Suite]
Update OPERATION_DUMP
Set [Operation Time Taken AA Sent For - Into Suite]= DATEDIFF(MI,[Operation DateTime A1 SentFor],[Operation DateTime A3 Into Suite])
FROM OPERATION_DUMP	

--Derive :[Operation Time Taken AB Into Suite - Into AR]
Update OPERATION_DUMP
Set [Operation Time Taken AB Into Suite - Into AR]= DATEDIFF(MI,[Operation DateTime A3 Into Suite],[Operation DateTime B1 Anaes Start])
FROM OPERATION_DUMP	

--Operation Time Taken AC Into AR - Anaes Start
Update OPERATION_DUMP
Set [Operation Time Taken AC Into AR - Anaes Start]= DATEDIFF(MI,[Operation DateTime A3 Into Suite],[Operation DateTime B1 Anaes Start])
FROM OPERATION_DUMP	

--Derive : [Operation Time Taken B Anaesthetic]
Update OPERATION_DUMP
Set [Operation Time Taken B Anaesthetic]= DATEDIFF(MI,[Operation DateTime B1 Anaes Start],[Operation DateTime C1 Into OR])
FROM OPERATION_DUMP	

--Derive : [Operation Time Taken BA Anaes Start - Anaes End]
Update OPERATION_DUMP
Set [Operation Time Taken BA Anaes Start - Anaes End]= DATEDIFF(MI,[Operation DateTime B1 Anaes Start],[Operation DateTime B2 Anaes Finish])
FROM OPERATION_DUMP	

--Derive : [Operation Time Taken BB Anaes End - Into OR]
Update OPERATION_DUMP
Set [Operation Time Taken BB Anaes End - Into OR]= DATEDIFF(MI,[Operation DateTime B1 Anaes Start],[Operation DateTime C1 Into OR])
FROM OPERATION_DUMP	

--Derive : [Operation Time Taken BC In Anaes + Operation]
Update OPERATION_DUMP
Set [Operation Time Taken BC In Anaes + Operation]= DATEDIFF(MI,[Operation DateTime B1 Anaes Start],[Operation DateTime C4 OutOf OR])
FROM OPERATION_DUMP	

--Derive : [Operation Time Taken BC In Anaes + Operation Within Planned]
--Condition to compute this is : Compute only if anaes start and out of theatre (OR) fall within session Begin and End Time
--Need to code this later (Actual operation against the planned/scheduled session)
Update OPERATION_DUMP
Set [Operation Time Taken BC In Anaes + Operation Within Planned]= DATEDIFF(MI,[Operation DateTime B1 Anaes Start],[Operation DateTime C4 OutOf OR])
FROM OPERATION_DUMP	

--Derive : [Operation Time Taken C Operation]
--Condition to compute this is : Compute only if anaes start and out of theatre (OR) fall within session Begin and End Time
Update OPERATION_DUMP
Set [Operation Time Taken C Operation]= DATEDIFF(MI,[Operation DateTime C1 Into OR] ,[Operation DateTime C4 OutOf OR])
FROM OPERATION_DUMP	

--Derive : [Operation Time Taken C Operation Within Planned]
--Condition to compute this is : Compute only if anaes start and out of theatre (OR) fall within session Begin and End Time
--Need to code this later (Actual operation against the planned/scheduled session)

Update OPERATION_DUMP
Set [Operation Time Taken C Operation Within Planned]= DATEDIFF(MI,[Operation DateTime C1 Into OR],[Operation DateTime C4 OutOf OR])
FROM OPERATION_DUMP	


--Derive : [Operation Time Taken D Recovery]
Update OPERATION_DUMP
Set [Operation Time Taken D Recovery]= DATEDIFF(MI,[Operation DateTime C4 OutOf OR],[Operation DateTime D3 Left RR])
FROM OPERATION_DUMP	

--SELECT [Operation DateTime C4 OutOf OR],[Operation DateTime D3 Left RR] FROM OPERATION_DUMP

--Derive : [Operation Time Taken DA Out of OR - Into RR]
Update OPERATION_DUMP
Set [Operation Time Taken DA Out of OR - Into RR]= DATEDIFF(MI,[Operation DateTime D1 Into RR],[Operation DateTime D3 Left RR])
FROM OPERATION_DUMP	

--Derive : [Operation Time Taken DB Into RR - Ready to Discharge]
--PATIENT RECOVERED LOGIC TO BE ADDED TO OPERATION TBALE AND TO BE USED WHEN [Operation DateTime D2 Ready to Discharge](FIRST WARD CALL) IS NULL
Update OPERATION_DUMP
Set [Operation Time Taken DB Into RR - Ready to Discharge]= DATEDIFF(MI,[Operation DateTime D1 Into RR],[Operation DateTime D2 Ready to Discharge])
FROM OPERATION_DUMP	

--Derive : [Operation Time Taken DC Ready To Discharge - Left RR]
--PATIENT RECOVERED LOGIC TO BE ADDED TO OPERATION TBALE AND TO BE USED WHEN [Operation DateTime D2 Ready to Discharge](FIRST WARD CALL) IS NULL
Update OPERATION_DUMP
Set [Operation Time Taken DC Ready To Discharge - Left RR]= DATEDIFF(MI,[Operation DateTime D2 Ready to Discharge],[Operation DateTime D3 Left RR])
FROM OPERATION_DUMP	

--Derive : [Operation TimeGap Next Operation],[Operation TimeGap Next Operation Within Planned]
--[Operation TimeGap Next Patient],[Operation TimeGap Next Surgery Within Planned1700]
--[Operation TimeOverlap Previous Operation Within Planned],[Operation TimeOverlap Previous Patient]
--[Operation TimeOverlap Previous Patient Within Planned]
--NEED TO BE CODED FOR ACTUAL OPERATION RANKING FOR DIFFERENT PATIENTS
Update OPERATION_DUMP
Set [Operation TimeGap Next Operation]= DATEDIFF(MI,[Operation DateTime C4 OutOf OR],[Operation DateTime C1 Into OR]),
	[Operation TimeGap Next Operation Within Planned]= DATEDIFF(MI,[Operation DateTime C4 OutOf OR],[Operation DateTime C1 Into OR]),
	[Operation TimeGap Next Patient]= DATEDIFF(MI,[Operation DateTime C4 OutOf OR],[Operation DateTime C1 Into OR]),
	--[Operation TimeGap Next Surgery Within Planned1700]= DATEDIFF(MI,[Operation DateTime C4 OutOf OR],[Operation DateTime C1 Into OR]),
	[Operation TimeGap Next Surgery Within Planned1700]= DATEDIFF(MI,[Operation DateTime C4 OutOf OR], [Operation DateTime B1 Anaes Start]),
	[Operation TimeOverlap Previous Operation Within Planned]= DATEDIFF(MI,[Operation DateTime C4 OutOf OR],[Operation DateTime C1 Into OR]),
	[Operation TimeOverlap Previous Patient]= DATEDIFF(MI,[Operation DateTime C4 OutOf OR],[Operation DateTime C1 Into OR]),
	[Operation TimeOverlap Previous Patient Within Planned]= DATEDIFF(MI,[Operation DateTime C4 OutOf OR],[Operation DateTime C1 Into OR])
FROM OPERATION_DUMP	

--Derive : Operation Type NHS or Private
Update OPERATION_DUMP
Set [Operation Type NHS or Private]=
									(Case 
									When q.ADMIN_CATEGORY_NHS_CD_ALIAS = '01' Then 'NHS'
									When q.ADMIN_CATEGORY_NHS_CD_ALIAS = '02' Then 'Private'
									When q.ADMIN_CATEGORY_NHS_CD_ALIAS = '03' Then 'Amenity'
									When q.ADMIN_CATEGORY_NHS_CD_ALIAS = '04' Then 'Category II'
									When q.ADMIN_CATEGORY_NHS_CD_ALIAS = '1' Then 'NHS'
									When q.ADMIN_CATEGORY_NHS_CD_ALIAS = '2' Then 'Private'
									When q.ADMIN_CATEGORY_NHS_CD_ALIAS = '3' Then 'Amenity'
									When q.ADMIN_CATEGORY_NHS_CD_ALIAS = '4' Then 'Category II'
									end)
FROM OPERATION_DUMP	o inner join
(select eve.ADMIN_CATEGORY_NHS_CD_ALIAS,sc.SURGICAL_CASE_ID from UKRWH_CDE_SURGICAL_CASE sc inner join UKRWH_CDE_CDS_EVENT eve
on sc.ENCNTR_ID=eve.ENCNTR_ID)q
On o.SURGICAL_CASE_ID=q.SURGICAL_CASE_ID


Update OPERATION_DUMP
Set BLOCK_INSTANCE_ID =s.BLOCK_INSTANCE_ID ,
    SLOT_START_DT_TM= s.SLOT_START_DT_TM
From OPERATION_DUMP o inner join UKRWH_CDE_SCH_APPT_REMOVED_THEATRE_SLOTS s
on s.SCH_APPT_ID = o.SCH_APPT_ID
Where o.BLOCK_INSTANCE_ID is null


Update OPERATION_DUMP
Set BLOCK_INSTANCE_ID =s.BLOCK_INSTANCE_ID ,
    SLOT_TEMPLATE_DESC_TXT= s.SLOT_TEMPLATE_DESC_TXT,
    SLOT_TYPE_DESC_TXT=s.SLOT_TYPE_DESC_TXT
From OPERATION_DUMP o inner join UKRWH_CDE_SCH_APPT_SLOTS s
on s.SCH_APPT_ID = o.SCH_APPT_ID
Where o.BLOCK_INSTANCE_ID is null


Update OPERATION_DUMP
set [Operation Date] = null,
	[Operation DateTime A1 SentFor] = null,
	[Operation DateTime A3 Into Suite]= null,
	[Operation DateTime A4 Into AR]=NULL	,
	[Operation DateTime B1 Anaes Start] = null,
	[Operation DateTime B2 Anaes Finish]=NULL	,
	[Operation DateTime C1 Into OR]=null,
	[Operation DateTime C2 Knife to Skin]=NULL	,
	[Operation DateTime C3 Closure Ended]=NULL	,
	[Operation DateTime C4 OutOf OR]=NULL	,
	[Operation DateTime D1 Into RR]=NULL	,
	[Operation DateTime D2 Ready to Discharge]=NULL	,
	[Operation DateTime D3 Left RR]=NULL	
from OPERATION_DUMP
where [Operation Cancellation Reason Code] <> '0' 
--and [Operation DateTime B1 Anaes Start] is not null	
--test

Exec usp_OUT_OF_THEATRE_Sequence_FOR_OPERATION_DUMP

Exec usp_Anaes_Start_Sequence_FOR_OPERATION_DUMP


Update OPERATION_DUMP
Set [Operation DateTime B1 Anaes Start Earliest]= a.[Operation DateTime B1 Anaes Start]
From OPERATION_DUMP o inner join Anaes_Start_Sequence_FOR_OPERATION_DUMP a
on o.BLOCK_INSTANCE_ID = a.BLOCK_INSTANCE_ID and  a.Anaes_Start_Sequence_NBR=1

Update OPERATION_DUMP
Set [Operation DateTime C4 OutOf OR Latest]= oa.[Operation DateTime C4 OutOf OR]
From OPERATION_DUMP o inner join OUT_OF_THEATRE_Sequence_FOR_OPERATION_DUMP oa
on o.BLOCK_INSTANCE_ID = oa.BLOCK_INSTANCE_ID and  oa.OUT_OF_THEATRE_Sequence_NBR=1





Update OPERATION_DUMP
Set Delay_Reason= q.RESPONSE_VALUE_FORMATTED_TXT
From OPERATION_DUMP o inner join Anaes_Start_Sequence_FOR_OPERATION_DUMP a
on o.BLOCK_INSTANCE_ID = a.BLOCK_INSTANCE_ID and  a.Anaes_Start_Sequence_NBR=1
Inner Join
(Select distinct RESPONSE_VALUE_FORMATTED_TXT,SURGICAL_CASE_ID from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%delay reason%' and exists (select 1 from UKRWH_CDE_CODE_VALUE_REF r where r.CODE_DESC_TXT like '%PreOp Document Type%' and CODE_VALUE_CD= dr.PERIOPERATIVE_DOC_TYPE_CD)

) q on q.SURGICAL_CASE_ID= a.SURGICAL_CASE_ID and  a.Anaes_Start_Sequence_NBR=1



--Derive  Temp_On_Arrival		  	   
Update OPERATION_DUMP
Set Temp_On_Arrival =q.RESPONSE_VALUE_FORMATTED_TXT
From OPERATION_DUMP o  inner Join (
Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.* from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%Temp on Arrival%')	 q on o.SURGICAL_CASE_ID= q.SURGICAL_CASE_ID

--Derive  PONV		  	   
Update OPERATION_DUMP
Set PONV =q.RESPONSE_VALUE_FORMATTED_TXT
From OPERATION_DUMP o  inner Join (
Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.* from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%Nausea/Vomting%')	 q on o.SURGICAL_CASE_ID= q.SURGICAL_CASE_ID


--Derive  Pain_Score_On_Arrival	  	   
Update OPERATION_DUMP
Set Pain_Score_On_Arrival =q.RESPONSE_VALUE_FORMATTED_TXT
From OPERATION_DUMP o  inner Join (
Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.* from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%Pain Score%')	 q on o.SURGICAL_CASE_ID= q.SURGICAL_CASE_ID


Update OPERATION_DUMP
Set [Operation Admission Type] =(case when [Operation Admission Type] = 'ROUTINE' then 'ELEC' 
									 When [Operation Admission Type] = 'Urgent' then 'NON-ELEC' 
									 When [Operation Admission Type] =  'Urgent Cancer' Then  'Urgent Cancer'
									 end)
From OPERATION_DUMP o 

--DERIVE	: Operation List Position (NEED TO BE DONE) 
Update OPERATION_DUMP
Set [Operation List Position] = S.Anaes_Start_Sequence_NBR,
	Actual_Sequence= S.Anaes_Start_Sequence_NBR,
    [Operation Session ID]= s.BLOCK_INSTANCE_ID
FROM OPERATION_DUMP INNER JOIN Anaes_Start_Sequence_FOR_OPERATION_DUMP S ON OPERATION_DUMP.BLOCK_INSTANCE_ID= S.BLOCK_INSTANCE_ID
and OPERATION_DUMP.SCH_APPT_ID= s.SCH_APPT_ID

--Derive  WHO_Sign_In	  	   
Update OPERATION_DUMP
Set WHO_Sign_In =q.RESPONSE_VALUE_FORMATTED_TXT
From OPERATION_DUMP o  inner Join(
Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.* from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%WHO Sign In%') q on o.SURGICAL_CASE_ID= q.SURGICAL_CASE_ID

--Derive  WHO_Sign_OUT	  	   
Update OPERATION_DUMP
Set WHO_Sign_OUT =q.RESPONSE_VALUE_FORMATTED_TXT
From OPERATION_DUMP o  inner Join(
Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.* from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%WHO Sign out%') q on o.SURGICAL_CASE_ID= q.SURGICAL_CASE_ID

--Derive  WHO_Sign_In	  	   
Update OPERATION_DUMP
Set WHO_Time_Out =q.RESPONSE_VALUE_FORMATTED_TXT
From OPERATION_DUMP o  inner Join(
Select distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.* from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
where CONTROL_COLUMN_HEADING_TXT like '%WHO Time Out%') q on o.SURGICAL_CASE_ID= q.SURGICAL_CASE_ID


--Derive  WHO_Sign_In	  	   
Update OPERATION_DUMP
Set LOC_SESSION_END_DT_TM =ns.LOC_SESSION_END_DT_TM
From OPERATION_DUMP o  inner Join NON_CDE_EDW_F_Session_WITH_SEQUENCE ns on ns.SESSION_SK= o.BLOCK_INSTANCE_ID and ns.Session_Sequence_NBR=1

---DERIVE COLUMN [Operation Consultant Name]
Update OPERATION_DUMP
Set [Operation Consultant Name] = COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where [Operation Consultant Name]= PERSONNEL_ID ) as Varchar(500)),Null) ,
[Consultant_Surgeon_GMC_Code]= COALESCE(Cast((Select distinct HCP_NHS_CD_ALIAS_IDENT   from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where [Operation Consultant Name]= PERSONNEL_ID and  PHYSICIAN_IND= 1) as Varchar(500)),Null) 
FROM OPERATION_DUMP AS O
where isnumeric([Operation Consultant Name])=1

---DERIVE COLUMN Operating_Surgeon
Update OPERATION_DUMP
Set Operating_Surgeon= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where Operating_Surgeon= PERSONNEL_ID ) as Varchar(500)),Null)
where isnumeric(Operating_Surgeon)=1


--First_Assistant, 
---DERIVE COLUMN First_Assistant
Update OPERATION_DUMP
Set First_Assistant= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where First_Assistant= PERSONNEL_ID ) as Varchar(500)),Null),
    First_Assistant_GMC_Code= COALESCE(Cast((Select distinct HCP_NHS_CD_ALIAS_IDENT   from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where First_Assistant= PERSONNEL_ID and  PHYSICIAN_IND= 1 ) as Varchar(500)),Null) 
where isnumeric(First_Assistant)=1

---DERIVE COLUMN Second_Assistant
Update OPERATION_DUMP
Set Second_Assistant= COALESCE(Cast((Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where Second_Assistant= PERSONNEL_ID ) as Varchar(500)),Null),
    Second_Assistant_GMC_Code= COALESCE(Cast((Select distinct HCP_NHS_CD_ALIAS_IDENT   from UKRWH_CDE_PRSNL_REF WITH (nolock)  Where Second_Assistant= PERSONNEL_ID and  PHYSICIAN_IND= 1) as Varchar(500)),Null) 
where isnumeric(Second_Assistant)=1



Update OPERATION_DUMP
Set Case_Planned_Procedure_Type=q.DESCRIPTION_TXT
From OPERATION_DUMP Inner Join 
(select n.DESCRIPTION_TXT,o.ENCNTR_ID  from OPERATION_DUMP o inner Join UKRWH_CDE_EAL_INTENDED_PROCEDURE ip on o.ENCNTR_ID= ip.ENCNTR_ID
inner join UKRWH_CDE_NOMENCLATURE_REF n on replace(n.VALUE_TXT,'.','')= PROC_NHS_CD_ALIAS and n.CONCEPT_CKI_IDENT like '%OPCS%')q
on OPERATION_DUMP.ENCNTR_ID= q.ENCNTR_ID


Update OPERATION_DUMP
Set Case_Clinical_Non_Clinical_Cancellation_Only=d.[CLINILCAL /NON CLINICAL]
FROM [dbo].[Dim_Cancellation_Reason_Code] d inner join OPERATION_DUMP o on
o.[Operation Cancellation Reason Desc]=d.CODE_DESC_TXT


Exec [usp_Operation_Cancelled_PIVOT]

End





GO


