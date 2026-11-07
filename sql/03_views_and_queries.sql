SELECT * FROM Department;
SELECT * FROM Support_Agent;
SELECT * FROM  Agent_Skill;
SELECT * FROM customer;
SELECT * FROM ticket;
SELECT * FROM chatmessage;
SELECT * FROM attachment;
SELECT * FROM knowledge_base;

--VIEWS:
CREATE VIEW View_Attachments_By_Ticket AS
SELECT
    Attachment_ID,
    file_name,
    file_type,
    uploaded_at,
    Ticket_ID
FROM Attachment;


CREATE VIEW Open_Tickets_View AS
SELECT
    T.Ticket_id,
    T.Title,
    T.Priority,
    T.Status,
    C.FName || ' ' || C.LName AS Customer_Name,
    D.Name AS Department_Name
FROM Ticket T
JOIN Customer C ON T.Customer_id = C.Customer_id
JOIN Department D ON T.Department_id = D.Department_id
WHERE T.Status = 'Open';


 CREATE VIEW Ticket_Activity_View AS
SELECT
  T.Ticket_id,
  T.Title,
  (SELECT COUNT(*) FROM ChatMessage CM WHERE CM.Ticket_id = T.Ticket_id) AS Message_Count,
  (SELECT COUNT(*) FROM Attachment A WHERE A.Ticket_id = T.Ticket_id) AS Attachment_Count
FROM Ticket T;


 CREATE VIEW Ticket_Summary_View AS
SELECT
  T.Ticket_id,
  T.Title,
  T.Priority,
  T.Status,
  T.CreationDate,
  C.FName || ' ' || C.LName AS Customer_Name,
  D.Name AS Department_Name,
  S.Fname || ' ' || S.Lname AS Agent_Name
FROM Ticket T
JOIN Customer C ON T.Customer_id = C.Customer_id
JOIN Department D ON T.Department_id = D.Department_id
LEFT JOIN Support_Agent S ON T.Agent_id = S.Agent_id;


CREATE VIEW Knowledge_By_Department_View AS
SELECT
    k.Article_id,
    k.Title,
    d.Name AS Department_Name,
    k.Created_Date
FROM Knowledge_Base k
JOIN Department d ON k.Department_id = d.Department_id; 




SELECT * FROM Open_Tickets_View;
SELECT * FROM Ticket_Summary_View;
SELECT * FROM Ticket_Activity_View;
SELECT * FROM View_Attachments_By_Ticket;
SELECT * FROM Knowledge_By_Department_View;

--Queries :
-- Count tickets created by each customer
SELECT C.FName || ' ' || C.LName AS Customer,
       COUNT(*) AS Total_Tickets
FROM Ticket T
JOIN Customer C ON T.Customer_id = C.Customer_id
GROUP BY C.FName, C.LName;

-- Attachments for  Ticket 102
SELECT * 
FROM Attachment 
WHERE Ticket_ID = 102;

-- Messages count per ticket
SELECT Ticket_ID, COUNT(*) AS Message_Count 
FROM ChatMessage 
GROUP BY Ticket_ID;

-- Attachments count per ticket
SELECT Ticket_ID, COUNT(*) AS Attachment_Count 
FROM Attachment 
GROUP BY Ticket_ID;

--Latest messages (descending)
SELECT * 
FROM ChatMessage 
ORDER BY Timestamp DESC;

--Tickets that are Closed + show resolution date
SELECT Ticket_id, Title, Status, CreationDate, ResolutionDate
FROM Ticket
WHERE Status = 'Closed'
ORDER BY ResolutionDate DESC;

-- Tickets count by Priority
SELECT Priority, COUNT(*) AS Total_Tickets 
FROM Ticket
 GROUP BY Priority;

-- Tickets count by Department
 SELECT D.Name AS Department, COUNT(*) AS Total_Tickets
 FROM Ticket T 
JOIN Department D ON T.Department_id = D.Department_id 
GROUP BY D.Name;


-- ++

--Group attachments by file type
SELECT file_type, COUNT(*) AS Total_Files
FROM Attachment
GROUP BY file_type;

-- Open tickets only
 SELECT Ticket_id, Title, Priority, Status, CreationDate
 FROM Ticket 
WHERE Status =  'Open';

