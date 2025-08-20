/*
 * Jake Licmo
 * December 1, 2023
 * Views all character's armors.
 */
CREATE OR ALTER VIEW ViewCharacterArmor
AS
SELECT
    c.character_id,
    c.character_name,
    cls.class_name,
    a.armor_id,
    a.armor_name,
    at.armor_type_name
FROM
    Characters c
JOIN
    Classes cls ON c.class_id = cls.class_id
LEFT JOIN
    CharacterArmors ca ON c.character_id = ca.character_id
LEFT JOIN
    Armors a ON ca.armor_id = a.armor_id
LEFT JOIN
    ArmorTypes at ON a.armor_type_id = at.armor_type_id;
