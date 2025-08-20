/*
 * Jake Licmo
 * December 1, 2023
 * DML Queries
 */

 USE VideoGame_RPG;

 /* Inner Join Query: Selects the user's username, password, and character details, including class.*/
SELECT u.username, 
	u.password, 
	c.character_id, 
	c.character_name, 
	c.level, 
	c.date_created, 
	cls.class_name
FROM Characters c
 INNER JOIN Users u ON c.user_id = u.user_id
 INNER JOIN Classes cls ON c.class_id = cls.class_id

ORDER BY c.character_id ASC;


 /* Outer Join Query: Retrieves a character, their weapon and the respective weapon type */
SELECT c.character_id, character_name, w.weapon_name, wt.weapon_type_name
FROM Characters c
LEFT OUTER JOIN Weapons w ON c.weapon_id = w.weapon_id
LEFT OUTER JOIN WeaponTypes wt ON w.weapon_type_id = wt.weapon_type_id

ORDER BY c.character_id ASC;

 /* Non-correlated subquery: Selects all characters who have a greater than average level of all players.*/
SELECT character_id, character_name, level
FROM Characters
WHERE level > (
    SELECT AVG(level) -- Independent aggregate query
    FROM Characters
);


/* Correlated subquery: Selects the characters with the highest level in their respective classes.*/
SELECT
    c.character_id,
    c.character_name,
    c.level,
    cl.class_name
FROM
    Characters c
JOIN
    Classes cl ON c.class_id = cl.class_id
WHERE
    c.level = (
        SELECT
            MAX(level)
        FROM
            Characters
        WHERE
            class_id = c.class_id
    );


















