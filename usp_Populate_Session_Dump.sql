USE [Cerner_CDS_Extract]
GO

/****** Object:  StoredProcedure [dbo].[usp_Populate_Session_Dump]    Script Date: 06/01/2019 23:29:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Populate_Session_Dump]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		TRUNCATE TABLE [SESSION]

		INSERT INTO [dbo].[Session]( 
		PK_SESSION,
		[Session Anaesthetic Text],
		[Session Anaesthetist Name] ,
		[Session Box Single Cancelled], 
		[Session Box Single Not Cancelled],
		[Session Cancel Text],-- [Cancellation free text]
		[Session Cancellation Code],
		[Session Cancellation Desc],
		[Session Cancelled Status],-- [Days or hours cancelled date is from session start date]
		[Session Consultant ID],
		[Session Consultant Name],
		[Session Count],
		[Session CPG ID],
		[Session Date],
		[Session DateTime Cancelled],
		[Session DateTime First Patient Operation Start],
		[Session DateTime First Patient Start], 
		[Session DateTime Last Patient End] ,
		[Session DateTime Last Patient Operation End],
		[Session DateTime Planned End],
		[Session DateTime Planned Start],
		[Session Day of Week],
		[Session Division ID],
		[Session Division ID Desc],
		[Session Exception Comments],
		[Session First Op Team],
		[Session Flag Backfill] ,
		[Session Flag Bad Actual Dates],
		[Session Flag Bad Planned Dates],
		[Session Flag Cancelled] ,
		[Session Flag Cancelled Session Involuntary],-- [See comment box]
		[Session Flag Cancelled Session Type Not True], 
		[Session Flag Cancelled Session Type True], 
		[Session Flag Cancelled Session Voluntary], 
		[Session Flag Cancelled Within 24Hrs],-- [Returns 0 for every record even though some some sessions -19048, 19005- cancelled within 24 hrs]
		[Session Flag Current],
		[Session Flag Early Finish],
		[Session Flag Early Start],
		[Session Flag Elective],
		[Session Flag Emergency],
		[Session Flag Future],
		[Session Flag Late Finish],
		[Session Flag Late Start],
		[Session Flag Not Cancelled],
		[Session Flag Not Planned],
		[Session Flag Not Used] ,
		[Session Flag Planned] ,
		[Session Flag Used] ,
		[Session ID],
		[Session Offer Status],
		[Session Operations Abandoned],
		[Session Operations Actual] ,
		[Session Operations Cancelled] ,
		[Session Operations Planned], 
		[Session Owner],
		[Session Planned Start-End Times],
		[Session Specialty Desc],
		[Session Start AM/PM],
		[Session Start Hour] ,
		[Session Start Period],
		[Session Start Time],
		[Session Surgeon Name],
		[Session Team (C-S/A/TL)], 
		[Session Theatre Code],
		[Session Theatre ID],
		[Session TimeErrors Ops Done in Cancelled Sessions],-- [0:00 or NULL on all records]
		[Session TimeErrors Ops Done in Sessions with Bad Actual Dates],--  [0:00 or NULL on all records]
		[Session TimeGained Early Start],
		[Session TimeGained Late Finish],
		[Session TimeGained Used Not Planned],
		[Session TimeGaps Between Operations] ,
		[Session TimeGaps Between Patients] ,
		[Session TimeGaps Between Surgery] ,
		[Session TimeGapsOnly Between Patients Within Planned],
		[Session TimeGapsOnly Between Patients Within Planned with Allowance],
		[Session TimeLost Cancelled Sessions],
		[Session TimeLost Early Finish],
		[Session TimeLost Late Start],
		[Session TimeLost Not Cancelled Not Used] ,
		[Session TimePlanned Total] ,
		[Session TimeTaken Actual Total],
		[Session TimeTaken Operation Within Planned],
		[Session TimeTaken Outside Planned] ,
		[Session TimeTaken Surgical Within Planned1700],-- ???
		[Session TimeTaken Within Planned],
		[Session TimeUsed Anaesthetic] ,
		[Session TimeUsed Operation],
		[Session TimeUsed Patient],
		[Session TimeUsed Surgical]  ,
		[Session Treatment Function Desc],
		[Session Treatment Function Local ID],
		[Session Type],
		[Session Type Elective or Emergency],
		[Session Type NHS or Private],
		[Session Units Actual] ,
		[Session Units Cancelled],
		[Session Units Planned] )
		Select
		'SESSION_SK'		,--as	[PK_SESSION],
		'Not Captured'		,--as	           [Session Anaesthetic Text],
		'[Pulled from actual Op. 1st available case with anaesthetist entered]'		,--as	           [Session Anaesthetist Name],
		'[Cons ID, Sess start & Finish, Sess type code, Plan (# of cases), canx code, canx date]'		,--as	           [Session Box Single Cancelled],
		'[Cons ID, Sess start & Finish, Sess type code, Plan (# of cases)]'		,--as	           [Session Box Single Not Cancelled],
		'UNKNOWN'		,--as	           [Session Cancel Text],
		'UNKNOWN'		,--as	           [Session Cancellation Code],
		'UNKNOWN'		,--as	           [Session Cancellation Desc],
		'UNKNOWN'		,--as	           [Session Cancelled Status],
		'[GMC Number]'		,--as	           [Session Consultant ID],
		'Derived Consultant Name'		,--as	           [Session Consultant Name],
		'[1 for every session, whether AM, PM or AD]'		,--as	           [Session Count],
		'Derived :Divisions now being used instead of CPG. Division specialty belongs to'		,--as	           [Session CPG ID],
		'SESSION_BEG_DT_TM'		,--as	           [Session Date],
		'UNKNOWN'		,--as	           [Session DateTime Cancelled],
		'[Anaesthetic Commenced]  [Time into Theatre]'		,--as	           [Session DateTime First Patient Operation Start],
		'[ANAESTHESTIC START'		,--as	           [Session DateTime First Patient Start],
		'OUT OF THEATRE [Time out of Theatre]'		,--as	           [Session DateTime Last Patient End],
		'OUT OF THEATRE [Time out of Theatre]'		,--as	           [Session DateTime Last Patient Operation End],
		'SESSION_END_DT_TM ]'		,--as	           [Session DateTime Planned End],
		'SESSION_BEG_DT_TM'		,--as	           [Session DateTime Planned Start],
		'Derived'		,--as	           [Session Day of Week],
		'DERIVED FROM SPECIALTY	'		,--as	           [Session Division ID],
		'DERIVED FROM SPECIALTY	'		,--as	           [Session Division ID Desc],
		'DELAY_REASON_CD'		,--as	           [Session Exception Comments],
		'ATTENDEE_PRSNL_ID(Derived)'		,--as	           [Session First Op Team],
		'[Shows 1 for every session record. Cannot work it what it means]'		,--as	           [Session Flag Backfill],
		'[1 for a cancelled session. Not clear about the logic behind it]'		,--as	           [Session Flag Bad Actual Dates],
		'[1 for emergency -unplanned- sessions. Most of planned session values are null]'		,--as	           [Session Flag Bad Planned Dates],
		'[Cannot work if there is any logic for the 1s and 0s for cancelled or not]'		,--as	           [Session Flag Cancelled],
		'Derived_as per comments	'		,--as	           [Session Flag Cancelled Session Involuntary],
		'[Returns 1 for list that were moved or merged/split; therefore not true cancellations]	'		,--as	           [Session Flag Cancelled Session Type Not True],
		'[Opposite of row 332]_Session Flag Cancelled_Session Involuntary'		,--as	           [Session Flag Cancelled Session Type True],
		'[Opposite of row 331]_Session Flag Cancelled '		,--as	           [Session Flag Cancelled Session Voluntary],
		'UNKNOWN'		,--as	           [Session Flag Cancelled Within 24Hrs],
		'[Returns 1 for every record. Cannot work out the logic.]'		,--as	           [Session Flag Current],
		'DERIVED_FROM_IF ACTUAL FINISH EARLIER THAN SCHEDULED FINISH'		,--as	           [Session Flag Early Finish],
		'DERIVED_FROM_IF ACTUAL START EARLIER THAN SCHEDULED START'		,--as	           [Session Flag Early Start],
		'Ask Danny'		,--as	           [Session Flag Elective],
		'Ask Danny'		,--as	           [Session Flag Emergency],
		'Ask Danny'		,--as	           [Session Flag Future],
		'DERIVED_FROM_IF ACTUAL FINISH LATER THAN SCHEDULED FINISH'		,--as	           [Session Flag Late Finish],
		'DERIVED_FROM_IF ACTUAL START LATER THAN SCHEDULED START'		,--as	           [Session Flag Late Start],
		'Ask Danny'		,--as	           [Session Flag Not Cancelled],
		'[1 for unplanned  - usually emergency - sessions]'		,--as	           [Session Flag Not Planned],
		'Default_to 1'		,--as	           [Session Flag Not Used],
		'[Opposite of row 345] Session_Flag Not Planned '		,--as	           [Session Flag Planned],
		'Default_to 0'		,--as	           [Session Flag Used],
		'SESSION_SK	'		,--as	           [Session ID],
		'IF_THE_SESSION HAS BEEN OFFERED_TO ANOTHER SPECIALTY'		,--as	           [Session Offer Status],
		'[Count of how many ops abandoned in the session]_as per_sql '		,--as	           [Session Operations Abandoned],
		'[Count of ops done in the session]'		,--as	           [Session Operations Actual],
		'[Count of cancelled ops on the session]'		,--as	           [Session Operations Cancelled],
		'COUNT_OF HOW MANY OPS SCHEDULED? [Count of  scheduled ops on the session]'		,--as	           [Session Operations Planned],
		'LEAD_HCP_PRNSL_ID'		,--as	           [Session Owner],
		'Derived'		,--as	           [Session Planned Start-End Times],
		'SURGICAL_CASE_SPECIALTY_CD	'		,--as	           [Session Specialty Desc],
		'[Derived from session start time] If_Session_Begin DTM is 0800 till 12 :00 it is AM rest is PM'		,--as	           [Session Start AM/PM],
		'[Session start as digits without minutes] Derived(Hour withour minutes)'		,--as	           [Session Start Hour],
		'Derived based on 24 hours divided in 4 clock cycles, need to find in which clock cycle our session start fits.  [6 hour intervals from midnight within which session start time falls. Eg session start hour 08:00. Session start period 06-12hrs]	'		,--as	           [Session Start Period],
		'Derived	'		,--as	           [Session Start Time],
		'[Planned sesison Surgeon name] 	'		,--as	           [Session Surgeon Name],
		'[Consultant & Surgeon from session template. Anaesthetist from actual Op] All CASE_ATTENDANCE_ID for First Patient inside Session from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE (Primary Surgeon,Operating Surgeon, Anaesthist Main )'		,--as	           [Session Team (C-S/A/TL)],
		'THEATRE_NBR_CD	'		,--as	           [Session Theatre Code],
		'THEATRE_NBR_CD	'		,--as	           [Session Theatre ID],
		'Derived'		,--as	           [Session TimeErrors Ops Done in Cancelled Sessions],
		'Derived'		,--as	           [Session TimeErrors Ops Done in Sessions with Bad Actual Dates],
		'[Need to test this logic for few cases, if ACTUAL_FIRST_CASE_START_DT_TM in Sesssion table is same as Anaesthetic start of first patient :Anaesthetic start of 1st pt eariler than session planned start]'		,--as	           [Session TimeGained Early Start],
		'[Session TimeGained Early Start [ Need to test this logic for few cases, if ACTUAL_LAST_CASE_STOP_DT_TM in Sesssion table is same as Time out of theatre for last patient :Time out of theatre of last pt later than session planned finish]'		,--as	           [Session TimeGained Late Finish],
		'[Emergency cases. Time out of theatre of last - anaesthetic start of first patient]'		,--as	           [Session TimeGained Used Not Planned],
		'[Sum of difference between Time out of Theatre for pt A and Time into theatre for next pt]	'		,--as	           [Session TimeGaps Between Operations],
		'[Sum of difference between Time out of Theatre for pt A and Anaesthetic Start for next pt]	'		,--as	           [Session TimeGaps Between Patients],
		'[Sum of difference between Surgical End for pt A and Knife to skin for next pt]'		,--as	           [Session TimeGaps Between Surgery],
		'[Sum of difference between time out of theatre for pt A and anaesthetic commenced for next pt ONLY WHERE THESE VALUES ARE POSITIVE]'		,--as	           [Session TimeGapsOnly Between Patients Within Planned],
		'[ same as above and where values are 10 or less, count as 0. And where values are more than 10 count as value minus 10]'		,--as	           [Session TimeGapsOnly Between Patients Within Planned with Allowance],
		'[Duration of session ie Session start - session End]'		,--as	           [Session TimeLost Cancelled Sessions],
		'[session end time - time of out theatre of last patient]'		,--as	           [Session TimeLost Early Finish],
		'[anaesthetic start of first patient - session start time]'		,--as	           [Session TimeLost Late Start],
		'[where session is not cancelled but all patients on session cancelled]'		,--as	           [Session TimeLost Not Cancelled Not Used],
		'[Session duration  start time to end time]'		,--as	           [Session TimePlanned Total],
		'[anaesthetic start of 1st pt to time out of theatre for last patient]'		,--as	           [Session TimeTaken Actual Total],
		'[1st pt Time into theatre to last pt Time out of theatre within the planned time]'		,--as	           [Session TimeTaken Operation Within Planned],
		'[Early start or late finish outside of planned session start and end time]'		,--as	           [Session TimeTaken Outside Planned],
		'Derived'		,--as	           [Session TimeTaken Surgical Within Planned1700],
		'[Anaesthetic start of 1st pt to time of out theatre for last pt within planned]'		,--as	           [Session TimeTaken Within Planned],
		'[Sum of anaesthetic start to time into theatre for each patient]'		,--as	           [Session TimeUsed Anaesthetic],
		'[Sum of difference between Time into theatre to time out of theatre for each patient within planned session time]	'		,--as	           [Session TimeUsed Operation],
		'[Sum of anaesthetic start to Time out of Theatre for each patient]'		,--as	           [Session TimeUsed Patient],
		'[Sum of knife to skin - surgical end of all patients]'		,--as	           [Session TimeUsed Surgical],
		'TREAT_FNC_CD [Specialty]'		,--as	           [Session Treatment Function Desc],
		'[specialty code]'		,--as	           [Session Treatment Function Local ID],
		'same as_Session_Type Elective or_Emergency	'		,--as	           [Session Type],
		'Derived'		,--as	           [Session Type Elective or Emergency],
		'Derived'		,--as	           [Session Type NHS or Private],
		'Derive :COUNT_OF ACTUAL_SESSIONS [derived from actual session mins out of total planned mins. Cant work out the logic behind the calculation]'		,--as	           [Session Units Actual],
		'??Derive :COUNT OF CANCELLED SESSIONS? Session Units Cancelled [Any part of the session cancelled; either AM or PM] [Any part of the session cancelled; either AM or PM]'		,--as	           [Session Units Cancelled],
		'Derive : COUNT_OF ACTUAL_SESSIONS? [1 for AM or PM sesison, 2 for AD] - Maybe work out_from planned mins ie 240 = 1, 480 = 2, 600 = 3]'		--as	           [Session Units Planned]


		INSERT INTO [dbo].[Session](
		 
		[PK_SESSION],
		SESSION_SK,
		[Session Date],
		[Session DateTime First Patient Operation Start] ,
		[Session DateTime Last Patient End] ,
		[Session DateTime Last Patient Operation End],
		[Session DateTime Planned End] ,
		[Session DateTime Planned Start],
		[Session ID],
		[Session Operations Actual],
		[Session Operations Planned] ,
		[Session Operations Cancelled] 	,
		[Session Start AM/PM]	,
		[Session Start Period] ,
		[Session Count],
		[Session Day of Week],
		[Session Flag Backfill],
		[Session Flag Current],
		[Session Flag Not Used],
		[Session Flag Used]
		--[Session TimeGained Early Start]
		--[Session Operations Planned] ,
		--[Session Start AM/PM] ,
		--[Session TimeGained Early Start]
		)


		select distinct

		EDW_F_SESSION_ID,
		SESSION_SK,
		SESSION_BEG_DT_TM,
		SESSION_BEG_DT_TM,
		SESSION_END_DT_TM,
		SESSION_END_DT_TM,
		SESSION_END_DT_TM,
		SESSION_BEG_DT_TM,
		SESSION_SK,
		NUMBER_OF_ACTUAL_CASES_HELD,
		NUMBER_OF_CANCELLATIONS,
		NUMBER_OF_PLANNED_CASES,
		case 
			when  DATEPART(HH,SESSION_BEG_DT_TM) between '8' and '12' then 'AM'
			Else 'PM'
		end as 	'Session Start AM/PM',
		case 
			when  DATEPART(HH,SESSION_BEG_DT_TM) between '0' and '6' then '00-06hrs'
			when  DATEPART(HH,SESSION_BEG_DT_TM) between '6' and '12' then '06-12hrs'
			when  DATEPART(HH,SESSION_BEG_DT_TM) between '12' and '18' then '12-18hrs'
			when  DATEPART(HH,SESSION_BEG_DT_TM) between '18' and '24' then '18-24hrs'
			
		end as 	'Session Start Period',
		1,
		 DATEPART(DAY,SESSION_BEG_DT_TM),
		 1,
		 1,
		 1,
		 0		 							
		From [NON_CDE_EDW_F_Session_WITH_SEQUENCE]
	where SESSION_BEG_DT_TM is not null and cast(SESSION_BEG_DT_TM as DATE) >= cast('09/03/2015' as DATE)  AND Session_Sequence_NBR= 1
		
		--COUNT OF HOW MANY OPS SCHEDULED?
		--If Session Begin DTM is 0800 till 12 :00 it's AM rest is PM
		--Derived

		Update [Session]
		Set [Session TimeGained Early Start]= 			 
			--DATEDIFF( HH,s.ACTUAL_FIRST_CASE_START_DT_TM,o.[Operation DateTime B1 Anaes Start])+ ' '+
			--DATEDIFF( MI,s.ACTUAL_FIRST_CASE_START_DT_TM,o.[Operation DateTime B1 Anaes Start])+ ' '+
			--DATEDIFF( SS,s.ACTUAL_FIRST_CASE_START_DT_TM,o.[Operation DateTime B1 Anaes Start]),
			CONVERT(VARCHAR(8), DATEADD(SECOND, DATEDIFF(SECOND,s.ACTUAL_FIRST_CASE_START_DT_TM,o.[Operation DateTime B1 Anaes Start]),0), 108)	
		from [NON_CDE_EDW_F_Session] s inner join OPERATION_DUMP o on 
			s.SESSION_SK= o.BLOCK_INSTANCE_ID inner join [Session] Se on Se.SESSION_SK= s.SESSION_SK
		where s.ACTUAL_FIRST_CASE_START_DT_TM <> ''		

		--DERIVE Session Anaesthetist Name
		--[Pulled from actual Op. 1st available case with anaesthetist entered]
		Update [Session]
		Set [Session Anaesthetist Name]=  o.[Operation Anaesthetist Name]
		From [Session] s Inner Join OPERATION_DUMP o on s.SESSION_SK= o.BLOCK_INSTANCE_ID
		WHERE O.FIRST_CASE= 'Y' 

		--Derive
		Update [Session]
		Set [Session Anaesthetic Text]= 'Not captured in Surginet'


		--Derive LEAD_HCP_PRNSL_ID
		Update [Session]
		Set [Session Owner]= NAME_FULL_TXT
		From [Session] s Inner Join
		(select a.EDW_F_SESSION_ID, aps.BLOCK_INSTANCE_ID,aps.SCH_APPT_ID ,aps.LEAD_HCP_PRNSL_ID,pref.NAME_FULL_TXT
		from NON_CDE_EDW_F_Session a left outer join UKRWH_CDE_SCH_APPT_SLOTS_WITH_SEQUENCE_FOR_SURGINET aps
		on a.SESSION_SK= aps.BLOCK_INSTANCE_ID
		Left outer join UKRWH_CDE_SURGICAL_CASE sc on sc.SCH_APPT_ID= aps.SCH_APPT_ID
		Left outer join UKRWH_CDE_PRSNL_REF pref On pref.PERSONNEL_ID= aps.LEAD_HCP_PRNSL_ID
		Where aps.BLOCK_INSTANCE_ID is not null)q on s.[PK_SESSION]=q.EDW_F_SESSION_ID

		--Derive Session Specialty Desc,Session Theatre Code,Session Theatre ID
		Update [Session]
		Set [Session Specialty Desc]= (Select distinct CODE_DESC_TXT  from UKRWH_CDE_CODE_VALUE_REF Where o.SURGICAL_CASE_SPECIALTY_CD = CODE_VALUE_CD),
		[Session Theatre Code]= (Select distinct CODE_DESC_TXT  from UKRWH_CDE_CODE_VALUE_REF Where o.THEATRE_NBR_CD = CODE_VALUE_CD),
		[Session Theatre ID]=(Select distinct ALIAS_NHS_CD_ALIAS  from UKRWH_CDE_CODE_VALUE_REF Where o.THEATRE_NBR_CD = CODE_VALUE_CD)

		From [Session] s Inner Join OPERATION_DUMP o on s.SESSION_SK= o.BLOCK_INSTANCE_ID

		--Derive [OPERATION Specialty Desc] and [Operation Specialty ID]
		Update OPERATION_DUMP
		Set [OPERATION Specialty Desc]= (Select distinct CODE_DESC_TXT  from UKRWH_CDE_CODE_VALUE_REF Where o.SURGICAL_CASE_SPECIALTY_CD = CODE_VALUE_CD),
		[Operation Specialty ID]= (Select distinct ALIAS_NHS_CD_ALIAS  from UKRWH_CDE_CODE_VALUE_REF Where o.SURGICAL_CASE_SPECIALTY_CD = CODE_VALUE_CD)
		From [Session] s Inner Join OPERATION_DUMP o on s.SESSION_SK= o.BLOCK_INSTANCE_ID


		--DERIVE Session First Op Team,[Session DateTime First Patient Operation Start]
		Update [Session]
		Set [Session First Op Team]=  O.[Operation Team (S/A/TL)],
		    [Session DateTime First Patient Operation Start]=o.[Operation DateTime C1 Into OR],
		    [Session Team (C-S/A/TL)]= O.[Operation Team (S/A/TL)]
		From [Session] s Inner Join OPERATION_DUMP o on s.SESSION_SK= o.BLOCK_INSTANCE_ID
		WHERE O.FIRST_CASE= 'Y' 

		--DERIVE [Session DateTime Last Patient End],Session DateTime Last Patient Operation End
		Update [Session]
		Set [Session DateTime Last Patient End]=o.[Operation DateTime C4 OutOf OR],
		    [Session DateTime Last Patient Operation End]=o.[Operation DateTime C4 OutOf OR]
		From [Session] s Inner Join OPERATION_DUMP o on s.SESSION_SK= o.BLOCK_INSTANCE_ID
		      Inner join (select sas.BLOCK_INSTANCE_ID ,MAX(sas.Slot_Sequence_NBR)as Max_Slot_Sequence_NBR
							from UKRWH_CDE_SCH_APPT_SLOTS_WITH_SEQUENCE_FOR_SURGINET sas
							Group By BLOCK_INSTANCE_ID )q
		On o.BLOCK_INSTANCE_ID= q.BLOCK_INSTANCE_ID And o.Slot_Sequence_NBR= q.Max_Slot_Sequence_NBR							
		

		--DERIVE [Session Exception Comments]
		Update [Session]
		Set [Session Exception Comments]=  (Select distinct CODE_DESC_TXT  from UKRWH_CDE_CODE_VALUE_REF Where scd.DELAY_REASON_CD = CODE_VALUE_CD)
		From [Session] s Inner Join OPERATION_DUMP o on s.SESSION_SK= o.BLOCK_INSTANCE_ID
		Inner Join UKRWH_CDE_SURGICAL_CASE_DELAY scd on o.SURGICAL_CASE_ID= scd.SURGICAL_CASE_ID
		WHERE O.FIRST_CASE= 'Y' 
		
		--DERIVE [Session Surgeon Name]
		Update [Session]
		Set [Session Surgeon Name]=  (Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF Where q.ATTENDEE_PRSNL_ID = PERSONNEL_ID) + ' ' +
		 (Select distinct NAME_FULL_TXT  from UKRWH_CDE_PRSNL_REF Where q.PRIMARY_SURGEON_PRSNL_ID = PERSONNEL_ID)
		From [Session] s Inner Join OPERATION_DUMP o on s.SESSION_SK= o.BLOCK_INSTANCE_ID
		Inner Join (select sc.SURGICAL_CASE_NBR_TXT,sa.SURGICAL_CASE_ID,ATTENDEE_PRSNL_ID,sa.ROLE_PERFORM_CD,scp.PRIMARY_SURGEON_PRSNL_ID
					from UKRWH_CDE_SURGICAL_CASE_ATTENDANCE sa
					inner join UKRWH_CDE_SURGICAL_CASE sc on sa.SURGICAL_CASE_ID= sc.SURGICAL_CASE_ID
					inner join UKRWH_CDE_SURGICAL_CASE_PROCEDURE scp on sc.SURGICAL_CASE_ID= scp.SURGICAL_CASE_ID
					where ROLE_PERFORM_CD= 9080510)Q
		ON O.SURGICAL_CASE_ID=Q.SURGICAL_CASE_ID
		


--Derive :  [Session Consultant ID],[Session Consultant Name]

	Update [Session]
	Set [Session Consultant ID]=q.PRIMARY_SURGEON_PRSNL_ID ,
        [Session Consultant Name]=q.NAME_FULL_TXT
	FROM [Session] S  INNER JOIN    
	(select PR.NAME_FULL_TXT,O.BLOCK_INSTANCE_ID,PROCE.PRIMARY_SURGEON_PRSNL_ID  FROM [dbo].[UKRWH_CDE_SURGICAL_CASE_PROCEDURE] PROCE WITH (nolock) INNER JOIN
	OPERATION_DUMP AS O WITH (nolock) on PROCE.SURGICAL_CASE_ID= O.SURGICAL_CASE_ID	
	LEFT OUTER JOIN UKRWH_CDE_PRSNL_REF PR ON PR.PERSONNEL_ID= PROCE.SCH_PRIMARY_SURGEON_PRSNL_ID
	where PRIMARY_PROC_IND= 1 and  PROC_CD<> 0)q
		ON Q.BLOCK_INSTANCE_ID = S.SESSION_SK 		

--Derive : [Session DateTime First Patient Start]
	Update [Session]
	Set [Session DateTime First Patient Start]=[Operation Time Taken B Anaesthetic]
	FROM OPERATION_DUMP O INNER JOIN [SESSION]	S ON s.session_sk= o.BLOCK_INSTANCE_ID
	Where o.FIRST_CASE= 'Y'		

--Derive : [Session Flag Early Finish] ,[Session Flag Early Start]
	Update [Session]
	Set [Session Flag Early Finish]= Q.[SessionFlagEarlyFinish],
		[Session Flag Early Start]= Q.[SessionFlagEarlyStart]
	FROM [Session] S INNER JOIN 
	(SELECT CASE 
				WHEN SCHED_LAST_CASE_STOP_DT_TM>ACTUAL_LAST_CASE_STOP_DT_TM THEN 1
				ELSE 0
			END AS [SessionFlagEarlyFinish],
	CASE 
		WHEN SCHED_LAST_CASE_STOP_DT_TM<ACTUAL_LAST_CASE_STOP_DT_TM THEN 1
	ELSE 0
	END AS [SessionFlagEarlyStart]	
	,SESSION_SK 
	FROM NON_CDE_EDW_F_Session)Q
	ON S.SESSION_SK=Q.SESSION_SK

--Derive : [Session Flag Late Finish] ,[Session Flag Late Start]
	Update [Session]
	Set [Session Flag Late Finish]= Q.[SessionFlagLateFinish],
		[Session Flag Late Start]= Q.[SessionFlagLateStart],
		[Session TimeGained Late Finish]=Q.SessionTimeGainedLateFinish
	FROM [Session] S INNER JOIN 
	(SELECT CASE 
				WHEN SCHED_LAST_CASE_STOP_DT_TM<ACTUAL_LAST_CASE_STOP_DT_TM THEN 1
				ELSE 0
			END AS [SessionFlagLateFinish],
	CASE 
		WHEN SCHED_LAST_CASE_STOP_DT_TM>ACTUAL_LAST_CASE_STOP_DT_TM THEN 1
	ELSE 0
	END AS [SessionFlagLateStart]	
	,SESSION_SK 
	,CONVERT(VARCHAR(8), DATEADD(SECOND, DATEDIFF(SECOND,SCHED_LAST_CASE_STOP_DT_TM, LOC_SCHED_LAST_CASE_STOP_DT_TM),0), 108) as SessionTimeGainedLateFinish
	FROM NON_CDE_EDW_F_Session)Q
	ON S.SESSION_SK=Q.SESSION_SK	



--select * From NON_CDE_EDW_F_Session
--Derive : [Session Operations Abandoned]
	Update [Session]
	Set [Session Operations Abandoned]= q.AbandonCount
	From [Session] s inner join 
	(select --distinct drp.INPUT_FORM_DISPLAY_TXT,drp.CONTROL_COLUMN_HEADING_TXT,dr.SURGICAL_CASE_ID,dr.RESPONSE_VALUE_DT_TM,
			--dr.RESPONSE_VALUE_FORMATTED_TXT--,
		o.BLOCK_INSTANCE_ID,COUNT(*) as AbandonCount
	 from UKRWH_CDE_PERIOP_DOC_RESPONSE dr inner join UKRWH_CDE_PERIOP_DOC_RESPONSE_REF drp on
	dr.PERIOP_DOC_REF_KEY= drp.PERIOP_DOC_REF_KEY
	inner join OPERATION_DUMP o on o.SURGICAL_CASE_ID= dr.SURGICAL_CASE_ID
	where  dr.RESPONSE_VALUE_FORMATTED_TXT= 'Procedure Abandoned'
	Group By o.BLOCK_INSTANCE_ID) q
	on 	q.BLOCK_INSTANCE_ID= q.BLOCK_INSTANCE_ID


----Derive : Session Planned Start-End Times
	Update [Session]
	Set [Session Planned Start-End Times]= Q.PlannedStartTime + '-'+ q.PlannedEndTime,
		[Session Start Hour]= Q.SessionStartHour,
		[Session Start Time]=Q.SessionStartTime		
	FROM [Session] S INNER JOIN 
	(SELECT SCHED_FIRST_CASE_START_DT_TM,SCHED_LAST_CASE_STOP_DT_TM,
	LTRIM(RIGHT(CONVERT(VARCHAR(20),SCHED_FIRST_CASE_START_DT_TM,100),7)) as PlannedStartTime,
	LTRIM(RIGHT(CONVERT(VARCHAR(20),SCHED_LAST_CASE_STOP_DT_TM,100),7)) as PlannedEndTime	,
	DATEPART(HH,SESSION_BEG_DT_TM) as SessionStartHour	,
	CONVERT(VARCHAR(5),SESSION_BEG_DT_TM,108) as SessionStartTime	,	
	SESSION_SK 
	FROM NON_CDE_EDW_F_Session)Q
	ON S.SESSION_SK=Q.SESSION_SK	


----Derive : [Session Type],
--select * from UKRWH_CDE_CODE_VALUE_REF where CODE_SET_NBR= '1304'--CODE_VALUE_CD= '1396'
	Update [Session]
	Set [Session Type]=O.[Operation Admission Type] ,
		[Session Type Elective or Emergency]=O.[Operation Admission Type] ,
		[Session Type NHS or Private]=O.[Operation Type NHS or Private]
	From OPERATION_DUMP O INNER JOIN Session S ON O.BLOCK_INSTANCE_ID=S.SESSION_SK


--	TFCLocal	=	COALESCE(Cast((q.LOCAL_SPECIALTY_CD_ALIAS) as Varchar(500)),Null),
--	TFCNational	=	COALESCE(Cast((Select distinct substring(ALIAS_NHS_CD_ALIAS,1,3)  from UKRWH_CDE_CODE_VALUE_REF WITH (nolock)  Where q.TREAT_FNC_CD	 = CODE_VALUE_CD) as Varchar(500)),Null),

		--DERIVE [Session Treatment Function Desc]
		Update [Session]
		Set [Session Treatment Function Desc]= (Select distinct CODE_DESC_TXT  from UKRWH_CDE_CODE_VALUE_REF Where q.TREAT_FNC_CD = CODE_VALUE_CD),
			[Session Treatment Function Local ID]=LOCAL_SPECIALTY_CD_ALIAS,
			SESSION_TFCNational= COALESCE(Cast((Select distinct substring(ALIAS_NHS_CD_ALIAS,1,3)  from UKRWH_CDE_CODE_VALUE_REF WITH (nolock)  Where q.TREAT_FNC_CD	 = CODE_VALUE_CD) as Varchar(500)),Null)
		From [Session] s Inner Join
		(Select a.EDW_F_SESSION_ID, aps.BLOCK_INSTANCE_ID,aps.SCH_APPT_ID ,aps.LEAD_HCP_PRNSL_ID,pref.NAME_FULL_TXT,eve.TREAT_FNC_CD,EVE.LOCAL_SPECIALTY_CD_ALIAS
		from NON_CDE_EDW_F_Session a left outer join UKRWH_CDE_SCH_APPT_SLOTS_WITH_SEQUENCE_FOR_SURGINET aps
		on a.SESSION_SK= aps.BLOCK_INSTANCE_ID
		Left outer join UKRWH_CDE_SURGICAL_CASE sc on sc.SCH_APPT_ID= aps.SCH_APPT_ID
		Left outer join UKRWH_CDE_PRSNL_REF pref On pref.PERSONNEL_ID= aps.LEAD_HCP_PRNSL_ID
		inner join UKRWH_CDE_CDS_EVENT eve on eve.ENCNTR_ID= aps.ENCNTR_ID
		Where aps.BLOCK_INSTANCE_ID is not null)q on s.[PK_SESSION]=q.EDW_F_SESSION_ID
		

--LOCAL
UPDATE [Session]
SET [Session Division ID] = dbo.Dim_TreatmentFunction.DivisionCode,
	[Session CPG ID]= dbo.Dim_TreatmentFunction.CPGcode,
  [Session Division ID Desc]=Division
FROM dbo.Session WITH (nolock) LEFT OUTER JOIN
dbo.Dim_TreatmentFunction WITH (nolock) ON dbo.Session.[Session Treatment Function Local ID] = dbo.Dim_TreatmentFunction.TreatmentFunctionLocalCode
WHERE dbo.Session.[Session Division ID] IS NULL OR dbo.Session.[Session Division ID] = ''
 
-- NATIONAL
UPDATE Session
SET [Session Division ID] = dbo.Dim_TreatmentFunction.DivisionCode,
	[Session CPG ID]= dbo.Dim_TreatmentFunction.CPGcode,
	[Session Division ID Desc]= Division
FROM dbo.Session WITH (nolock) LEFT OUTER JOIN
dbo.Dim_TreatmentFunction WITH (nolock) ON dbo.Session.SESSION_TFCNational = dbo.Dim_TreatmentFunction.TreatmentFunctionCode

--Derive : Operation Division ID 
Update OPERATION_DUMP
Set [Operation Division ID] = [Session Division ID]
FROM OPERATION_DUMP INNER JOIN Session ON OPERATION_DUMP.BLOCK_INSTANCE_ID= SESSION.SESSION_SK

UPDATE Session
SET [Session Flag Bad Planned Dates]= '1'
FROM dbo.Session WITH (nolock) INNER JOIN OPERATION_DUMP O ON SESSION.SESSION_SK= O.BLOCK_INSTANCE_ID
AND  O.PATIENT_TYPE = 'EMERGENCY'

--[Session Flag Planned]
UPDATE Session
SET [Session Flag Planned]= '1'
FROM dbo.Session WITH (nolock) INNER JOIN OPERATION_DUMP O ON SESSION.SESSION_SK= O.BLOCK_INSTANCE_ID
AND  O.PATIENT_TYPE <> 'EMERGENCY'

UPDATE Session
SET [Session Flag Bad Planned Dates]= '1',
    [Session Flag Emergency]= '1',
    [Session Flag Not Planned]= '1'
FROM dbo.Session WITH (nolock) INNER JOIN OPERATION_DUMP O ON SESSION.SESSION_SK= O.BLOCK_INSTANCE_ID
AND  O.PATIENT_TYPE = 'EMERGENCY'

--[Session Flag Elective]
UPDATE Session
SET [Session Flag Elective]= '1'
FROM dbo.Session WITH (nolock) INNER JOIN OPERATION_DUMP O ON SESSION.SESSION_SK= O.BLOCK_INSTANCE_ID
AND  O.Operation_SLOT_TYPE_DESC_TXT like '%ELECTIVE%'

--Session Flag Future
UPDATE Session
SET [Session Flag Future]=  CASE 
							WHEN CONVERT(vARCHAR(10),[Session DateTime Planned Start],103)> CONVERT(VARCHAR(10),GETDATE(),103) 
							THEN 1 ELSE 0 END 
FROM Session	

--Session Flag Future
UPDATE Session
SET [Session Box Single Cancelled]=Q.SessionBoxSingleCancelled,
[Session Box Single Not Cancelled]=Q.SessionBoxSingleNotCancelled
FROM Session INNER JOIN
(SELECT DISTINCT
COALESCE(O.[Operation Consultant Name],'')+ COALESCE(NS.LOC_SESSION_BEG_DT_TM,'')
+COALESCE(NS.LOC_SESSION_END_DT_TM,'') + COALESCE(UKS.SLOT_TEMPLATE_DESC_TXT,'') + COALESCE(NS.NUMBER_OF_PLANNED_CASES,'')+ 
'CANCELLATION CODE'+ 'CANCELLATION DATE' AS SessionBoxSingleCancelled ,
COALESCE(O.[Operation Consultant Name],'')+ COALESCE(NS.LOC_SESSION_BEG_DT_TM,'')
+COALESCE(NS.LOC_SESSION_END_DT_TM,'') + COALESCE(UKS.SLOT_TEMPLATE_DESC_TXT,'') + COALESCE(NS.NUMBER_OF_PLANNED_CASES,'')
 AS SessionBoxSingleNotCancelled ,
NS.EDW_F_SESSION_ID
FROM UKRWH_CDE_SCH_APPT_SLOTS_WITH_SEQUENCE_FOR_SURGINET UKS
INNER JOIN NON_CDE_EDW_F_Session NS ON UKS.BLOCK_INSTANCE_ID= NS.SESSION_SK
INNER JOIN OPERATION_DUMP O ON O.BLOCK_INSTANCE_ID= NS.SESSION_SK)Q ON
SESSION.[PK_SESSION]= Q.EDW_F_SESSION_ID


--Derive [Session TimeGained Used Not Planned]
--Test on Monday
Update [Session]
Set 
--[Session TimeGained Used Not Planned]=CONVERT(VARCHAR(200), DATEADD(SECOND, DATEDIFF(SECOND,[Session DateTime Last Patient Operation End],o.[Operation Time Taken A Getting Patient]),0), 108) 		,
[Session TimeTaken Actual Total]=CONVERT(VARCHAR(200), DATEADD(SECOND, DATEDIFF(SECOND,o.[Operation DateTime B1 Anaes Start],O.[Operation DateTime C4 OutOf OR])/60,0), 108) 		,
[Session TimeTaken Operation Within Planned]=CONVERT(VARCHAR(200), DATEADD(SECOND, DATEDIFF(SECOND,o.[Operation DateTime C1 Into OR],O.[Operation DateTime C4 OutOf OR])/60,0), 108) 		,
[Session TimeTaken Within Planned]=CONVERT(VARCHAR(200),  DATEDIFF( SECOND,o.[Operation DateTime B1 Anaes Start],O.[Operation DateTime C4 OutOf OR])/60, 108)		

From [Session] s Inner Join OPERATION_DUMP o on s.SESSION_SK= o.BLOCK_INSTANCE_ID
     -- Inner join (select sas.BLOCK_INSTANCE_ID ,MAX(sas.Slot_Sequence_NBR)as Max_Slot_Sequence_NBR
					--from UKRWH_CDE_SCH_APPT_SLOTS_WITH_SEQUENCE_FOR_SURGINET sas
					--Group By BLOCK_INSTANCE_ID )q
--On o.BLOCK_INSTANCE_ID= q.BLOCK_INSTANCE_ID And o.Slot_Sequence_NBR= q.Max_Slot_Sequence_NBR AND  O.PATIENT_TYPE = 'EMERGENCY'	


--Derive Session TimePlanned Total
Update [Session]
Set [Session TimePlanned Total]=CONVERT(VARCHAR(8), DATEADD(SECOND, DATEDIFF(SECOND,ns.SESSION_BEG_DT_TM,SESSION_END_DT_TM),0), 108) 	
From [Session] s inner join NON_CDE_EDW_F_Session ns on s.PK_SESSION= ns.EDW_F_SESSION_ID

--dERIVE [Session TimeLost Early Finish]
UPDATE Session
SET     [Session TimeLost Early Finish]= CONVERT(VARCHAR(8), DATEADD(SECOND, DATEDIFF(SECOND,NS.SESSION_END_DT_TM,O.[Operation DateTime C4 OutOf OR]),0), 108) 		
FROM dbo.Session WITH (nolock) INNER JOIN OPERATION_DUMP O ON SESSION.SESSION_SK= O.BLOCK_INSTANCE_ID
inner join NON_CDE_EDW_F_Session NS ON NS.EDW_F_SESSION_ID=SESSION.PK_SESSION
Inner join (select sas.BLOCK_INSTANCE_ID ,MAX(sas.Slot_Sequence_NBR)as Max_Slot_Sequence_NBR
					from UKRWH_CDE_SCH_APPT_SLOTS_WITH_SEQUENCE_FOR_SURGINET sas
					Group By BLOCK_INSTANCE_ID )q ON Q.BLOCK_INSTANCE_ID = NS.SESSION_SK
INNER jOIN 	UKRWH_CDE_SCH_APPT_SLOTS_WITH_SEQUENCE_FOR_SURGINET sas1 ON SAS1.SCH_APPT_ID= O.SCH_APPT_ID	AND Q.Max_Slot_Sequence_NBR= SAS1.Slot_Sequence_NBR			
					
--dERIVE [Session TimeLost Late Start]
UPDATE Session
SET     [Session TimeLost Late Start]= CONVERT(VARCHAR(8), DATEADD(SECOND, DATEDIFF(MI,NS.ACTUAL_FIRST_CASE_START_DT_TM,NS.SESSION_BEG_DT_TM),0), 108) 		
FROM dbo.Session WITH (nolock) INNER JOIN OPERATION_DUMP O ON SESSION.SESSION_SK= O.BLOCK_INSTANCE_ID
inner join NON_CDE_EDW_F_Session NS ON NS.EDW_F_SESSION_ID=SESSION.PK_SESSION
--Inner join (select sas.BLOCK_INSTANCE_ID ,MIN(sas.Slot_Sequence_NBR)as Max_Slot_Sequence_NBR
--					from UKRWH_CDE_SCH_APPT_SLOTS_WITH_SEQUENCE_FOR_SURGINET sas
--					Group By BLOCK_INSTANCE_ID )q ON Q.BLOCK_INSTANCE_ID = NS.SESSION_SK
--INNER jOIN 	UKRWH_CDE_SCH_APPT_SLOTS_WITH_SEQUENCE_FOR_SURGINET sas1 ON SAS1.SCH_APPT_ID= O.SCH_APPT_ID	AND Q.Max_Slot_Sequence_NBR= SAS1.Slot_Sequence_NBR			


--Derive Session TimePlanned Total
Update [Session]
Set [Session TimeLost Cancelled Sessions]=CONVERT(VARCHAR(8), DATEADD(SECOND, DATEDIFF(SECOND,ns.SESSION_BEG_DT_TM,SESSION_END_DT_TM),0), 108) 		
From [Session] s inner join NON_CDE_EDW_F_Session ns on s.PK_SESSION= ns.EDW_F_SESSION_ID
inner join UKRWH_CDE_SCH_APPT_SLOTS_WITH_SEQUENCE_FOR_SURGINET sc on sc.BLOCK_INSTANCE_ID=  s.PK_SESSION
Where sc.SCHED_TEMPLATE_MNEM_TXT LIKE '%CANCEL%'

	
END


GO


