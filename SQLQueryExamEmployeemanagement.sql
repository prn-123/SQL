CREATE PROCEDURE spEmployeeCRUD
@pOperation VARCHAR(20), @pEmployeeId INT = NULL,
@pEmployeeName VARCHAR(30) = NULL,
@pLocation VARCHAR(30) = NULL,
@pDateOfJoin DATE = NULL
AS
BEGIN
IF @pOperation = 'SELECT'
	BEGIN
		SELECT * FROM Employee
	END
ELSE IF @pOperation = 'FIND'
	BEGIN
		SELECT * FROM Employee WHERE EmployeeId = @pEmployeeId
	END
ELSE IF @pOperation='INSERT'
	BEGIN
		INSERT INTO Employee VALUES(@pEmployeeName, @pLocation, @pDateOfJoin)
	END
END


spEmployeeCRUD @pOperation = 'SELECT'

spEmployeeCRUD @pOperation = 'FIND', @pEmployeeId = 2

spEmployeeCRUD @pOperation = 'INSERT', @pEmployeeName = 'Pournami', 
@pLocation = 'Pathanamthitta', @pDateOfJoin = '8-Oct-2018'

spEmployeeCRUD @pOperation = 'INSERT', @pEmployeeName = 'Reshma', 
@pLocation = 'Chengannur', @pDateOfJoin = '8-Oct-2018'

spEmployeeCRUD @pOperation = 'INSERT', @pEmployeeName = 'Jincy', 
@pLocation = 'Kollam', @pDateOfJoin = '8-Oct-2018'

spEmployeeCRUD @pOperation = 'INSERT', @pEmployeeName = 'Aleena', 
@pLocation = 'Thrissur', @pDateOfJoin = '8-Oct-2018'