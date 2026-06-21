-- Create author table
CREATE TABLE author (
-- author contains author details
authorID INT AUTO_INCREMENT,
authFirstName VARCHAR(50) NOT NULL,
authLastName VARCHAR(50) NOT NULL,
PRIMARY KEY (authorID)
);

-- Create publisher table
CREATE TABLE publisher (
-- publisher contains publisher details
publisherID INT AUTO_INCREMENT,
publisherName  VARCHAR(100),
PRIMARY KEY (publisherID)
);

-- Create branch table
CREATE TABLE branch (
-- branch contains branch details
branchID INT AUTO_INCREMENT,
branchName VARCHAR(50) NOT NULL,
branchLocation VARCHAR(50) NOT NULL,
PRIMARY KEY (branchID)
);

-- Create category table 
CREATE TABLE category (
-- category contains category details
categoryID INT AUTO_INCREMENT,
categoryName VARCHAR(50),
PRIMARY KEY (categoryID)
);

-- Create librarian table 
CREATE TABLE librarian (
-- librarian contains librarian details
librarianID INT AUTO_INCREMENT,
librarianFirstName VARCHAR(20) NOT NULL,
librarianLastName VARCHAR(50) NOT NULL,
PRIMARY KEY (librarianID)
);



-- Create format table 
CREATE TABLE format (
-- format contains digital format details
formatID INT AUTO_INCREMENT,
formatType VARCHAR(30),
PRIMARY KEY (formatID)
);


--Create Ebook table
CREATE TABLE eBook (
 -- ebook contains ebook details
eBookID INT       AUTO_INCREMENT,
bookTitle VARCHAR(255) NOT NULL,
bookDescription TEXT NOT NULL,
releaseYear INT,
availableStatus VARCHAR(20),


--foreign key columns
authorID INT NOT NULL,
categoryID  INT NOT NULL,
publisherID INT NOT NULL,
branchID INT NOT NULL,
formatID INT NOT NULL,
librarianID INT NOT NULL,

--identify primary key
PRIMARY KEY (eBookID),

--Foreign Key links
FOREIGN KEY (authorID) REFERENCES author(authorID),
FOREIGN KEY (categoryID) REFERENCES category(categoryID),
FOREIGN KEY (publisherID) REFERENCES publisher(publisherID),
FOREIGN KEY (branchID) REFERENCES branch(branchID),
FOREIGN KEY (formatID) REFERENCES format(formatID),
FOREIGN KEY (librarianID) REFERENCES librarian(librarianID)
);

-- end Create eBook table


-- create members table 
CREATE TABLE members (
-- members contains member details, contact info and status
memberID INT AUTO_INCREMENT,
firstName VARCHAR(20) NOT NULL,
lastName VARCHAR(30) NOT NULL,
email VARCHAR(100) NOT NULL,
phoneNumber VARCHAR(20),
accountStatus VARCHAR(20) DEFAULT 'ACTIVE',
PRIMARY KEY (memberID)
) AUTO_INCREMENT = 1000;


-- Create loans table
CREATE TABLE loans (
-- loans contains loan details
loanID INT AUTO_INCREMENT,
loanDate DATE NOT NULL,
returnDate DATE,
eBookID INT,
memberID INT,

-- Foreign Key links
PRIMARY KEY (loanID),
FOREIGN KEY (eBookID) REFERENCES eBook(eBookID),
FOREIGN KEY (memberID) REFERENCES members(memberID)
);


-- Create reservations table
CREATE TABLE reservations (
-- reservations contains reservation details
reservationID INT AUTO_INCREMENT,
reservationDate DATE NOT NULL,
status VARCHAR(20)  DEFAULT 'HOLD',
eBookID INT NOT NULL,
memberID INT NOT NULL,

-- Foreign key links 
PRIMARY KEY (reservationID),
FOREIGN KEY(eBookID) REFERENCES eBook(eBookID),
FOREIGN KEY (memberID) REFERENCES members(memberID)
);




--INSERT STATEMENTS

--INSERT members data

INSERT INTO members (firstName, lastName, email, phoneNumber, accountStatus) VALUES ('Elena', 'Gilbert','egilbert@gemail.com', '203-222-4567','ACTIVE');
INSERT INTO members (firstName, lastName, email, phoneNumber, accountStatus) VALUES ('Damon', 'Salvatore','dsalvatore@gemail.com', '917-252-6543','CANCELLED');
INSERT INTO members (firstName, lastName, email, phoneNumber, accountStatus) VALUES ('Bonnie', 'Bennet','bbennet@gemail.com', '404-554-0123','ACTIVE');
INSERT INTO members (firstName, lastName, email, phoneNumber, accountStatus) VALUES ('Caroline', 'Forbes','carolineforbes@gemail.com', '678-111-6789','PENDING');


-- INSERT format data
INSERT INTO format (formatType) VALUES ('EPUB');
INSERT INTO format (formatType) VALUES ('PDF');
INSERT INTO format (formatType) VALUES ('Audiobook');



-- INSERT Category data
INSERT INTO category (categoryName) VALUES ('Fiction');
INSERT INTO category (categoryName) VALUES ('Sci-Fi');
INSERT INTO category (categoryName) VALUES ('Mystery');
INSERT INTO category (categoryName) VALUES ('Romance');
INSERT INTO category (categoryName) VALUES ('Fantasy');
INSERT INTO category (categoryName) VALUES ('Technology');
INSERT INTO category (categoryName) VALUES ('Self-Help');
INSERT INTO category (categoryName) VALUES ('Biography');
INSERT INTO category (categoryName) VALUES ('Children');



-- INSERT publisher data
INSERT INTO publisher (publisherName) VALUES ('Penguin Random House');
INSERT INTO publisher (publisherName) VALUES ('HarperCollins');
INSERT INTO publisher (publisherName) VALUES ('Kindle Direct Publishing');


-- INSERT author data
INSERT INTO author (authFirstName, authLastName) VALUES ('Colleen', 'Hoover');
INSERT INTO author (authFirstName, authLastName) VALUES ('Andy', 'Weir');
INSERT INTO author (authFirstName, authLastName) VALUES ('Tracy', 'Deonn');
INSERT INTO author (authFirstName, authLastName) VALUES ('Dr.', 'Seuss');
INSERT INTO author (authFirstName, authLastName) VALUES ('Roald', 'Dahl');



-- INSERT branch data
INSERT INTO branch (branchName, branchLocation) VALUES ('Gilbert Community Library', 'Mystic Falls');
INSERT INTO branch (branchName, branchLocation) VALUES ('The Square Digital Kiosk', 'River Falls');
INSERT INTO branch (branchName, branchLocation) VALUES ('City Reading Room', 'Shiloh Hill');


-- INSERT librarian data
INSERT INTO librarian(librarianFirstName, librarianLastName) VALUES ('May', 'James');
INSERT INTO librarian(librarianFirstName, librarianLastName) VALUES ('Allison', 'Fields');


-- INSERT eBook data
INSERT INTO eBook(bookTitle, bookDescription, releaseYear, availableStatus, authorID, categoryID, publisherID, branchID , formatID, librarianID) VALUES ('Project Hail Mary', 'A lone astronaut wakes up on a spaceship with a mission to save humanity.', '2021', 'Available',2,1,3,2,1,1 );
INSERT INTO eBook(bookTitle, bookDescription, releaseYear, availableStatus, authorID, categoryID, publisherID, branchID , formatID, librarianID) VALUES ('Legendborn', 'A teenager uncovers a secret magical society  connected to King Arthurs legacy while at college.', '2020', 'Available',3,3,2,3,1,1);
INSERT INTO eBook(bookTitle, bookDescription, releaseYear, availableStatus, authorID, categoryID, publisherID, branchID , formatID, librarianID) VALUES ('Verity', ' A struggling writer uncovers a chilling unfinished autobiography hidden inside an injured authors home.', '2018', 'Checked Out',1,3,1,3,1,1);
INSERT INTO eBook(bookTitle, bookDescription, releaseYear, availableStatus, authorID, categoryID, publisherID, branchID , formatID, librarianID) VALUES ('The Cat in the Hat', ' Two children home alone on a rainy day are visited by an eccentric, mischievous cat.', '1957', 'Checked Out',4,4,1,1,2,1);
INSERT INTO eBook(bookTitle, bookDescription, releaseYear, availableStatus, authorID, categoryID, publisherID, branchID , formatID, librarianID) VALUES ('Matilda', 'An exceptional smart young girl discovers she has telekinetic powers.', '1988', 'On Hold',5,4,1,1,2,1);





-- INSERT loan data
-- borrowed Project Hail Mary
INSERT INTO loans (loanDate, returnDate, eBookID, memberID) VALUES ('2026-05-15','2026-05-21',1,1000);
-- borrowed Legendborn
INSERT INTO loans (loanDate, returnDate, eBookID, memberID) VALUES ('2026-05-03',NULL,2,1001);
-- borrowed The Cat in the Hat
INSERT INTO loans (loanDate, returnDate, eBookID, memberID) VALUES ('2026-04-10',NULL,4,1002);
-- borrowed Project Hail Mary
INSERT INTO loans (loanDate, returnDate, eBookID, memberID) VALUES ('2026-05-23','2026-06-01',1,1003);



-- INSERT reservation data 
-- these 3 will have the default 'status' of HOLD since the status was omitted  
-- member is waiting for Legendborn
INSERT INTO reservations(reservationDate, eBookID, memberID) VALUES ('2026-05-21',2, 1000);
-- member is waiting for Maltida
INSERT INTO reservations(reservationDate, eBookID, memberID) VALUES ('2026-06-03',5, 1001);
-- member is waiting for Verity
INSERT INTO reservations(reservationDate, eBookID, memberID) VALUES ('2026-05-29',3, 1002);


-- this entry will be marked 'ready' for The Cat in the Hat 
INSERT INTO reservations(reservationDate, status, eBookID, memberID) VALUES ('2026-05-21','ready',4, 1003);






---TEST SQL QUERIES



--List all from eBook
SELECT * FROM eBook;

-- List books with their release years
SELECT bookTitle, releaseYear 
FROM eBook;

-- List members that are Cancelled
SELECT memberID, firstName, lastName, accountStatus 
FROM members 
WHERE accountStatus = 'CANCELLED';

-- List members with a last name of Salvatore

SELECT memberID, firstName, lastName, email 
FROM members 
WHERE lastName = 'Salvatore';


-- List members of have a reservation status of 'Hold'

SELECT 
    members.memberID, 
    members.firstName, 
    members.lastName, 
    reservations.reservationDate, 
    reservations.status
FROM members 
INNER JOIN reservations ON members.memberID = reservations.memberID
WHERE reservations.status = 'HOLD';


-- Show  book loans with no return date specified

SELECT *
FROM loans 
WHERE returnDate is NULL;

-- List all books with current loans that are checked out.

SELECT DISTINCT eBook.bookTitle
FROM eBook
JOIN loans ON eBook.eBookID = loans.eBookID
WHERE loans.returnDate IS NULL;

-- Show Matilda loan availability status

SELECT bookTitle,
      availableStatus
FROM eBook
WHERE bookTitle = 'Matilda';


-- List all ebooks with a format type of PDF

SELECT bookTitle, formatType
FROM eBook 
JOIN format
ON eBook.formatID = format.formatID
WHERE formatType = 'PDF';

-- List all members by their last name ascending
SELECT lastName, firstName, email, accountStatus
FROM members
ORDER BY lastName ASC;


-- Count how many members are registered  

SELECT COUNT(memberID) AS totalRegisteredMembers
FROM members
WHERE accountStatus ='ACTIVE' ;

--  List all eBooks along with the librarian responsible for each eBook

SELECT 
    eBook.bookTitle, 
    librarian.librarianFirstName AS librarianFirst, 
    librarian.librarianLastName AS librarianLast
FROM eBook
JOIN librarian ON eBook.librarianID = librarian.librarianID;



--- Find members with gemail address
SELECT firstName, lastName, email
FROM members
WHERE email LIKE '%@gemail.com';

-- List eBooks by oldest release year
SELECT bookTitle, releaseYear
FROM eBook
ORDER BY releaseYear ASC;

-- List eBooks being loaned with their formats

SELECT 
    loans.loanID, 
    eBook.bookTitle, 
    `format`.formatType, 
    loans.loanDate
FROM loans
JOIN eBook ON loans.eBookID = eBook.eBookID
JOIN `format` ON eBook.formatID = `format`.formatID;


-- List eBooks loans for the month of May

SELECT DISTINCT eBook.*, loans.loanDate
FROM eBook 
JOIN loans 
ON eBook.eBookID = loans.eBookID
WHERE loans.loanDate >= '2026-05-01'
AND loans.loanDate < '2026-06-01';


-- Show members and how many loans they have

SELECT members.firstName, members.lastName,
       COUNT(loans.loanID) AS loanCount
FROM members
LEFT JOIN loans
    ON members.memberID = loans.memberID
GROUP BY members.memberID;


-- Update loanID 3, with a return date of June 05, 2026

UPDATE loans
SET returnDate = '2026-06-05'
WHERE loanID = 3;

-- Show how many books each member has borrowed, including members with zero loans

SELECT members.memberID,
       members.firstName,
       members.lastName,
       COUNT(Loans.loanID) AS loanCount
FROM members
LEFT JOIN loans
    ON Members.memberID = Loans.memberID
GROUP BY members.memberID, members.firstName, Members.lastName
ORDER BY loanCount DESC;


-- Show each eBook and  the branch it belongs to


SELECT eBook.bookTitle,
	branch.branchName
FROM eBook
JOIN branch
ON eBook.branchID = branch.branchID;









