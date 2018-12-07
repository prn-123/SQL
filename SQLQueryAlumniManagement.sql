ALTER PROCEDURE spBatchesCRUD 
@pOperation VARCHAR(10),
@pBatchId INT = NULL, 
@pBatchName VARCHAR(20) = NULL, 
@pNoOfStudents INT = NULL,
@pDateOfPassout DATE = NULL,
@pRemarks VARCHAR(30) = NULL
AS
BEGIN
IF @pOperation = 'INSERT'
	BEGIN
		INSERT INTO Batches VALUES(
		@pBatchName, @pNoOfStudents, 
		@pDateOfPassout, @pRemarks)
	END
IF @pOperation = 'SELECT'
	BEGIN
		SELECT * FROM Batches
	END
IF @pOperation = 'FIND'
	BEGIN
		SELECT * FROM Batches WHERE BatchId = @pBatchId
	END
IF @pOperation = 'DELETE' 
	BEGIN
		DELETE FROM Batches WHERE BatchId = @pBatchId
END
IF @pOperation = 'UPDATE'
	BEGIN
		UPDATE Batches SET BatchName = @pBatchName, 
		NoOfStudents = @pNoOfStudents, 
		DateOfPassout = @pDateOfPassout,
		Remarks = @pRemarks WHERE BatchId = @pBatchId
	END
END

spBatchesCRUD @POPERATION='INSERT', @PBATCHNAME='2012 BATCH',
@PNOOFSTUDENTS=42,
@PDATEOFPASSOUT='1-Apr-2012',
@PREMARKS='2012 BATCH'


spBatchesCRUD @POPERATION = 'SELECT'


spBatchesCRUD @POPERATION = 'FIND', @PBATCHID = 3

spBatchesCRUD @POPERATION = 'UPDATE', @PBATCHNAME = '2000 BATCH', 
@PNOOFSTUDENTS = 4, @PREMARKS = '2000 BATCH',
@PDATEOFPASSOUT = '1-APR-2000', @PBATCHID = 2


spBatchesCRUD @POPERATION = 'DELETE' @PBATCHID = 1