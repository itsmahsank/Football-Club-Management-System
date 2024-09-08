create schema football_club;

use football_club;
CREATE TABLE Club (
    Name VARCHAR(255) not null primary key,
    Location VARCHAR(255),
    Logo VARCHAR(255),
    EstablishmentDate DATE,
    Owner VARCHAR(255),
    Chairman VARCHAR(255),
    BoardOfDirectors VARCHAR(255),
    staffid int
);
CREATE TABLE Administration (
    Staffid INT not null PRIMARY KEY,
    Departments VARCHAR(255) NOT NULL,
    Roles VARCHAR(255) NOT NULL,
    ContactInformation TEXT NOT NULL
);
CREATE TABLE Team (
    Name VARCHAR(255) NOT NULL PRIMARY KEY,
    Squad TEXT,
    Formation VARCHAR(255),
    Coach VARCHAR(255),
    Stadium VARCHAR(255),
    MatchSchedule TEXT,
    PerformanceStatistics TEXT,
    Club_Name VARCHAR(255)
);
CREATE TABLE Players (
    ShirtNumber INT not null PRIMARY KEY,
    Name VARCHAR(255),
    Age INT,
    Nationality VARCHAR(255),
    Position VARCHAR(255),
    Height DECIMAL(4, 2),
    Weight DECIMAL(5, 2),
    PreferredFoot VARCHAR(255),
    ContractDetails TEXT,
    CoachID INT,
    Club_Name VARCHAR(255)
);
CREATE TABLE Coaches (
    CoachID INT not null PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    Nationality VARCHAR(255) NOT NULL,
    CoachingExperience TEXT,
    PlayingCareer TEXT,
    CoachingStyle TEXT,
    TrainingMethods TEXT,
    ContractDetails TEXT,
	Club_Name VARCHAR(255)
);
CREATE TABLE MedicalStaff (
    med_staff_id INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    Qualification VARCHAR(255),
    Experience TEXT,
    Roles TEXT,
    InjuryRecoveryManagement TEXT
);
CREATE TABLE Matches (
    Date DATE NOT NULL,
    Location VARCHAR(255) NOT NULL,
    Opponent VARCHAR(255),
    Competition VARCHAR(255),
    MatchOfficials TEXT,
    Lineup TEXT,
    MatchStatistics TEXT,
    Team_Name VARCHAR(255),
	Club_Name VARCHAR(255),
    PRIMARY KEY (Date, Location)
);
CREATE TABLE Finance (
    Report_id INT PRIMARY KEY,
    Budget DECIMAL(12, 2),
    Revenue DECIMAL(12, 2),
    Expenses DECIMAL(12, 2),
    SponsorshipDeals DECIMAL(12, 2),
    TVRights DECIMAL(12, 2),
    TicketSales DECIMAL(12, 2),
    MerchandiseSales DECIMAL(12, 2),
    PlayerSalaries DECIMAL(12, 2),
    FinancialReports TEXT,
	Club_Name VARCHAR(255)
);
CREATE TABLE TransferMarket (
    transfer_id INT PRIMARY KEY,
    PlayerTransfers TEXT,
    LoanDeals TEXT,
    TransferRumors TEXT,
    ContractNegotiations TEXT,
    TransferFees DECIMAL(12, 2),
	Team_Name VARCHAR(255)
);
CREATE TABLE PlayerCoached (
    Shirt_Number INT NOT NULL,
    CoachID INT NOT NULL,
    CONSTRAINT PK_PlayerCoach PRIMARY KEY (Shirt_Number, CoachID),
    CONSTRAINT FK_PlayerCoach_Player FOREIGN KEY (Shirt_Number) REFERENCES Players (ShirtNumber)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_PlayerCoach_Coach FOREIGN KEY (CoachID) REFERENCES Coaches (CoachID) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE Club
ADD FOREIGN KEY (Staffid) REFERENCES Administration(Staffid)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Team
ADD FOREIGN KEY (Club_Name) REFERENCES Club(Name);

ALTER TABLE Players
ADD FOREIGN KEY (CoachID) REFERENCES Coaches(CoachID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Players
ADD FOREIGN KEY (Club_Name) REFERENCES Club(Name)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Coaches
ADD FOREIGN KEY (Club_Name) REFERENCES Club(Name)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Matches
ADD FOREIGN KEY (Team_Name) REFERENCES Team(Name)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Matches
ADD FOREIGN KEY (Club_Name) REFERENCES Club(Name)
ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE TransferMarket
ADD FOREIGN KEY (Team_Name) REFERENCES Team(Name)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Finance
ADD FOREIGN KEY (Club_Name) REFERENCES Club(Name)
ON DELETE CASCADE ON UPDATE CASCADE;


INSERT INTO Club (Name, Location, Logo, EstablishmentDate, Owner, Chairman, BoardOfDirectors)
VALUES
    ('Real Madrid', 'Madrid, Spain', 'real_madrid_logo.png', '1902-03-06', 'Florentino Perez', 'Florentino Perez', 'Real Madrid Board of Directors'),
    ('Barcelona', 'Barcelona, Spain', 'barcelona_logo.png', '1899-11-29', 'Club members', 'Joan Laporta', 'Barcelona Board of Directors'),
    ('Manchester United', 'Manchester, England', 'manutd_logo.png', '1878-04-01', 'Joel Glazer', 'Joel Glazer', 'Manchester United Board of Directors'),
    ('Bayern Munich', 'Munich, Germany', 'bayern_munich_logo.png', '1900-02-27', 'Club members', 'Herbert Hainer', 'Bayern Munich Board of Directors'),
    ('Juventus', 'Turin, Italy', 'juventus_logo.png', '1897-11-01', 'Agnelli family', 'Andrea Agnelli', 'Juventus Board of Directors');
INSERT INTO Administration (Staffid, Departments, Roles, ContactInformation)
VALUES
    (1, 'Management', 'CEO', 'ceo@club.com'),
    (2, 'Finance', 'CFO', 'cfo@club.com'),
    (3, 'Marketing', 'CMO', 'cmo@club.com'),
    (4, 'Technical', 'Head Coach', 'headcoach@club.com'),
    (5, 'Medical', 'Team Doctor', 'teamdoctor@club.com');
INSERT INTO Team (Name, Squad, Formation, Coach, Stadium, MatchSchedule, PerformanceStatistics)
VALUES
    ('Real Madrid', 'Keylor Navas, Dani Carvajal, Raphael Varane, Sergio Ramos, Marcelo, Toni Kroos, Luka Modric, Casemiro, Gareth Bale, Karim Benzema, Eden Hazard', '4-3-3', 'Carlo Ancelotti', 'Santiago Bernabeu', 'Upcoming matches: Match 1 - vs. Barcelona, Match 2 - vs. Atletico Madrid, Match 3 - vs. Sevilla', 'Season performance: Played 10, Won 8, Drawn 1, Lost 1'),
    ('Barcelona', 'Marc-Andre ter Stegen, Sergi Roberto, Gerard Pique, Clement Lenglet, Jordi Alba, Sergio Busquets, Frenkie de Jong, Pedri, Lionel Messi, Antoine Griezmann, Memphis Depay', '4-2-3-1', 'Ronald Koeman', 'Camp Nou', 'Upcoming matches: Match 1 - vs. Real Madrid, Match 2 - vs. Atletico Madrid, Match 3 - vs. Sevilla', 'Season performance: Played 9, Won 6, Drawn 2, Lost 1'),
    ('Bayern Munich', 'Manuel Neuer, Joshua Kimmich, Niklas Sule, David Alaba, Alphonso Davies, Leon Goretzka, Thomas Muller, Serge Gnabry, Kingsley Coman, Leroy Sane, Robert Lewandowski', '4-2-3-1', 'Julian Nagelsmann', 'Allianz Arena', 'Upcoming matches: Match 1 - vs. Borussia Dortmund, Match 2 - vs. RB Leipzig, Match 3 - vs. Wolfsburg', 'Season performance: Played 8, Won 7, Drawn 0, Lost 1'),
    ('Liverpool', 'Alisson Becker, Trent Alexander-Arnold, Virgil van Dijk, Joe Gomez, Andrew Robertson, Fabinho, Jordan Henderson, Thiago Alcantara, Mohamed Salah, Sadio Mane, Roberto Firmino', '4-3-3', 'Jurgen Klopp', 'Anfield', 'Upcoming matches: Match 1 - vs. Manchester City, Match 2 - vs. Chelsea, Match 3 - vs. Arsenal', 'Season performance: Played 9, Won 5, Drawn 3, Lost 1'),
    ('Juventus', 'Wojciech Szczesny, Juan Cuadrado, Matthijs de Ligt, Leonardo Bonucci, Alex Sandro, Arthur, Rodrigo Bentancur, Weston McKennie, Federico Chiesa, Paulo Dybala, Alvaro Morata', '4-4-2', 'Massimiliano Allegri', 'Allianz Stadium', 'Upcoming matches: Match 1 - vs. Inter Milan, Match 2 - vs. AC Milan, Match 3 - vs. Napoli', 'Season performance: Played 8, Won 6, Drawn 1, Lost 1');
INSERT INTO Players (ShirtNumber, Name, Age, Nationality, Position, Height, Weight, PreferredFoot, ContractDetails)
VALUES
    (7, 'Cristiano Ronaldo', 38, 'Portuguese', 'Forward', 1.87, 83.0, 'Right', 'Contract details for Cristiano Ronaldo'),
    (10, 'Lionel Messi', 35, 'Argentinian', 'Forward', 1.70, 72.0, 'Left', 'Contract details for Lionel Messi'),
    (9, 'Robert Lewandowski', 34, 'Polish', 'Forward', 1.84, 80.0, 'Right', 'Contract details for Robert Lewandowski'),
    (4, 'Virgil van Dijk', 32, 'Dutch', 'Defender', 1.93, 92.0, 'Right', 'Contract details for Virgil van Dijk'),
    (11, 'Neymar Jr.', 31, 'Brazilian', 'Forward', 1.75, 68.0, 'Right', 'Contract details for Neymar Jr.');
INSERT INTO Coaches (CoachID, Name, Age, Nationality, CoachingExperience, PlayingCareer, CoachingStyle, TrainingMethods, ContractDetails)
VALUES
    (1, 'Jose Mourinho', 58, 'Portuguese', 'Coached various top clubs including Real Madrid, Chelsea, and Inter Milan.', 'Former professional footballer.', 'Tactical and disciplined approach.', 'Emphasizes defensive organization and set-piece strategies.', 'Contract details for Jose Mourinho.'),
    (2, 'Pep Guardiola', 50, 'Spanish', 'Coached Barcelona and Manchester City with great success.', 'Former professional footballer for Barcelona.', 'Possession-based and attacking style.', 'Focuses on positional play and quick passing.', 'Contract details for Pep Guardiola.'),
    (3, 'Jurgen Klopp', 54, 'German', 'Coached Borussia Dortmund and Liverpool, winning multiple titles.', 'Former professional footballer in Germany.', 'High-intensity and pressing style.', 'Emphasizes teamwork and gegenpressing.', 'Contract details for Jurgen Klopp.'),
    (4, 'Carlo Ancelotti', 62, 'Italian', 'Coached top clubs including AC Milan, Real Madrid, and Chelsea.', 'Former professional footballer in Italy.', 'Balanced and adaptable style.', 'Focuses on player relationships and tactical flexibility.', 'Contract details for Carlo Ancelotti.'),
    (5, 'Zinedine Zidane', 49, 'French', 'Coached Real Madrid, leading the team to multiple Champions League titles.', 'Former professional footballer for France and Real Madrid.', 'Attacking and fluid style.', 'Encourages creative and expressive play.', 'Contract details for Zinedine Zidane.');
INSERT INTO MedicalStaff (med_staff_id, Name, Age, Qualification, Experience, Roles, InjuryRecoveryManagement)
VALUES
    (1, 'John Smith', 35, 'Doctor of Medicine', '10 years of experience in sports medicine.', 'Medical doctor', 'Specializes in injury diagnosis and recovery management.'),
    (2, 'Emily Johnson', 28, 'Physical Therapist', '5 years of experience in sports rehabilitation.', 'Physical therapist', 'Provides treatment and rehabilitation programs for injured athletes.'),
    (3, 'Michael Davis', 42, 'Sports Massage Therapist', '15 years of experience in sports massage therapy.', 'Massage therapist', 'Focuses on muscle recovery and relaxation techniques.'),
    (4, 'Sarah Wilson', 31, 'Athletic Trainer', '8 years of experience in sports injury prevention and treatment.', 'Athletic trainer', 'Provides on-field injury assessment and immediate care.'),
    (5, 'David Roberts', 39, 'Sports Nutritionist', '12 years of experience in sports nutrition and dietary planning.', 'Nutritionist', 'Designs specialized nutrition plans for athletes for optimal performance.');
INSERT INTO Matches (Date, Location, Opponent, Competition, MatchOfficials, Lineup, MatchStatistics)
VALUES
    ('2023-06-01', 'Santiago Bernabeu', 'Barcelona', 'La Liga', 'John Smith, Emily Johnson', 'Lineup details for Real Madrid', 'Match statistics for Real Madrid vs Barcelona'),
    ('2023-06-08', 'Estadio Azteca', 'Club America', 'Friendly', 'Michael Davis, Sarah Wilson', 'Lineup details for Real Madrid', 'Match statistics for Real Madrid vs Club America'),
    ('2023-06-15', 'Wembley Stadium', 'Manchester United', 'Champions League', 'David Roberts, Emily Johnson', 'Lineup details for Real Madrid', 'Match statistics for Real Madrid vs Manchester United'),
    ('2023-06-22', 'Allianz Arena', 'Bayern Munich', 'International Champions Cup', 'John Smith, Michael Davis', 'Lineup details for Real Madrid', 'Match statistics for Real Madrid vs Bayern Munich'),
    ('2023-06-30', 'San Siro', 'AC Milan', 'UEFA Super Cup', 'Sarah Wilson, David Roberts', 'Lineup details for Real Madrid', 'Match statistics for Real Madrid vs AC Milan');
INSERT INTO Finance (Report_id, Budget, Revenue, Expenses, SponsorshipDeals, TVRights, TicketSales, MerchandiseSales, PlayerSalaries, FinancialReports)
VALUES
    (1, 10000000.00, 15000000.00, 8000000.00, 5000000.00, 2000000.00, 3000000.00, 4000000.00, 6000000.00, 'Financial report for the first quarter of 2023.'),
    (2, 12000000.00, 18000000.00, 9000000.00, 6000000.00, 2500000.00, 3500000.00, 4500000.00, 7000000.00, 'Financial report for the second quarter of 2023.'),
    (3, 11000000.00, 16000000.00, 8500000.00, 5500000.00, 2300000.00, 3200000.00, 4200000.00, 6500000.00, 'Financial report for the third quarter of 2023.'),
    (4, 13000000.00, 20000000.00, 9500000.00, 7000000.00, 2700000.00, 3700000.00, 4700000.00, 7500000.00, 'Financial report for the fourth quarter of 2023.'),
    (5, 14000000.00, 22000000.00, 10000000.00, 7500000.00, 3000000.00, 4000000.00, 5000000.00, 8000000.00, 'Financial report for the full year of 2023.');
INSERT INTO TransferMarket (transfer_id, PlayerTransfers, LoanDeals, TransferRumors, ContractNegotiations, TransferFees)
VALUES
    (1, 'Cristiano Ronaldo to Al Nassr', NULL, NULL, NULL, 15000000.00),
    (2, 'Lionel Messi to Inter Miami', NULL, NULL, NULL, 10000000.00),
    (3, 'Karim Benzema to Al Ittihad', NULL, NULL, NULL, 8000000.00),
    (4, NULL, 'Martin Odegaard on loan to Arsenal', NULL, NULL, NULL),
    (5, NULL, 'Joao Felix on loan to Chelsea', NULL, NULL, NULL);

UPDATE Club
SET Location = 'London'
WHERE Name = 'Chelsea FC';

UPDATE Team
SET Coach = 'Jurgen Klopp'
WHERE Name = 'Liverpool FC';

UPDATE MedicalStaff
SET Qualification = 'Sports Physiotherapist'
WHERE med_staff_id = 1;

UPDATE Team
SET MatchSchedule = '2023-06-20: vs. Manchester United, 2023-06-25: vs. Arsenal'
WHERE Name = 'Real Madrid';

UPDATE Finance
SET Budget = 1000000.00
WHERE Report_id = 1;

UPDATE Coaches
SET CoachingStyle = 'Attacking'
WHERE CoachID = 2;

UPDATE MedicalStaff
SET InjuryRecoveryManagement = 'Specializes in rehabilitation after ACL injuries'
WHERE med_staff_id = 3;

UPDATE Finance
SET PlayerSalaries = 7500000.00
WHERE Report_id = 2;

UPDATE TransferMarket
SET TransferFees = 5000000.00
WHERE transfer_id = 1;

#Q1 Select command
SELECT * FROM Club;
SELECT * FROM Matches;
SELECT * FROM Team;

SELECT *
FROM Coaches
WHERE Club_Name = 'Liverpool';

SELECT MatchSchedule
FROM Team
WHERE Name = 'Barcelona';

#Q2 Cases
SELECT name, position,
    CASE
        WHEN position IN ('Forward', 'Striker', 'Winger') THEN 'Attacker'
        WHEN position IN ('Defender', 'Center-back', 'Full-back') THEN 'Defender'
        ELSE 'Other'
    END AS category
FROM Players;

SELECT name, age,
    CASE
        WHEN age < 25 THEN 'Young'
        WHEN age >= 25 THEN 'Old'
        ELSE 'Unknown'
    END AS age_category
FROM Players;

SELECT name, Location,
    CASE
        WHEN location IN ('Manchester, England') THEN 'United Kingdom'
        WHEN location IN ('Barcelona, Spain','Madrid, Spain','Turin, Italy','Munich, Germany') THEN 'Rest of Europe'
        ELSE 'Unknown'
    END AS loc_category
FROM Club;
SELECT name, age,
    CASE
        WHEN age >= 50 THEN 'Experienced'
        WHEN age < 50 AND age >= 30 THEN 'Intermediate'
        WHEN age < 30 THEN 'Beginner'
        ELSE 'Unknown'
    END AS experience_category
FROM Coaches;

SELECT Competition,Opponent,
    CASE
        WHEN Competition IN ('Friendly','International Champions Cup') then 'NOT IMPORTANT'
        ELSE 'IMPORTANT'
    END AS Importance
FROM Matches;

#Q3 Aggergate Functions
SELECT Min(age) AS youngest_age
FROM players;

SELECT COUNT(*) AS total_teams FROM Team;

SELECT AVG(Age) AS average_age FROM Players;

SELECT max(budget) AS max_budget FROM Finance;

SELECT SUM(TransferFees) AS total_fees
FROM TransferMarket;
#Q4 Joins
select *
from club as c
left join players as p
on c.name=p.club_name;

select *
from coaches as c
left join players as p
on c.coachid=p.coachid;

select *
from club as c
left join coaches as p
on c.name=p.club_name;

select *
from club as c
left join administration as a
on c.staffid=a.staffid;
#Q5 views

create view date_of_establishment as
select EstablishmentDate,c.name
from club as c
left join coaches as p
on c.name=p.club_name;

select * from date_of_establishment;

create view Club_data as
select c.name,c.Chairman
from club as c
left join players as p
on c.name=p.club_name;

select * from club_data;

create view coaches_data as
select c.name,c.coachid,c.age,c.nationality
from coaches as c
left join players as p
on c.coachid=p.coachid;

select * from date_of_establishment;

create view directors as
select c.name,c.BoardOfDirectors
from club as c
left join administration as a
on c.staffid=a.staffid;

select * from directors;
#Q6 Correlated Queries
SELECT * from players where age=(select Max(age) AS oldest_age from players);
SELECT * from coaches where age>(select Min(age) AS youngest_age from coaches);
SELECT * from players where shirtnumber not in(select ShirtNumber from coaches where shirtnumber ='10');
SELECT c.name,c.location,c.chairman from club as c join team as t where c.name in(select name from club where name ='Juventus') limit 1;

#Q7 Procedures

call schedule('Real Madrid');
#CREATE DEFINER=`root`@`localhost` PROCEDURE `name_of_club`()
#BEGIN
#select *
#from club as c
#left join players as p
#on c.name=p.club_name;
#END
call name_of_club();
#CREATE DEFINER=`root`@`localhost` PROCEDURE `average_age`()
#BEGIN
#SELECT AVG(Age) AS average_age FROM Players;
#END
call average_age();
#CREATE DEFINER=`root`@`localhost` PROCEDURE `club_data`(in x varchar(255),out y varchar(255))
#BEGIN
#select c.chairman into y
#from club as c
#left join coaches as p
#on c.name=p.club_name
#where c.name='Real Madrid';
#END
call club_data('Bayern Munich',@y);
select @y; 
