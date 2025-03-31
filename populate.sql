DROP TABLE IF EXISTS Comments;
DROP TABLE IF EXISTS Posts;
DROP TABLE IF EXISTS Messages;
DROP TABLE IF EXISTS EcommerceTransaction;
DROP TABLE IF EXISTS ViewDate;
DROP TABLE IF EXISTS Ads;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users
(
    UserID    INT IDENTITY(1,1) NOT NULL,
    Username  VARCHAR(50) NOT NULL,
    Email     VARCHAR(100) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT PK_Users PRIMARY KEY (UserID)
);

CREATE TABLE Ads
(
    AdID          INT IDENTITY(1,1) NOT NULL,
    AdTitle       VARCHAR(100) NOT NULL,
    AdDescription VARCHAR(500),
    CreatedAt     DATETIME DEFAULT GETDATE(),
    CONSTRAINT PK_Ads PRIMARY KEY (AdID)
);

CREATE TABLE ViewDate
(
    ViewDateID INT IDENTITY(1,1) NOT NULL,
    UserID     INT NOT NULL,
    AdID       INT NOT NULL,
    ViewedOn   DATETIME NOT NULL,
    CONSTRAINT PK_ViewDate PRIMARY KEY (ViewDateID),
    CONSTRAINT FK_ViewDate_Users FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT FK_ViewDate_Ads FOREIGN KEY (AdID) REFERENCES Ads(AdID)
);

CREATE TABLE EcommerceTransaction
(
    TransactionID   INT IDENTITY(1,1) NOT NULL,
    UserID          INT NOT NULL,
    TransactionDate DATETIME DEFAULT GETDATE() NOT NULL,
    Amount          DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_EcommerceTransaction PRIMARY KEY (TransactionID),
    CONSTRAINT FK_EcommerceTransaction_Users FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Messages
(
    MessageID  INT IDENTITY(1,1) NOT NULL,
    SenderID   INT NOT NULL,
    ReceiverID INT NOT NULL,
    Content    VARCHAR(1000),
    SentOn     DATETIME DEFAULT GETDATE() NOT NULL,
    CONSTRAINT PK_Messages PRIMARY KEY (MessageID),
    CONSTRAINT FK_Messages_Sender FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    CONSTRAINT FK_Messages_Receiver FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);

CREATE TABLE Posts
(
    PostID   INT IDENTITY(1,1) NOT NULL,
    UserID   INT NOT NULL,
    Title    VARCHAR(200) NOT NULL,
    Content  VARCHAR(MAX),
    PostedOn DATETIME DEFAULT GETDATE() NOT NULL,
    CONSTRAINT PK_Posts PRIMARY KEY (PostID),
    CONSTRAINT FK_Posts_Users FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Comments
(
    CommentID   INT IDENTITY(1,1) NOT NULL,
    PostID      INT NOT NULL,
    UserID      INT NOT NULL,
    Content     VARCHAR(1000),
    CommentedOn DATETIME DEFAULT GETDATE() NOT NULL,
    CONSTRAINT PK_Comments PRIMARY KEY (CommentID),
    CONSTRAINT FK_Comments_Posts FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    CONSTRAINT FK_Comments_Users FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

USE x2022fkr;
GO

INSERT INTO Users (Username, Email)
VALUES 
    ('ty', 'ty@example.com'),
    ('evan', 'evan@example.com'),
    ('david', 'david@example.com');

INSERT INTO Ads (AdTitle, AdDescription)
VALUES
    ('Spring Sale', 'Save 20% on selected items'),
    ('Summer Clearance', 'Up to 50% off'),
    ('Holiday Special', 'Buy 2 get 1 free');

INSERT INTO ViewDate (UserID, AdID, ViewedOn)
VALUES
    (1, 1, '2025-03-27 10:00'),
    (2, 1, '2025-03-27 10:05'),
    (2, 2, '2025-03-27 11:15'),
    (3, 3, '2025-03-27 12:30');

INSERT INTO EcommerceTransaction (UserID, TransactionDate, Amount)
VALUES
    (1, '2025-03-26', 59.99),
    (2, '2025-03-26', 120.00),
    (1, '2025-03-27', 19.95);

INSERT INTO Messages (SenderID, ReceiverID, Content, SentOn)
VALUES
    (1, 2, 'Hey Evan, how are you?', '2025-03-26 09:15'),
    (2, 1, 'Doing well, Ty! Thanks!', '2025-03-26 09:20'),
    (3, 1, 'Hi Ty, can you help me with something?', '2025-03-26 10:00');

INSERT INTO Posts (UserID, Title, Content, PostedOn)
VALUES
    (1, 'Hello World', 'This is my first post!', '2025-03-25 08:30'),
    (2, 'A day in the life', 'Today I did something interesting...', '2025-03-26 11:00');

INSERT INTO Comments (PostID, UserID, Content, CommentedOn)
VALUES
    (1, 2, 'Nice post, Ty!', '2025-03-25 09:00'),
    (1, 3, 'I agree with Evan, great post.', '2025-03-25 09:05'),
    (2, 1, 'Interesting read, Evan.', '2025-03-26 11:15');
GO

