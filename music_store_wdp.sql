--level easy

--Q1.who is the senior most employes based on job title??

select * from  employee

select first_name,last_name,title from employee
order by levels desc
limit 1 

where title ='senior general manager'
where levels='L7'

--Q2. which countries  have the most invoices? 
select * from invoice
--select define krna read krna
select count(*) as country_count, billing_country from invoice
group by billing_country
order by country_count desc
limit 3

--Q:3 what are top 3 values of total invoice?
select * from invoice
select total from invoice 
order by total desc
limit 3
--Q;3 which city has the best customer? we would like to throw a promotional music festival 
--in the city we made the most money.
--write a query that returns one city that has the highest sum of invoice totals .
--returns both the city name and sum of all invoice totals..


select billing_city , round(sum(total)) as total_invoice from invoice
group by billing_city  
order by total_invoice desc
limit 1


-- Q5: who is the best customer? the customer who has spent 
-- the most money will be declared the best customer,
-- write a query that returns the person who spent the most money.!

select customer.customer_id,first_name,last_name,round(sum(total)) as total_spending from customer
join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id
order by total_spending desc
limit 1


-- level Moderate!(intermediate level)

-- Q1.write query to return emai, first name, last name and genre of all rock music listener
-- Return your list ordered alphabetically by email starting by A

select Distinct email as Email,first_name as FirstName, last_name as LastName,
genre.name as genre from customer
join invoice on invoice.customer_id =customer.customer_id
join invoice_line on invoice_line.invoice_id = invoice_line.invoice_id
join track on track.track_id = invoice_line.track_id
join genre on genre.genre_id  = track.genre_id
where genre.name like 'Rock'
order by email



-- Q2. Let's invite the artists who have written the most rock music in our dataset.
-- write a query that returns the artist name and total track count on the top 10 rock bands.

select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs from track
join album on album.album_id  = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10

