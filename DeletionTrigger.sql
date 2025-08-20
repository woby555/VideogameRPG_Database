/*
 *
 * Jake Licmo
 * December 5, 2023
 * Logs when a character is deleted from the Characters table.
 *
 */
CREATE TRIGGER LogCharacterDeletion
ON Characters
AFTER DELETE
AS
BEGIN
    PRINT 'Trigger Executed';

    INSERT INTO CharacterDeletionLog (character_id, character_name, deletion_timestamp, deleted_by_user)
    SELECT 
        c.character_id,
        c.character_name,
        GETDATE(),
        SUSER_SNAME()
    FROM 
        deleted d
    INNER JOIN 
        Characters c ON d.character_id = c.character_id;
END;

-- USING VideoGame_RPG;
-- DELETE FROM Characters
-- WHERE character_name = 'ToBeDeleted';