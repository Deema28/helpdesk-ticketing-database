-- Department INSERT :
INSERT INTO Department VALUES (1001, 'IT Support', 'Hardware and Software technical issues');
INSERT INTO Department VALUES (1002, 'HR', 'Human Resources and Payroll');
INSERT INTO Department VALUES (1003, 'Finance', 'Billing, Invoices, and Payments');
INSERT INTO Department VALUES (1004, 'Facilities', 'Building maintenance and furniture');
INSERT INTO Department VALUES (1005, 'Security', 'Access badges and safety concerns');
INSERT INTO Department VALUES (1006, 'Legal', 'Contract reviews and legal advice');

-- Support_Agent INSERT:
INSERT INTO Support_Agent VALUES (2000000001, 'Faisal', 'Saud', '0591111111', 'faisal@helpdesk.com', 'Senior Technician', 1001);
INSERT INTO Support_Agent VALUES (2000000002, 'Layla', 'Ayman', '0592222222', 'layla@helpdesk.com', 'HR Officer', 1002);
INSERT INTO Support_Agent VALUES (2000000003, 'Saad', 'Jaber', '0593333333', 'saad@helpdesk.com', 'Accountant', 1003);
INSERT INTO Support_Agent VALUES (2000000004, 'Huda', 'Saleh', '0594444444', 'huda@helpdesk.com', 'Facility Manager', 1004);
INSERT INTO Support_Agent VALUES (2000000005, 'Yousef', 'Rami', '0595555555', 'yousef@helpdesk.com', 'Security Officer', 1005);
INSERT INTO Support_Agent VALUES (2000000006, 'Maha', 'Nasser', '0596666666', 'maha@helpdesk.com', 'Legal Advisor', 1006);

-- Agent_Skill INSERT:
INSERT INTO Agent_Skill VALUES (2000000001, 'Networking');
INSERT INTO Agent_Skill VALUES (2000000001, 'Hardware Repair');
INSERT INTO Agent_Skill VALUES (2000000002, 'Recruitment System');
INSERT INTO Agent_Skill VALUES (2000000003, 'Excel Advanced');
INSERT INTO Agent_Skill VALUES (2000000005, 'CCTV Systems');
INSERT INTO Agent_Skill VALUES (2000000006, 'Labor Law');

--Customer INSERT:
INSERT INTO Customer VALUES (1, 'Ahmed', 'Alghamdi', '0501111111', 'ahmed@example.com', 'Tech Corp');
INSERT INTO Customer VALUES (2, 'Fatimah', 'Alotaibi', '0502222222', 'fatimah@example.com', 'Home Services');
INSERT INTO Customer VALUES (3, 'Hassan', 'Alshammari', '0503333333', 'hassan@example.com', 'Finance Group');
INSERT INTO Customer VALUES (4, 'Nawal', 'Alshehri', '0504444444', 'nawal@example.com', 'Marketing Co');
INSERT INTO Customer VALUES (5, 'Mohammed', 'Alzahrani', '0505555555', 'mohammed@example.com', 'Sales Ltd');
INSERT INTO Customer  VALUES (6, 'Sara', 'Almutairi', '0506666666', 'sara@example.com', 'Support Inc');

--Ticket INSERT:
INSERT INTO Ticket VALUES (101, 'Cannot login','User cannot login to the system.','High','Open', TO_DATE('2025-12-14','YYYY-MM-DD'), NULL, 1, 1001, 2000000001);
INSERT INTO Ticket VALUES (102, 'Email issue','Emails are not being sent.','Medium','In Progress',TO_DATE('2025-12-13','YYYY-MM-DD'),NULL, 2, 1002, 2000000002);
INSERT INTO Ticket VALUES (103, 'System crash','Application crashes at startup.','High','Open',TO_DATE('2025-12-12','YYYY-MM-DD'),NULL,3, 1003, 2000000003);
INSERT INTO Ticket VALUES (104, 'Slow network','Internet connection is slow.','Low', 'Closed', TO_DATE('2025-12-10','YYYY-MM-DD'),TO_DATE('2025-12-11','YYYY-MM-DD'),4, 1004, 2000000004);
INSERT INTO Ticket VALUES (105, 'Password reset','User requested password reset.','Medium','Closed',TO_DATE('2025-12-09','YYYY-MM-DD'),TO_DATE('2025-12-09','YYYY-MM-DD'),5, 1005, 2000000005);
INSERT INTO Ticket VALUES (106, 'VPN access','VPN access required for remote work.','High','In Progress',TO_DATE('2025-12-08','YYYY-MM-DD'),NULL,6, 1006, 2000000006);

--ChatMessage INSERT: 
INSERT INTO ChatMessage VALUES (1, 'Message content 1', SYSDATE, 102, NULL, 2);
INSERT INTO ChatMessage VALUES (2, 'Message content 2', SYSDATE, 102, 2000000002, NULL);
INSERT INTO ChatMessage VALUES (3, 'Message content 3', SYSDATE, 103,  NULL, 3);
INSERT INTO ChatMessage VALUES (4, 'Message content 4', SYSDATE, 103, 2000000003, NULL);
INSERT INTO ChatMessage VALUES (5, 'Message content 5', SYSDATE, 105, NULL, 5);
INSERT INTO ChatMessage VALUES (6, 'Message content 6', SYSDATE, 105, 2000000005, NULL);

--Attachment INSERT :
INSERT INTO Attachment VALUES (101,1, 'screenshot_error.png', 'PNG', SYSDATE);
INSERT INTO Attachment VALUES (102,2, 'system_log.txt', 'TXT', SYSDATE);
INSERT INTO Attachment VALUES (103,3, 'invoice.pdf', 'PDF', SYSDATE);
INSERT INTO Attachment VALUES (104,4,'profile_pic.jpg', 'JPG', SYSDATE);
INSERT INTO Attachment VALUES (105,5, 'chat_history.docx', 'DOCX', SYSDATE);
INSERT INTO Attachment VALUES (106,6, 'evidence_video.mp4', 'MP4', SYSDATE);
 
--KnowledgeBase INSERT:
INSERT INTO Knowledge_Base VALUES (1, 1001, 'Password Reset', 'Steps to reset user password through the helpdesk system.', SYSDATE);
INSERT INTO Knowledge_Base VALUES (2, 1002, 'Login Issues', 'Common reasons for login failure and how to resolve them.', SYSDATE);
INSERT INTO Knowledge_Base VALUES (3, 1003, 'Email Setup', 'How to configure company email on desktop and mobile devices.', SYSDATE);
INSERT INTO Knowledge_Base VALUES (4, 1004, 'Network Troubleshooting', 'Basic steps to identify and fix network connectivity problems.', SYSDATE);
INSERT INTO Knowledge_Base VALUES (5, 1005, 'Hardware Request', 'Procedure for requesting new hardware or equipment.', SYSDATE);
INSERT INTO Knowledge_Base VALUES (6, 1006, 'VPN Configuration', 'Guide to install and configure VPN for remote access.', SYSDATE);
