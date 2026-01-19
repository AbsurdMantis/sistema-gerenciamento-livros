
--Para este simulador usei pg4Admin com a querytools e o Postgre como db 

CREATE TABLE Books (
    book_id INT PRIMARY KEY, 
    title VARCHAR(255)
    author VARCHAR(255)
    genre VARCHAR(100)
    published_year INT
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY, 
    name VARCHAR(255)
    email VARCHAR(255)
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT REFERENCES Books(book_id), 
    user_id INT REFERENCES Users(user_id), 
    loan_date DATE
    return_date DATE
);