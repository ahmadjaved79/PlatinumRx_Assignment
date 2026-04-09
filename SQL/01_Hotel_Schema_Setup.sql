CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(20),
    mail_id VARCHAR(100),
    billing_address TEXT
);

CREATE TABLE bookings (
    booking_id VARCHAR(50) PRIMARY KEY,
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE items (
    item_id VARCHAR(50) PRIMARY KEY,
    item_name VARCHAR(100),
    item_rate DECIMAL(10,2)
);

CREATE TABLE booking_commercials (
    id VARCHAR(50) PRIMARY KEY,
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);






INSERT INTO users VALUES
('u1','John Doe','9876543210','john@example.com','Address1'),
('u2','Alice','9876543211','alice@example.com','Address2');

INSERT INTO bookings VALUES
('b1','2021-11-10 10:00:00','101','u1'),
('b2','2021-11-15 12:00:00','102','u2'),
('b3','2021-10-05 09:00:00','103','u1');

INSERT INTO items VALUES
('i1','Food',100),
('i2','Drinks',50);

INSERT INTO booking_commercials VALUES
('c1','b1','bill1','2021-11-10 12:00:00','i1',5),
('c2','b1','bill1','2021-11-10 12:00:00','i2',2),
('c3','b2','bill2','2021-11-15 13:00:00','i1',3),
('c4','b3','bill3','2021-10-05 10:00:00','i2',30);