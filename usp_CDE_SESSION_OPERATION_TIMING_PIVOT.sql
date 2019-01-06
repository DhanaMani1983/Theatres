USE [Cerner_CDS_Extract]
GO

/****** Object:  StoredProcedure [dbo].[usp_CDE_SESSION_OPERATION_TIMING_PIVOT]    Script Date: 06/01/2019 23:26:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CDE_SESSION_OPERATION_TIMING_PIVOT]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CDE_SESSION_OPERATION_TIMING_PIVOT]') AND type in (N'U'))
	DROP TABLE CDE_SESSION_OPERATION_TIMING_PIVOT
    -- Insert statements for procedure here
	SELECT
	BLOCK_INSTANCE_ID,
	MAX(case when [Slot_Sequence_NBR] = 1 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR1],
	MAX(case when [Slot_Sequence_NBR] = 1 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR1],
	MAX(case when [Slot_Sequence_NBR] = 1 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite1],
	MAX(case when [Slot_Sequence_NBR] = 1 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start1],
	--MAX(case when [Slot_Sequence_NBR] = 1 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID1],
	MAX(case when [Slot_Sequence_NBR] = 1 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin1],
	--MAX(case when [Slot_Sequence_NBR] = 1 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT1,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_1],
	CAST(null as int) as [Session TimeTaken Within Planned_1],


	MAX(case when [Slot_Sequence_NBR] = 2 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR2],
	MAX(case when [Slot_Sequence_NBR] = 2 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR2],
	MAX(case when [Slot_Sequence_NBR] = 2 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite2],
	MAX(case when [Slot_Sequence_NBR] = 2 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start2],
	--MAX(case when [Slot_Sequence_NBR] = 2 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID2],
	MAX(case when [Slot_Sequence_NBR] = 2 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin2],
	--MAX(case when [Slot_Sequence_NBR] = 2 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT2,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_2],
	CAST(null as int) as [Session TimeTaken Within Planned_2],
	

	MAX(case when [Slot_Sequence_NBR] = 3 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR3],
	MAX(case when [Slot_Sequence_NBR] = 3 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR3],
	MAX(case when [Slot_Sequence_NBR] = 3 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite3],
	MAX(case when [Slot_Sequence_NBR] = 3 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start3],
	--MAX(case when [Slot_Sequence_NBR] = 3 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID3],
	MAX(case when [Slot_Sequence_NBR] = 3 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin3],
	--MAX(case when [Slot_Sequence_NBR] = 3 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT3,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_3],
	CAST(null as int) as [Session TimeTaken Within Planned_3],
	


	MAX(case when [Slot_Sequence_NBR] = 4 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR4],
	MAX(case when [Slot_Sequence_NBR] = 4 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR4],
	MAX(case when [Slot_Sequence_NBR] = 4 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite4],
	MAX(case when [Slot_Sequence_NBR] = 4 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start4],
	--MAX(case when [Slot_Sequence_NBR] = 4 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID4],
	MAX(case when [Slot_Sequence_NBR] = 4 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin4],
	--MAX(case when [Slot_Sequence_NBR] = 4 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT4,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_4],
	CAST(null as int) as [Session TimeTaken Within Planned_4],


	MAX(case when [Slot_Sequence_NBR] = 5 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR5],
	MAX(case when [Slot_Sequence_NBR] = 5 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR5],
	MAX(case when [Slot_Sequence_NBR] = 5 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite5],
	MAX(case when [Slot_Sequence_NBR] = 5 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start5],
	--MAX(case when [Slot_Sequence_NBR] = 5 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID5],
	MAX(case when [Slot_Sequence_NBR] = 5 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin5],
	--MAX(case when [Slot_Sequence_NBR] = 5 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT5,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_5],
	CAST(null as int) as [Session TimeTaken Within Planned_5],
	

	MAX(case when [Slot_Sequence_NBR] = 6 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR6],
	MAX(case when [Slot_Sequence_NBR] = 6 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR6],
	MAX(case when [Slot_Sequence_NBR] = 6 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite6],
	MAX(case when [Slot_Sequence_NBR] = 6 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start6],
	--MAX(case when [Slot_Sequence_NBR] = 6 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID6],
	MAX(case when [Slot_Sequence_NBR] = 6 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin6],
	--MAX(case when [Slot_Sequence_NBR] = 6 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT6,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_6],
	CAST(null as int) as [Session TimeTaken Within Planned_6],
	


	MAX(case when [Slot_Sequence_NBR] = 7 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR7],
	MAX(case when [Slot_Sequence_NBR] = 7 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR7],
	MAX(case when [Slot_Sequence_NBR] = 7 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite7],
	MAX(case when [Slot_Sequence_NBR] = 7 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start7],
	--MAX(case when [Slot_Sequence_NBR] = 7 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID7],
	MAX(case when [Slot_Sequence_NBR] = 7 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin7],
	--MAX(case when [Slot_Sequence_NBR] = 7 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT7,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_7],
	CAST(null as int) as [Session TimeTaken Within Planned_7],
	


	MAX(case when [Slot_Sequence_NBR] = 8 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR8],
	MAX(case when [Slot_Sequence_NBR] = 8 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR8],
	MAX(case when [Slot_Sequence_NBR] = 8 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite8],
	MAX(case when [Slot_Sequence_NBR] = 8 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start8],
	--MAX(case when [Slot_Sequence_NBR] = 8 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID8],
	MAX(case when [Slot_Sequence_NBR] = 8 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin8],
	--MAX(case when [Slot_Sequence_NBR] = 8 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT8,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_8],
	CAST(null as int) as [Session TimeTaken Within Planned_8],
	

	MAX(case when [Slot_Sequence_NBR] = 9 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR9],
	MAX(case when [Slot_Sequence_NBR] = 9 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR9],
	MAX(case when [Slot_Sequence_NBR] = 9 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite9],
	MAX(case when [Slot_Sequence_NBR] = 9 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start9],
	--MAX(case when [Slot_Sequence_NBR] = 9 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID9],
	MAX(case when [Slot_Sequence_NBR] = 9 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin9],
	--MAX(case when [Slot_Sequence_NBR] = 9 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT9,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_9],
	CAST(null as int) as [Session TimeTaken Within Planned_9],

	

	MAX(case when [Slot_Sequence_NBR] = 10 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR10],
	MAX(case when [Slot_Sequence_NBR] = 10 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR10],
	MAX(case when [Slot_Sequence_NBR] = 10 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite10],
	MAX(case when [Slot_Sequence_NBR] = 10 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start10],
	--MAX(case when [Slot_Sequence_NBR] = 10 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID10],
	MAX(case when [Slot_Sequence_NBR] = 10 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin10],
	--MAX(case when [Slot_Sequence_NBR] = 10 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT10,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_10],
	CAST(null as int) as [Session TimeTaken Within Planned_10],
	

	MAX(case when [Slot_Sequence_NBR] = 11 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR11],
	MAX(case when [Slot_Sequence_NBR] = 11 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR11],
	MAX(case when [Slot_Sequence_NBR] = 11 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite11],
	MAX(case when [Slot_Sequence_NBR] = 11 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start11],
	--MAX(case when [Slot_Sequence_NBR] = 11 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID11],
	MAX(case when [Slot_Sequence_NBR] = 11 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin11],
	--MAX(case when [Slot_Sequence_NBR] = 11 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT11,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_11],
	CAST(null as int) as [Session TimeTaken Within Planned_11],	


	MAX(case when [Slot_Sequence_NBR] = 12 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR12],
	MAX(case when [Slot_Sequence_NBR] = 12 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR12],
	MAX(case when [Slot_Sequence_NBR] = 12 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite12],
	MAX(case when [Slot_Sequence_NBR] = 12 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start12],
	--MAX(case when [Slot_Sequence_NBR] = 12 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID12],
	MAX(case when [Slot_Sequence_NBR] = 12 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin12],
	--MAX(case when [Slot_Sequence_NBR] = 12 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT12,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_12],
	CAST(null as int) as [Session TimeTaken Within Planned_12],		


	MAX(case when [Slot_Sequence_NBR] = 13 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR13],
	MAX(case when [Slot_Sequence_NBR] = 13 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR13],
	MAX(case when [Slot_Sequence_NBR] = 13 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite13],
	MAX(case when [Slot_Sequence_NBR] = 13 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start13],
	--MAX(case when [Slot_Sequence_NBR] = 13 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID13],
	MAX(case when [Slot_Sequence_NBR] = 13 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin13],
	--MAX(case when [Slot_Sequence_NBR] = 13 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT13,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_13],
	CAST(null as int) as [Session TimeTaken Within Planned_13],		

	MAX(case when [Slot_Sequence_NBR] = 14 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR14],
	MAX(case when [Slot_Sequence_NBR] = 14 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR14],
	MAX(case when [Slot_Sequence_NBR] = 14 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite14],
	MAX(case when [Slot_Sequence_NBR] = 14 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start14],
	--MAX(case when [Slot_Sequence_NBR] = 14 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID14],
	MAX(case when [Slot_Sequence_NBR] = 14 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin14],
	--MAX(case when [Slot_Sequence_NBR] = 14 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT14,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_14],
	CAST(null as int) as [Session TimeTaken Within Planned_14],		


	MAX(case when [Slot_Sequence_NBR] = 15 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR15],
	MAX(case when [Slot_Sequence_NBR] = 15 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR15],
	MAX(case when [Slot_Sequence_NBR] = 15 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite15],
	MAX(case when [Slot_Sequence_NBR] = 15 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start15],
	--MAX(case when [Slot_Sequence_NBR] = 15 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID15],
	MAX(case when [Slot_Sequence_NBR] = 15 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin15],
	--MAX(case when [Slot_Sequence_NBR] = 15 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT15,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_15],
	CAST(null as int) as [Session TimeTaken Within Planned_15],		


	MAX(case when [Slot_Sequence_NBR] = 16 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR16],
	MAX(case when [Slot_Sequence_NBR] = 16 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR16],
	MAX(case when [Slot_Sequence_NBR] = 16 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite16],
	MAX(case when [Slot_Sequence_NBR] = 16 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start16],
	--MAX(case when [Slot_Sequence_NBR] = 16 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID16],
	MAX(case when [Slot_Sequence_NBR] = 16 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin16],
	--MAX(case when [Slot_Sequence_NBR] = 16 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT16,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_16],
	CAST(null as int) as [Session TimeTaken Within Planned_16],		

	MAX(case when [Slot_Sequence_NBR] = 17 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR17],
	MAX(case when [Slot_Sequence_NBR] = 17 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR17],
	MAX(case when [Slot_Sequence_NBR] = 17 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite17],
	MAX(case when [Slot_Sequence_NBR] = 17 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start17],
	--MAX(case when [Slot_Sequence_NBR] = 17 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID17],
	MAX(case when [Slot_Sequence_NBR] = 17 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin17],
	--MAX(case when [Slot_Sequence_NBR] = 17 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT17,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_17],
	CAST(null as int) as [Session TimeTaken Within Planned_17],		

	MAX(case when [Slot_Sequence_NBR] = 18 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR18],
	MAX(case when [Slot_Sequence_NBR] = 18 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR18],
	MAX(case when [Slot_Sequence_NBR] = 18 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite18],
	MAX(case when [Slot_Sequence_NBR] = 18 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start18],
	--MAX(case when [Slot_Sequence_NBR] = 18 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID18],
	MAX(case when [Slot_Sequence_NBR] = 18 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin18],
	--MAX(case when [Slot_Sequence_NBR] = 18 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT18,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_18],
	CAST(null as int) as [Session TimeTaken Within Planned_18],		

	MAX(case when [Slot_Sequence_NBR] = 19 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR19],
	MAX(case when [Slot_Sequence_NBR] = 19 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR19],
	MAX(case when [Slot_Sequence_NBR] = 19 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite19],
	MAX(case when [Slot_Sequence_NBR] = 19 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start19],
	--MAX(case when [Slot_Sequence_NBR] = 19 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID19],
	MAX(case when [Slot_Sequence_NBR] = 19 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin19],
	--MAX(case when [Slot_Sequence_NBR] = 19 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT19,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_19],
	CAST(null as int) as [Session TimeTaken Within Planned_19],		

	MAX(case when [Slot_Sequence_NBR] = 20 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR20],
	MAX(case when [Slot_Sequence_NBR] = 20 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR20],
	MAX(case when [Slot_Sequence_NBR] = 20 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite20],
	MAX(case when [Slot_Sequence_NBR] = 20 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start20],
	--MAX(case when [Slot_Sequence_NBR] = 20 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID20],
	MAX(case when [Slot_Sequence_NBR] = 20 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin20],
	--MAX(case when [Slot_Sequence_NBR] = 20 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT20,
		CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_20],
	CAST(null as int) as [Session TimeTaken Within Planned_20],			
	
	MAX(case when [Slot_Sequence_NBR] = 21 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR21],
	MAX(case when [Slot_Sequence_NBR] = 21 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR21],
	MAX(case when [Slot_Sequence_NBR] = 21 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite21],
	MAX(case when [Slot_Sequence_NBR] = 21 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start21],
	--MAX(case when [Slot_Sequence_NBR] = 21 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID21],
	MAX(case when [Slot_Sequence_NBR] = 21 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin21],
	--MAX(case when [Slot_Sequence_NBR] = 21 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT21,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_21],
	CAST(null as int) as [Session TimeTaken Within Planned_21],		

	MAX(case when [Slot_Sequence_NBR] = 22 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR22],
	MAX(case when [Slot_Sequence_NBR] = 22 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR22],
	MAX(case when [Slot_Sequence_NBR] = 22 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite22],
	MAX(case when [Slot_Sequence_NBR] = 22 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start22],
	--MAX(case when [Slot_Sequence_NBR] = 22 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID22],
	MAX(case when [Slot_Sequence_NBR] = 22 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin22],
	--MAX(case when [Slot_Sequence_NBR] = 22 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT22,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_22],
	CAST(null as int) as [Session TimeTaken Within Planned_22],		

	MAX(case when [Slot_Sequence_NBR] = 23 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR23],
	MAX(case when [Slot_Sequence_NBR] = 23 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR23],
	MAX(case when [Slot_Sequence_NBR] = 23 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite23],
	MAX(case when [Slot_Sequence_NBR] = 23 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start23],
	--MAX(case when [Slot_Sequence_NBR] = 23 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID23],
	MAX(case when [Slot_Sequence_NBR] = 23 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin23],
	--MAX(case when [Slot_Sequence_NBR] = 23 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT23,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_23],
	CAST(null as int) as [Session TimeTaken Within Planned_23],		

	MAX(case when [Slot_Sequence_NBR] = 24 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR24],
	MAX(case when [Slot_Sequence_NBR] = 24 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR24],
	MAX(case when [Slot_Sequence_NBR] = 24 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite24],
	MAX(case when [Slot_Sequence_NBR] = 24 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start24],
	--MAX(case when [Slot_Sequence_NBR] = 24 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID24],
	MAX(case when [Slot_Sequence_NBR] = 24 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin24],
	--MAX(case when [Slot_Sequence_NBR] = 24 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT24,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_24],
	CAST(null as int) as [Session TimeTaken Within Planned_24],		


	MAX(case when [Slot_Sequence_NBR] = 25 then [Slot_Sequence_NBR] end) as [Slot_Sequence_NBR25],
	MAX(case when [Slot_Sequence_NBR] = 25 then [Operation DateTime C4 OutOf OR] end) as [Operation DateTime C4 OutOf OR25],
	MAX(case when [Slot_Sequence_NBR] = 25 then [Operation DateTime A3 Into Suite] end) as [Operation DateTime A3 Into Suite25],
	MAX(case when [Slot_Sequence_NBR] = 25 then [Operation DateTime B1 Anaes Start] end) as [Operation DateTime B1 Anaes Start25],
	--MAX(case when [Slot_Sequence_NBR] = 25 then [ENCNTR_SLICE_ID] end) as [ENCNTR_SLICE_ID25],
	MAX(case when [Slot_Sequence_NBR] = 25 then [Operation DateTime C2 Knife to Skin] end) as [Operation DateTime C2 Knife to Skin25],
	--MAX(case when [Slot_Sequence_NBR] = 25 then CONCEPT_CKI_IDENT end) as CONCEPT_CKI_IDENT25,
	CAST(null as int) as [Operation TimeGap Next Surgery Within Planned1700_25],
	CAST(null as int) as [Session TimeTaken Within Planned_25]


	INTO CDE_SESSION_OPERATION_TIMING_PIVOT
	
	FROM OPERATION_DUMP
	Where (rtrim(ltrim([BLOCK_INSTANCE_ID]))<> '' and  [BLOCK_INSTANCE_ID] is not null) and ([Slot_Sequence_NBR] is not null and [Slot_Sequence_NBR] <> '')
	GROUP BY [BLOCK_INSTANCE_ID]
	ORDER BY  [BLOCK_INSTANCE_ID]
	

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_1]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR1]),convert(Datetime,[Operation DateTime B1 Anaes Start2]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR1 is not NULL and Slot_Sequence_NBR2 is not null and [Operation DateTime C4 OutOf OR1] is not null and [Operation DateTime B1 Anaes Start2] is not null	

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_2]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR2]),convert(Datetime,[Operation DateTime B1 Anaes Start3]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR2 is not NULL and Slot_Sequence_NBR3 is not null and [Operation DateTime C4 OutOf OR2] is not null and [Operation DateTime B1 Anaes Start3] is not null	
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_3]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR3]),convert(Datetime,[Operation DateTime B1 Anaes Start4]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR3 is not NULL and Slot_Sequence_NBR4 is not null and [Operation DateTime C4 OutOf OR3] is not null and [Operation DateTime B1 Anaes Start4] is not null	
		
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_4]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR4]),convert(Datetime,[Operation DateTime B1 Anaes Start5]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR4 is not NULL and Slot_Sequence_NBR5 is not null and [Operation DateTime C4 OutOf OR4] is not null and [Operation DateTime B1 Anaes Start5] is not null	

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_5]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR5]),convert(Datetime,[Operation DateTime B1 Anaes Start6]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR5 is not NULL and Slot_Sequence_NBR6 is not null and [Operation DateTime C4 OutOf OR5] is not null and [Operation DateTime B1 Anaes Start6] is not null	
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_6]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR6]),convert(Datetime,[Operation DateTime B1 Anaes Start7]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR6 is not NULL and Slot_Sequence_NBR7 is not null and [Operation DateTime C4 OutOf OR6] is not null and [Operation DateTime B1 Anaes Start7] is not null	
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_7]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR7]),convert(Datetime,[Operation DateTime B1 Anaes Start8]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR7 is not NULL and Slot_Sequence_NBR8 is not null and [Operation DateTime C4 OutOf OR7] is not null and [Operation DateTime B1 Anaes Start8] is not null	
				
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_8]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR8]),convert(Datetime,[Operation DateTime B1 Anaes Start9]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR8 is not NULL and Slot_Sequence_NBR9 is not null and [Operation DateTime C4 OutOf OR8] is not null and [Operation DateTime B1 Anaes Start9] is not null	

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_9]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR9]),convert(Datetime,[Operation DateTime B1 Anaes Start10]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR9 is not NULL and Slot_Sequence_NBR10 is not null and [Operation DateTime C4 OutOf OR9] is not null and [Operation DateTime B1 Anaes Start10] is not null	
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_10]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR10]),convert(Datetime,[Operation DateTime B1 Anaes Start11]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR10 is not NULL and Slot_Sequence_NBR11 is not null and [Operation DateTime C4 OutOf OR10] is not null and [Operation DateTime B1 Anaes Start11] is not null	

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_11]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR11]),convert(Datetime,[Operation DateTime B1 Anaes Start12]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR11 is not NULL and Slot_Sequence_NBR12 is not null and [Operation DateTime C4 OutOf OR11] is not null and [Operation DateTime B1 Anaes Start12] is not null				

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_12]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR12]),convert(Datetime,[Operation DateTime B1 Anaes Start13]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR12 is not NULL and Slot_Sequence_NBR13 is not null and [Operation DateTime C4 OutOf OR12] is not null and [Operation DateTime B1 Anaes Start13] is not null	
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_13]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR13]),convert(Datetime,[Operation DateTime B1 Anaes Start14]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR13 is not NULL and Slot_Sequence_NBR14 is not null and [Operation DateTime C4 OutOf OR13] is not null and [Operation DateTime B1 Anaes Start14] is not null		

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_14]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR14]),convert(Datetime,[Operation DateTime B1 Anaes Start15]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR14 is not NULL and Slot_Sequence_NBR15 is not null and [Operation DateTime C4 OutOf OR14] is not null and [Operation DateTime B1 Anaes Start15] is not null	

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_15]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR15]),convert(Datetime,[Operation DateTime B1 Anaes Start16]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR15 is not NULL and Slot_Sequence_NBR16 is not null and [Operation DateTime C4 OutOf OR15] is not null and [Operation DateTime B1 Anaes Start16] is not null					   		   			   		   			   			   			   		   
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_16]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR16]),convert(Datetime,[Operation DateTime B1 Anaes Start17]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR16 is not NULL and Slot_Sequence_NBR17 is not null and [Operation DateTime C4 OutOf OR16] is not null and [Operation DateTime B1 Anaes Start17] is not null		

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_17]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR17]),convert(Datetime,[Operation DateTime B1 Anaes Start18]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR17 is not NULL and Slot_Sequence_NBR18 is not null and [Operation DateTime C4 OutOf OR17] is not null and [Operation DateTime B1 Anaes Start18] is not null	

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_18]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR18]),convert(Datetime,[Operation DateTime B1 Anaes Start19]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR18 is not NULL and Slot_Sequence_NBR19 is not null and [Operation DateTime C4 OutOf OR18] is not null and [Operation DateTime B1 Anaes Start19] is not null			
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_19]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR19]),convert(Datetime,[Operation DateTime B1 Anaes Start20]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR19 is not NULL and Slot_Sequence_NBR20 is not null and [Operation DateTime C4 OutOf OR19] is not null and [Operation DateTime B1 Anaes Start20] is not null	

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_20]= Datediff(mi,convert(Datetime,[Operation DateTime C4 OutOf OR20]),convert(Datetime,[Operation DateTime B1 Anaes Start21]))
	FROM    dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Where Slot_Sequence_NBR20 is not NULL and Slot_Sequence_NBR21 is not null and [Operation DateTime C4 OutOf OR20] is not null and [Operation DateTime B1 Anaes Start21] is not null	
		

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_1]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_1]< 0
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_2]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_2]< 0
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_3]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_3]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_4]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_4]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_5]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_5]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_6]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_6]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_7]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_7]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_8]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_8]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_9]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_9]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_10]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_10]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_11]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_11]< 0
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_12]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_12]< 0
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_13]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_13]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_14]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_14]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_15]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_15]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_16]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_16]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_17]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_17]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_18]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_18]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_19]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_19]< 0

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_20]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_20]< 0
	

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_1]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_1]  Is Null
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_2]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_2]  Is Null
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_3]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_3]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_4]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_4]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_5]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_5]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_6]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_6]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_7]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_7]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_8]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_8]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_9]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_9]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_10]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_10]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_11]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_11]  Is Null
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_12]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_12]  Is Null
	
	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_13]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_13]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_14]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_14]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_15]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_15]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_16]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_16]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_17]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_17]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_18]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_18]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_19]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_19]  Is Null

	Update dbo.CDE_SESSION_OPERATION_TIMING_PIVOT
	Set [Operation TimeGap Next Surgery Within Planned1700_20]= 0		
	Where [Operation TimeGap Next Surgery Within Planned1700_20]  Is Null

	
END


GO


