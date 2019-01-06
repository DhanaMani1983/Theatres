USE [Cerner_CDS_Extract]
GO

/****** Object:  StoredProcedure [dbo].[usp_CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT]    Script Date: 06/01/2019 23:28:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT]') AND type in (N'U'))
	DROP TABLE CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
    -- Insert statements for procedure here
	SELECT
	BLOCK_INSTANCE_ID,
	MAX(case when [Actual_Sequence] = 1 then [Actual_Sequence] end) as [Actual_Sequence1],
	MAX(case when [Actual_Sequence] = 1 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR1],
	MAX(case when [Actual_Sequence] = 1 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite1],
	MAX(case when [Actual_Sequence] = 1 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start1],
	--MAX(case when [Actual_Sequence] = 1 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID1],
	MAX(case when [Actual_Sequence] = 1 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin1],
	MAX(case when [Actual_Sequence] = 1 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM1,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_1],
	CAST(null as int) as [Session TimeTaken Within Planned_1],


	MAX(case when [Actual_Sequence] = 2 then [Actual_Sequence] end) as [Actual_Sequence2],
	MAX(case when [Actual_Sequence] = 2 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR2],
	MAX(case when [Actual_Sequence] = 2 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite2],
	MAX(case when [Actual_Sequence] = 2 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start2],
	--MAX(case when [Actual_Sequence] = 2 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID2],
	MAX(case when [Actual_Sequence] = 2 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin2],
	MAX(case when [Actual_Sequence] = 2 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM2,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_2],
	CAST(null as int) as [Session TimeTaken Within Planned_2],
	

	MAX(case when [Actual_Sequence] = 3 then [Actual_Sequence] end) as [Actual_Sequence3],
	MAX(case when [Actual_Sequence] = 3 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR3],
	MAX(case when [Actual_Sequence] = 3 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite3],
	MAX(case when [Actual_Sequence] = 3 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start3],
	--MAX(case when [Actual_Sequence] = 3 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID3],
	MAX(case when [Actual_Sequence] = 3 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin3],
	MAX(case when [Actual_Sequence] = 3 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM3,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_3],
	CAST(null as int) as [Session TimeTaken Within Planned_3],
	


	MAX(case when [Actual_Sequence] = 4 then [Actual_Sequence] end) as [Actual_Sequence4],
	MAX(case when [Actual_Sequence] = 4 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR4],
	MAX(case when [Actual_Sequence] = 4 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite4],
	MAX(case when [Actual_Sequence] = 4 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start4],
	--MAX(case when [Actual_Sequence] = 4 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID4],
	MAX(case when [Actual_Sequence] = 4 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin4],
	MAX(case when [Actual_Sequence] = 4 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM4,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_4],
	CAST(null as int) as [Session TimeTaken Within Planned_4],


	MAX(case when [Actual_Sequence] = 5 then [Actual_Sequence] end) as [Actual_Sequence5],
	MAX(case when [Actual_Sequence] = 5 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR5],
	MAX(case when [Actual_Sequence] = 5 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite5],
	MAX(case when [Actual_Sequence] = 5 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start5],
	--MAX(case when [Actual_Sequence] = 5 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID5],
	MAX(case when [Actual_Sequence] = 5 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin5],
	MAX(case when [Actual_Sequence] = 5 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM5,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_5],
	CAST(null as int) as [Session TimeTaken Within Planned_5],
	

	MAX(case when [Actual_Sequence] = 6 then [Actual_Sequence] end) as [Actual_Sequence6],
	MAX(case when [Actual_Sequence] = 6 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR6],
	MAX(case when [Actual_Sequence] = 6 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite6],
	MAX(case when [Actual_Sequence] = 6 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start6],
	--MAX(case when [Actual_Sequence] = 6 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID6],
	MAX(case when [Actual_Sequence] = 6 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin6],
	MAX(case when [Actual_Sequence] = 6 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM6,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_6],
	CAST(null as int) as [Session TimeTaken Within Planned_6],
	


	MAX(case when [Actual_Sequence] = 7 then [Actual_Sequence] end) as [Actual_Sequence7],
	MAX(case when [Actual_Sequence] = 7 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR7],
	MAX(case when [Actual_Sequence] = 7 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite7],
	MAX(case when [Actual_Sequence] = 7 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start7],
	--MAX(case when [Actual_Sequence] = 7 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID7],
	MAX(case when [Actual_Sequence] = 7 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin7],
	MAX(case when [Actual_Sequence] = 7 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM7,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_7],
	CAST(null as int) as [Session TimeTaken Within Planned_7],
	


	MAX(case when [Actual_Sequence] = 8 then [Actual_Sequence] end) as [Actual_Sequence8],
	MAX(case when [Actual_Sequence] = 8 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR8],
	MAX(case when [Actual_Sequence] = 8 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite8],
	MAX(case when [Actual_Sequence] = 8 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start8],
	--MAX(case when [Actual_Sequence] = 8 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID8],
	MAX(case when [Actual_Sequence] = 8 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin8],
	MAX(case when [Actual_Sequence] = 8 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM8,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_8],
	CAST(null as int) as [Session TimeTaken Within Planned_8],
	

	MAX(case when [Actual_Sequence] = 9 then [Actual_Sequence] end) as [Actual_Sequence9],
	MAX(case when [Actual_Sequence] = 9 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR9],
	MAX(case when [Actual_Sequence] = 9 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite9],
	MAX(case when [Actual_Sequence] = 9 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start9],
	--MAX(case when [Actual_Sequence] = 9 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID9],
	MAX(case when [Actual_Sequence] = 9 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin9],
	MAX(case when [Actual_Sequence] = 9 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM9,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_9],
	CAST(null as int) as [Session TimeTaken Within Planned_9],

	

	MAX(case when [Actual_Sequence] = 10 then [Actual_Sequence] end) as [Actual_Sequence10],
	MAX(case when [Actual_Sequence] = 10 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR10],
	MAX(case when [Actual_Sequence] = 10 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite10],
	MAX(case when [Actual_Sequence] = 10 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start10],
	--MAX(case when [Actual_Sequence] = 10 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID10],
	MAX(case when [Actual_Sequence] = 10 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin10],
	MAX(case when [Actual_Sequence] = 10 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM10,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_10],
	CAST(null as int) as [Session TimeTaken Within Planned_10],
	

	MAX(case when [Actual_Sequence] = 11 then [Actual_Sequence] end) as [Actual_Sequence11],
	MAX(case when [Actual_Sequence] = 11 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR11],
	MAX(case when [Actual_Sequence] = 11 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite11],
	MAX(case when [Actual_Sequence] = 11 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start11],
	--MAX(case when [Actual_Sequence] = 11 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID11],
	MAX(case when [Actual_Sequence] = 11 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin11],
	MAX(case when [Actual_Sequence] = 11 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM11,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_11],
	CAST(null as int) as [Session TimeTaken Within Planned_11],	


	MAX(case when [Actual_Sequence] = 12 then [Actual_Sequence] end) as [Actual_Sequence12],
	MAX(case when [Actual_Sequence] = 12 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR12],
	MAX(case when [Actual_Sequence] = 12 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite12],
	MAX(case when [Actual_Sequence] = 12 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start12],
	--MAX(case when [Actual_Sequence] = 12 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID12],
	MAX(case when [Actual_Sequence] = 12 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin12],
	MAX(case when [Actual_Sequence] = 12 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM12,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_12],
	CAST(null as int) as [Session TimeTaken Within Planned_12],		


	MAX(case when [Actual_Sequence] = 13 then [Actual_Sequence] end) as [Actual_Sequence13],
	MAX(case when [Actual_Sequence] = 13 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR13],
	MAX(case when [Actual_Sequence] = 13 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite13],
	MAX(case when [Actual_Sequence] = 13 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start13],
	--MAX(case when [Actual_Sequence] = 13 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID13],
	MAX(case when [Actual_Sequence] = 13 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin13],
	MAX(case when [Actual_Sequence] = 13 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM13,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_13],
	CAST(null as int) as [Session TimeTaken Within Planned_13],		

	MAX(case when [Actual_Sequence] = 14 then [Actual_Sequence] end) as [Actual_Sequence14],
	MAX(case when [Actual_Sequence] = 14 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR14],
	MAX(case when [Actual_Sequence] = 14 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite14],
	MAX(case when [Actual_Sequence] = 14 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start14],
	--MAX(case when [Actual_Sequence] = 14 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID14],
	MAX(case when [Actual_Sequence] = 14 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin14],
	MAX(case when [Actual_Sequence] = 14 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM14,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_14],
	CAST(null as int) as [Session TimeTaken Within Planned_14],		


	MAX(case when [Actual_Sequence] = 15 then [Actual_Sequence] end) as [Actual_Sequence15],
	MAX(case when [Actual_Sequence] = 15 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR15],
	MAX(case when [Actual_Sequence] = 15 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite15],
	MAX(case when [Actual_Sequence] = 15 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start15],
	--MAX(case when [Actual_Sequence] = 15 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID15],
	MAX(case when [Actual_Sequence] = 15 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin15],
	MAX(case when [Actual_Sequence] = 15 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM15,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_15],
	CAST(null as int) as [Session TimeTaken Within Planned_15],		


	MAX(case when [Actual_Sequence] = 16 then [Actual_Sequence] end) as [Actual_Sequence16],
	MAX(case when [Actual_Sequence] = 16 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR16],
	MAX(case when [Actual_Sequence] = 16 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite16],
	MAX(case when [Actual_Sequence] = 16 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start16],
	--MAX(case when [Actual_Sequence] = 16 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID16],
	MAX(case when [Actual_Sequence] = 16 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin16],
	MAX(case when [Actual_Sequence] = 16 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM16,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_16],
	CAST(null as int) as [Session TimeTaken Within Planned_16],		

	MAX(case when [Actual_Sequence] = 17 then [Actual_Sequence] end) as [Actual_Sequence17],
	MAX(case when [Actual_Sequence] = 17 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR17],
	MAX(case when [Actual_Sequence] = 17 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite17],
	MAX(case when [Actual_Sequence] = 17 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start17],
	--MAX(case when [Actual_Sequence] = 17 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID17],
	MAX(case when [Actual_Sequence] = 17 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin17],
	MAX(case when [Actual_Sequence] = 17 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM17,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_17],
	CAST(null as int) as [Session TimeTaken Within Planned_17],		

	MAX(case when [Actual_Sequence] = 18 then [Actual_Sequence] end) as [Actual_Sequence18],
	MAX(case when [Actual_Sequence] = 18 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR18],
	MAX(case when [Actual_Sequence] = 18 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite18],
	MAX(case when [Actual_Sequence] = 18 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start18],
	--MAX(case when [Actual_Sequence] = 18 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID18],
	MAX(case when [Actual_Sequence] = 18 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin18],
	MAX(case when [Actual_Sequence] = 18 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM18,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_18],
	CAST(null as int) as [Session TimeTaken Within Planned_18],		

	MAX(case when [Actual_Sequence] = 19 then [Actual_Sequence] end) as [Actual_Sequence19],
	MAX(case when [Actual_Sequence] = 19 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR19],
	MAX(case when [Actual_Sequence] = 19 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite19],
	MAX(case when [Actual_Sequence] = 19 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start19],
	--MAX(case when [Actual_Sequence] = 19 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID19],
	MAX(case when [Actual_Sequence] = 19 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin19],
	MAX(case when [Actual_Sequence] = 19 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM19,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_19],
	CAST(null as int) as [Session TimeTaken Within Planned_19],		

	MAX(case when [Actual_Sequence] = 20 then [Actual_Sequence] end) as [Actual_Sequence20],
	MAX(case when [Actual_Sequence] = 20 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR20],
	MAX(case when [Actual_Sequence] = 20 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite20],
	MAX(case when [Actual_Sequence] = 20 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start20],
	--MAX(case when [Actual_Sequence] = 20 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID20],
	MAX(case when [Actual_Sequence] = 20 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin20],
	MAX(case when [Actual_Sequence] = 20 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM20,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_20],
	CAST(null as int) as [Session TimeTaken Within Planned_20],			
	
	MAX(case when [Actual_Sequence] = 21 then [Actual_Sequence] end) as [Actual_Sequence21],
	MAX(case when [Actual_Sequence] = 21 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR21],
	MAX(case when [Actual_Sequence] = 21 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite21],
	MAX(case when [Actual_Sequence] = 21 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start21],
	--MAX(case when [Actual_Sequence] = 21 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID21],
	MAX(case when [Actual_Sequence] = 21 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin21],
	MAX(case when [Actual_Sequence] = 21 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM21,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_21],
	CAST(null as int) as [Session TimeTaken Within Planned_21],		

	MAX(case when [Actual_Sequence] = 22 then [Actual_Sequence] end) as [Actual_Sequence22],
	MAX(case when [Actual_Sequence] = 22 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR22],
	MAX(case when [Actual_Sequence] = 22 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite22],
	MAX(case when [Actual_Sequence] = 22 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start22],
	--MAX(case when [Actual_Sequence] = 22 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID22],
	MAX(case when [Actual_Sequence] = 22 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin22],
	MAX(case when [Actual_Sequence] = 22 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM22,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_22],
	CAST(null as int) as [Session TimeTaken Within Planned_22],		

	MAX(case when [Actual_Sequence] = 23 then [Actual_Sequence] end) as [Actual_Sequence23],
	MAX(case when [Actual_Sequence] = 23 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR23],
	MAX(case when [Actual_Sequence] = 23 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite23],
	MAX(case when [Actual_Sequence] = 23 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start23],
	--MAX(case when [Actual_Sequence] = 23 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID23],
	MAX(case when [Actual_Sequence] = 23 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin23],
	MAX(case when [Actual_Sequence] = 23 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM23,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_23],
	CAST(null as int) as [Session TimeTaken Within Planned_23],		

	MAX(case when [Actual_Sequence] = 24 then [Actual_Sequence] end) as [Actual_Sequence24],
	MAX(case when [Actual_Sequence] = 24 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR24],
	MAX(case when [Actual_Sequence] = 24 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite24],
	MAX(case when [Actual_Sequence] = 24 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start24],
	--MAX(case when [Actual_Sequence] = 24 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID24],
	MAX(case when [Actual_Sequence] = 24 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin24],
	MAX(case when [Actual_Sequence] = 24 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM24,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_24],
	CAST(null as int) as [Session TimeTaken Within Planned_24],		


	MAX(case when [Actual_Sequence] = 25 then [Actual_Sequence] end) as [Actual_Sequence25],
	MAX(case when [Actual_Sequence] = 25 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR25],
	MAX(case when [Actual_Sequence] = 25 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite25],
	MAX(case when [Actual_Sequence] = 25 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start25],
	--MAX(case when [Actual_Sequence] = 25 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID25],
	MAX(case when [Actual_Sequence] = 25 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin25],
	MAX(case when [Actual_Sequence] = 25 then LOC_SESSION_END_DT_TM end) as LOC_SESSION_END_DT_TM25,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_25],
	CAST(null as int) as [Session TimeTaken Within Planned_25]


	INTO CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	
	FROM OPERATION_DUMP 
	Where (rtrim(ltrim([BLOCK_INSTANCE_ID]))<> '' and  [BLOCK_INSTANCE_ID] is not null) and ([Actual_Sequence] is not null and [Actual_Sequence] <> '')
	GROUP BY [BLOCK_INSTANCE_ID]
	ORDER BY  [BLOCK_INSTANCE_ID]
	

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_1]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR1]),convert(Datetime,[Operation DateTime B1 Anaes Start2]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence1 is not NULL and Actual_Sequence2 is not null and [Operation DateTime C4 OutOf OR1] is not null and [Operation DateTime B1 Anaes Start2] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM1)> = convert(Datetime,[Operation DateTime B1 Anaes Start2])

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_2]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR2]),convert(Datetime,[Operation DateTime B1 Anaes Start3]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence2 is not NULL and Actual_Sequence3 is not null and [Operation DateTime C4 OutOf OR2] is not null and [Operation DateTime B1 Anaes Start3] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM2)> = convert(Datetime,[Operation DateTime B1 Anaes Start3])

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_3]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR3]),convert(Datetime,[Operation DateTime B1 Anaes Start4]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence3 is not NULL and Actual_Sequence4 is not null and [Operation DateTime C4 OutOf OR3] is not null and [Operation DateTime B1 Anaes Start4] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM3)> = convert(Datetime,[Operation DateTime B1 Anaes Start4])
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_4]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR4]),convert(Datetime,[Operation DateTime B1 Anaes Start5]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence4 is not NULL and Actual_Sequence5 is not null and [Operation DateTime C4 OutOf OR4] is not null and [Operation DateTime B1 Anaes Start5] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM4)> = convert(Datetime,[Operation DateTime B1 Anaes Start5])


	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_5]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR5]),convert(Datetime,[Operation DateTime B1 Anaes Start6]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence5 is not NULL and Actual_Sequence6 is not null and [Operation DateTime C4 OutOf OR5] is not null and [Operation DateTime B1 Anaes Start6] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM5)> = convert(Datetime,[Operation DateTime B1 Anaes Start6])
	
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_6]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR6]),convert(Datetime,[Operation DateTime B1 Anaes Start7]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence6 is not NULL and Actual_Sequence7 is not null and [Operation DateTime C4 OutOf OR6] is not null and [Operation DateTime B1 Anaes Start7] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM6)> = convert(Datetime,[Operation DateTime B1 Anaes Start7])
	
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_7]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR7]),convert(Datetime,[Operation DateTime B1 Anaes Start8]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence7 is not NULL and Actual_Sequence8 is not null and [Operation DateTime C4 OutOf OR7] is not null and [Operation DateTime B1 Anaes Start8] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM7)> = convert(Datetime,[Operation DateTime B1 Anaes Start8])
	
				
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_8]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR8]),convert(Datetime,[Operation DateTime B1 Anaes Start9]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence8 is not NULL and Actual_Sequence9 is not null and [Operation DateTime C4 OutOf OR8] is not null and [Operation DateTime B1 Anaes Start9] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM8)> = convert(Datetime,[Operation DateTime B1 Anaes Start9])
	

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_9]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR9]),convert(Datetime,[Operation DateTime B1 Anaes Start10]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence9 is not NULL and Actual_Sequence10 is not null and [Operation DateTime C4 OutOf OR9] is not null and [Operation DateTime B1 Anaes Start10] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM9)> = convert(Datetime,[Operation DateTime B1 Anaes Start10])
	
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_10]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR10]),convert(Datetime,[Operation DateTime B1 Anaes Start11]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence10 is not NULL and Actual_Sequence11 is not null and [Operation DateTime C4 OutOf OR10] is not null and [Operation DateTime B1 Anaes Start11] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM10)> = convert(Datetime,[Operation DateTime B1 Anaes Start11])
	

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_11]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR11]),convert(Datetime,[Operation DateTime B1 Anaes Start12]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence11 is not NULL and Actual_Sequence12 is not null and [Operation DateTime C4 OutOf OR11] is not null and [Operation DateTime B1 Anaes Start12] is not null				
	And convert(Datetime,LOC_SESSION_END_DT_TM11)> = convert(Datetime,[Operation DateTime B1 Anaes Start12])
	

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_12]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR12]),convert(Datetime,[Operation DateTime B1 Anaes Start13]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence12 is not NULL and Actual_Sequence13 is not null and [Operation DateTime C4 OutOf OR12] is not null and [Operation DateTime B1 Anaes Start13] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM12)> = convert(Datetime,[Operation DateTime B1 Anaes Start13])
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_13]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR13]),convert(Datetime,[Operation DateTime B1 Anaes Start14]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence13 is not NULL and Actual_Sequence14 is not null and [Operation DateTime C4 OutOf OR13] is not null and [Operation DateTime B1 Anaes Start14] is not null		
	And convert(Datetime,LOC_SESSION_END_DT_TM12)> = convert(Datetime,[Operation DateTime B1 Anaes Start14])

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_14]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR14]),convert(Datetime,[Operation DateTime B1 Anaes Start15]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence14 is not NULL and Actual_Sequence15 is not null and [Operation DateTime C4 OutOf OR14] is not null and [Operation DateTime B1 Anaes Start15] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM14)> = convert(Datetime,[Operation DateTime B1 Anaes Start15])

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_15]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR15]),convert(Datetime,[Operation DateTime B1 Anaes Start16]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence15 is not NULL and Actual_Sequence16 is not null and [Operation DateTime C4 OutOf OR15] is not null and [Operation DateTime B1 Anaes Start16] is not null					   		   			   		   			   			   			   		   
	And convert(Datetime,LOC_SESSION_END_DT_TM15)> = convert(Datetime,[Operation DateTime B1 Anaes Start16])

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_16]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR16]),convert(Datetime,[Operation DateTime B1 Anaes Start17]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence16 is not NULL and Actual_Sequence17 is not null and [Operation DateTime C4 OutOf OR16] is not null and [Operation DateTime B1 Anaes Start17] is not null		
	And convert(Datetime,LOC_SESSION_END_DT_TM16)> = convert(Datetime,[Operation DateTime B1 Anaes Start17])

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_17]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR17]),convert(Datetime,[Operation DateTime B1 Anaes Start18]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence17 is not NULL and Actual_Sequence18 is not null and [Operation DateTime C4 OutOf OR17] is not null and [Operation DateTime B1 Anaes Start18] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM17)> = convert(Datetime,[Operation DateTime B1 Anaes Start18])

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_18]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR18]),convert(Datetime,[Operation DateTime B1 Anaes Start19]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence18 is not NULL and Actual_Sequence19 is not null and [Operation DateTime C4 OutOf OR18] is not null and [Operation DateTime B1 Anaes Start19] is not null			
	And convert(Datetime,LOC_SESSION_END_DT_TM18)> = convert(Datetime,[Operation DateTime B1 Anaes Start19])
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_19]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR19]),convert(Datetime,[Operation DateTime B1 Anaes Start20]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence19 is not NULL and Actual_Sequence20 is not null and [Operation DateTime C4 OutOf OR19] is not null and [Operation DateTime B1 Anaes Start20] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM19)> = convert(Datetime,[Operation DateTime B1 Anaes Start20])

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_20]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR20]),convert(Datetime,[Operation DateTime B1 Anaes Start21]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Where Actual_Sequence20 is not NULL and Actual_Sequence21 is not null and [Operation DateTime C4 OutOf OR20] is not null and [Operation DateTime B1 Anaes Start21] is not null	
	And convert(Datetime,LOC_SESSION_END_DT_TM20)> = convert(Datetime,[Operation DateTime B1 Anaes Start21])
		

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_1]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_1]< 0
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_2]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_2]< 0
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_3]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_3]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_4]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_4]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_5]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_5]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_6]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_6]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_7]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_7]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_8]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_8]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_9]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_9]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_10]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_10]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_11]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_11]< 0
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_12]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_12]< 0
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_13]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_13]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_14]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_14]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_15]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_15]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_16]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_16]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_17]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_17]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_18]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_18]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_19]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_19]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_20]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_20]< 0
	

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_1]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_1]  Is Null
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_2]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_2]  Is Null
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_3]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_3]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_4]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_4]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_5]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_5]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_6]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_6]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_7]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_7]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_8]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_8]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_9]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_9]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_10]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_10]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_11]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_11]  Is Null
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_12]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_12]  Is Null
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_13]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_13]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_14]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_14]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_15]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_15]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_16]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_16]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_17]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_17]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_18]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_18]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_19]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_19]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_ACTUAL_WITHIN_PLANNED_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_20]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_20]  Is Null

	
END



GO


