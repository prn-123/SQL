CREATE PROCEDURE spSimplifiedContactCRUD @pOption VARCHAR(40),
@pContactId INT=NULL,@pContactName VARCHAR(40)=NULL,@pLocation VARCHAR(40)=NULL

AS
BEGIN
IF @pOption='Select'
	BEGIN
		SELECT * FROM Contacts
	END
ELSE IF @pOption='Find'
	BEGIN
		SELECT * FROM Contacts WHERE ContactId=@pContactId
	END
ELSE IF @pOption='Insert'
	BEGIN
		INSERT INTO Contacts VALUES(@pContactName,@pLocation)
	END
ELSE IF @pOption='Delete'
	BEGIN
		DELETE FROM Contacts WHERE ContactId=@pContactId
	END	
END

--RUN ==>

spSimplifiedContactCRUD @pOption='Select'  +f5

spSimplifiedContactCRUD @pOption='insert',@pContactName='Parameswari Devi',@pLocation='Thiruvalla' +F5

spSimplifiedContactCRUD @pOption='find',@pContactId=1

spSimplifiedContactCRUD @pOption='Delete',@pContactId=3


