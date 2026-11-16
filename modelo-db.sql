-- PROGRAMACION DISTRIBUIDA
-- MODELO BD

-- AUTHORS

CREATE TABLE authors (
    id serial PRIMARY KEY,
    name varchar(255),
    version integer
);

-- BOOKS

CREATE TABLE books (
    price numeric(8,2) NOT NULL,
    version integer NOT NULL,
    isbn varchar(255) NOT NULL,
    title varchar(255),

    CONSTRAINT books_pkey
        PRIMARY KEY (isbn)
);

-- INVENTORY

CREATE TABLE inventory (
    sold integer NOT NULL,
    supplied integer NOT NULL,
    version integer NOT NULL,
    book_isbn varchar(255) NOT NULL,

    CONSTRAINT inventory_pkey
        PRIMARY KEY (book_isbn),

    CONSTRAINT fk_inventory_book
        FOREIGN KEY (book_isbn)
        REFERENCES books(isbn)
);

-- BOOKS_AUTHORS

CREATE TABLE books_authors (
    authors_id integer NOT NULL,
    books_isbn varchar(255) NOT NULL,

    CONSTRAINT books_authors_pkey
        PRIMARY KEY (authors_id, books_isbn),

    CONSTRAINT fk_ba_author
        FOREIGN KEY (authors_id)
        REFERENCES authors(id),

    CONSTRAINT fk_ba_book
        FOREIGN KEY (books_isbn)
        REFERENCES books(isbn)
);

-- AUTHORS

INSERT INTO authors(name,version)
VALUES ('Gabriel Garcia Marquez',1);

INSERT INTO authors(name,version)
VALUES ('Julio Verne',1);

INSERT INTO authors(name,version)
VALUES ('Isaac Asimov',1);

INSERT INTO authors(name,version)
VALUES ('Joshua Bloch',1);

INSERT INTO authors(name,version)
VALUES ('Robert Martin',1);

-- BOOKS

INSERT INTO books
(price, version, isbn, title)
VALUES (40.00, 1, '978-0596009205', 'Head First Java');

INSERT INTO books
(price, version, isbn, title)
VALUES (55.00, 1, '978-0321349606', 'Java Concurrency in Practice');

INSERT INTO books
(price, version, isbn, title)
VALUES (50.00, 1, '978-0136083238', 'Clean Code: A Handbook of Agile Software Craftsmanship');

INSERT INTO books
(price, version, isbn, title)
VALUES (45.00, 1, '978-0134686097', 'Effective Java');

INSERT INTO books
(price, version, isbn, title)
VALUES (50.00, 1, '978-1260440232', 'Java: The Complete Reference');

-- INVENTORY

INSERT INTO inventory
(sold, supplied, version, book_isbn)
VALUES (10, 50, 1, '978-0134686097');

-- BOOKS_AUTHORS

INSERT INTO books_authors
(authors_id, books_isbn)
VALUES (1, '978-0134686097');

INSERT INTO books_authors
(authors_id, books_isbn)
VALUES (2, '978-1260440232');

INSERT INTO books_authors
(authors_id, books_isbn)
VALUES (3, '978-0596009205');

INSERT INTO books_authors
(authors_id, books_isbn)
VALUES (4, '978-0321349606');

INSERT INTO books_authors
(authors_id, books_isbn)
VALUES (5, '978-0136083238');