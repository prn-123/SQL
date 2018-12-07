
ALTER PROCEDURE spAssignmentCRUD @pOption VARCHAR(40),@pContactId INT=NULL,
@pAssignment VARCHAR(40)=NULL,@pStatus VARCHAR(40)=NULL,@pAssignmentId INT=NULL
AS
  BEGIN
	IF @pOption='Select'
		BEGIN 
			SELECT * FROM Assignments 
		END
	ELSE IF @pOption='Insert'
		BEGIN
			INSERT INTO Assignments VALUES(@pContactId,@pAssignment,@pStatus)
		END
	ELSE IF @pOption='Delete'
		BEGIN
			DELETE FROM Assignments WHERE AssignmentId=@pAssignmentId
		END
	ELSE IF @pOption='Find'
		BEGIN
			SELECT * FROM Assignments WHERE AssignmentId=@pAssignmentId
		END
	ELSE IF @pOption='Update'
		BEGIN
			UPDATE Assignments SET Assignment=@pAssignment,Status=@pStatus WHERE AssignmentId=@pAssignmentId
		END
END



spAssignmentCRUD @pOption='Insert',@pContactId=1,@pAssignment='DART',@pStatus='Completed'
spAssignmentCRUD @pOption='Insert',@pContactId=1,@pAssignment='VUE JS',@pStatus='Pending'
spAssignmentCRUD @pOption='Insert',@pContactId=1,@pAssignment='LAMP',@pStatus='Completed'
spAssignmentCRUD @pOption='Insert',@pContactId=1,@pAssignment='RDBMS',@pStatus='Completed'
spAssignmentCRUD @pOption='Insert',@pContactId=1,@pAssignment='SCSS',@pStatus='Pending'

spAssignmentCRUD @pOption='Select'  


SELECT A.Assignment,A.Status,C.ContactName FROM Contacts C INNER JOIN Assignments A ON A.ContactId=c.ContactId