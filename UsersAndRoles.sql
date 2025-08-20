/*
 * Jake Licmo
 * December 3, 2023
 * Roles and Users
 */
 
 USE VideoGame_RPG;

 -- Logins
 CREATE LOGIN WeaponsTeam WITH PASSWORD = 'weapons', DEFAULT_DATABASE = VideoGame_RPG, CHECK_POLICY = OFF;
 CREATE LOGIN ArmorTeam WITH PASSWORD = 'armor', DEFAULT_DATABASE = VideoGame_RPG, CHECK_POLICY = OFF;
 CREATE LOGIN CharactersTeam WITH PASSWORD = 'users', DEFAULT_DATABASE = VideoGame_RPG, CHECK_POLICY = OFF;

 -- Users
 CREATE USER UserW FOR LOGIN WeaponsTeam;
 ALTER ROLE WeaponsTeam ADD MEMBER UserW;

 CREATE USER UserA FOR LOGIN ArmorTeam;
 ALTER ROLE ArmorTeam ADD MEMBER UserA;

 CREATE USER UserC FOR LOGIN CharactersTeam;
 ALTER ROLE CharactersTeam ADD MEMBER UserC;

 -- Roles
CREATE ROLE WeaponsTeam;
CREATE ROLE ArmorTeam;
CREATE ROLE CharactersTeam;

-- WeaponsTeam Permissions
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON Weapons TO WeaponsTeam;
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON WeaponTypes TO WeaponsTeam;
GRANT SELECT ON Characters TO WeaponsTeam;

-- ArmorTeam Permissions
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON Armors TO ArmorTeam;
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON ArmorTypes TO ArmorTeam;
GRANT SELECT ON Characters TO ArmorTeam;

-- CharactersTeam Permissions
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON Users TO CharactersTeam;
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON Characters TO CharactersTeam;
REVOKE SELECT ON Armors FROM CharactersTeam;
REVOKE SELECT ON Weapons FROM CharactersTeam;
REVOKE SELECT ON ArmorTypes FROM CharactersTeam;
REVOKE SELECT ON WeaponTypes FROM CharactersTeam;
REVOKE SELECT ON Elements FROM CharactersTeam;

-- Weapons Team Test
EXECUTE AS LOGIN = 'WeaponsTeam';
SELECT USER;

SELECT * FROM Weapons; -- Success

SELECT * FROM Users; -- Fail

REVERT;

-- Armor Team Test
EXECUTE AS LOGIN = 'ArmorTeam'
SELECT USER;

SELECT * FROM Armors; -- Success

SELECT * FROM Users; -- Fail

REVERT;

-- Characters Team Test
EXECUTE AS LOGIN = 'CharactersTeam';
SELECT USER;

SELECT * FROM Characters; -- Success

SELECT * FROM Elements; -- Fail

REVERT;