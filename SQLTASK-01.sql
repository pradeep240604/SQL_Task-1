-- Create the database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Create Author table
CREATE TABLE IF NOT EXISTS Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- Create Book table
CREATE TABLE IF NOT EXISTS Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    available_copies INT DEFAULT 1,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

-- Create Student table
CREATE TABLE IF NOT EXISTS Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Create Loan table
CREATE TABLE IF NOT EXISTS Loan (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create Librarian table
CREATE TABLE IF NOT EXISTS Librarian (
    librarian_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15)
);



/* ======== AUTHORS (5) ======== */
INSERT INTO Author (name, bio) VALUES
('Jane Austen'        ,'English novelist known for realism and commentary on society.'),
('Mark Twain'         ,'American writer, humorist, entrepreneur, and lecturer.'),
('J.K. Rowling'       ,'British author, best known for the Harry Potter series.'),
('George Orwell'      ,'English novelist and essayist, critic of totalitarianism.'),
('Agatha Christie'    ,'English writer known as the “Queen of Crime”.');

/* ======== BOOKS (10) ======== */
INSERT INTO Book (title, category, available_copies, author_id) VALUES
('Pride and Prejudice',                     'Classic'  ,3, 1),
('Sense and Sensibility',                   'Classic'  ,2, 1),
('Adventures of Huckleberry Finn',          'Fiction'  ,4, 2),
('The Adventures of Tom Sawyer',            'Fiction'  ,3, 2),
('Harry Potter and the Sorcerer''s Stone',  'Fantasy'  ,5, 3),
('Harry Potter and the Chamber of Secrets', 'Fantasy'  ,4, 3),
('1984',                                    'Dystopian',2, 4),
('Animal Farm',                             'Satire'   ,3, 4),
('Murder on the Orient Express',            'Mystery'  ,2, 5),
('And Then There Were None',                'Mystery'  ,2, 5);

/* ======== STUDENTS / MEMBERS (10) ======== */
INSERT INTO Student (name, email, phone) VALUES
('Arjun Rai'    ,'arjun.rai@example.com'    ,'9876543201'),
('Bina Patel'   ,'bina.patel@example.com'   ,'9876543202'),
('Chandan Kumar','chandan.k@example.com'    ,'9876543203'),
('Deepa Singh'  ,'deepa.singh@example.com'  ,'9876543204'),
('Esha Reddy'   ,'esha.reddy@example.com'   ,'9876543205'),
('Farhan Ali'   ,'farhan.ali@example.com'   ,'9876543206'),
('Gita Joshi'   ,'gita.joshi@example.com'   ,'9876543207'),
('Hari Varma'   ,'hari.varma@example.com'   ,'9876543208'),
('Ishita Das'   ,'ishita.das@example.com'   ,'9876543209'),
('Jayant Mehta' ,'jayant.mehta@example.com' ,'9876543210');

/* ======== LIBRARIANS (2) ======== */
INSERT INTO Librarian (name, email, phone) VALUES
('Kavita Menon','kavita.menon@library.org','0801112221'),
('Rahul Bose'  ,'rahul.bose@library.org'  ,'0801112222');

/* ======== LOANS (5 sample transactions) ======== */
INSERT INTO Loan (student_id, book_id, issue_date, return_date) VALUES
(1,  1, '2025-06-01', '2025-06-15'),
(3,  5, '2025-06-04', '2025-06-18'),
(5,  7, '2025-06-05', NULL),                  -- still on loan
(2, 10, '2025-06-07', '2025-06-21'),
(8,  3, '2025-06-09', NULL);                  -- still on loan



