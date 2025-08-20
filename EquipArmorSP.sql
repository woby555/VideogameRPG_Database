/*
 * Jake Licmo
 * December 1, 2023
 * Equips a character with the specified armor.
 */
CREATE OR ALTER PROCEDURE EquipArmor
    @character_id INT,
    @armor_id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validation if a duplicate ArmorType is already equipped
        IF EXISTS (
            SELECT 1
            FROM CharacterArmors ca
            INNER JOIN Armors a ON ca.armor_id = a.armor_id
            WHERE ca.character_id = @character_id
              AND a.armor_type_id = (
                SELECT armor_type_id
                FROM Armors
                WHERE armor_id = @armor_id
              )
        )

		-- Throw error message
        BEGIN
            ROLLBACK;
            THROW 50000, 'Character already has an armor of the same type.', 1;
            RETURN;
        END;

        INSERT INTO CharacterArmors (character_id, armor_id)
        VALUES (@character_id, @armor_id);

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;

        THROW; -- Throws error message.
    END CATCH;
END;

-- character_id: 18
-- armor_id: 4, 8

