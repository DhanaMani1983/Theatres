USE [Cerner_CDS_Extract]
GO

/****** Object:  StoredProcedure [dbo].[usp_Populate_Surginet_Theatre_Utilization_Report]    Script Date: 06/01/2019 23:40:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Populate_Surginet_Theatre_Utilization_Report]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Theatre_Utilization_Report]') AND type in (N'U'))
DROP TABLE [Theatre_Utilization_Report]

    
select q.* INTO Theatre_Utilization_Report  from     
(select 
DATEDIFF(MI,o.[Operation DateTime B1 Anaes Start Earliest],O.[Operation DateTime C4 OutOf OR Latest]) as [Session TimeTaken Within Planned]	,
DATEDIFF(MI,LOC_SESSION_BEG_DT_TM,ns.LOC_SESSION_END_DT_TM) as [Session TimePlanned Total],	
DATEDIFF(MI,(SELECT [Operation DateTime B1 Anaes Start] FROM OPERATION_DUMP OD WHERE  Actual_Sequence= 1 AND O.SURGICAL_CASE_ID= OD.SURGICAL_CASE_ID),NS.LOC_SESSION_BEG_DT_TM) as [Session TimeLost Late Start],
DATEDIFF(MI,ns.ACTUAL_FIRST_CASE_START_DT_TM,o.[Operation DateTime B1 Anaes Start]) as [Session TimeGained Early Start],	
DATEDIFF(MI,NS.LOC_SESSION_END_DT_TM,O.[Operation DateTime C4 OutOf OR]) as [Session TimeLost Early Finish],
DATEDIFF(MI,ns.SCHED_LAST_CASE_STOP_DT_TM, LOC_SCHED_LAST_CASE_STOP_DT_TM) as SessionTimeGainedLateFinish,
0 as [Operation TimeGap Next Surgery Within Planned1700],
0 as [Operation TimeGap Next Surgery Within Planned1700_Actual],
[Operation Count],
[Operation Flag Cancelled],
LOC_SESSION_BEG_DT_TM as [Session DateTime Planned Start],
ns.LOC_SESSION_END_DT_TM as [Session DateTime Planned End],
o.[Operation DateTime C4 OutOf OR]as [Session DateTime Last Patient End],
[Operation Time Taken B Anaesthetic] as [Session DateTime First Patient Start],
'' AS [Session Cancellation Desc],
'' as [Session Cancel Text],
'' as [Session Exception Comments],
[Operation Cancellation Reason Desc],
'Not captured in Surginet' as [Session Anaesthetic Text],
'' as [Operation Cancellation Text],
[Operation ID],
rtrim(ltrim([dbo].[fnsplitColumn](9,'-',s.SLOT_TEMPLATE_DESC_TXT))) as [Theatre Suite],
rtrim(ltrim([dbo].[fnsplitColumn](6,'-',s.SLOT_TYPE_DESC_TXT))) as [Session Specialty Desc],
rtrim(ltrim([dbo].[fnsplitColumn](6,'-',s.SLOT_TYPE_DESC_TXT))) as [Session Specialty],
rtrim(ltrim([dbo].[fnsplitColumn](3,'-',s.SLOT_TYPE_DESC_TXT))) as [Session_Type],
CAST(NULL as Varchar(100))  as Session_Type_Description,
o.[Operation Type NHS or Private],
s.SLOT_START_DT_TM AS [Session Date],
LTRIM(RIGHT(CONVERT(VARCHAR(20),LOC_SESSION_BEG_DT_TM,100),8))  + '-'+LTRIM(RIGHT(CONVERT(VARCHAR(20),ns.LOC_SESSION_END_DT_TM,100),8)) as [Session Planned Start-End Times],


'' as [Session Team (C-S/A/TL)],
(select distinct RESOURCE_DISP_TXT from UKRWH_CDE_RESOURCE_REF rr where s.RESOURCE_CD=rr.RESOURCE_CD)   as [Site Theatre] ,
rtrim(ltrim([dbo].[fnsplitColumn](4,'-',s.SLOT_TYPE_DESC_TXT))) as 'Session_AM_PM',
rtrim(ltrim([dbo].[fnsplitColumn](5,'-',s.SLOT_TYPE_DESC_TXT))) as 'Consultant',
CAST(NULL as Varchar(100)) as Consultant_Name,
rtrim(ltrim([dbo].[fnsplitColumn](10,'-',s.SLOT_TEMPLATE_DESC_TXT))) as 'Site',
s.SLOT_TYPE_DESC_TXT,s.SLOT_TEMPLATE_DESC_TXT,s.SLOT_START_DT_TM,
s.SCH_APPT_ID,
s.BLOCK_INSTANCE_ID,
s.BLOCK_INSTANCE_ID as [Session ID],

'No' as [Cancelled],
o.[Operation DateTime B1 Anaes Start Earliest],
O.[Operation DateTime C4 OutOf OR Latest],
ns.SESSION_BEG_DT_TM,
ns.SESSION_END_DT_TM,
SURGICAL_CASE_NBR_TXT,
[Operation Patient ID#],
[Operation Patient Name - Family#],
SURGICAL_CASE_ID,
CAST(NULL as Varchar(100)) as TREAT_FNC_CD,
CAST(NULL as Varchar(100)) as MAIN_SPECIALTY_NATIONAL_CODE,
CAST(NULL as Varchar(100)) as CONSULTANT_CODE_NATIONAL,
CAST(NULL as Varchar(100)) as TREATMENT_FUNCTION_CODE_NATIONAL,
CAST(NULL as Varchar(100)) as DivisionCode,
CAST(NULL as Varchar(100)) as CPGCode,
CAST(NULL as Varchar(100)) as 	[Session Treatment Function Desc],
CAST(NULL as Varchar(100)) as [Session Treatment Function Local],
CAST(NULL as Varchar(100)) as 	[Session Theatre Code],
o.[Operation Consultant Name] as 	[Session Owner],
o.Operating_Surgeon as 	[Session Surgeon Name],
o.Anaesthetist_Main as 	[Session Anaesthetist Name],
CAST(NULL as Varchar(100)) as 	[Session Start Period],
 left(convert(varchar(100),convert(time,ACTUAL_FIRST_CASE_START_DT_TM)),2) as 	[Session Start Hour],
convert(varchar(100),convert(time,ACTUAL_FIRST_CASE_START_DT_TM)) as 	[Session Start Time],
o.[Operation Team (S/A/TL)] as 	[Session First Op Team],
CAST(NULL as Varchar(100)) as 	[Session Division ID],
s.ENCNTR_ID,
ns.NUMBER_OF_PLANNED_CASES as [Session Planned Cases],
ns.NUMBER_OF_ACTUAL_CASES_HELD as [Session Actual Cases],
CAST(NULL as Varchar(100)) as TimeStamp,
CAST(NULL as Varchar(1000)) as [Delay Comments],
CAST(NULL as Varchar(1000)) as [Cancel Comments],
o.[Actual_Sequence],
o.Delay_Reason,
0 as Actual_Session_Length,
s.SCH_EVENT_ID,
s.SCHEDULE_ID,
ns.LOC_SESSION_BEG_DT_TM,
ns.LOC_SESSION_END_DT_TM,
o.CANCELLED_DT_TM

from UKRWH_CDE_SCH_APPT_SLOTS s inner join OPERATION_DUMP o on s.SCH_APPT_ID= o.SCH_APPT_ID Inner join NON_CDE_EDW_F_Session_WITH_SEQUENCE ns on ns.SESSION_SK= s.BLOCK_INSTANCE_ID
where (s.SLOT_TYPE_DESC_TXT like 'th%' ) --and s.SCHED_STATUS_CD<>'9543'
And ( exists (Select 1 From UKRWH_CDE_SURGICAL_CASE sc where sc.SCH_APPT_ID = o.SCH_APPT_ID) And s.SCHED_STATUS_CD<>'9543' )
And s.SLOT_START_DT_TM > '09 mar 2015' and s.SLOT_START_DT_TM < convert(varchar(100),CONVERT(date,GetDate(),101),106)  
And exists (select 1 from [THEATRE_AREA_TO_INCLUDE] t where  t.CODE_DISP_TXT = (select RESOURCE_DISP_TXT from UKRWH_CDE_RESOURCE_REF where RESOURCE_CD= s.RESOURCE_CD) and t.include = 'Y')
And ns.Session_Sequence_NBR=1

	
Union all
	
select 
DATEDIFF(MI,o.[Operation DateTime B1 Anaes Start Earliest],O.[Operation DateTime C4 OutOf OR Latest]) as [Session TimeTaken Within Planned]	,
DATEDIFF(MI,LOC_SESSION_BEG_DT_TM,ns.LOC_SESSION_END_DT_TM) as [Session TimePlanned Total],	
DATEDIFF(MI,(SELECT [Operation DateTime B1 Anaes Start] FROM OPERATION_DUMP OD WHERE Actual_Sequence= 1 AND O.SURGICAL_CASE_ID= OD.SURGICAL_CASE_ID),NS.LOC_SESSION_BEG_DT_TM) as [Session TimeLost Late Start],
DATEDIFF(MI,ns.ACTUAL_FIRST_CASE_START_DT_TM,o.[Operation DateTime B1 Anaes Start]) as [Session TimeGained Early Start],	
DATEDIFF(MI,NS.LOC_SESSION_END_DT_TM,O.[Operation DateTime C4 OutOf OR]) as [Session TimeLost Early Finish],
DATEDIFF(MI,ns.SCHED_LAST_CASE_STOP_DT_TM, LOC_SCHED_LAST_CASE_STOP_DT_TM) as SessionTimeGainedLateFinish,
0 as [Operation TimeGap Next Surgery Within Planned1700],
0 as [Operation TimeGap Next Surgery Within Planned1700_Actual],
[Operation Count],
[Operation Flag Cancelled],
LOC_SESSION_BEG_DT_TM as [Session DateTime Planned Start],
ns.LOC_SESSION_END_DT_TM as [Session DateTime Planned End],

o.[Operation DateTime C4 OutOf OR]as [Session DateTime Last Patient End],
[Operation Time Taken B Anaesthetic] as [Session DateTime First Patient Start],
'' AS [Session Cancellation Desc],
'' as [Session Cancel Text],
'' as [Session Exception Comments],
[Operation Cancellation Reason Desc],
'Not captured in Surginet' as [Session Anaesthetic Text],
'' as [Operation Cancellation Text],
[Operation ID],
rtrim(ltrim([dbo].[fnsplitColumn](9,'-',s.SLOT_TEMPLATE_DESC_TXT))) as [Theatre Suite],
rtrim(ltrim([dbo].[fnsplitColumn](6,'-',s.SLOT_TYPE_DESC_TXT))) as [Session Specialty Desc],
rtrim(ltrim([dbo].[fnsplitColumn](6,'-',s.SLOT_TYPE_DESC_TXT))) as [Session Specialty],
rtrim(ltrim([dbo].[fnsplitColumn](3,'-',s.SLOT_TYPE_DESC_TXT))) as [Session_Type],
CAST(NULL as Varchar(100)) as  Session_Type_Description,
o.[Operation Type NHS or Private],
s.SLOT_START_DT_TM AS [Session Date],
LTRIM(RIGHT(CONVERT(VARCHAR(20),LOC_SESSION_BEG_DT_TM,100),8))  + '-'+LTRIM(RIGHT(CONVERT(VARCHAR(20),ns.LOC_SESSION_END_DT_TM,100),8)) as [Session Planned Start-End Times],

--Q.PlannedStartTime + '-'+ q.PlannedEndTime as [Session Planned Start-End Times],
'' as [Session Team (C-S/A/TL)],
--rtrim(ltrim([dbo].[fnsplitColumn](10,'-',s.SLOT_TEMPLATE_DESC_TXT)))+ ' '+rtrim(ltrim([dbo].[fnsplitColumn](9,'-',s.SLOT_TEMPLATE_DESC_TXT))) as [Site Theatre]  ,
(select distinct RESOURCE_DISP_TXT from UKRWH_CDE_RESOURCE_REF rr where s.RESOURCE_CD=rr.RESOURCE_CD)   as [Site Theatre] ,
rtrim(ltrim([dbo].[fnsplitColumn](4,'-',s.SLOT_TYPE_DESC_TXT))) as 'Session_AM_PM',
rtrim(ltrim([dbo].[fnsplitColumn](5,'-',s.SLOT_TYPE_DESC_TXT))) as 'Consultant',
CAST(NULL as Varchar(100)) as Consultant_Name,
rtrim(ltrim([dbo].[fnsplitColumn](10,'-',s.SLOT_TEMPLATE_DESC_TXT))) as 'Site',
s.SLOT_TYPE_DESC_TXT,s.SLOT_TEMPLATE_DESC_TXT,s.SLOT_START_DT_TM,
s.SCH_APPT_ID,
s.BLOCK_INSTANCE_ID,
s.BLOCK_INSTANCE_ID as [Session ID],
'Yes' as [Cancelled],
o.[Operation DateTime B1 Anaes Start Earliest],
O.[Operation DateTime C4 OutOf OR Latest],
ns.SESSION_BEG_DT_TM,
ns.SESSION_END_DT_TM,
SURGICAL_CASE_NBR_TXT,
[Operation Patient ID#],
[Operation Patient Name - Family#],
SURGICAL_CASE_ID,
CAST(NULL as Varchar(100)) as TREAT_FNC_CD,
CAST(NULL as Varchar(100)) as MAIN_SPECIALTY_NATIONAL_CODE,
CAST(NULL as Varchar(100)) as CONSULTANT_CODE_NATIONAL,
CAST(NULL as Varchar(100)) as TREATMENT_FUNCTION_CODE_NATIONAL,
CAST(NULL as Varchar(100)) as DivisionCode,
CAST(NULL as Varchar(100)) as CPGCode,
CAST(NULL as Varchar(100)) as 	[Session Treatment Function Desc],
CAST(NULL as Varchar(100)) as [Session Treatment Function Local],
CAST(NULL as Varchar(100)) as 	[Session Theatre Code],
o.[Operation Consultant Name] as 	[Session Owner],
o.Operating_Surgeon as 	[Session Surgeon Name],
o.Anaesthetist_Main as 	[Session Anaesthetist Name],
CAST(NULL as Varchar(100)) as 	[Session Start Period],
 left(convert(varchar(100),convert(time,ACTUAL_FIRST_CASE_START_DT_TM)),2) as 	[Session Start Hour],
convert(varchar(100),convert(time,ACTUAL_FIRST_CASE_START_DT_TM)) as 	[Session Start Time],
o.[Operation Team (S/A/TL)] as 	[Session First Op Team],
CAST(NULL as Varchar(100)) as 	[Session Division ID],
s.ENCNTR_ID,
ns.NUMBER_OF_PLANNED_CASES as [Session Planned Cases],
ns.NUMBER_OF_ACTUAL_CASES_HELD as [Session Actual Cases],
CAST(NULL as Varchar(100)) as TimeStamp,
CAST(NULL as Varchar(1000)) as [Delay Comments],
CAST(NULL as Varchar(1000)) as [Cancel Comments],
o.[Actual_Sequence],
o.Delay_Reason,
0 as Actual_Session_Length,
s.SCH_EVENT_ID,
s.SCHEDULE_ID,
ns.LOC_SESSION_BEG_DT_TM,
ns.LOC_SESSION_END_DT_TM,
o.CANCELLED_DT_TM

from UKRWH_CDE_SCH_APPT_REMOVED_THEATRE_SLOTS s left outer join OPERATION_DUMP o on s.SCH_APPT_ID= o.SCH_APPT_ID 
left outer join NON_CDE_EDW_F_Session_WITH_SEQUENCE ns on ns.SESSION_SK= s.BLOCK_INSTANCE_ID and ns.Session_Sequence_NBR=1
Where (s.SLOT_TYPE_DESC_TXT like 'th%' ) and s.SCHED_STATUS_CD<>'9543' 
and  s.SLOT_START_DT_TM > '09 mar 2015' and s.SLOT_START_DT_TM < convert(varchar(100),CONVERT(date,GetDate(),101),106)  and s.SLOT_TYPE_DESC_TXT like '%cancel%'
and exists (select 1 from [THEATRE_AREA_TO_INCLUDE] t where  t.CODE_DISP_TXT = (select RESOURCE_DISP_TXT from UKRWH_CDE_RESOURCE_REF where RESOURCE_CD= s.RESOURCE_CD) and t.include = 'Y')

and s.SLOT_TYPE_DESC_TXT like '%cancel%'


Union All

select 
DATEDIFF(MI,o.[Operation DateTime B1 Anaes Start Earliest],O.[Operation DateTime C4 OutOf OR Latest]) as [Session TimeTaken Within Planned]	,
DATEDIFF(MI,LOC_SESSION_BEG_DT_TM,ns.LOC_SESSION_END_DT_TM) as [Session TimePlanned Total],	
DATEDIFF(MI,(SELECT [Operation DateTime B1 Anaes Start] FROM OPERATION_DUMP OD WHERE Actual_Sequence= 1 AND O.SURGICAL_CASE_ID= OD.SURGICAL_CASE_ID),NS.LOC_SESSION_BEG_DT_TM) as [Session TimeLost Late Start],
DATEDIFF(MI,ns.ACTUAL_FIRST_CASE_START_DT_TM,o.[Operation DateTime B1 Anaes Start]) as [Session TimeGained Early Start],	
DATEDIFF(MI,NS.LOC_SESSION_END_DT_TM,O.[Operation DateTime C4 OutOf OR]) as [Session TimeLost Early Finish],
DATEDIFF(MI,ns.SCHED_LAST_CASE_STOP_DT_TM, LOC_SCHED_LAST_CASE_STOP_DT_TM) as SessionTimeGainedLateFinish,
0 as [Operation TimeGap Next Surgery Within Planned1700],
0 as [Operation TimeGap Next Surgery Within Planned1700_Actual],
[Operation Count],
[Operation Flag Cancelled],
LOC_SESSION_BEG_DT_TM as [Session DateTime Planned Start],
ns.LOC_SESSION_END_DT_TM as [Session DateTime Planned End],

o.[Operation DateTime C4 OutOf OR]as [Session DateTime Last Patient End],
[Operation Time Taken B Anaesthetic] as [Session DateTime First Patient Start],
'' AS [Session Cancellation Desc],
'' as [Session Cancel Text],
'' as [Session Exception Comments],
[Operation Cancellation Reason Desc],
'Not captured in Surginet' as [Session Anaesthetic Text],
'' as [Operation Cancellation Text],
[Operation ID],
rtrim(ltrim([dbo].[fnsplitColumn](9,'-',s.SLOT_TEMPLATE_DESC_TXT))) as [Theatre Suite],
rtrim(ltrim([dbo].[fnsplitColumn](6,'-',s.SLOT_TYPE_DESC_TXT))) as [Session Specialty Desc],
rtrim(ltrim([dbo].[fnsplitColumn](6,'-',s.SLOT_TYPE_DESC_TXT))) as [Session Specialty],
rtrim(ltrim([dbo].[fnsplitColumn](3,'-',s.SLOT_TYPE_DESC_TXT))) as [Session_Type],
CAST(NULL as Varchar(100)) as  Session_Type_Description,
o.[Operation Type NHS or Private],
s.SLOT_START_DT_TM AS [Session Date],
LTRIM(RIGHT(CONVERT(VARCHAR(20),LOC_SESSION_BEG_DT_TM,100),8))  + '-'+LTRIM(RIGHT(CONVERT(VARCHAR(20),ns.LOC_SESSION_END_DT_TM,100),8)) as [Session Planned Start-End Times],

--Q.PlannedStartTime + '-'+ q.PlannedEndTime as [Session Planned Start-End Times],
'' as [Session Team (C-S/A/TL)],
--rtrim(ltrim([dbo].[fnsplitColumn](10,'-',s.SLOT_TEMPLATE_DESC_TXT)))+ ' '+rtrim(ltrim([dbo].[fnsplitColumn](9,'-',s.SLOT_TEMPLATE_DESC_TXT))) as [Site Theatre]  ,
(select distinct RESOURCE_DISP_TXT from UKRWH_CDE_RESOURCE_REF rr where s.RESOURCE_CD=rr.RESOURCE_CD)   as [Site Theatre] ,
rtrim(ltrim([dbo].[fnsplitColumn](4,'-',s.SLOT_TYPE_DESC_TXT))) as 'Session_AM_PM',
rtrim(ltrim([dbo].[fnsplitColumn](5,'-',s.SLOT_TYPE_DESC_TXT))) as 'Consultant',
CAST(NULL as Varchar(100)) as Consultant_Name,
rtrim(ltrim([dbo].[fnsplitColumn](10,'-',s.SLOT_TEMPLATE_DESC_TXT))) as 'Site',
s.SLOT_TYPE_DESC_TXT,s.SLOT_TEMPLATE_DESC_TXT,s.SLOT_START_DT_TM,
s.SCH_APPT_ID,
s.BLOCK_INSTANCE_ID,
s.BLOCK_INSTANCE_ID as [Session ID],
'Yes' as [Cancelled],
o.[Operation DateTime B1 Anaes Start Earliest],
O.[Operation DateTime C4 OutOf OR Latest],
ns.SESSION_BEG_DT_TM,
ns.SESSION_END_DT_TM,
SURGICAL_CASE_NBR_TXT,
[Operation Patient ID#],
[Operation Patient Name - Family#],
SURGICAL_CASE_ID,
CAST(NULL as Varchar(100)) as TREAT_FNC_CD,
CAST(NULL as Varchar(100)) as MAIN_SPECIALTY_NATIONAL_CODE,
CAST(NULL as Varchar(100)) as CONSULTANT_CODE_NATIONAL,
CAST(NULL as Varchar(100)) as TREATMENT_FUNCTION_CODE_NATIONAL,
CAST(NULL as Varchar(100)) as DivisionCode,
CAST(NULL as Varchar(100)) as CPGCode,
CAST(NULL as Varchar(100)) as 	[Session Treatment Function Desc],
CAST(NULL as Varchar(100)) as [Session Treatment Function Local],
CAST(NULL as Varchar(100)) as 	[Session Theatre Code],
o.[Operation Consultant Name] as 	[Session Owner],
o.Operating_Surgeon as 	[Session Surgeon Name],
o.Anaesthetist_Main as 	[Session Anaesthetist Name],
CAST(NULL as Varchar(100)) as 	[Session Start Period],
 left(convert(varchar(100),convert(time,ACTUAL_FIRST_CASE_START_DT_TM)),2) as 	[Session Start Hour],
convert(varchar(100),convert(time,ACTUAL_FIRST_CASE_START_DT_TM)) as 	[Session Start Time],
o.[Operation Team (S/A/TL)] as 	[Session First Op Team],
CAST(NULL as Varchar(100)) as 	[Session Division ID],
s.ENCNTR_ID,
ns.NUMBER_OF_PLANNED_CASES as [Session Planned Cases],
ns.NUMBER_OF_ACTUAL_CASES_HELD as [Session Actual Cases],
CAST(NULL as Varchar(100)) as TimeStamp,
CAST(NULL as Varchar(1000)) as [Delay Comments],
CAST(NULL as Varchar(1000)) as [Cancel Comments],
o.[Actual_Sequence],
o.Delay_Reason,
0 as Actual_Session_Length,
s.SCH_EVENT_ID,
s.SCHEDULE_ID,
ns.LOC_SESSION_BEG_DT_TM,
ns.LOC_SESSION_END_DT_TM,
o.CANCELLED_DT_TM
from UKRWH_CDE_SCH_APPT_SLOTS s inner join OPERATION_DUMP o on s.SCH_APPT_ID= o.SCH_APPT_ID Inner join NON_CDE_EDW_F_Session_WITH_SEQUENCE ns on ns.SESSION_SK= s.BLOCK_INSTANCE_ID
where (s.SLOT_TYPE_DESC_TXT like 'th%' ) --and s.SCHED_STATUS_CD<>'9543'
And ( exists (Select 1 From UKRWH_CDE_SURGICAL_CASE sc where sc.SCH_APPT_ID = o.SCH_APPT_ID and sc.CHECK_IN_DT_TM is not null) And s.SCHED_STATUS_CD='9543' )
And s.SLOT_START_DT_TM > '09 mar 2015' and s.SLOT_START_DT_TM < convert(varchar(100),CONVERT(date,GetDate(),101),106)  
And exists (select 1 from [THEATRE_AREA_TO_INCLUDE] t where  t.CODE_DISP_TXT = (select RESOURCE_DISP_TXT from UKRWH_CDE_RESOURCE_REF where RESOURCE_CD= s.RESOURCE_CD) and t.include = 'Y')
And ns.Session_Sequence_NBR=1
)q



Update Theatre_Utilization_Report
Set [Session TimeTaken Within Planned]  = 0
Where [Session TimeTaken Within Planned] is null

Update Theatre_Utilization_Report
Set Site= rtrim(ltrim([dbo].[fnsplitColumn](4,' ',[Site Theatre])))

Update Theatre_Utilization_Report
Set Site= rtrim(ltrim([dbo].[fnsplitColumn](3,' ',[Site Theatre])))
Where Site is null

Update Theatre_Utilization_Report
Set SessionTimeGainedLateFinish= (
Case
	When DATEDIFF(SECOND,CAST(ns.LOC_SESSION_END_DT_TM as datetime),o.[Operation DateTime C4 OutOf OR Latest])/60 > 0 Then  DATEDIFF(SECOND,CAST(ns.LOC_SESSION_END_DT_TM as datetime),o.[Operation DateTime C4 OutOf OR Latest])/60 
End)
from UKRWH_CDE_SCH_APPT_SLOTS s inner join OPERATION_DUMP o on s.SCH_APPT_ID= o.SCH_APPT_ID Inner join NON_CDE_EDW_F_Session_WITH_SEQUENCE ns on ns.SESSION_SK= s.BLOCK_INSTANCE_ID
inner join Theatre_Utilization_Report t on t.BLOCK_INSTANCE_ID= o.BLOCK_INSTANCE_ID
where (s.SLOT_TYPE_DESC_TXT like 'th%' )
and s.SLOT_START_DT_TM > '09 mar 2015' and s.SLOT_START_DT_TM < convert(varchar(100),CONVERT(date,GetDate(),101),106) 

and exists (select 1 from [THEATRE_AREA_TO_INCLUDE] t where  t.CODE_DISP_TXT = (select RESOURCE_DISP_TXT from UKRWH_CDE_RESOURCE_REF where RESOURCE_CD= s.RESOURCE_CD) and t.include = 'Y')
and ns.Session_Sequence_NBR=1

Update Theatre_Utilization_Report
Set [Session TimeLost Early Finish] = (
Case
	When DATEDIFF(SECOND,CAST(ns.LOC_SESSION_END_DT_TM as datetime),o.[Operation DateTime C4 OutOf OR Latest])/60 < 0 Then  DATEDIFF(SECOND,CAST(ns.LOC_SESSION_END_DT_TM as datetime),o.[Operation DateTime C4 OutOf OR Latest])/60 
End)
from UKRWH_CDE_SCH_APPT_SLOTS s inner join OPERATION_DUMP o on s.SCH_APPT_ID= o.SCH_APPT_ID Inner join NON_CDE_EDW_F_Session_WITH_SEQUENCE ns on ns.SESSION_SK= s.BLOCK_INSTANCE_ID
inner join Theatre_Utilization_Report t on t.BLOCK_INSTANCE_ID= o.BLOCK_INSTANCE_ID
where (s.SLOT_TYPE_DESC_TXT like 'th%' )
and s.SLOT_START_DT_TM > '09 mar 2015' and s.SLOT_START_DT_TM < convert(varchar(100),CONVERT(date,GetDate(),101),106)  
and exists (select 1 from [THEATRE_AREA_TO_INCLUDE] t where  t.CODE_DISP_TXT = (select RESOURCE_DISP_TXT from UKRWH_CDE_RESOURCE_REF where RESOURCE_CD= s.RESOURCE_CD) and t.include = 'Y')
and ns.Session_Sequence_NBR=1


Update Theatre_Utilization_Report
Set [Session TimeLost Late Start]= (
Case

	When DATEDIFF(SECOND,ns.LOC_SESSION_BEG_DT_TM,o.[Operation DateTime B1 Anaes Start Earliest])/60 > 0 Then  DATEDIFF(SECOND,ns.LOC_SESSION_BEG_DT_TM,o.[Operation DateTime B1 Anaes Start Earliest])/60 
	
End)
from UKRWH_CDE_SCH_APPT_SLOTS s inner join OPERATION_DUMP o on s.SCH_APPT_ID= o.SCH_APPT_ID Inner join NON_CDE_EDW_F_Session_WITH_SEQUENCE ns on ns.SESSION_SK= s.BLOCK_INSTANCE_ID
inner join Theatre_Utilization_Report t on t.BLOCK_INSTANCE_ID= o.BLOCK_INSTANCE_ID
where (s.SLOT_TYPE_DESC_TXT like 'th%' )
and s.SLOT_START_DT_TM > '09 mar 2015' and s.SLOT_START_DT_TM < convert(varchar(100),CONVERT(date,GetDate(),101),106)  
and exists (select 1 from [THEATRE_AREA_TO_INCLUDE] t where  t.CODE_DISP_TXT = (select RESOURCE_DISP_TXT from UKRWH_CDE_RESOURCE_REF where RESOURCE_CD= s.RESOURCE_CD) and t.include = 'Y')
and ns.Session_Sequence_NBR=1


Update Theatre_Utilization_Report
Set [Session TimeGained Early Start]  = (
Case
	When DATEDIFF(SECOND,ns.LOC_SESSION_BEG_DT_TM,o.[Operation DateTime B1 Anaes Start Earliest])/60 < 0 Then  DATEDIFF(SECOND,ns.LOC_SESSION_BEG_DT_TM,o.[Operation DateTime B1 Anaes Start Earliest])/60 
End)
from UKRWH_CDE_SCH_APPT_SLOTS s inner join OPERATION_DUMP o on s.SCH_APPT_ID= o.SCH_APPT_ID Inner join NON_CDE_EDW_F_Session_WITH_SEQUENCE ns on ns.SESSION_SK= s.BLOCK_INSTANCE_ID
inner join Theatre_Utilization_Report t on t.BLOCK_INSTANCE_ID= o.BLOCK_INSTANCE_ID
where (s.SLOT_TYPE_DESC_TXT like 'th%' )
and s.SLOT_START_DT_TM > '09 mar 2015' and s.SLOT_START_DT_TM < convert(varchar(100),CONVERT(date,GetDate(),101),106)  
and exists (select 1 from [THEATRE_AREA_TO_INCLUDE] t where  t.CODE_DISP_TXT = (select RESOURCE_DISP_TXT from UKRWH_CDE_RESOURCE_REF where RESOURCE_CD= s.RESOURCE_CD) and t.include = 'Y')
and ns.Session_Sequence_NBR=1

Update Theatre_Utilization_Report
Set [Operation Count] = 0
Where[Cancelled]		= 'Yes'

Update Theatre_Utilization_Report
Set [Operation Count] = 1
Where[Cancelled]		= 'No'


Update dbo.Theatre_Utilization_Report
Set [Operation TimeGap Next Surgery Within Planned1700]= 
    sp.[Operation TimeGap Next Surgery Within Planned1700_1]+sp.[Operation TimeGap Next Surgery Within Planned1700_2]+
	sp.[Operation TimeGap Next Surgery Within Planned1700_3]+sp.[Operation TimeGap Next Surgery Within Planned1700_4]+sp.[Operation TimeGap Next Surgery Within Planned1700_5]+
	sp.[Operation TimeGap Next Surgery Within Planned1700_6]+sp.[Operation TimeGap Next Surgery Within Planned1700_7]+sp.[Operation TimeGap Next Surgery Within Planned1700_8]+
	sp.[Operation TimeGap Next Surgery Within Planned1700_9]+sp.[Operation TimeGap Next Surgery Within Planned1700_10]+sp.[Operation TimeGap Next Surgery Within Planned1700_11]+
	sp.[Operation TimeGap Next Surgery Within Planned1700_12]+sp.[Operation TimeGap Next Surgery Within Planned1700_13]+sp.[Operation TimeGap Next Surgery Within Planned1700_14]+
	sp.[Operation TimeGap Next Surgery Within Planned1700_15]+sp.[Operation TimeGap Next Surgery Within Planned1700_16]+sp.[Operation TimeGap Next Surgery Within Planned1700_17]+
	sp.[Operation TimeGap Next Surgery Within Planned1700_18]+sp.[Operation TimeGap Next Surgery Within Planned1700_19]+sp.[Operation TimeGap Next Surgery Within Planned1700_20]

From Theatre_Utilization_Report t inner join CDE_SESSION_OPERATION_TIMING_ACTUAL_PIVOT sp on t.BLOCK_INSTANCE_ID=sp.BLOCK_INSTANCE_ID

Update dbo.Theatre_Utilization_Report
Set [Operation TimeGap Next Surgery Within Planned1700_Actual]= 
    sp.[Operation TimeGap Next Surgery Within Planned1700_1]+sp.[Operation TimeGap Next Surgery Within Planned1700_2]+
	sp.[Operation TimeGap Next Surgery Within Planned1700_3]+sp.[Operation TimeGap Next Surgery Within Planned1700_4]+sp.[Operation TimeGap Next Surgery Within Planned1700_5]+
	sp.[Operation TimeGap Next Surgery Within Planned1700_6]+sp.[Operation TimeGap Next Surgery Within Planned1700_7]+sp.[Operation TimeGap Next Surgery Within Planned1700_8]+
	sp.[Operation TimeGap Next Surgery Within Planned1700_9]+sp.[Operation TimeGap Next Surgery Within Planned1700_10]+sp.[Operation TimeGap Next Surgery Within Planned1700_11]+
	sp.[Operation TimeGap Next Surgery Within Planned1700_12]+sp.[Operation TimeGap Next Surgery Within Planned1700_13]+sp.[Operation TimeGap Next Surgery Within Planned1700_14]+
	sp.[Operation TimeGap Next Surgery Within Planned1700_15]+sp.[Operation TimeGap Next Surgery Within Planned1700_16]+sp.[Operation TimeGap Next Surgery Within Planned1700_17]+
	sp.[Operation TimeGap Next Surgery Within Planned1700_18]+sp.[Operation TimeGap Next Surgery Within Planned1700_19]+sp.[Operation TimeGap Next Surgery Within Planned1700_20]

From Theatre_Utilization_Report t inner join CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT sp on t.BLOCK_INSTANCE_ID=sp.BLOCK_INSTANCE_ID




Update dbo.Theatre_Utilization_Report
Set [Session TimeTaken Within Planned]= [Total Planned Session Time]-[Operation TimeGap Next Surgery Within Planned1700_Actual]
From Theatre_Utilization_Report t inner join 
(select   convert(varchar(100),convert(datetime,ns.LOC_SESSION_BEG_DT_TM)  ,113) as LOC_SESSION_BEG_DT_TM ,convert(varchar(100),convert(datetime,ns.LOC_SESSION_END_DT_TM)  ,113) as SESSION_End_DT_TM ,
DATEDIFF(MI,convert(varchar(100),convert(datetime,ns.LOC_SESSION_BEG_DT_TM)  ,113),convert(varchar(100),convert(datetime,ns.LOC_SESSION_END_DT_TM)  ,113)) as [Total Planned Session Time],	
ns.SESSION_SK, o.BLOCK_INSTANCE_ID
from OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned_PIVOT  o Inner join NON_CDE_EDW_F_Session_WITH_SEQUENCE ns on ns.SESSION_SK= o.BLOCK_INSTANCE_ID
where ns.Session_Sequence_NBR=1)q on q.SESSION_SK= t.BLOCK_INSTANCE_ID


-- Late Start
Update dbo.Theatre_Utilization_Report
Set [Session TimeTaken Within Planned]= [Session TimeTaken Within Planned]-q.[Total late start Time]
From Theatre_Utilization_Report t inner join 
(select   convert(varchar(100),eas.[Operation DateTime B1 Anaes Start]  ,113) as [Operation DateTime B1 Anaes Start],convert(varchar(100),convert(datetime,ns.LOC_SESSION_BEG_DT_TM)  ,113) as SESSION_BEG_DT_TM 
,convert(varchar(100),convert(datetime,ns.LOC_SESSION_END_DT_TM)  ,113) as SESSION_End_DT_TM ,
DATEDIFF(MI,convert(varchar(100),convert(datetime,ns.LOC_SESSION_BEG_DT_TM)  ,113),convert(varchar(100),convert(datetime,eas.[Operation DateTime B1 Anaes Start])  ,113)) as [Total late start Time],	
ns.SESSION_SK, eas.BLOCK_INSTANCE_ID
from OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned  o Inner join NON_CDE_EDW_F_Session_WITH_SEQUENCE ns on ns.SESSION_SK= o.BLOCK_INSTANCE_ID
inner join Anaes_Start_Sequence_FOR_OPERATION_DUMP EAS on eas.BLOCK_INSTANCE_ID= o.BLOCK_INSTANCE_ID
where ns.Session_Sequence_NBR=1 and DATEDIFF(MI,convert(varchar(100),convert(datetime,ns.LOC_SESSION_BEG_DT_TM)  ,113),convert(varchar(100),convert(datetime,eas.[Operation DateTime B1 Anaes Start])  ,113))>0
and eas.Anaes_Start_Sequence_NBR= 1 and  ns.Session_Sequence_NBR=1
and convert(datetime,eas.[Operation DateTime B1 Anaes Start]  ,113)= convert(datetime,o.[Operation DateTime B1 Anaes Start]  ,113))q
On t.BLOCK_INSTANCE_ID= q.SESSION_SK

-- Early Finish
Update dbo.Theatre_Utilization_Report
Set [Session TimeTaken Within Planned]= [Session TimeTaken Within Planned]-q.[Total Early Finish Time]
From Theatre_Utilization_Report t inner join 
(select   convert(varchar(100),OOT.[Operation DateTime C4 OutOf OR]  ,113) as [Operation DateTime C4 OutOf OR],convert(varchar(100),convert(datetime,ns.LOC_SESSION_BEG_DT_TM)  ,113) as SESSION_BEG_DT_TM 
,convert(varchar(100),convert(datetime,ns.LOC_SESSION_END_DT_TM)  ,113) as SESSION_End_DT_TM ,
ABS(DATEDIFF(MI,convert(varchar(100),convert(datetime,ns.LOC_SESSION_END_DT_TM)  ,113),convert(varchar(100),convert(datetime,OOT.[Operation DateTime C4 OutOf OR])  ,113))) as [Total Early Finish Time],	
ns.SESSION_SK, OOT.BLOCK_INSTANCE_ID
from OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned  o Inner join NON_CDE_EDW_F_Session_WITH_SEQUENCE ns on ns.SESSION_SK= o.BLOCK_INSTANCE_ID
inner join OUT_OF_THEATRE_Sequence_FOR_OPERATION_DUMP OOT on OOT.BLOCK_INSTANCE_ID= o.BLOCK_INSTANCE_ID
where ns.Session_Sequence_NBR=1 and DATEDIFF(MI,convert(varchar(100),convert(datetime,ns.LOC_SESSION_END_DT_TM)  ,113),convert(varchar(100),convert(datetime,OOT.[Operation DateTime C4 OutOf OR])  ,113))<0
and OOT.OUT_OF_THEATRE_Sequence_NBR= 1 and  ns.Session_Sequence_NBR=1
and convert(datetime,OOT.[Operation DateTime C4 OutOf OR]  ,113)= convert(datetime,o.[Operation DateTime C4 OutOf OR]  ,113))q
On t.BLOCK_INSTANCE_ID= q.SESSION_SK

ALTER TABLE Theatre_Utilization_Report
ALTER COLUMN [Session TimeTaken Within Planned] float

Update dbo.Theatre_Utilization_Report
Set [Session TimeTaken Within Planned]= ([Session TimeTaken Within Planned]* 100)/ABS(DATEDIFF(MI,convert(varchar(100),convert(datetime,LOC_SESSION_BEG_DT_TM)  ,113),convert(varchar(100),convert(datetime,LOC_SESSION_END_DT_TM)  ,113)))
From Theatre_Utilization_Report
Where ABS(DATEDIFF(MI,convert(varchar(100),convert(datetime,LOC_SESSION_BEG_DT_TM)  ,113),convert(varchar(100),convert(datetime,LOC_SESSION_END_DT_TM)  ,113)))<>0


Update dbo.Theatre_Utilization_Report
Set
TREAT_FNC_CD= q.TREAT_FNC_CD ,
MAIN_SPECIALTY_NATIONAL_CODE	=	COALESCE(Cast((Select distinct ALIAS_NHS_CD_ALIAS  from UKRWH_CDE_CODE_VALUE_REF WITH (nolock)  Where q.MAIN_SPEC_CD	 = CODE_VALUE_CD) as Varchar(500)),Null) ,
CONSULTANT_CODE_NATIONAL= (select distinct HCP_NHS_CD_ALIAS_IDENT from UKRWH_CDE_PRSNL_REF where PERSONNEL_ID= q.RESP_HCP_PRSNL_ID),
TREATMENT_FUNCTION_CODE_NATIONAL=	COALESCE(Cast((Select distinct substring(ALIAS_NHS_CD_ALIAS,1,3)  from UKRWH_CDE_CODE_VALUE_REF WITH (nolock)  Where q.TREAT_FNC_CD	 = CODE_VALUE_CD) as Varchar(500)),Null),

[Session Treatment Function Desc]=COALESCE(Cast((Select distinct CODE_DESC_TXT  from UKRWH_CDE_CODE_VALUE_REF WITH (nolock)  Where q.MAIN_SPEC_CD	 = CODE_VALUE_CD) as Varchar(500)),Null) ,
[Session Treatment Function Local]= 	COALESCE(Cast((q.LOCAL_SPECIALTY_CD_ALIAS) as Varchar(500)),Null),
[Session Theatre Code]= [site theatre]


From Theatre_Utilization_Report T Inner join (
select
e.ADMIN_CATEGORY_NHS_CD_ALIAS,
e.OSV_STATUS_CD,
e.TREAT_FNC_CD,
e.MAIN_SPEC_CD ,
e.GMP_NHS_IDENT,
e.GMP_PRACTICE_NHS_ORG_ALIAS,
e.ADDR_LINE1_TXT,
e.ADDR_LINE2_TXT,
e.ADDR_LINE3_TXT,
e.ADDR_LINE4_TXT,
e.PCT_RESIDENCE_NHS_CD_ALIAS,
e.RESP_HCP_PRSNL_ID,
e.CDS_TYPE_NHS_CD_ALIAS,
e.ENCNTR_ID,
e.EPISODE_ID,
e.EXTRACT_DT_TM	,
e.LOCAL_SPECIALTY_CD_ALIAS,
e.RTT_STATUS_CD,
e.CDS_UNIQUE_IDENT,
e.CDS_UPDATE_DEL_NHS_CD_ALIAS,
e.CDS_VERSION_NBR
From  UKRWH_CDE_CDS_EVENT e) q  on t.ENCNTR_ID= q.ENCNTR_ID


--LOCAL
UPDATE Theatre_Utilization_Report
SET DivisionCode = [Cerner_ReferenceData].[dbo].[Dim_TreatmentFunction].DivisionCode,
	CPGCode= [Cerner_ReferenceData].[dbo].[Dim_TreatmentFunction].CPGcode,
	[Session Division ID]= [Cerner_ReferenceData].[dbo].[Dim_TreatmentFunction].DivisionCode
FROM dbo.Theatre_Utilization_Report WITH (nolock) LEFT OUTER JOIN
[Cerner_ReferenceData].[dbo].[Dim_TreatmentFunction] WITH (nolock) ON dbo.Theatre_Utilization_Report.[Session Treatment Function Local] = [Cerner_ReferenceData].[dbo].[Dim_TreatmentFunction].TreatmentFunctionLocalCode
WHERE dbo.Theatre_Utilization_Report.DivisionCode IS NULL OR dbo.Theatre_Utilization_Report.DivisionCode = ''
 
 --NATIONAL
UPDATE Theatre_Utilization_Report
SET DivisionCode = [Cerner_ReferenceData].[dbo].[Dim_TreatmentFunction].DivisionCode,
	CPGCode= [Cerner_ReferenceData].[dbo].[Dim_TreatmentFunction].CPGcode,
	[Session Division ID]= [Cerner_ReferenceData].[dbo].[Dim_TreatmentFunction].DivisionCode
FROM dbo.Theatre_Utilization_Report WITH (nolock) LEFT OUTER JOIN
[Cerner_ReferenceData].[dbo].[Dim_TreatmentFunction] WITH (nolock) ON dbo.Theatre_Utilization_Report.TREATMENT_FUNCTION_CODE_NATIONAL = [Cerner_ReferenceData].[dbo].[Dim_TreatmentFunction].TreatmentFunctionCode




Update Theatre_Utilization_Report
set [Session Start Period] = 
	Case 
	When cast([Session Start Hour] as integer) between 0 and 5 Then '00-06hrs'
	When cast([Session Start Hour] as integer) between 6 and 11 Then '06-12hrs'
	When cast([Session Start Hour] as integer) between 12 and 17 Then '12-18hrs'
	When cast([Session Start Hour] as integer) between 18 and 23 Then '18-24hrs'
	 End


UPDATE Theatre_Utilization_Report
SET --DivisionCode = q.DivisionCode,
	--CPGCode= q.CPGcode,
	--[Session Division ID]= q.DivisionCode
      [TREAT_FNC_CD]=q.TREAT_FNC_CD
      ,[MAIN_SPECIALTY_NATIONAL_CODE]=q.MAIN_SPECIALTY_NATIONAL_CODE
      ,[CONSULTANT_CODE_NATIONAL]=q.CONSULTANT_CODE_NATIONAL
      ,[TREATMENT_FUNCTION_CODE_NATIONAL]=q.TREATMENT_FUNCTION_CODE_NATIONAL
      ,[Session Treatment Function Desc]=q.[Session Treatment Function Desc]
      ,[Session Treatment Function Local]=	q.[Session Treatment Function Local]
From Theatre_Utilization_Report T Inner Join ( Select * from 	Theatre_Utilization_Report T1 Where DivisionCode is not null) q
On T.[Session ID]= q.[Session ID]
Where T.DivisionCode is null and t.[Session ID]= q.[Session ID]

--UPDATE Theatre_Utilization_Report
--SET Timestamp =

UPDATE Theatre_Utilization_Report
SET Timestamp = getdate()


UPDATE Theatre_Utilization_Report
SET Session_Type_Description = (Case Session_Type
									When  'TR' Then 'TRAUMA'
									When 'WLI' Then 'WAITING LIST INITIATIVE'
									When 'PP' Then 'PRIVATE'
									When 'EM' Then 'EMERGENCY'
									
									When 'EL' Then 'ELECTIVE'
									When 'WL' Then 'WAITING LIST INITIATIVE'
									When 'PM' Then 'NOT SESSION TYPES'
									When 'AD' Then 'NOT SESSION TYPES'
									When 'MT' Then 'MOBILE THEATRE'

									End )
									
From Theatre_Utilization_Report

UPDATE Theatre_Utilization_Report
SET Consultant_Name=c.[Cerner Consultant]
From Theatre_Utilization_Report T inner Join DIM_Theatre_Consultants c on t.Consultant= c.[Slot Consultant] And t.[Session Specialty]= c.[Slot Specialty] 

UPDATE Theatre_Utilization_Report
SET Consultant_Name=Consultant
From Theatre_Utilization_Report T
Where Consultant_Name is null

UPDATE Theatre_Utilization_Report
SET Consultant_Name=c.[Cerner Consultant]
From Theatre_Utilization_Report T inner Join DIM_Theatre_Consultants c on t.Consultant= c.[Slot Consultant] And t.[Session Specialty]= c.[Slot Specialty] 


UPDATE Theatre_Utilization_Report
Set DivisionCode=c.Divison,
[Session Division ID]=c.Divison,
[Session Specialty Desc]= c.[Cerner Specialty]
From Theatre_Utilization_Report T inner Join DIM_Theatre_DIV_Specialty c on  t.[Session Specialty]= c.[Slot Specialty] 


UPDATE Theatre_Utilization_Report
Set DivisionCode=c.Divison,
[Session Specialty Desc]= c.[Cerner Specialty]
From Theatre_Utilization_Report T inner Join DIM_Theatre_DIV_Specialty c on  t.[Session Specialty]= c.[Slot Specialty] 
where DivisionCode is null or DivisionCode = ''



UPDATE Theatre_Utilization_Report
SET Consultant_Name='CANCELLED'
From Theatre_Utilization_Report
where Consultant_Name= 'UNKNOWN'

Update Theatre_Utilization_Report
SET [Session Theatre Code]= [site theatre]
From Theatre_Utilization_Report


UPDATE Theatre_Utilization_Report
Set DivisionCode= 'Z',
[Session Division ID]= 'Z'
Where [Session Specialty Desc]= 'EMERGENCY' Or [Session Specialty Desc]= 'MAJOR TRAUMA'


UPDATE Theatre_Utilization_Report
Set [Cancel Comments]= rtrim(ltrim([dbo].[fnsplitColumn](1,'-',SLOT_TYPE_DESC_TXT)))
From Theatre_Utilization_Report where Consultant_Name = 'cancelled'

UPDATE Theatre_Utilization_Report
Set [Cancel Comments] = (Case [Cancel Comments]
									When  'AU' Then 'Anaesthetist Unavailable'
									When 'BH' Then 'Bank Holiday'
									When 'LM' Then 'List merged /split'
									When 'MI' Then 'Major incident'
									
									When 'MW' Then 'Maintenance work'
									When 'NC' Then 'No cases booked'
									When 'PT' Then 'Protected Teaching'
									When 'PU' Then 'Patient unfit'
									When 'SU' Then 'Surgeon unavailable'
									When 'TE' Then 'Problem with theatre environment'
									When 'TU' Then ' Theatre staff unavailable'									

									End )
From Theatre_Utilization_Report 



Update Theatre_Utilization_Report
Set [Session TimePlanned Total] = 0
Where [Session TimePlanned Total] is null

Update Theatre_Utilization_Report
Set [Session TimeLost Late Start] = 0
Where [Session TimeLost Late Start] is null

Update Theatre_Utilization_Report
Set [Session TimeLost Early Finish] = 0
Where [Session TimeLost Early Finish] is null

Update Theatre_Utilization_Report
Set [Operation TimeGap Next Surgery Within Planned1700] = 0
Where [Operation TimeGap Next Surgery Within Planned1700] is null

Update Theatre_Utilization_Report
Set [Session TimeGained Early Start] = 0
Where [Session TimeGained Early Start] is null

Update Theatre_Utilization_Report
Set SessionTimeGainedLateFinish = 0
Where SessionTimeGainedLateFinish is null

Update Theatre_Utilization_Report
--Modified by DR on 24/11/2015 as per new formula request from Wendy Silvia
--Set Actual_Session_Length =[Session TimePlanned Total] -abs([Session TimeLost Late Start]) - abs([Session TimeLost Early Finish])-[Operation TimeGap Next Surgery Within Planned1700] --+[Session TimeGained Early Start]+SessionTimeGainedLateFinish

--Modified by DR on 02/12/2015 as per new formula request from Silvia 

--Set Actual_Session_Length =DATEDIFF(MI,convert(varchar(100),convert(datetime,[Operation DateTime B1 Anaes Start Earliest])  ,113),convert(varchar(100),convert(datetime, [Operation DateTime C4 OutOf OR Latest])  ,113))- coalesce([Operation TimeGap Next Surgery Within Planned1700],0)
Set Actual_Session_Length =DATEDIFF(MI,convert(varchar(100),convert(datetime,[Operation DateTime B1 Anaes Start Earliest])  ,113),convert(varchar(100),convert(datetime, [Operation DateTime C4 OutOf OR Latest])  ,113))

Where [Operation DateTime B1 Anaes Start Earliest] is not null and [Operation DateTime C4 OutOf OR Latest] is not null

Update Theatre_Utilization_Report
Set [Cancel Comments] =q.ACTION_REASON_Desc
From Theatre_Utilization_Report T Inner Join
(select distinct SCH_EVENT_ID,ENCNTR_ID,(select CODE_DESC_TXT from UKRWH_CDE_CODE_VALUE_REF where CODE_VALUE_CD= ACTION_DESCRIPTION_CD) as ACTION_DESCRIPTION ,
ACTION_DESCRIPTION_CD,(select CODE_DESC_TXT from UKRWH_CDE_CODE_VALUE_REF where CODE_VALUE_CD= ACTION_REASON_CD) as ACTION_REASON_Desc  ,ACTION_DT_TM
from UKRWH_CDE_SCH_ACTIONS where 
  ACTION_DESCRIPTION_CD=4518
group by SCH_EVENT_ID, ENCNTR_ID,ACTION_REASON_CD,ACTION_DESCRIPTION_CD,ACTION_DT_TM) q
On t.SCH_EVENT_ID= q.SCH_EVENT_ID 
and convert(date,t.SLOT_START_DT_TM)<=convert(date,q.ACTION_DT_TM)

Update Theatre_Utilization_Report
Set [Session Planned Start-End Times] = q.Start_Time + ' - ' + q.End_Time,
[Session TimePlanned Total] = q.SLOT_DURATION_NBR
From Theatre_Utilization_Report t inner join 
(select s.SLOT_START_DT_TM,s.SLOT_DURATION_NBR,t.[Session Planned Start-End Times],
CONVERT(VARCHAR(5), CONVERT(DATETIME, s.SLOT_START_DT_TM, 0), 108)  as Start_Time,
CONVERT(VARCHAR(5), CONVERT(DATETIME, Dateadd(MI,cast(s.SLOT_DURATION_NBR as integer),s.SLOT_START_DT_TM), 0), 108)  as End_Time,
s.SCH_APPT_ID,s.BLOCK_INSTANCE_ID
from UKRWH_CDE_SCH_APPT_REMOVED_THEATRE_SLOTS s Inner join Theatre_Utilization_Report t on s.SCH_APPT_ID= t.SCH_APPT_ID
and s.SLOT_TYPE_DESC_TXT like '%cancel%'  and [Session DateTime Planned Start] is NULL) q
On t.SCH_APPT_ID = q.SCH_APPT_ID
Where t.SLOT_TYPE_DESC_TXT like '%cancel%'  and t.[Session DateTime Planned Start] is NULL

Update Theatre_Utilization_Report
set[Session Theatre Code]= COALESCE( (select distinct CODE_DESC_TXT from UKRWH_CDE_CODE_VALUE_REF where CODE_VALUE_CD= q.THEATRE_NBR_CD),[site theatre]),
[site theatre]=COALESCE( (select distinct CODE_DESC_TXT from UKRWH_CDE_CODE_VALUE_REF where CODE_VALUE_CD= q.THEATRE_NBR_CD),[site theatre])
From Theatre_Utilization_Report t inner join (Select THEATRE_NBR_CD,SURGICAL_CASE_ID,SCH_APPT_ID,ENCNTR_ID From ukrwh_cde_surgical_case) q on t.SURGICAL_CASE_ID= q.SURGICAL_CASE_ID 



Update Theatre_Utilization_Report
Set Actual_Session_Length= 0,
	[Session TimePlanned Total]= 0,
	[Session TimeLost Late Start]= 0,
	[Session TimeLost Early Finish]=0,
	[Operation TimeGap Next Surgery Within Planned1700]=0,
	[Session TimeGained Early Start]=0,
	SessionTimeGainedLateFinish= 0,
	[Session TimeTaken Within Planned]=0

Where Consultant_Name= 'CANCELLED'

Delete  from Theatre_Utilization_Report 
Where exists (SELECT 1
FROM         dbo.OPERATION_DUMP INNER JOIN
                      dbo.TEST_PATIENTS_DUMP ON dbo.OPERATION_DUMP.PERSON_ID = dbo.TEST_PATIENTS_DUMP.PERSON_ID
                      and Theatre_Utilization_Report.SURGICAL_CASE_NBR_TXT= OPERATION_DUMP.SURGICAL_CASE_NBR_TXT
where Surname like 'zz%' or Surname like 'yy%')

Update Theatre_Utilization_Report
set[Session Theatre Code]= (select distinct CODE_DESC_TXT from UKRWH_CDE_CODE_VALUE_REF where CODE_VALUE_CD= sc.SCH_THEATRE_NBR_CD),
[site theatre]=(select distinct CODE_DESC_TXT from UKRWH_CDE_CODE_VALUE_REF where CODE_VALUE_CD= sc.SCH_THEATRE_NBR_CD)
From Theatre_Utilization_Report t inner join 

(select a.[Session Specialty Desc],convert(varchar,a.[Session Date],101) as [Session Date],a.[Session Planned Start-End Times],a.[Session Theatre Code],a.BLOCK_INSTANCE_ID
 From Theatre_Utilization_Report a inner join Theatre_Utilization_Report b on
a.[Session Specialty Desc]=b.[Session Specialty Desc] and convert(varchar,a.[Session Date],101) =convert(varchar,b.[Session Date],101)  
and a.[Session Planned Start-End Times]= b.[Session Planned Start-End Times] and  a.[Session Theatre Code]=b.[Session Theatre Code]
where a.[Session Date] > '09 March 2015' --and a.BLOCK_INSTANCE_ID IN('333562029','333567029')
and a.BLOCK_INSTANCE_ID<> b.BLOCK_INSTANCE_ID
Group By a.[Session Specialty Desc],convert(varchar,a.[Session Date],101),a.[Session Planned Start-End Times],a.[Session Theatre Code],a.BLOCK_INSTANCE_ID
Having COUNT(*) > 1)q
On t.BLOCK_INSTANCE_ID= q.BLOCK_INSTANCE_ID
inner join UKRWH_CDE_SURGICAL_CASE sc on sc.SURGICAL_CASE_ID= t.SURGICAL_CASE_ID


Update Theatre_Utilization_Report
set[Session Theatre Code]= (select distinct CODE_DESC_TXT from UKRWH_CDE_CODE_VALUE_REF where CODE_VALUE_CD= sc.SCH_THEATRE_NBR_CD),
[site theatre]=(select distinct CODE_DESC_TXT from UKRWH_CDE_CODE_VALUE_REF where CODE_VALUE_CD= sc.SCH_THEATRE_NBR_CD)
From Theatre_Utilization_Report t inner join 
(select a.[Session Specialty Desc],convert(varchar,a.[Session Date],101) as [Session Date],a.[Session Planned Start-End Times],a.BLOCK_INSTANCE_ID
 From Theatre_Utilization_Report a inner join Theatre_Utilization_Report b on
a.[Session Specialty Desc]=b.[Session Specialty Desc] and convert(varchar,a.[Session Date],101) =convert(varchar,b.[Session Date],101)  
and a.[Session Planned Start-End Times]= b.[Session Planned Start-End Times] 
where a.[Session Date] > '09 March 2015' --and a.BLOCK_INSTANCE_ID IN('333562029','333567029')
and a.BLOCK_INSTANCE_ID= b.BLOCK_INSTANCE_ID and a.[Session Theatre Code]<> b.[Session Theatre Code]
Group By a.[Session Specialty Desc],convert(varchar,a.[Session Date],101),a.[Session Planned Start-End Times],a.BLOCK_INSTANCE_ID
Having Count(*) > 1)q
On t.BLOCK_INSTANCE_ID= q.BLOCK_INSTANCE_ID
inner join UKRWH_CDE_SURGICAL_CASE sc on sc.SURGICAL_CASE_ID= t.SURGICAL_CASE_ID


Update [SESSION]
Set  
[Session Cancellation Code]=rtrim(ltrim([dbo].[fnsplitColumn](1,'-',t.SLOT_TYPE_DESC_TXT))),
[Session Cancellation Desc]=t.[Cancel Comments],
--[Session DateTime Cancelled]=t.[Session DateTime Cancelled],
[Session Cancel Text]  =t.[Session Cancel Text],
[Session Owner]=t.[Session Owner],
[Session Specialty Code] =t.[Session Specialty],
[Session Specialty Desc]=t.[Session Specialty Desc]
From [SESSION] s inner join Theatre_Utilization_Report t on s.SESSION_SK= t.BLOCK_INSTANCE_ID
where t.Consultant_Name = 'cancelled'



Update Theatre_Utilization_Report
set[Session Actual Cases]= q.Actual_Cases
From Theatre_Utilization_Report t Inner Join
(select MAX(actual_sequence) as Actual_Cases,BLOCK_INSTANCE_ID from OPERATION_DUMP
Group By BLOCK_INSTANCE_ID)    q
on t.BLOCK_INSTANCE_ID= q.BLOCK_INSTANCE_ID

Update Theatre_Utilization_Report
set[Session Planned Cases]= [Session Actual Cases] 
From Theatre_Utilization_Report t


Update Theatre_Utilization_Report
set[Session Planned Cases]= [Session Planned Cases] + coalesce(Cancelled_Cases,0)
From Theatre_Utilization_Report t Inner Join
(select SUM(Operation_Cancelled_On_Same_Day_After_Operation_Date)Cancelled_Cases,r.BLOCK_INSTANCE_ID from Ranked_Actual_Operation_Cancelled r
--where r.BLOCK_INSTANCE_ID= '330250416'
Group By r.BLOCK_INSTANCE_ID) q
on t.BLOCK_INSTANCE_ID= q.BLOCK_INSTANCE_ID


--DQ Fix for a particular Session only for Wendy
Update [Theatre_Utilization_Report]
Set Consultant='GRIFFITHS',
Consultant_Name= 'Griffiths , Dylan Ellis',
[Session Division ID]= 'B',
Session_Type_Description= 'ELECTIVE',
[Session Specialty Desc]= 'Trauma & Orthopaedics'

from [Theatre_Utilization_Report] where 
rtrim(ltrim([dbo].[fnsplitColumn](7,'-',SLOT_TYPE_DESC_TXT))) is null
And SCH_APPT_ID IN(148753062,149201456,149252604,149252606,149252607)

Update [Theatre_Utilization_Report]
Set [Theatre Suite]=
 
 (case [Session Theatre Code]
		 When 'CX Mn Th 01' Then 'MN TH 01'
		 When 'CX Mn Th 02' Then 'MN TH 02'
		 When 'CX Mn Th 03' Then 'MN TH 03'
		 When 'CX Mn Th 04' Then 'MN TH 04'
		 When 'CX Mn Th 05' Then 'MN TH 05'
		 When 'CX Mn Th 06' Then 'MN TH 06'
		 When 'CX Mn Th 07' Then 'MN TH 07'
		 When 'CX Mn Th 08' Then 'MN TH 08'
		 When 'CX Mn Th 09' Then 'MN TH 09'
		 When 'CX Mn Th 10' Then 'MN TH 101'
		  When 'CX RS An 01' Then 'RS An 01'
		 When 'CX RS An 02' Then 'RS An 02'

		 When 'CX RS Th 01' Then 'RS TH 01'
		 When 'CX RS Th 02' Then 'RS TH 02'
		 When 'CX RS Th 03' Then 'RS TH 03'
		 When 'CX RS Th 04' Then 'RS TH 04'
		 When 'CX RS Th 05' Then 'RS TH 05'
		 When 'CX RS Th 06' Then 'RS TH 06'
		 When 'CX RS Th 07' Then 'RS TH 07'
		 When 'CX RS Th 08' Then 'RS TH 08'
		 When 'CX RS Th 09' Then 'RS TH 09'
		 When 'CX RS Th 10' Then 'RS TH 10'
	End )
  FROM Theatre_Utilization_Report
  where [Session Theatre Code] like 'CX%'

Update [Theatre_Utilization_Report]
Set [Theatre Suite]=
 
 (case [Session Theatre Code]
		 When 'HH Th 01' Then 'MN TH 01'
		 When 'HH TH 02' Then 'MN TH 02'
		 When 'HH TH 03' Then 'MN TH 03'
		 When 'HH TH 04' Then 'MN TH 04'
		 When 'HH TH 05' Then 'MN TH 05'
		 When 'HH TH 06' Then 'MN TH 06'
		 When 'HH TH 07' Then 'MN TH 07'
		 When 'HH TH 08' Then 'MN TH 08'
		 When 'HH TH 09' Then 'MN TH 09'
		 When 'HH TH 10' Then 'MN TH 10'
	
	End )
  FROM Theatre_Utilization_Report
  where [Session Theatre Code] like 'HH%'

	--Update Theatre_Utilization_Report
	--Set [Operation Cancellation Reason Desc]=[Cancel Comments]
	--Where [Operation Cancellation Reason Desc] is null and [Cancel Comments] is not null
  

	--Update Theatre_Utilization_Report
	--Set [Cancel Comments]=[Operation Cancellation Reason Desc]
	--Where [Operation Cancellation Reason Desc] is not null and [Cancel Comments] is  null
        
END






GO


