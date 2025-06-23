# 📚 LibraryDB - Library Management System (SQL)

**Author:** Sai Pradeep Kala  
**GitHub:** [@pradeep240604](https://github.com/pradeep240604)  
**Email:** saipradeep2464@gmail.com  

---

## 📌 Overview

LibraryDB is a **Library Management System** built using **MySQL**.  
It is designed to manage the core operations of a library such as tracking authors, books, students, librarians, and book loans. The project demonstrates how relational databases can be structured and queried efficiently.

---

## 🏗️ Database Structure

### ✅ Tables Created

- **Author**  
  Stores details about book authors.

- **Book**  
  Contains book information, including foreign key reference to the author.

- **Student**  
  Represents library members who can borrow books.

- **Loan**  
  Tracks which student borrowed which book, along with issue and return dates.

- **Librarian**  
  Contains records of librarians who manage the library.

---

## 💾 Features Implemented

- Table creation with appropriate keys and constraints.
- Insertion of sample data for each table.
- Sample queries for:
  - Fetching book and author details.
  - Tracking loans and due returns.
  - Student borrowing history.
  - Librarian management operations.

---

## 🧪 Sample SQL Operations

```sql
-- Example: Get all books with their authors
SELECT Book.title, Author.name 
FROM Book 
JOIN Author ON Book.author_id = Author.author_id;

-- Example: Show all overdue loans
SELECT * FROM Loan 
WHERE return_date IS NULL AND due_date < CURDATE();
```
