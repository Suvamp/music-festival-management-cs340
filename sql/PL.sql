-- Music Festival Management System
-- Procedural Language (PL)
-- Group: 42
-- Team Members: Suvam Patel, Kenneth Sieu
-- Date: 11/20/2025

-- 1. RESET QUERY

DROP PROCEDURE IF EXISTS sp_reset_button;
DELIMITER // 
CREATE PROCEDURE sp_reset_button()
BEGIN

    -- Disable foreign key checks and autocommit for clean import
    SET FOREIGN_KEY_CHECKS = 0;
    SET AUTOCOMMIT = 0;

    -- Drop Tables if they exist

    DROP TABLE IF EXISTS staffAssignments;
    DROP TABLE IF EXISTS sponsorships;
    DROP TABLE IF EXISTS vendorAssignments;
    DROP TABLE IF EXISTS performances;
    DROP TABLE IF EXISTS staff;
    DROP TABLE IF EXISTS sponsors;
    DROP TABLE IF EXISTS vendors;
    DROP TABLE IF EXISTS stages;
    DROP TABLE IF EXISTS artists;
    DROP TABLE IF EXISTS festivals;

    -- Create Tables

    -- Festivals table: Stores information about music festival events
    CREATE TABLE festivals (
        festivalID INT AUTO_INCREMENT NOT NULL,
        festivalName VARCHAR(255) NOT NULL,
        startDate DATE NOT NULL,
        endDate DATE NOT NULL,
        location VARCHAR(255) NOT NULL,
        expectedAttendance INT NOT NULL,
        budget DECIMAL(12,2) NOT NULL,
        ticketPrice DECIMAL(10,2) NOT NULL,
        PRIMARY KEY (festivalID)
    );

    -- Artists table: Stores details about musical artists and bands
    CREATE TABLE artists (
        artistID INT AUTO_INCREMENT NOT NULL,
        artistName VARCHAR(255) UNIQUE NOT NULL,
        genre VARCHAR(100) NOT NULL,
        bookingFee DECIMAL(10,2) NOT NULL,
        contactEmail VARCHAR(255) NOT NULL,
        contactPhone VARCHAR(20),
        country VARCHAR(100) NOT NULL,
        websiteURL VARCHAR(255),
        PRIMARY KEY (artistID)
    );

    -- Stages table: Contains information about performance stages at festivals
    CREATE TABLE stages (
        stageID INT AUTO_INCREMENT NOT NULL,
        festivalID INT NOT NULL,
        stageName VARCHAR(100) NOT NULL,
        capacity INT NOT NULL,
        stageType VARCHAR(50) NOT NULL,
        locationDescription VARCHAR(255) NOT NULL,
        hasCover BOOLEAN NOT NULL,
        PRIMARY KEY (stageID),
        FOREIGN KEY (festivalID) REFERENCES festivals(festivalID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    );

    -- Vendors table: Tracks food, beverage, and merchandise vendors
    CREATE TABLE vendors (
        vendorID INT AUTO_INCREMENT NOT NULL,
        vendorName VARCHAR(255) NOT NULL,
        vendorType VARCHAR(100) NOT NULL,
        contactEmail VARCHAR(255) NOT NULL,
        contactPhone VARCHAR(20) NOT NULL,
        businessLicense VARCHAR(100),
        PRIMARY KEY (vendorID)
    );

    -- Sponsors table: Records corporate sponsors who procvide financial support
    CREATE TABLE sponsors (
        sponsorID INT AUTO_INCREMENT NOT NULL,
        sponsorName VARCHAR(255) UNIQUE NOT NULL,
        industry VARCHAR(100) NOT NULL,
        contactEmail VARCHAR(255) NOT NULL,
        contactPhone VARCHAR(20) NOT NULL,
        websiteURL VARCHAR(255),
        PRIMARY KEY (sponsorID)
    );

    -- Staff table: Contains information about festival staff and crew members
    CREATE TABLE staff (
        staffID INT AUTO_INCREMENT NOT NULL,
        firstName VARCHAR(100) NOT NULL,
        lastName VARCHAR(100) NOT NULL,
        email VARCHAR(255) UNIQUE NOT NULL,
        phone VARCHAR(20) NOT NULL,
        role VARCHAR(100) NOT NULL,
        hourlyRate DECIMAL(10,2),
        PRIMARY KEY (staffID)
    );

    -- Performaces table: intersection table for Artists and Stages (M:N)
    -- Records scheduled performaces with additional performace details
    CREATE TABLE performances (
        performanceID INT AUTO_INCREMENT NOT NULL,
        artistID INT NOT NULL,
        stageID INT NOT NULL,
        performanceDate DATE NOT NULL,
        startTime TIME NOT NULL,
        endTime TIME NOT NULL,
        setupNotes TEXT,
        soundcheckTime TIME,
        PRIMARY KEY (performanceID),
        FOREIGN KEY (artistID) REFERENCES artists(artistID)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
        FOREIGN KEY (stageID) REFERENCES stages(stageID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    );

    -- VendorAssignments table: Intersection table for Vendors and Festivals (M:N)
    -- Tracks which vendors are assigned to which festivals
    CREATE TABLE vendorAssignments (
        assignmentID INT AUTO_INCREMENT NOT NULL,
        vendorID INT NOT NULL,
        festivalID INT NOT NULL,
        boothNumber VARCHAR(50),
        registrationFee DECIMAL(10,2) NOT NULL,
        assignmentDate DATE NOT NULL,
        PRIMARY KEY (assignmentID),
        FOREIGN KEY (vendorID) REFERENCES vendors(vendorID)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
        FOREIGN KEY (festivalID) REFERENCES festivals(festivalID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    );

    -- Sponsorships table: Intersection table for Sponsors and Festivals (M:N)
    -- Records sponsorship deals between sponsors and festivals
    CREATE TABLE sponsorships (
        sponsorshipID INT AUTO_INCREMENT NOT NULL,
        sponsorID INT NOT NULL,
        festivalID INT NOT NULL,
        sponsorshipAmount DECIMAL(12,2) NOT NULL,
        sponsorshipTier VARCHAR(50) NOT NULL,
        contractDate DATE NOT NULL,
        benefits TEXT,
        PRIMARY KEY (sponsorshipID),
        FOREIGN KEY (sponsorID) REFERENCES sponsors(sponsorID)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
        FOREIGN KEY (festivalID) REFERENCES festivals(festivalID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    );

    -- StaffAssignments table: Intersection table for Staff and Festivals (M:N)
    -- Tracks staff assignments to festivals
    CREATE TABLE staffAssignments (
        staffAssignmentID INT AUTO_INCREMENT NOT NULL,
        staffID INT NOT NULL,
        festivalID INT NOT NULL,
        assignedDate DATE NOT NULL,
        hoursWorked DECIMAL(5,2),
        shiftNotes TEXT,
        PRIMARY KEY (staffAssignmentID),
        FOREIGN KEY (staffID) REFERENCES staff(staffID)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
        FOREIGN KEY (festivalID) REFERENCES festivals(festivalID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    );

    -- Insert Sample Data

    -- Insert Festivals data
    INSERT INTO festivals (festivalName, startDate, endDate, location, expectedAttendance, budget, ticketPrice) 
    VALUES
    ('Summer Soundwave Festival', '2025-07-15', '2025-07-17', 'Golden Gate Park, San Francisco, CA', 75000, 2500000.00, 299.99),
    ('Electric Dreams Festival', '2025-08-20', '2025-08-22', 'Desert Sky Venue, Phoenix, AZ', 50000, 1800000.00, 249.99),
    ('Autumn Acoustic Gathering', '2025-09-10', '2025-09-12', 'Red Rocks Amphitheatre, Morrison, CO', 40000, 1200000.00, 189.99),
    ('Winter Beats Celebration', '2025-12-28', '2025-12-30', 'Miami Beach Convention Center, FL', 60000, 2000000.00, 279.99);

    -- Insert Artists data
    INSERT INTO artists (artistName, genre, bookingFee, contactEmail, contactPhone, country, websiteURL)
    VALUES
    ('The Midnight Riders', 'Rock', 50000.00, 'booking@midnightriders.com', '555-0101', 'United States', 'www.midnightriders.com'),
    ('DJ Pulse', 'Electronic', 75000.00, 'contact@djpulse.com', '555-0102', 'United Kingdom', 'www.djpulse.com'),
    ('Sarah Chen', 'Acoustic/Folk', 25000.00, 'sarah@sarahchenmusic.com', '555-0103', 'Canada', 'www.sarahchenmusic.com'),
    ('Bass Revolution', 'EDM', 80000.00, 'info@bassrevolution.com', '555-0104', 'Netherlands', 'www.bassrevolution.com'),
    ('The Harmony Project', 'Indie Pop', 35000.00, 'bookings@harmonyproject.com', '555-0105', 'Australia', 'www.harmonyproject.com');

    -- Insert Stages data
    INSERT INTO stages (festivalID, stageName, capacity, stageType, locationDescription, hasCover) 
    VALUES
    (1, 'Main Stage', 50000, 'Main Stage', 'Center of festival grounds', FALSE),
    (1, 'Electronic Arena', 20000, 'Electronic Stage', 'East side near food court', TRUE),
    (1, 'Acoustic Garden', 5000, 'Acoustic Stage', 'Shaded area west side', TRUE),
    (2, 'Desert Main Stage', 35000, 'Main Stage', 'North end of venue', FALSE),
    (2, 'Oasis Lounge', 8000, 'Lounge Stage', 'Covered pavilion south side', TRUE),
    (3, 'Red Rocks Stage', 30000, 'Main Stage', 'Natural amphitheatre', FALSE),
    (4, 'Miami Main Stage', 40000, 'Main Stage', 'Convention center main hall', TRUE),
    (4, 'Beach Club Stage', 15000, 'Electronic Stage', 'Outdoor beach area', FALSE);

    -- Insert Vendors data
    INSERT INTO vendors (vendorName, vendorType, contactEmail, contactPhone, businessLicense) 
    VALUES
    ('Gourmet Street Tacos', 'Food', 'info@gourmettacos.com', '555-0201', 'FL-123456'),
    ('Craft Beer Garden', 'Beverage', 'contact@craftbeergarden.com', '555-0202', 'CA-789012'),
    ('Festival Merch Co', 'Merchandise', 'sales@festivalmerch.com', '555-0203', 'TX-345678'),
    ('Smoothie Paradise', 'Beverage', 'hello@smoothieparadise.com', '555-0204', 'AZ-901234'),
    ('Artisan Pizza Oven', 'Food', 'orders@artisanpizza.com', '555-0205', 'CO-567890');

    -- Insert Sponsors data
    INSERT INTO sponsors (sponsorName, industry, contactEmail, contactPhone, websiteURL) 
    VALUES
    ('MegaBrew Beer Company', 'Beverage', 'sponsorships@megabrew.com', '555-0301', 'www.megabrew.com'),
    ('TechSound Audio', 'Technology', 'partnerships@techsound.com', '555-0302', 'www.techsound.com'),
    ('GreenRide Transportation', 'Transportation', 'marketing@greenride.com', '555-0303', 'www.greenride.com'),
    ('EcoWear Apparel', 'Fashion', 'sponsorship@ecowear.com', '555-0304', 'www.ecowear.com');

    -- Insert Staff data
    INSERT INTO staff (firstName, lastName, email, phone, role, hourlyRate) 
    VALUES
    ('John', 'Martinez', 'john.martinez@festivalstaff.com', '555-0401', 'Security', 25.00),
    ('Emily', 'Thompson', 'emily.thompson@festivalstaff.com', '555-0402', 'Medical', 35.00),
    ('Michael', 'Chang', 'michael.chang@festivalstaff.com', '555-0403', 'Technical Crew', 40.00),
    ('Sarah', 'Johnson', 'sarah.johnson@festivalstaff.com', '555-0404', 'Volunteer Coordinator', 22.00),
    ('David', 'Wilson', 'david.wilson@festivalstaff.com', '555-0405', 'Stage Manager', 45.00);

    -- Insert Performances data
    INSERT INTO performances (artistID, stageID, performanceDate, startTime, endTime, setupNotes, soundcheckTime) 
    VALUES
    (1, 1, '2025-07-16', '20:00:00', '21:30:00', 'Requires pyrotechnics setup', '17:00:00'),
    (2, 2, '2025-07-15', '22:00:00', '23:30:00', 'Full LED wall needed', '19:00:00'),
    (3, 3, '2025-07-16', '15:00:00', '16:00:00', 'Minimal setup, acoustic only', '13:30:00'),
    (4, 4, '2025-08-21', '21:00:00', '22:30:00', 'Heavy bass system required', '18:00:00'),
    (5, 6, '2025-09-11', '18:00:00', '19:15:00', 'Standard indie setup', '16:00:00'),
    (1, 4, '2025-08-22', '19:00:00', '20:30:00', 'Standard rock setup', '16:30:00');

    -- Insert VendorAssignments data
    INSERT INTO vendorAssignments (vendorID, festivalID, boothNumber, registrationFee, assignmentDate) 
    VALUES
    (1, 1, 'F-01', 1500.00, '2025-06-01'),
    (2, 1, 'B-03', 2000.00, '2025-06-01'),
    (3, 1, 'M-05', 1200.00, '2025-06-05'),
    (1, 2, 'F-12', 1500.00, '2025-07-10'),
    (4, 2, 'B-08', 1800.00, '2025-07-12'),
    (5, 3, 'F-04', 1300.00, '2025-08-01');

    -- Insert Sponsorships data
    INSERT INTO sponsorships (sponsorID, festivalID, sponsorshipAmount, sponsorshipTier, contractDate, benefits) 
    VALUES
    (1, 1, 500000.00, 'Title', '2025-03-15', 'Festival naming rights, main stage branding, VIP area access'),
    (2, 1, 250000.00, 'Platinum', '2025-04-01', 'Stage naming rights, logo on all marketing materials'),
    (3, 2, 150000.00, 'Gold', '2025-05-10', 'Transportation partner, shuttle branding'),
    (1, 3, 300000.00, 'Title', '2025-06-20', 'Festival naming rights, main stage branding'),
    (4, 4, 200000.00, 'Platinum', '2025-09-01', 'Exclusive apparel partner, merchandise booth');

    -- Insert StaffAssignments data
    INSERT INTO staffAssignments (staffID, festivalID, assignedDate, hoursWorked, shiftNotes) 
    VALUES
    (1, 1, '2025-07-15', 24.00, 'Main entrance security, all three days'),
    (2, 1, '2025-07-15', 30.00, 'On-site medical staff, full festival'),
    (3, 1, '2025-07-14', 40.00, 'Stage setup and teardown, includes prep day'),
    (4, 2, '2025-08-20', 28.00, 'Volunteer coordination for all shifts'),
    (5, 3, '2025-09-10', 32.00, 'Stage management for main stage'),
    (1, 2, '2025-08-20', 24.00, 'Security detail for Desert Main Stage'),
    (3, 4, '2025-12-27', 36.00, 'Technical setup including prep day');

    -- Re-enable foreign key checks and commit
    SET FOREIGN_KEY_CHECKS=1;
    COMMIT;

END //
DELIMITER ;

-- 2. FESTIVALS QUERIES

-- Create
DROP PROCEDURE IF EXISTS sp_create_festival;
DELIMITER // 
CREATE PROCEDURE sp_create_festival(
    IN p_name VARCHAR(255),
    IN p_start DATE,
    IN p_end DATE,
    IN p_location VARCHAR(255),
    IN p_attendance INT,
    IN p_budget DECIMAL(12,2),
    IN p_ticketPrice DECIMAL(10,2),
    OUT p_id INT

)
BEGIN
    INSERT INTO festivals
        (festivalName, startDate, endDate, location, expectedAttendance, budget, ticketPrice)
    VALUES
        (p_name, p_start, p_end, p_location, p_attendance, p_budget, p_ticketPrice);
    
    SET p_id = LAST_INSERT_ID();
END //
DELIMITER ;

-- Update
DROP PROCEDURE IF EXISTS sp_update_festival;
DELIMITER // 
CREATE PROCEDURE sp_update_festival(
    IN p_id INT,
    IN p_name VARCHAR(255),
    IN p_start DATE,
    IN p_end DATE,
    IN p_location VARCHAR(255),
    IN p_attendance INT,
    IN p_budget DECIMAL(12,2),
    IN p_ticketPrice DECIMAL(10,2)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM festivals WHERE festivalID = p_id) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Festival ID does not exist';
    ELSE
        UPDATE festivals
        SET
            festivalName = IFNULL(p_name, festivalName),
            startDate = IFNULL(p_start, startDate),
            endDate = IFNULL(p_end, endDate),
            location = IFNULL(p_location, location),
            expectedAttendance = IFNULL(p_attendance, expectedAttendance),
            budget = IFNULL(p_budget, budget),
            ticketPrice = IFNULL(p_ticketPrice, ticketPrice)
        WHERE festivalID = p_id; 
    END IF; 

END //
DELIMITER ;
-- Delete, This will throw an error if it doesn't exist
DROP PROCEDURE IF EXISTS sp_delete_festival;
DELIMITER // 
CREATE PROCEDURE sp_delete_festival(
    IN p_id INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM festivals WHERE festivalID = p_id) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Festival ID does not exist';
    ELSE
        DELETE FROM festivals WHERE festivalID = p_id;
    END IF;   
END //
DELIMITER ;

-- 3. ARTISTS QUERIES

-- Create
DROP PROCEDURE IF EXISTS sp_create_artist;
DELIMITER // 
CREATE PROCEDURE sp_create_artist(
    IN p_artistName VARCHAR(255) ,
    IN p_genre VARCHAR(100),
    IN p_bookingFee DECIMAL(10,2),
    IN p_contactEmail VARCHAR(255),
    IN p_contactPhone VARCHAR(20),
    IN p_country VARCHAR(100),
    IN p_websiteURL VARCHAR(255),
    OUT p_id INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM artists WHERE artistName = p_artistName) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Artist already exists';
    ELSE
        INSERT INTO artists
            (artistName, genre, bookingFee, contactEmail, contactPhone, country, websiteURL)
        VALUES
            (p_artistName, p_genre, p_bookingFee, p_contactEmail, p_contactPhone, p_country, p_websiteURL);
        
        SET p_id = LAST_INSERT_ID();
    END IF;
END //
DELIMITER ;

-- Update

DROP PROCEDURE IF EXISTS sp_update_artist;
DELIMITER // 
CREATE PROCEDURE sp_update_artist(
    IN p_id INT,
    IN p_artistName VARCHAR(255) ,
    IN p_genre VARCHAR(100),
    IN p_bookingFee DECIMAL(10,2),
    IN p_contactEmail VARCHAR(255),
    IN p_contactPhone VARCHAR(20),
    IN p_country VARCHAR(100),
    IN p_websiteURL VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM artists WHERE artistID = p_id) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Artist ID does not exist';
    ELSE
        UPDATE artists
        SET 
            artistName = IFNULL(p_artistName, artistName),
            genre = IFNULL(p_genre, genre),
            bookingFee = IFNULL(p_bookingFee, bookingFee),
            contactEmail = IFNULL(p_contactEmail, contactEmail),
            contactPhone = IFNULL(p_contactPhone,contactPhone ),
            country = IFNULL(p_country, country),
            websiteURL = IFNULL(p_websiteURL,websiteURL )
        WHERE artistID = p_id;
    END IF;
END //
DELIMITER ;

-- Delete
DROP PROCEDURE IF EXISTS sp_delete_artist;
DELIMITER // 
CREATE PROCEDURE sp_delete_artist(
    IN p_id INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM artists WHERE artistID = p_id) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Artist ID does not exist';
    ELSE
        DELETE FROM artists WHERE artistID = p_id;
    END IF;
END //
DELIMITER ;

-- 4. STAGES QUERIES

-- Create
DROP PROCEDURE IF EXISTS sp_create_stage;
DELIMITER // 
CREATE PROCEDURE sp_create_stage(
    IN p_festivalID INT,
    IN p_stageName VARCHAR(100),
    IN p_capacity INT,
    IN p_stageType VARCHAR(50),
    IN p_locationDescription VARCHAR(255),
    IN p_hasCover BOOLEAN,
    OUT p_stageID INT
)
BEGIN
    INSERT INTO stages
        (festivalID, stageName, capacity, stageType, locationDescription, hasCover)
    VALUES
        (p_festivalID, p_stageName, p_capacity, p_stageType, p_locationDescription, p_hasCover);
    
    SET p_stageID = LAST_INSERT_ID();
END //
DELIMITER ;

-- Update
DROP PROCEDURE IF EXISTS sp_update_stage;
DELIMITER //
CREATE PROCEDURE sp_update_stage(
    IN p_stageID INT,
    IN p_stageName VARCHAR(100),
    IN p_capacity INT,
    IN p_stageType VARCHAR(50),
    IN p_locationDescription VARCHAR(255),
    IN p_hasCover BOOLEAN
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM stages WHERE stageID = p_stageID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stage ID does not exist';
    ELSE
        UPDATE stages
        SET
            stageName = IFNULL(p_stageName, stageName),
            capacity = IFNULL(p_capacity, capacity),
            stageType = IFNULL(p_stageType, stageType),
            locationDescription = IFNULL(p_locationDescription, locationDescription),
            hasCover = IFNULL(p_hasCover, hasCover)
        WHERE stageID = p_stageID;
    END IF;
END //
DELIMITER ;


-- Delete
DROP PROCEDURE IF EXISTS sp_delete_stage;
DELIMITER //
CREATE PROCEDURE sp_delete_stage(
    IN p_stageID INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM stages WHERE stageID = p_stageID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stage ID does not exist';
    ELSE
        DELETE FROM stages WHERE stageID = p_stageID;
    END IF;
END //
DELIMITER ;


-- 5. VENDORS QUERIES

-- Create
DROP PROCEDURE IF EXISTS sp_create_vendor;
DELIMITER // 
CREATE PROCEDURE sp_create_vendor(
    IN p_vendorName VARCHAR(255) ,
    IN p_vendorType VARCHAR(100),
    IN p_contactEmail VARCHAR(255),
    IN p_contactPhone VARCHAR(20),
    IN p_businessLicense VARCHAR(100),
    OUT p_id INT
)
BEGIN
    INSERT INTO vendors
        (vendorName, vendorType, contactEmail, contactPhone, businessLicense)
    VALUES
        (p_vendorName, p_vendorType, p_contactEmail, p_contactPhone, p_businessLicense);
    
    SET p_id = LAST_INSERT_ID();
END //
DELIMITER ;

-- Update

DROP PROCEDURE IF EXISTS sp_update_vendor;
DELIMITER // 
CREATE PROCEDURE sp_update_vendor(
    IN p_id INT,
    IN p_vendorName VARCHAR(255) ,
    IN p_vendorType VARCHAR(100),
    IN p_contactEmail VARCHAR(255),
    IN p_contactPhone VARCHAR(20),
    IN p_businessLicense VARCHAR(100)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM vendors WHERE vendorID = p_id) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Vendor ID does not exist';
    ELSE
        UPDATE vendors
        SET 
            vendorName = IFNULL(p_vendorName, vendorName),
            vendorType = IFNULL(p_vendorType, vendorType),
            contactEmail = IFNULL(p_contactEmail, contactEmail),
            contactPhone = IFNULL(p_contactPhone,contactPhone ),
            businessLicense = IFNULL(p_businessLicense, businessLicense)
        WHERE vendorID = p_id;
    END IF;
END //
DELIMITER ;

-- Delete
DROP PROCEDURE IF EXISTS sp_delete_vendor;
DELIMITER // 
CREATE PROCEDURE sp_delete_vendor(
    IN p_id INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM vendors WHERE vendorID = p_id) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Vendor ID does not exist';
    ELSE
        DELETE FROM vendors WHERE vendorID = p_id;
    END IF;
END //
DELIMITER ;

-- 6. SPONSORS QUERIES

-- Create
DROP PROCEDURE IF EXISTS sp_create_sponsor;
DELIMITER // 
CREATE PROCEDURE sp_create_sponsor(
    IN p_sponsorName VARCHAR(255) ,
    IN p_industry VARCHAR(100),
    IN p_contactEmail VARCHAR(255),
    IN p_contactPhone VARCHAR(20),
    IN p_websiteURL VARCHAR(255),
    OUT p_id INT
)
BEGIN
    IF EXISTS(SELECT 1 FROM sponsors WHERE sponsorName = p_sponsorName) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = "Sponsor name already exists";
    ELSE
        INSERT INTO sponsors
            (sponsorName, industry, contactEmail, contactPhone, websiteURL)
        VALUES
            (p_sponsorName, p_industry, p_contactEmail, p_contactPhone, p_websiteURL);
        
        SET p_id = LAST_INSERT_ID();
    END IF;
END //
DELIMITER ;

-- Update
DROP PROCEDURE IF EXISTS sp_update_sponsor;
DELIMITER // 
CREATE PROCEDURE sp_update_sponsor(
    IN p_sponsorID INT,
    IN p_sponsorName VARCHAR(255) ,
    IN p_industry VARCHAR(100),
    IN p_contactEmail VARCHAR(255),
    IN p_contactPhone VARCHAR(20),
    IN p_websiteURL VARCHAR(255)
)
BEGIN
    IF NOT EXISTS(SELECT 1 FROM sponsors WHERE sponsorID = p_sponsorID) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = "Sponsor id does not exist";
    ELSE
        UPDATE sponsors
        SET
            sponsorName = IFNULL(p_sponsorName, sponsorName),
            industry = IFNULL(p_industry, industry),
            contactEmail = IFNULL(p_contactEmail, contactEmail),
            contactPhone = IFNULL(p_contactPhone, contactPhone),
            websiteURL = IFNULL(p_websiteURL, websiteURL)
        WHERE sponsorID = p_sponsorID;
    END IF ;
END //
DELIMITER ;
-- Delete
DROP PROCEDURE IF EXISTS sp_delete_sponsor;
DELIMITER // 
CREATE PROCEDURE sp_delete_sponsor(
    IN p_id INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM sponsors WHERE sponsorID = p_id) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Sponsor ID does not exist';
    ELSE
        DELETE FROM sponsors WHERE sponsorID = p_id;
    END IF;
END //
DELIMITER ;

-- 7. STAFF QUERIES

-- Create
DROP PROCEDURE IF EXISTS sp_create_staff;
DELIMITER // 
CREATE PROCEDURE sp_create_staff(
    IN p_firstName VARCHAR(100) ,
    IN p_lastName VARCHAR(100),
    IN p_email VARCHAR(255),
    IN p_phone VARCHAR(20),
    IN p_role VARCHAR(100),
    IN p_hourlyRate DECIMAL(10,2),
    OUT p_id INT
)
BEGIN
    INSERT INTO staff
        (firstName, lastName, email, phone, role, hourlyRate)
    VALUES
        (p_firstName, p_lastName, p_email, p_phone, p_role, p_hourlyRate);
    
    SET p_id = LAST_INSERT_ID();
END //
DELIMITER ;

-- Update
DROP PROCEDURE IF EXISTS sp_update_staff;
DELIMITER // 
CREATE PROCEDURE sp_update_staff(
    IN p_staffID INT,
    IN p_firstName VARCHAR(100) ,
    IN p_lastName VARCHAR(100),
    IN p_email VARCHAR(255),
    IN p_phone VARCHAR(20),
    IN p_role VARCHAR(100),
    IN p_hourlyRate DECIMAL(10,2)
)
BEGIN
    IF NOT EXISTS(SELECT 1 FROM staff WHERE staffID = p_staffID) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = "Staff id does not exist";
    ELSE
        UPDATE staff
        SET
            firstName = IFNULL(p_firstName, firstName),
            lastName = IFNULL(p_lastName, lastName),
            email = IFNULL(p_email, email),
            phone = IFNULL(p_phone, phone),
            role = IFNULL(p_role, role),
            hourlyRate = IFNULL(p_hourlyRate, hourlyRate)
        WHERE staffID = p_staffID;
    END IF ;
END //
DELIMITER ;

-- Delete
DROP PROCEDURE IF EXISTS sp_delete_staff;
DELIMITER // 
CREATE PROCEDURE sp_delete_staff(
    IN p_id INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM staff WHERE staffID = p_id) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Staff ID does not exist';
    ELSE
        DELETE FROM staff WHERE staffID = p_id;
    END IF;
END //
DELIMITER ;

-- 8. PERFORMANCES QUERIES (M:N between Artists and Stages)

-- Create
DROP PROCEDURE IF EXISTS sp_create_performance;
DELIMITER //
CREATE PROCEDURE sp_create_performance(
    IN p_artistID INT,
    IN p_stageID INT,
    IN p_performanceDate DATE,
    IN p_startTime TIME,
    IN p_endTime TIME,
    IN p_setupNotes TEXT,
    IN p_soundcheckTime TIME,
    OUT p_id INT
)
BEGIN
    -- Check if artist exists
    IF NOT EXISTS (SELECT 1 FROM artists WHERE artistID = p_artistID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Artist ID does not exist';
    -- Check if stage exists
    ELSEIF NOT EXISTS (SELECT 1 FROM stages WHERE stageID = p_stageID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stage ID does not exist';
    ELSE
        INSERT INTO performances
            (artistID, stageID, performanceDate, startTime, endTime, setupNotes, soundcheckTime)
        VALUES
            (p_artistID, p_stageID, p_performanceDate, p_startTime, p_endTime, p_setupNotes, p_soundcheckTime);

        SET p_id = LAST_INSERT_ID();
    END IF;
END //
DELIMITER ;
-- Update
DROP PROCEDURE IF EXISTS sp_update_performance;
DELIMITER //
CREATE PROCEDURE sp_update_performance(
    IN p_performanceID INT,
    IN p_artistID INT,
    IN p_stageID INT,
    IN p_performanceDate DATE,
    IN p_startTime TIME,
    IN p_endTime TIME,
    IN p_setupNotes TEXT,
    IN p_soundcheckTime TIME
)
BEGIN
    -- Check if performance exists
    IF NOT EXISTS (SELECT 1 FROM performances WHERE performanceID = p_performanceID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Performance ID does not exist';
    ELSE
        UPDATE performances
        SET
            artistID = IFNULL(p_artistID, artistID),
            stageID = IFNULL(p_stageID, stageID),
            performanceDate = IFNULL(p_performanceDate, performanceDate),
            startTime = IFNULL(p_startTime, startTime),
            endTime = IFNULL(p_endTime, endTime),
            setupNotes = IFNULL(p_setupNotes, setupNotes),
            soundcheckTime = IFNULL(p_soundcheckTime, soundcheckTime)
        WHERE performanceID = p_performanceID;
    END IF;
END //
DELIMITER ;

-- Delete
DROP PROCEDURE IF EXISTS sp_delete_performance;
DELIMITER //
CREATE PROCEDURE sp_delete_performance(
    IN p_performanceID INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM performances WHERE performanceID = p_performanceID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Performance ID does not exist';
    ELSE
        DELETE FROM performances WHERE performanceID = p_performanceID;
    END IF;
END //
DELIMITER ;

-- 9. VENDOR ASSIGNMENTS QUERIES (M:N between Vendors and Festivals)

-- Create
DROP PROCEDURE IF EXISTS sp_create_vendorAssignment;
DELIMITER //
CREATE PROCEDURE sp_create_vendorAssignment(
    IN p_vendorID INT,
    IN p_festivalID INT,
    IN p_boothNumber VARCHAR(50),
    IN p_registrationFee DECIMAL(10,2),
    IN p_assignmentDate DATE,
    OUT p_id INT
)
BEGIN
    -- Check if vendor exists
    IF NOT EXISTS (SELECT 1 FROM vendors WHERE vendorID = p_vendorID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Vendor ID does not exist';
    -- Check if festival exists
    ELSEIF NOT EXISTS (SELECT 1 FROM festivals WHERE festivalID = p_festivalID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Festival ID does not exist';
    ELSE
        INSERT INTO vendorAssignments
            (vendorID, festivalID, boothNumber, registrationFee, assignmentDate)
        VALUES
            (p_vendorID, p_festivalID, p_boothNumber, p_registrationFee, p_assignmentDate);

        SET p_id = LAST_INSERT_ID();
    END IF;
END //
DELIMITER ;

-- Update
DROP PROCEDURE IF EXISTS sp_update_vendorAssignment;
DELIMITER //
CREATE PROCEDURE sp_update_vendorAssignment(
    IN p_assignmentID INT,
    IN p_vendorID INT,
    IN p_festivalID INT,
    IN p_boothNumber VARCHAR(50),
    IN p_registrationFee DECIMAL(10,2),
    IN p_assignmentDate DATE
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM vendorAssignments WHERE assignmentID = p_assignmentID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Assignment ID does not exist';
    ELSE
        UPDATE vendorAssignments
        SET
            vendorID = IFNULL(p_vendorID, vendorID),
            festivalID = IFNULL(p_festivalID, festivalID),
            boothNumber = IFNULL(p_boothNumber, boothNumber),
            registrationFee = IFNULL(p_registrationFee, registrationFee),
            assignmentDate = IFNULL(p_assignmentDate, assignmentDate)
        WHERE assignmentID = p_assignmentID;
    END IF;
END //
DELIMITER ;

-- Delete
DROP PROCEDURE IF EXISTS sp_delete_vendorAssignment;
DELIMITER //
CREATE PROCEDURE sp_delete_vendorAssignment(
    IN p_assignmentID INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM vendorAssignments WHERE assignmentID = p_assignmentID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Assignment ID does not exist';
    ELSE
        DELETE FROM vendorAssignments WHERE assignmentID = p_assignmentID;
    END IF;
END //
DELIMITER ;

-- 10. SPONSORSHIPS QUERIES (M:N between Sponsors and Festivals)

-- Create
DROP PROCEDURE IF EXISTS sp_create_sponsorship;
DELIMITER //
CREATE PROCEDURE sp_create_sponsorship(
    IN p_sponsorID INT,
    IN p_festivalID INT,
    IN p_sponsorshipAmount DECIMAL(12,2),
    IN p_sponsorshipTier VARCHAR(50),
    IN p_contractDate DATE,
    IN p_benefits TEXT,
    OUT p_id INT
)
BEGIN
    -- Check foreign keys
    IF NOT EXISTS (SELECT 1 FROM sponsors WHERE sponsorID = p_sponsorID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sponsor ID does not exist';
    ELSEIF NOT EXISTS (SELECT 1 FROM festivals WHERE festivalID = p_festivalID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Festival ID does not exist';
    ELSE
        INSERT INTO sponsorships
            (sponsorID, festivalID, sponsorshipAmount, sponsorshipTier, contractDate, benefits)
        VALUES
            (p_sponsorID, p_festivalID, p_sponsorshipAmount, p_sponsorshipTier, p_contractDate, p_benefits);

        SET p_id = LAST_INSERT_ID();
    END IF;
END //
DELIMITER ;

-- Update
DROP PROCEDURE IF EXISTS sp_update_sponsorship;
DELIMITER //
CREATE PROCEDURE sp_update_sponsorship(
    IN p_sponsorshipID INT,
    IN p_sponsorID INT,
    IN p_festivalID INT,
    IN p_sponsorshipAmount DECIMAL(12,2),
    IN p_sponsorshipTier VARCHAR(50),
    IN p_contractDate DATE,
    IN p_benefits TEXT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM sponsorships WHERE sponsorshipID = p_sponsorshipID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sponsorship ID does not exist';
    ELSE
        UPDATE sponsorships
        SET
            sponsorID = IFNULL(p_sponsorID, sponsorID),
            festivalID = IFNULL(p_festivalID, festivalID),
            sponsorshipAmount = IFNULL(p_sponsorshipAmount, sponsorshipAmount),
            sponsorshipTier = IFNULL(p_sponsorshipTier, sponsorshipTier),
            contractDate = IFNULL(p_contractDate, contractDate),
            benefits = IFNULL(p_benefits, benefits)
        WHERE sponsorshipID = p_sponsorshipID;
    END IF;
END //
DELIMITER ;

-- Delete
DROP PROCEDURE IF EXISTS sp_delete_sponsorship;
DELIMITER //
CREATE PROCEDURE sp_delete_sponsorship(
    IN p_sponsorshipID INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM sponsorships WHERE sponsorshipID = p_sponsorshipID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sponsorship ID does not exist';
    ELSE
        DELETE FROM sponsorships WHERE sponsorshipID = p_sponsorshipID;
    END IF;
END //
DELIMITER ;

-- 11. STAFF ASSIGNMENTS QUERIES (M:N between Staff and Festivals)

-- Create
DROP PROCEDURE IF EXISTS sp_create_staff_assignment;
DELIMITER //
CREATE PROCEDURE sp_create_staff_assignment(
    IN p_staffID INT,
    IN p_festivalID INT,
    IN p_assignedDate DATE,
    IN p_hoursWorked DECIMAL(5,2),
    IN p_shiftNotes TEXT,
    OUT p_id INT
)
BEGIN
    -- Check foreign keys
    IF NOT EXISTS (SELECT 1 FROM staff WHERE staffID = p_staffID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Staff ID does not exist';
    ELSEIF NOT EXISTS (SELECT 1 FROM festivals WHERE festivalID = p_festivalID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Festival ID does not exist';
    ELSE
        INSERT INTO staffAssignments
            (staffID, festivalID, assignedDate, hoursWorked, shiftNotes)
        VALUES
            (p_staffID, p_festivalID, p_assignedDate, p_hoursWorked, p_shiftNotes);

        SET p_id = LAST_INSERT_ID();
    END IF;
END //
DELIMITER ;

-- Update
DROP PROCEDURE IF EXISTS sp_update_staff_assignment;
DELIMITER //
CREATE PROCEDURE sp_update_staff_assignment(
    IN p_staffAssignmentID INT,
    IN p_staffID INT,
    IN p_festivalID INT,
    IN p_assignedDate DATE,
    IN p_hoursWorked DECIMAL(5,2),
    IN p_shiftNotes TEXT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM staffAssignments WHERE staffAssignmentID = p_staffAssignmentID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Staff Assignment ID does not exist';
    ELSE
        UPDATE staffAssignments
        SET
            staffID = IFNULL(p_staffID, staffID),
            festivalID = IFNULL(p_festivalID, festivalID),
            assignedDate = IFNULL(p_assignedDate, assignedDate),
            hoursWorked = IFNULL(p_hoursWorked, hoursWorked),
            shiftNotes = IFNULL(p_shiftNotes, shiftNotes)
        WHERE staffAssignmentID = p_staffAssignmentID;
    END IF;
END //
DELIMITER ;

-- Delete
DROP PROCEDURE IF EXISTS sp_delete_staff_assignment;
DELIMITER //
CREATE PROCEDURE sp_delete_staff_assignment(
    IN p_staffAssignmentID INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM staffAssignments WHERE staffAssignmentID = p_staffAssignmentID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Staff Assignment ID does not exist';
    ELSE
        DELETE FROM staffAssignments WHERE staffAssignmentID = p_staffAssignmentID;
    END IF;
END //
DELIMITER ;
