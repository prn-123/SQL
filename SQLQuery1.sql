CREATE DATABASE InstituteManagement


USE InstituteManagement







---------BATCHES----------

CREATE TABLE Batches(BatchId INT PRIMARY KEY IDENTITY(1,1), BatchName VARCHAR(40),Remarks VARCHAR(40))


CREATE PROCEDURE spBatchesCRUB @pOperation VARCHAR(40)=NULL,@pBatchName VARCHAR(40)=NULL,
@pRemarks VARCHAR(40)=NULL,@pBatchId INT=NULL
AS
BEGIN
IF @pOperation='Select'
	BEGIN
		SELECT * FROM Batches
	END
ELSE IF @pOperation='Insert'
	BEGIN
		INSERT INTO Batches VALUES(@pBatchName,@pRemarks)
	END
ELSE IF @pOperation='Find'
	BEGIN
		SELECT * FROM Batches WHERE BatchId=@pBatchId
	END
ELSE IF @pOperation='Update'
	BEGIN
		UPDATE Batches SET BatchName=@pBatchName,Remarks=@pRemarks WHERE BatchId=@pBatchId
	END
ELSE IF @pOperation='DELETE'
	BEGIN
		DELETE FROM Batches WHERE BatchId=@pBatchId
	END
END
	

spBatchesCRUB @pOperation='Select'

spBatchesCRUB @pOperation='Insert', @pBatchName='ANGULAR', @pRemarks='Started on OCT12'
spBatchesCRUB @pOperation='Insert', @pBatchName='.NET', @pRemarks='Started on nov1'
spBatchesCRUB @pOperation='Insert', @pBatchName='Angular', @pRemarks='Started on nov19'

spBatchesCRUB @pOperation='delete', @pBatchId=1

spBatchesCRUB @pOperation='Find',@pBatchId=2

spBatchesCRUB @pOperation='Update',@pBatchName='REACT',@pRemarks='Started on oct 18' , @pBatchId=4










----------TRAINEES---------

CREATE TABLE Trainees(TraineeId INT PRIMARY KEY IDENTITY(1,1),BatchId INT REFERENCES Batches(BatchId),
TraineeName VARCHAR(40),Location VARCHAR(40))


CREATE PROCEDURE spTraineesCRUD @pOperation VARCHAR(40),@pTraineeId INT =NULL,
@pTraineeName VARCHAR(40)=NULL, @pBatchId VARCHAR(50)=NULL,@pLocation VARCHAR(60)=NULL

AS
BEGIN
IF @pOperation='INSERT'
	BEGIN
		INSERT INTO Trainees VALUES(@pBatchId,@pTraineeName,@pLocation)
	END
ELSE IF @pOperation='UPDATE' 
	BEGIN
		UPDATE Trainees SET BatchId=@pBatchId,TraineeName=@pTraineeName,Location=@pLocation WHERE TraineeId=@pTraineeId
	END
ELSE IF @pOperation='DELETE'
	BEGIN
		DELETE FROM Trainees WHERE TraineeId=@pTraineeId
	END
ELSE IF @pOperation='FIND'
	BEGIN
		SELECT * FROM Trainees WHERE TraineeId=@pTraineeId
	END
ELSE IF @pOperation='SELECT'
	BEGIN
		SELECT T.TraineeId,B.BatchName,T.TraineeName,T.Location FROM Batches B INNER JOIN Trainees T ON B.BatchId=T.BatchId
	END
END


spTraineesCRUD @pOperation='Insert' ,@pBatchId=2,@pTraineeName='Pournami',@pLocation='Pathanamthitta'
spTraineesCRUD @pOperation='Insert',@pBatchId=2,@pTraineeName='Reshma',@pLocation='Chengannur'
spTraineesCRUD @pOperation='Insert',@pBatchId=3,@pTraineeName='Jincy',@pLocation='Kollam'
spTraineesCRUD @pOperation='Insert',@pBatchId=3,@pTraineeName='Aleena',@pLocation='Thrissur'

spTraineesCRUD @pOperation='SELECT'

spTraineesCRUD @pOperation='Update', @pBatchId=3,@pTraineeName='Mamatha',@pLocation='Kottayam'

spTraineesCRUD @pOperation='Delete',@pTraineeId=4

spTraineesCRUD @pOperation='Find', @pTraineeId=1










----------ASSIGNMENTS-------------

CREATE TABLE Assignments(AssignmentId INT PRIMARY KEY IDENTITY(1,1),
TraineeId INT REFERENCES Trainees(TraineeId),Assignment VARCHAR(40),Status VARCHAR(40))


ALTER PROCEDURE spAssignments @pOperation VARCHAR(40), @pAssignmentId INT=NULL,
 @pAssignment VARCHAR(40)=NULL, @pStatus VARCHAR(40)=NULL, @pTraineeId INT =NULL
AS
BEGIN
IF @pOperation='INSERT'
	BEGIN
		INSERT INTO Assignments VALUES(@pTraineeId,@pAssignment,@pStatus)
	END
ELSE IF @pOperation='DELETE'
	BEGIN
		DELETE FROM Assignments WHERE AssignmentId=@pAssignmentId
	END
ELSE IF @pOperation='FIND'
	BEGIN
		SELECT * FROM Assignments WHERE AssignmentId=@pAssignmentId
	END
ELSE IF @pOperation='UPDATE'
	BEGIN
		UPDATE Assignments SET TraineeId=@pTraineeId,Assignment=@pAssignment,Status=@pStatus WHERE AssignmentId=@pAssignmentId
	END
ELSE IF @pOperation='SELECT'
	BEGIN
		SELECT A.AssignmentId,T.TraineeName,A.Assignment,A.Status FROM Trainees T INNER JOIN 
		Assignments A ON T.TraineeId=A.TraineeId
	END
END


spAssignments @pOperation='Insert',@pTraineeId=1,@pAssignment='DART',@pStatus='C'
spAssignments @pOperation='Insert',@pTraineeId=1,@pAssignment='ASP.NET',@pStatus='C'
spAssignments @pOperation='Insert',@pTraineeId=2,@pAssignment='FRAMEWORK',@pStatus='P'
spAssignments @pOperation='Insert',@pTraineeId=2,@pAssignment='MONGODB',@pStatus='C'
spAssignments @pOperation='Insert',@pTraineeId=3,@pAssignment='DART',@pStatus='P'
spAssignments @pOperation='Insert',@pTraineeId=3,@pAssignment='RDBMS',@pStatus='C'
spAssignments @pOperation='Insert',@pTraineeId=4,@pAssignment='VUE JS',@pStatus='P'

spAssignments @pOperation='Select'

spAssignments @pOperation='update',@pAssignment='POCO',@pAssignmentId=5,@pStatus='C'

spAssignments @pOperation='delete',@pAssignmentId=7

spAssignments @pOperation='FIND',@pAssignmentId=3