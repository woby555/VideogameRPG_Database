/*
 * Jake Licmo
 * December 7, 2023
 * Retrieves a table of all skills associated to a character based on their chosen class.
 */
CREATE FUNCTION GetCharacterSkills(@characterId INT) 
RETURNS TABLE
AS
RETURN (
    SELECT Skills.skill_id, Skills.skill_name
    FROM Characters
    INNER JOIN Classes ON Characters.class_id = Classes.class_id
    INNER JOIN Skills ON Classes.class_id = Skills.class_id
    WHERE Characters.character_id = @characterId
);

-- USING VideoGame_RPG;
-- SELECT * FROM GetCharacterSkills (4);