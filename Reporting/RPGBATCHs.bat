@ECHO OFF
CLS

ECHO Generating RPG Character Report...

REM Replace the connection parameters with your actual SQL Server connection parameters
sqlcmd -S Jake-Laptop\JAKESQLSERVER -d VideoGame_RPG -o VideoGame_RPG_Batch.txt -Q "SELECT c.character_id, u.username, c.character_name, c.level, c.date_created, cls.class_name, w.weapon_name, e.element_name FROM Characters c JOIN Users u ON c.user_id = u.user_id JOIN Classes cls ON c.class_id = cls.class_id LEFT JOIN Weapons w ON c.weapon_id = w.weapon_id JOIN Elements e ON c.element_id = e.element_id;"

ECHO RPG Character Report generated successfully.

PAUSE