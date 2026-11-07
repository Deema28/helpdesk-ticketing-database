CREATE TABLE Department (
    Department_id NUMBER(4) NOT NULL,
    Name          VARCHAR2(50) NOT NULL,
    Description   VARCHAR2(300),
    
    CONSTRAINT Dept_PK PRIMARY KEY (Department_id),
    CONSTRAINT Dept_Name_UQ UNIQUE (Name),
    CONSTRAINT Chk_Dept_ID CHECK (Department_id > 0)
);

CREATE TABLE Support_Agent (
    Agent_id      NUMBER(10) NOT NULL,
    Fname         VARCHAR2(50) NOT NULL,
    Lname         VARCHAR2(50) NOT NULL,
    Phone         VARCHAR2(10),
    Email         VARCHAR2(100) ,
    Role          VARCHAR2(50),
    Department_id NUMBER(4) NOT NULL,
    
    CONSTRAINT Agent_PK PRIMARY KEY (Agent_id),
    CONSTRAINT Agent_Email_UQ UNIQUE (Email),
    
  
    CONSTRAINT Agent_Dept_FK FOREIGN KEY (Department_id) REFERENCES Department(Department_id),

    CONSTRAINT Chk_Agent_Contact CHECK (Phone IS NOT NULL OR Email IS NOT NULL),    
    CONSTRAINT Chk_Agent_Email CHECK (Email IS NULL OR Email LIKE '%@%.%'),
    CONSTRAINT Chk_Agent_Phone CHECK (Phone IS NULL OR Phone LIKE '05%')
);

CREATE TABLE Agent_Skill (
    Agent_id      NUMBER(10) NOT NULL,
    Skill         VARCHAR2(50) NOT NULL,
    
    CONSTRAINT Skill_PK PRIMARY KEY (Agent_id, Skill),
    
    CONSTRAINT Skill_Agent_FK FOREIGN KEY (Agent_id) 
        REFERENCES Support_Agent(Agent_id) ON DELETE CASCADE
);

CREATE TABLE Customer (
    Customer_id    NUMBER(10) NOT NULL,
    FName         VARCHAR2(50) NOT NULL,
    LName         VARCHAR2(50) NOT NULL,
    Phone         VARCHAR2(10),
    Email         VARCHAR2(100),
    Organization  VARCHAR2(100) ,

    CONSTRAINT Customer_PK PRIMARY KEY (Customer_id),
    CONSTRAINT Customer_Email_UQ UNIQUE (Email),
    CONSTRAINT Chk_Customer_Contact CHECK (Phone IS NOT NULL OR Email IS NOT NULL),    
    CONSTRAINT Chk_Customer_Email CHECK (Email IS NULL OR Email LIKE '%@%.%'),
    CONSTRAINT Chk_Customer_Phone CHECK (Phone IS NULL OR Phone LIKE '05%')
);

CREATE TABLE Ticket (
     Ticket_id       NUMBER(10) NOT NULL,
    Title          VARCHAR2(100) NOT NULL,
    Description    CLOB,
    Priority       VARCHAR2(10) DEFAULT 'Low' ,
    Status         VARCHAR2(20)   DEFAULT 'Open',
    CreationDate   DATE   DEFAULT SYSDATE,
    ResolutionDate DATE,
    Customer_id     NUMBER(10) NOT NULL,
    Department_id   NUMBER(4) NOT NULL,
    Agent_id        NUMBER(10) NOT NULL,

        CONSTRAINT Ticket_PK PRIMARY KEY (Ticket_id),
    CONSTRAINT Ticket_Customer_FK FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
    CONSTRAINT Ticket_Agent_FK FOREIGN KEY (Agent_id) REFERENCES Support_Agent(Agent_id),
    CONSTRAINT Ticket_Dept_FK FOREIGN KEY (Department_id) REFERENCES Department(Department_id), 

CONSTRAINT Chk_Priority CHECK (Priority IN ('Low', 'Medium', 'High')), CONSTRAINT Chk_Status CHECK (Status IN ('Open', 'In Progress', 'Closed')),
CONSTRAINT Chk_Dates CHECK (ResolutionDate IS NULL OR ResolutionDate >= CreationDate)

 );

CREATE TABLE ChatMessage (
    chat_id   NUMBER(10)        NOT NULL,
    Content    VARCHAR2(500)   NOT NULL,
    Timestamp   DATE        DEFAULT SYSDATE    NOT NULL,
    Ticket_id  NUMBER(10)        NOT NULL,
     Agent_id   NUMBER(10), 
     Customer_id  NUMBER(10),

    CONSTRAINT pk_chatmessage PRIMARY KEY (chat_id),
    CONSTRAINT fk_chat_ticket FOREIGN KEY (Ticket_id)
        REFERENCES Ticket(Ticket_id),
     CONSTRAINT Chat_Agent_FK FOREIGN KEY (Agent_id)
        REFERENCES Support_Agent(Agent_id) ON DELETE SET NULL,
    CONSTRAINT Chat_Cust_FK FOREIGN KEY (Customer_id)
        REFERENCES Customer(Customer_id) ON DELETE SET NULL,
 
   CONSTRAINT Chk_Chat_Sender CHECK (
        (Agent_id IS NOT NULL AND Customer_id IS NULL)
        OR
        (Agent_id IS NULL AND Customer_id IS NOT NULL)
       )
);

 
CREATE TABLE Attachment (
   Ticket_id     NUMBER(10)        NOT NULL,
    Attachment_id  NUMBER(10)        NOT NULL,
    file_name     VARCHAR2(200)  NOT NULL,
    file_type     VARCHAR2(50)   NOT NULL,
    uploaded_at    DATE    DEFAULT SYSDATE     NOT NULL,
   
    CONSTRAINT pk_attachment PRIMARY KEY (Attachment_id,Ticket_id),
    CONSTRAINT fk_attachment_ticket FOREIGN KEY (Ticket_id)
        REFERENCES Ticket(Ticket_id) ON DELETE CASCADE
);

CREATE TABLE Knowledge_Base (
    Article_id     NUMBER(10) NOT NULL,
    Department_id  NUMBER(4) NOT NULL,
    Title          VARCHAR2(200) NOT NULL,
    Content        VARCHAR2(1000) NOT NULL,
    Created_Date   DATE   DEFAULT SYSDATE  NOT NULL,

    CONSTRAINT KnowledgeBase_PK PRIMARY KEY (Article_id),
    CONSTRAINT KnowledgeBase_Department_FK  FOREIGN KEY (Department_id)
     REFERENCES Department(Department_id) 
);


