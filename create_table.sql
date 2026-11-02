1. CUSTOMER TABLE
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    contact_no VARCHAR(20),
    created_at DATETIME
);

2. STAFF TABLE
CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(255),
    role VARCHAR(50),
    is_active BOOLEAN
);

3. SERVICE TABLE
CREATE TABLE service (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_type VARCHAR(50),
    service_name VARCHAR(100),
    description TEXT,
    base_rate DECIMAL(10,2),
    rate_unit VARCHAR(50),
    deposit_percent INT, 
    is_available BOOLEAN
);

4. BOOKING TABLE
CREATE TABLE booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_ref VARCHAR(50) UNIQUE,
    customer_id INT, 
    handled_by INT, 
    status VARCHAR(50),
    total_amount DECIMAL(10,2),
    deposit_amount DECIMAL(10,2), 
    payment_due_by DATETIME,
    remarks TEXT,
    created_at DATETIME,
    approved_at DATETIME,
    updated_at DATETIME
);

5. TRAVELER TABLE
CREATE TABLE traveler (
    traveler_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT, 
    full_name VARCHAR(100),
    birthdate DATE,
    id_no VARCHAR(50)
);

6. BOOKING_ITEM TABLE
CREATE TABLE booking_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT, 
    service_id INT, 
    service_date DATE,
    pax_qty INT,
    pickup_location VARCHAR(255),
    destination VARCHAR(255),
    unit_rate DECIMAL(10,2),
    subtotal DECIMAL(10,2)
);

7. PAYMENT TABLE
CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT, 
    verified_by INT, 
    amount DECIMAL(10,2),
    method VARCHAR(50),
    proof_file BLOB, 
    payment_status VARCHAR(50),
    paid_at DATETIME,
    verified_at DATETIME
);

8. BOOKING_CHANGE TABLE
CREATE TABLE booking_change (
    change_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT, 
    decided_by INT, 
    request_type VARCHAR(50),
    details TEXT,
    change_fee_percent DECIMAL(5,2),
    change_fee DECIMAL(10,2),
    price_difference DECIMAL(10,2),
    status VARCHAR(50),
    requested_at DATETIME,
    decided_at DATETIME
);
