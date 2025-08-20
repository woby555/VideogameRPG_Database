/*
 * Jake Licmo
 * November 24, 2023
 * Creates the database tables.
 */

USE VideoGame_RPG;

CREATE TABLE Users (
	user_id INT PRIMARY KEY IDENTITY(1,1),
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
)

CREATE TABLE Elements(
	element_id INT PRIMARY KEY IDENTITY(1,1),
	element_name nVARCHAR(50) NOT NULL
)

CREATE TABLE WeaponTypes(
	weapon_type_id INT PRIMARY KEY IDENTITY(1,1),
	weapon_type_name nVARCHAR(50) NOT NULL
)

CREATE TABLE Weapons(
	weapon_id INT PRIMARY KEY IDENTITY(1,1),
	weapon_type_id INT NOT NULL,
	weapon_name nVARCHAR(50) NOT NULL,
	weapon_price DECIMAL(10,2),
	FOREIGN KEY (weapon_type_id) REFERENCES WeaponTypes(weapon_type_id)
)

CREATE TABLE ArmorTypes(
	armor_type_id INT PRIMARY KEY IDENTITY(1,1),
	armor_type_name nVARCHAR(50) NOT NULL
)

CREATE TABLE Armors(
	armor_id INT PRIMARY KEY IDENTITY(1,1),
	armor_type_id INT NOT NULL,
	armor_name nVARCHAR(50) NOT NULL,
	FOREIGN KEY (armor_type_id) REFERENCES ArmorTypes (armor_type_id)
)

CREATE TABLE Classes(
	class_id INT PRIMARY KEY IDENTITY(1,1),
	class_name nVARCHAR(50) NOT NULL
)

CREATE TABLE Skills(
	skill_id INT PRIMARY KEY IDENTITY(1,1),
	skill_name nVARCHAR(50) NOT NULL,
	class_id INT NOT NULL,
	FOREIGN KEY (class_id) REFERENCES Classes(class_id)
)

CREATE TABLE Characters(
	character_id INT PRIMARY KEY IDENTITY(1,1),
	user_id INT NOT NULL,
	character_name nVARCHAR(20) NOT NULL,
	level INT DEFAULT 1 NOT NULL,
	date_created DATE, 
	class_id INT NOT NULL,
	weapon_id INT,
	element_id INT NOT NULL,
	gold DECIMAL (10,2),
	UNIQUE (user_id),
	CONSTRAINT Level_Check CHECK (level >= 1 AND level <= 100), --Additional check constraint
	FOREIGN KEY (user_id) REFERENCES Users (user_id),
	FOREIGN KEY (class_id) REFERENCES Classes (class_id),
	FOREIGN KEY (weapon_id) REFERENCES Weapons (weapon_id),
	FOREIGN KEY (element_id) REFERENCES Elements (element_id)
)

CREATE TABLE CharacterArmors(
	character_armor_id INT PRIMARY KEY IDENTITY(1,1),
	character_id INT NOT NULL,
	armor_id INT NOT NULL,
	FOREIGN KEY (character_id) REFERENCES Characters (character_id),
	FOREIGN KEY (armor_id) REFERENCES Armors (armor_id)
)

-- Debug
/*DROP TABLE IF EXISTS Characters;
DROP TABLE IF EXISTS Skills;
DROP TABLE IF EXISTS Armors;
DROP TABLE IF EXISTS ArmorTypes;
DROP TABLE IF EXISTS Weapons;
DROP TABLE IF EXISTS WeaponTypes;
DROP TABLE IF EXISTS Elements;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Users;*/

