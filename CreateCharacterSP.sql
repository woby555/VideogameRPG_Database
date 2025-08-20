/*
 * Jake Licmo
 * November 29, 2023
 * Creates a character.
 */
CREATE OR ALTER PROCEDURE CreateCharacter
    @user_id INT,
    @character_name NVARCHAR(20),
    @class_name NVARCHAR(50),
    @weapon_name NVARCHAR(50),
    @element_name NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @class_id INT, @weapon_id INT, @element_id INT;

    -- Validation checks
    SELECT @class_id = class_id
    FROM Classes
    WHERE class_name = @class_name;

    IF @class_id IS NULL
    BEGIN
        THROW 50000, 'Invalid class_name. Class does not exist.', 1;
    END;

    SELECT @weapon_id = weapon_id
    FROM Weapons
    WHERE weapon_name = @weapon_name;

    SELECT @element_id = element_id
    FROM Elements
    WHERE element_name = @element_name;

    IF @element_id IS NULL
    BEGIN
        THROW 50000, 'Invalid element_name. Element does not exist.', 1;
    END;

    -- Inserting the new character
    INSERT INTO Characters (user_id, character_name, class_id, weapon_id, element_id, date_created, gold, level)
    VALUES (@user_id, @character_name, @class_id, @weapon_id, @element_id, GETDATE(), 0, 1);
END;
