/*
 * Jake Licmo
 * November 30, 2023
 * Creates a Character.
 */
CREATE OR ALTER PROCEDURE CreateCharacter(
	@user_id INT,
	@character_name NVARCHAR(20),
	@class_id INT,
	@weapon_id INT,
	@element_id INT
)
AS
BEGIN
	DECLARE @date_created DATE;
	SET @date_created = CONVERT(DATE, GETDATE());

	INSERT INTO Characters (user_id, character_name, level, date_created, class_id, weapon_id, element_id, gold)
	VALUES (@user_id, @character_name, 1, @date_created, @class_id, @weapon_id, @element_id, 0)
END;
	


