CREATE TABLE CharacterDeletionLog (
	log_id INT PRIMARY KEY IDENTITY,
	character_id INT,
	character_name nVARCHAR(20),
	deletion_timestamp DATETIME,
	deleted_by_user nVARCHAR(50),
	);

