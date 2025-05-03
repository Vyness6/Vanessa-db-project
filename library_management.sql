--Question 1--
-- Database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Table: Authors
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year INT
);

-- Table: Books
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    published_year INT,
    genre VARCHAR(50),
    isbn VARCHAR(20) UNIQUE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Table: Members
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL
);

-- Table: Loans
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

--sample data--
-- Sample Authors
INSERT INTO Authors (name, birth_year) VALUES
('J.K. Rowling', 1965),
('George Orwell', 1903);

-- Sample Books
INSERT INTO Books (title, author_id, published_year, genre, isbn) VALUES
('Harry Potter and the Sorcerer\'s Stone', 1, 1997, 'Fantasy', '9780747532699'),
('1984', 2, 1949, 'Dystopian', '9780451524935');

-- Sample Members
INSERT INTO Members (name, email, join_date) VALUES
('Alice Johnson', 'alice@example.com', '2023-01-10'),
('Bob Smith', 'bob@example.com', '2022-12-15');

-- Sample Loans
INSERT INTO Loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2023-10-01', '2023-10-15'),
(2, 2, '2023-10-05', NULL);


--Question 2--
-- Database
CREATE DATABASE IF NOT EXISTS TaskManagerDB;
USE TaskManagerDB;

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Tasks Table
CREATE TABLE Tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    due_date DATE,
    completed BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

--API structure--
task_manager/
├── main.py
├── models.py
├── schemas.py
├── crud.py
└── database.py


