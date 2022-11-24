CREATE TABLE crime_id (
     id_no INTEGER NOT NULL,
	 primary_type VARCHAR NOT NULL,
	 location_description VARCHAR NOT NULL,
	 arrest BOOLEAN NOT NULL,
	 domestic BOOLEAN NOT NULL,
	 crime_date DATE NOT NULL,
	 crime_time VARCHAR NOT NULL,
     PRIMARY KEY (id_no),
     UNIQUE (id_no)
);

CREATE TABLE location_data (
	id_no INTEGER NOT NULL,
	block VARCHAR NOT NULL,
	location_description VARCHAR NOT NULL,
	district INTEGER NOT NULL,
	latitude DECIMAL NOT NULL,
	longitude DECIMAL NOT NULL,
	FOREIGN KEY (id_no) REFERENCES crime_id (id_no),
	PRIMARY KEY (id_no)
);

Drop TABLE location_data;

SELECT
	crime_id.id_no,
	primary_type,
	arrest,
	domestic,
	crime_date,
	crime_time,
	block,
	latitude,
	longitude
FROM
	crime_id
INNER JOIN location_data 
    ON location_data.id_no = crime_id.id_no;