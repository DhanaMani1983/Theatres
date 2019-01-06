USE [Cerner_CDS_Extract]
GO

/****** Object:  StoredProcedure [dbo].[usp_OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned]    Script Date: 06/01/2019 23:30:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned]') AND type in (N'U'))
	DROP TABLE OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned

	--Select row_number() over (partition by BLOCK_INSTANCE_ID order by SLOT_START_DT_TM ) as Slot_Sequence_NBR_Within_Planned,*,'No ' as FirstCase, 'No ' as Lastcase
	--InTo OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned
	--From OPERATION_DUMP
	--Where [Operation DateTime C4 OutOf OR] is not null and [Operation DateTime B1 Anaes Start] is not null 
	--Order By BLOCK_INSTANCE_ID

	Select row_number() over (partition by BLOCK_INSTANCE_ID order by convert(datetime,[Operation DateTime B1 Anaes Start]  ,113) ) as Slot_Sequence_NBR_Within_Planned,*,'No ' as FirstCase, 'No ' as Lastcase
	InTo OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned
	From OPERATION_DUMP
	Where [Operation DateTime C4 OutOf OR] is not null and [Operation DateTime B1 Anaes Start] is not null 
	Order By BLOCK_INSTANCE_ID
		

	Update OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned
	Set Lastcase = 'Yes'
	From OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned o Inner Join 
	(select [BLOCK_INSTANCE_ID],Max(Slot_Sequence_NBR_Within_Planned)as Slot_Sequence_NBR_Within_Planned
	from OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned
	Group By [BLOCK_INSTANCE_ID]) q	
	On o.BLOCK_INSTANCE_ID= q.BLOCK_INSTANCE_ID and o.Slot_Sequence_NBR_Within_Planned= q.Slot_Sequence_NBR_Within_Planned

	Update OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned
	Set Lastcase = 'No'
	Where Lastcase = 'No '
	
	Update OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned
	Set FirstCase = 'Yes'
	From OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned o Inner Join 
	(select [BLOCK_INSTANCE_ID],Min(Slot_Sequence_NBR_Within_Planned)as Slot_Sequence_NBR_Within_Planned
	from OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned
	Group By [BLOCK_INSTANCE_ID]) q	
	On o.BLOCK_INSTANCE_ID= q.BLOCK_INSTANCE_ID and o.Slot_Sequence_NBR_Within_Planned= q.Slot_Sequence_NBR_Within_Planned

	Update OPERATION_DUMP_With_Slot_Sequence_NBR_Within_Planned
	Set FirstCase = 'No'
	Where FirstCase = 'No '

	
End


GO


