# Social Network Database Project

This project models a social network with functionalities such as messaging, posting, commenting, viewing ads, and e-commerce transactions. The database was designed using an Entity-Relationship model and converted into a relational schema. SQL scripts were written to create and populate the database, along with sample queries for testing.

---

## 1. Problem Statement and ER Model

The purpose of this database is to support a social network system with the following core features:

- Users can send and receive messages.
- Users can create posts and comment on posts.
- Users can view ads, which are logged with timestamps.
- Users can make e-commerce transactions.

### ER Diagram
![ER Diagram](./ER%20Diagram.png)

---

## 2. Relational Schema and Creation Scripts

The relational model was derived from the ER diagram and includes the following main tables: `Users`, `Message`, `Post`, `Comment`, `Views`, `ADS`, and `Ecommerce_Transaction`.

### Relational Model Screenshot
![Relational Schema](./Relational%20Schema.png)

### Database Creation Scripts
- [Creation Script - `query.sql`](./query.sql)

---

## 3. Data Population and Sample Queries

The database is populated with sample data that reflects real interactions between users and system features.

### Populate Script
- [Populate Script - `populate.sql`](./populate.sql)

### Sample Queries
Here are some sample queries used for testing and interacting with the data:

```sql
-- Sample Query 1: Retrieve all users who have made posts
SELECT DISTINCT u.user_ID, u.name
FROM Users u
JOIN Post p ON u.user_ID = p.user_ID;

-- Sample Query 2: Find messages exchanged between two users
SELECT * 
FROM Message 
WHERE (sender_ID = 1 AND receiver_ID = 2)
   OR (sender_ID = 2 AND receiver_ID = 1);

-- Sample Query 3: List all ads viewed by a specific user
SELECT a.ad_ID, v.view_date
FROM Views v
JOIN ADS a ON v.ad_ID = a.ad_ID
WHERE v.user_ID = 1;

-- Sample Query 4: Count comments made on each post
SELECT post_ID, COUNT(comment_ID) AS comment_count
FROM Comment
GROUP BY post_ID;
