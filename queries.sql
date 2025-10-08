--- What are the top 5 highest-grossing genres?
SELECT
    genre,
    SUM("gross sales") AS total_revenue
FROM
    book_sales
GROUP BY
    genre
ORDER BY
    total_revenue DESC
LIMIT 5;
--- Who are the top 5 best-selling publishers?
SELECT
    "Publisher ", 
    SUM("units sold") AS total_units
FROM
    book_sales
GROUP BY
    "Publisher " 
ORDER BY
    total_units DESC
LIMIT 5;
---Find the top 10 best-selling books (by units sold) that were published in or after 2015.
SELECT
    "Book Name",
    "Author",
    "Publishing Year",
    "units sold"
FROM
    book_sales
WHERE
    "Publishing Year" >= 2015
ORDER BY
    "units sold" DESC
LIMIT 10;
---Group the data by author to find out which authors have.... 
---generated the most total revenue across all their books.
SELECT
    "Author",
    SUM("gross sales") AS total_revenue,
    COUNT(*) AS books_published
FROM
    book_sales
GROUP BY
    "Author"
ORDER BY
    total_revenue DESC
LIMIT 10;
/*shows a performance summary for each publisher, including the number of books they have in the dataset, 
their average book rating, and their total sales.*/
SELECT
    "Publisher ",
    COUNT(*) AS number_of_books,
    AVG("Book_average_rating") AS average_rating,
    SUM("units sold") AS total_sales
FROM
    book_sales
GROUP BY
    "Publisher "
ORDER BY
    total_sales DESC;
/*uses a CASE statement—a powerful SQL feature—to categorize books into different price 
tiers and then counts how many books fall into each category.*/
SELECT
    CASE
        WHEN "sale price" < 15 THEN 'Budget (< $15)'
        WHEN "sale price" >= 15 AND "sale price" < 30 THEN 'Mid-Range ($15-$30)'
        ELSE 'Premium (> $30)'
    END AS price_category,
    COUNT(*) AS number_of_books
FROM
    book_sales
GROUP BY
    price_category
ORDER BY
    number_of_books DESC;
