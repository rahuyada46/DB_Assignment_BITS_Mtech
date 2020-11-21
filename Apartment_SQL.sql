# Create schemas

# Create tables
CREATE TABLE IF NOT EXISTS SOCIETY
(
    Society_ID INT NOT NULL,
    Gov_Reg_ID INT,
    Soc_Name CHARACTER(20),
    Pres_Owner_ID INT,
    Pres_Start_Date date,
    Area CHARACTER(30),
    City CHARACTER(20),
    PIN INT,
    PRIMARY KEY(Society_ID)
);

CREATE TABLE IF NOT EXISTS APARTMENTS
(

   Apt_No Character (10) NOT NULL,    
   Aprt_ID INT NOT NULL,    
    Apt_Type CHARACTER(5),
    Apt_Ownership_Start_Date date,
    Apt_size FLOAT(4),
    Aprt_Owner_ID INT,
   PRIMARY KEY(Apt_No)
);

CREATE TABLE IF NOT EXISTS APT_OWNER
(
    APT_Owner_ID INT NOT NULL,
    Owner_Name CHARACTER(20),
    Mobile character(10),
    Email CHARACTER(30),
    Society_ID INT,
    Adhaar INT,
    DOB date,
    Member_Start_Date date,
    PRIMARY KEY(APT_Owner_ID)
);

CREATE TABLE IF NOT EXISTS MAINTENANCE
(
    Aprt_No Character (10) NOT NULL,
    Bill_no CHARACTER(20) NOT NULL,
    Amount INT,
    Bill_Date date,
    Due_Date CHARACTER(8),
    Bill_Month INT,
    PRIMARY KEY(Bill_no)
);

CREATE TABLE IF NOT EXISTS FAMILY
(
    Apt_Owner_ID INT NOT NULL,
    Name CHARACTER(20) NOT NULL,
    Relation CHARACTER(20),
    Age INT,
    Gender CHARACTER(5),
    Fam_DOB date,
    Fam_Mobile Character(10),
    PRIMARY KEY(Apt_Owner_ID, Name)
);

CREATE TABLE IF NOT EXISTS BLOCKS
(
    Society_ID INT NOT NULL,
    Block_No CHARACTER(20),
    APT_ID INT NOT NULL,
    Unit_No INT,
    Floor CHARACTER(10),
    PRIMARY KEY(APT_ID)
);

# Create FKs
ALTER TABLE SOCIETY
    ADD    FOREIGN KEY (Pres_Owner_ID) 
    REFERENCES apt_owner(APT_Owner_ID)
   ;
     
ALTER TABLE BLOCKS
    ADD    FOREIGN KEY (Society_ID) REFERENCES society (Society_ID)
;
    
ALTER TABLE APARTMENTS
    ADD    
            FOREIGN KEY (APRT_Owner_ID) REFERENCES apt_owner (APT_Owner_ID)
;
    
ALTER TABLE APT_OWNER
    ADD        FOREIGN KEY (Society_ID) REFERENCES society (Society_ID)
;

ALTER TABLE maintenance
    ADD        FOREIGN KEY (Aprt_No) REFERENCES Apartments (Apt_No)
;
# Create Indexes

ALTER TABLE Society Modify COLUMN Pres_Start_Date date;
Alter table apartments modify Column  Apt_Ownership_Start_Date date;
Alter table apartments rename Column  Apt_ID to Aprt_ID;
Alter table family rename Column  mobile to Fam_Mobile;
Alter table apartments rename Column  Apt_Owner_ID to Aprt_Owner_ID;
alter table apt_owner modify column dob date;
alter table apt_owner modify column Member_Start_Date date;
alter table maintenance modify column bill_date date;
alter table maintenance rename column apt_no to aprt_no;
alter table maintenance modify column due_date date;

alter table family modify column dob date;
ALTER TABLE Society add COLUMN area character (30);
ALTER TABLE Society drop COLUMN address;
Alter table apartments add Column  block_no character (10);
alter table apt_owner modify column mobile character(10);
alter table Family modify column Mobile Character(10);
INSERT INTO apt_owner ( APT_Owner_ID , Owner_Name , Mobile, Email ,Society_ID, Adhaar ,   dob  , Member_Start_Date)
   VALUES
   ( '1005', 'Abhishek', '9877777671',  'Abhishek@bitspilani.com', '001', '25358832','1992-12-15', '2017-10-21');
INSERT INTO apt_owner ( APT_Owner_ID , Owner_Name , Mobile, Email ,Society_ID, Adhaar ,   dob  , Member_Start_Date)
   VALUES
   ( '1003', 'Mohan', '9911154012',  'mohan@bitspilani.com', '001', '29388486','1992-10-23', '2016-05-11');


   
   INSERT INTO society ( Society_ID , Gov_Reg_ID ,Soc_Name, Pres_Start_Date,  Area ,  City , pin)
   VALUES
   ( '001', '123', 'Aparna Westside',  '2020-01-01', 'Huda Rd 1 Neknampur','Hyderabad', '500089');
   
   Update society 
   SET
   Pres_Owner_ID = '1003'
   where society_id = '1';
  
INSERT INTO Blocks ( Society_ID , Block_no ,Apt_id, unit_no,  floor)
   VALUES
   ( '001', 'A', '100',  '101', 'First');
INSERT INTO Blocks ( Society_ID , Block_no ,Apt_id, unit_no,  floor)
   VALUES
   ( '001', 'A', '101',  '102', 'First');
   INSERT INTO Blocks ( Society_ID , Block_no ,Apt_id, unit_no,  floor)
   VALUES
   ( '001', 'A', '102',  '201', 'Second');
    INSERT INTO Blocks ( Society_ID , Block_no ,Apt_id, unit_no,  floor)
   VALUES
   ( '001', 'A', '103',  '301', 'Third');
    INSERT INTO Blocks ( Society_ID , Block_no ,Apt_id, unit_no,  floor)
   VALUES
   ( '001', 'B', '104',  '101', 'First'); 
     INSERT INTO Blocks ( Society_ID , Block_no ,Apt_id, unit_no,  floor)
   VALUES
   ( '001', 'C', '105',  '401', 'Fourth');
   
   Update Blocks
   SET Block_no = 'C' where Apt_ID = '105';
   
    INSERT INTO apartments (Apt_id, Apt_no, Apt_type, apt_ownership_start_date, apt_size, apt_owner_id )
   VALUES  ( '100', 'A101', '3 BHK',  '2017-05-01', '1760.00','1001');  
   
   Alter table apartments modify Column  Apt_no character (10);
   Alter table apartments drop Column  block_no;
   Alter table maintenance modify Column  Apt_no character (10);
   # Removing F Key constraints
   ALTER TABLE maintenance drop FOREIGN KEY maintenance_ibfk_1;
  
  INSERT INTO apartments (Apt_id, Apt_no, Apt_type, apt_ownership_start_date, apt_size, apt_owner_id )
   VALUES  ( '102', 'A201', '4 BHK',  '2016-01-01', '1995.00','1003'); 
     INSERT INTO apartments (Apt_id, Apt_no, Apt_type, apt_ownership_start_date, apt_size, apt_owner_id )
   VALUES  ( '105', 'C105', '3 BHK',  '2015-02-01', '1580.00','1005');
   
   INSERT INTO apartments (Aprt_id, Apt_no, Apt_type, apt_ownership_start_date, apt_size, aprt_owner_id )
   VALUES  ( '103', 'A301', '2 BHK',  '2018-02-01', '1250.00','1001');
   
     INSERT INTO Family (Apt_Owner_ID, Name, relation, age, gender, dob, mobile )
   VALUES  ( '1001', 'Deepti', 'Wife',  '30', 'F','1992-12-03','9909988888');
   update family set age = '28' where name ='Deepti' and Apt_owner_id ='1001';
        INSERT INTO Family (Apt_Owner_ID, Name, relation, age, gender, dob, mobile )
   VALUES  ( '1001', 'R KY', 'Father',  '70', 'M','1950-09-17','9819988865');
      update family set Name = 'RKY' where name ='R K Yadav' and Apt_owner_id ='1001';
    INSERT INTO Family (Apt_Owner_ID, Name, relation, age, gender, dob, mobile )
   VALUES  ( '1002', 'CK Y', 'Father',  '65', 'M','1955-02-27','9865432865');
   
       INSERT INTO Family (Apt_Owner_ID, Name, relation, age, gender, dob, mobile )
   VALUES  ( '1003', 'Meena', 'Wife',  '25', 'F','1995-07-11','9765432834');
   Update Blocks
   SET unit_no = '105' where Apt_ID = '105';
    Update Blocks
   SET floor = 'First' where Apt_ID = '105';
   
    INSERT INTO maintenance (Apt_No, Bill_No, Amount, bill_date, due_date, bill_month )
   VALUES  ( 'A101', 'MN_A101_102020', '3500',  '2020-10-01', '2020-10-10','10');
   
       INSERT INTO maintenance (Apt_No, Bill_No, Amount, bill_date, due_date, bill_month )
   VALUES  ( 'A102', 'MN_A102_102020', '2500',  '2020-10-01', '2020-10-10','10');
   
          INSERT INTO maintenance (Apt_No, Bill_No, Amount, bill_date, due_date, bill_month )
   VALUES  ( 'A201', 'MN_A201_102020', '4500',  '2020-10-01', '2020-10-10','10');
   
          INSERT INTO maintenance (Apt_No, Bill_No, Amount, bill_date, due_date, bill_month )
   VALUES  ( 'B101', 'MN_B101_102020', '3000',  '2020-10-01', '2020-10-10','10');
   
          INSERT INTO maintenance (Apt_No, Bill_No, Amount, bill_date, due_date, bill_month )
   VALUES  ( 'C105', 'MN_C105_102020', '3000',  '2020-10-01', '2020-10-10','10');
   
    INSERT INTO maintenance (Aprt_No, Bill_No, Amount, bill_date, due_date, bill_month )
   VALUES  ( 'A301', 'MN_A301_102020', '2400',  '2020-10-01', '2020-10-10','10');
   
   Select owner_name, mobile, Pres_Start_Date from apt_owner, society 
   where apt_owner.APT_Owner_ID = society.Pres_Owner_ID;
   
Select owner_name, aprt_no , amount from apt_owner, maintenance, apartments 
where maintenance.Aprt_No = apartments.Apt_No and 
apartments.Aprt_Owner_ID = apt_owner.Apt_Owner_ID;

Select owner_name, amount from apt_owner, maintenance, apartments 
where maintenance.Aprt_No = apartments.Apt_No and 
apartments.Aprt_Owner_ID = apt_owner.Apt_Owner_ID group by Apt_No order by max(Amount) desc;

Select Owner_Name, Aprt_No, amount from apt_owner,maintenance,apartments where amount 
in (select max(amount) from Maintenance) and maintenance.Aprt_No = apartments.Apt_No 
and apartments.Aprt_Owner_ID = apt_owner.Apt_Owner_ID;

   Select owner_name, apt_no, floor from apt_owner, apartments, blocks 
   where apartments.aprt_Id = blocks.Apt_ID and 
   apartments.Aprt_Owner_ID = apt_owner.Apt_Owner_ID and floor ='first';
   
Select owner_name, Apt_No, Apt_Ownership_Start_Date from 
apt_owner, apartments where apartments.Aprt_Owner_ID = apt_owner.Apt_Owner_ID;

select Name, relation, Fam_Mobile from family,Apt_owner 
where Family.Apt_Owner_ID = apt_owner.Apt_Owner_ID and Owner_Name= 'rahul';

select Aprt_no, amount from maintenance where amount 
in (select max(amount) from Maintenance);
