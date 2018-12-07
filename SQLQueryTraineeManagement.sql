
alter PROCEDURE spTraineeCRUD @pStatement varchar(10) ,@pTraineeId INT=NULL,
@pTraineeName VARCHAR(40) = NULL, @pFinalProject VARCHAR(40) = NULL	
AS
BEGIN
	IF @pStatement = 'SELECT'
		BEGIN
			SELECT * FROM Trainees
		END
	IF @pStatement = 'FIND'
		BEGIN
			SELECT * FROM Trainees WHERE TraineeId=@pTraineeId
		END
	IF @pStatement='INSERT'
		BEGIN
			INSERT INTO Trainees VALUES(@pTraineeName,@pFinalProject)
		END
END
GO

spTraineeCRUD @pStatement ='Select'


spTraineeCRUD @pStatement ='FIND', @pTraineeId=1



spTraineeCRUD @pStatement ='INSERT', @pTraineeName = 'KAVERI', @pFinalProject = 'Glove pie'