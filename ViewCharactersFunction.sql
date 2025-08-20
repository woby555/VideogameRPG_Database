/*
 * Jake Licmo
 * November 30, 2023
 * Returns all characters in the database.
 */
 CREATE OR ALTER VIEW ViewCharacters
AS
SELECT
    c.character_id,
    u.username,
    c.character_name,
    c.level,
    c.date_created,
    cls.class_name,
    w.weapon_name,
    e.element_name
FROM
    Characters c
JOIN
    Users u ON c.user_id = u.user_id
JOIN
    Classes cls ON c.class_id = cls.class_id
JOIN
    Weapons w ON c.weapon_id = w.weapon_id
JOIN
    Elements e ON c.element_id = e.element_id;

