INSERT INTO Books (book_id, title, author, genre, published_year) VALUES
(1, 'O Código Télos', 'Ana C. Silva', 'Ficção Científica', 2023),
(2, 'A Era dos Gigantes de Pedra', 'Pedro R. Souza', 'Fantasia', 2018),
(3, 'Introdução ao SQL Moderno', 'Maria L. Santos', 'Técnico', 2021),
(4, 'O Mistério da Rua Quatro', 'Ricardo B. Lima', 'Suspense', 2005),
(5, 'Viagem ao Centro da Terra', 'Júlio Verne', 'Aventura', 1864),
(6, 'Padrões de Projeto em Python', 'Carlos E. Dantas', 'Técnico', 2019),
(7, 'Crônicas de Olinda', 'Beatriz M. Costa', 'História', 2020),
(8, 'A Revolução dos Dados', 'Thiago F. Borges', 'Ficção Científica', 2024),
(9, 'Receitas Veganas Rápidas', 'Laura P. Mendes', 'Culinária', 2022),
(10, 'A Queda do Império Digital', 'Helena V. Reis', 'Suspense', 2017);

INSERT INTO Users (user_id, name, email) VALUES
(101, 'Raphael Holmes', 'raphaelbholmes@gmail.com'),
(102, 'Julia Almeida', 'julia.a@emailficticio.com'),
(103, 'Marcos Vinicius', 'marcos.v@outroficticio.com'),
(104, 'Fernanda Costa', 'fernanda.c@bibliotel.com'),
(105, 'Bruno Guedes', 'bruno.g@servidor.com'),
(106, 'Camila Rocha', 'camila.r@bibliotel.com');

INSERT INTO Loans (loan_id, book_id, user_id, loan_date, return_date) VALUES
(1, 3, 102, '2026-01-10', NULL),
(2, 8, 104, '2026-01-15', NULL), 
(3, 5, 101, '2026-01-17', NULL), 
(4, 1, 103, '2025-12-01', '2025-12-15'),
(5, 7, 102, '2026-01-05', '2026-01-08'),
(6, 1, 103, '2026-01-12', '2026-01-19'),
(7, 2, 105, '2025-11-01', '2025-11-15'),
(8, 4, 105, '2025-12-01', '2025-12-10'),
(9, 6, 105, '2026-01-01', '2026-01-15'),
(10, 10, 105, '2026-01-19', NULL);

UPDATE Books 
SET published_year = 2006 
WHERE book_id = 4;

UPDATE Users 
SET name = 'Marcos V. Santos' 
WHERE user_id = 103;

DELETE FROM Books 
WHERE book_id = 9;

DELETE FROM Users 
WHERE user_id = 106;

SELECT title, author FROM Books 
WHERE genre = 'Suspense';

SELECT user_id, name FROM Users 
WHERE email = 'raphaelbholmes@gmail.com';

INSERT INTO Loans (loan_id, book_id, user_id, loan_date, return_date) 
VALUES (11, 4, 104, CURRENT_DATE, NULL);

UPDATE Loans 
SET return_date = CURRENT_DATE 
WHERE loan_id = 1;

SELECT T1.title, T2.name, T3.loan_date 
FROM Books AS T1
JOIN Loans AS T3 ON T1.book_id = T3.book_id
JOIN Users AS T2 ON T3.user_id = T2.user_id
WHERE T3.return_date IS NULL;

SELECT Users.name
FROM Users
WHERE (SELECT COUNT(*) FROM Loans WHERE Loans.user_id = Users.user_id) > 3;