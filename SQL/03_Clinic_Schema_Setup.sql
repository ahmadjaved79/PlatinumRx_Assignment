CREATE TABLE clinics (
    cid VARCHAR(50) PRIMARY KEY,
    clinic_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE customer (
    uid VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    mobile VARCHAR(20)
);

CREATE TABLE clinic_sales (
    oid VARCHAR(50) PRIMARY KEY,
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount DECIMAL(10,2),
    datetime DATETIME,
    sales_channel VARCHAR(50),
    FOREIGN KEY (uid) REFERENCES customer(uid),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

CREATE TABLE expenses (
    eid VARCHAR(50) PRIMARY KEY,
    cid VARCHAR(50),
    description TEXT,
    amount DECIMAL(10,2),
    datetime DATETIME,
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);



INSERT INTO clinics VALUES
('c1','Clinic A','Hyderabad','Telangana','India'),
('c2','Clinic B','Vijayawada','AP','India');

INSERT INTO customer VALUES
('u1','John','9999999999'),
('u2','Alice','8888888888');

INSERT INTO clinic_sales VALUES
('o1','u1','c1',2000,'2021-05-10 10:00:00','online'),
('o2','u2','c1',3000,'2021-05-15 11:00:00','offline'),
('o3','u1','c2',4000,'2021-05-20 12:00:00','online');

INSERT INTO expenses VALUES
('e1','c1','rent',1500,'2021-05-05 09:00:00'),
('e2','c2','equipment',2000,'2021-05-07 10:00:00');

INSERT INTO clinics VALUES
('c3','Clinic C','Hyderabad','Telangana','India');

INSERT INTO clinic_sales VALUES
('o4','u2','c3',1000,'2021-05-25 14:00:00','offline');