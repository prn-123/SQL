create database ExpenseManagementSystem

USE ExpenseManagementSystem

CREATE TABLE ExpenseGroups(GroupId INT PRIMARY KEY IDENTITY(1,1),
GroupName VARCHAR(40))


ALTER PROCEDURE spInsertExpenseGroups @pGroupName VARCHAR(40) 
AS
BEGIN
INSERT INTO ExpenseGroups VALUES(@pGroupName)
END

spInsertExpenseGroups 'Food'
spInsertExpenseGroups 'Apparels'
spInsertExpenseGroups 'Travelling'

CREATE PROCEDURE spAllExpenseGroups 
AS
SELECT * FROM ExpenseGroups
GO

spAllExpenseGroups

CREATE PROCEDURE spEditExpenseGroups @pGroupId INT ,@pGroupName VARCHAR(40)
AS
UPDATE ExpenseGroups SET GroupName=@pGroupName WHERE GroupId=@pGroupId
GO

spEditExpenseGroups


CREATE PROCEDURE spDeleteExpenseGroups @pGroupId INT 
AS
DELETE FROM ExpenseGroups WHERE GroupId=@pGroupId
GO

spDeleteExpenseGroups


CREATE PROCEDURE spFindExpenseGroups @pGroupId INT 
AS
SELECT * FROM ExpenseGroups WHERE GroupId=@pGroupId
GO

spFindExpenseGroups


------------------------------------------------------------------

CREATE TABLE Expense(ExpenseId INT PRIMARY KEY IDENTITY(1,1),
GroupId INT REFERENCES ExpenseGroups(GroupId),ExpenseName VARCHAR(40))



CREATE PROCEDURE spExpense
(@pOption VARCHAR(40),@pExpenseId VARCHAR(40)=NULL,@pGroupId INT =NULL,@pExpenseName VARCHAR(40)=NULL)
AS
BEGIN
	IF(@pOption='Select')
		BEGIN
			 SELECT * FROM Expense
		END
	ELSE IF(@pOption='Insert')
		BEGIN
			INSERT INTO Expense VALUES  (@pGroupId,@pExpenseName)
		END
	ELSE IF(@pOption='Edit')
		BEGIN
			UPDATE Expense SET ExpenseName=@pExpenseName WHERE ExpenseId=@pExpenseId
		END
	ELSE IF(@pOption='Delete')
		BEGIN
			DELETE FROM Expense WHERE ExpenseId=@pExpenseId
	END
	ELSE IF(@pOption='Find')
		BEGIN
			SELECT * FROM Expense WHERE ExpenseId=@pExpenseId
	END
END

spExpense @pOption='Insert',@pGroupId=1,@pExpenseName='Foood'	


create table ExpenseDetails(ExpenseDetailId int primary key ,
ExpenseId int references Expense(ExpenseId),
Date datetime,Amount numeric(8,2),Description varchar(40))


