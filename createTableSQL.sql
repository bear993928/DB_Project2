CREATE TABLE GROUP7.Vehicle_Collisions 
(
	collision_id 					varchar2(50) NOT NULL,
	crash_dateTime 					DATE,
	borough  						varchar2(50),
	zip_code 						varchar2(10),
	latitude 						varchar2(20),
	longitude 						varchar2(20),
	location 						varchar2(50),
	on_street_name 					varchar2(50),
	cross_street_name 				varchar2(50),
	off_street_name 				varchar2(50),
	number_of_persons_injured 		INTEGER,
	number_of_persons_killed 		INTEGER,
	number_of_pedestrians_injured 	INTEGER,
	number_of_pedestrians_killed 	INTEGER,
	number_of_cyclist_injured 		INTEGER,
	number_of_cyclist_killed	 	INTEGER,
	number_of_motorist_injured 		INTEGER,
	number_of_motorist_killed 		INTEGER,
	contributing_factor_vehicle_1 	varchar2(100),
	contributing_factor_vehicle_2 	varchar2(100),
	contributing_factor_vehicle_3 	varchar2(100),
	contributing_factor_vehicle_4 	varchar2(100),
	contributing_factor_vehicle_5 	varchar2(100),
	vehicle_type_code_1 			varchar2(50),
	vehicle_type_code_2 			varchar2(50),
	vehicle_type_code_3 			varchar2(50),
	vehicle_type_code_4 			varchar2(50),
	vehicle_type_code_5 			varchar2(50),
	CONSTRAINT PK1 PRIMARY KEY(collision_id)
);


CREATE TABLE GROUP7.communityBoardsInfo 
(
    Postcode 			varchar2(50) NOT NULL,
    Borough				varchar2(512),
    CommunityBoard		varchar2(512) NOT NULL,
    Neighborhoods		varchar2(512),
    CBOfficeAddress		varchar2(512),
    CBAddressLine2		varchar2(512),
    CBOfficePhone		varchar2(512),
    CBOfficeFax			varchar2(512),
    CBOfficeEmail		varchar2(512),
    CBWebsite 			varchar2(512),
    CBChair				varchar2(512),
    CBDistrictManager	varchar2(512),
    CBBoardMeeting		varchar2(512),
    CBCabinetMeeting 	varchar2(512),
    CBPrecinct 			varchar2(512),
    CBPrecinctPhone 	varchar2(512),
    Latitude 			NUMBER,
    Longitude 			NUMBER,
    CommunityBoard1		varchar2(512),
    CouncilDistrict		varchar2(512),
    BIN					varchar2(512),
    BBL					varchar2(512),
    CensusTract			varchar2(512),
    NTA					VARCHAR(512),
    LocationPoint 		VARCHAR(512),
	PRIMARY KEY(Postcode, CommunityBoard)
);

CREATE TABLE GROUP7.personByZipCode 
(
    zip_code 			varchar2(50) NOT NULL,
    pop_est				INTEGER,
	PRIMARY KEY(zip_code)
);