-- 1. Individuals Table (Individuals)
CREATE TABLE Individuals (
    IndividualID INT AUTO_INCREMENT PRIMARY KEY,
    BusinessID INT NULL,
    Member1 INT NULL,
    Member2 INT NULL,
    Member3 INT NULL,
    Member4 INT NULL,
    EmployerType VARCHAR(50),
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    SIN CHAR(9),
    DateOfBirth DATE,
    Relation VARCHAR(50),
    ResidentStatus VARCHAR(20),
    ArrivalDate DATE,
    SourceOfIncome VARCHAR(50),
    YearlyIncome DECIMAL(12,2),
    Occupation VARCHAR(50),
    EmployerOrSchool VARCHAR(100),
    StreetAddress VARCHAR(100),
    City VARCHAR(50),
    Province VARCHAR(50),
    PostalCode VARCHAR(10),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    MaritalStatus VARCHAR(20),
    Dependants INT,
    Website VARCHAR(100),
    LinkedIn VARCHAR(100),
    Instagram VARCHAR(100),
    Facebook VARCHAR(100),
    TikTok VARCHAR(100),
    YouTube VARCHAR(100),
    InsuranceServiceID INT NULL,
    InvestmentAccountID INT NULL,
    MortgageID INT NULL
);

-- 2. Mortgages Table (Mortgages)
CREATE TABLE Mortgages (
    MortgageID INT AUTO_INCREMENT PRIMARY KEY,
    IndividualID INT NOT NULL,
    HomeOwner TINYINT(1),
    Lender VARCHAR(100),
    OutstandingBalance DECIMAL(12,2),
    MarketValue DECIMAL(12,2),
    Term VARCHAR(20),
    InterestRate DECIMAL(5,2),
    RenewalDate DATE
);

-- 3. Family Table (Family)
CREATE TABLE Family (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    IndividualID INT NOT NULL,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    SIN CHAR(9),
    DateOfBirth DATE,
    Occupation VARCHAR(100),
    Employer VARCHAR(100),
    StreetAddress VARCHAR(100),
    City VARCHAR(50),
    Province VARCHAR(50),
    PostalCode VARCHAR(10),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Website VARCHAR(100),
    LinkedIn VARCHAR(100),
    Instagram VARCHAR(100),
    Facebook VARCHAR(100),
    TikTok VARCHAR(100),
    YouTube VARCHAR(100)
);

-- 4. InvestmentAccounts Table (InvestmentAccounts)
CREATE TABLE InvestmentAccounts (
    InvestmentID INT AUTO_INCREMENT PRIMARY KEY,
    IndividualID INT NOT NULL,
    InvestmentType VARCHAR(50),
    Amount DECIMAL(12,2),
    Carrier VARCHAR(50),
    ReturnRate DECIMAL(5,2)
);

-- 5. InsurancePolicies Table (InsurancePolicies)
CREATE TABLE InsurancePolicies (
    IndividualID AUTO_INCREMENT PRIMARY KEY,
    PolicyType VARCHAR(50),
    FaceAmount DECIMAL(12,2),
    Term VARCHAR(20),
    Premium DECIMAL(10,2),
    Carrier VARCHAR(50)
);

-- 6. BusinessClients Table (BusinessClients)
CREATE TABLE BusinessClients (
    BusinessID INT AUTO_INCREMENT PRIMARY KEY,
    BusinessName VARCHAR(100),
    CustomerStatus VARCHAR(10),
    RegistrationType VARCHAR(30),
    Activity VARCHAR(50),
    DirectorName VARCHAR(100),
    IncorporationNumber VARCHAR(50),
    RegistrationDate DATE,
    AnnualFilingMonth VARCHAR(20),
    BusinessNumber VARCHAR(15),
    Online TINYINT(1),
    CRA_AccessCode VARCHAR(20),
    HST_Frequency VARCHAR(10),
    WSIB_Frequency VARCHAR(10),
    Payroll_Frequency VARCHAR(10),
    PaystubFrequency VARCHAR(10),
    T4Service INT NULL,
    BookkeepingService VARCHAR(10),
    ROE_Service INT NULL,
    StreetAddress VARCHAR(100),
    City VARCHAR(50),
    Province VARCHAR(50),
    PostalCode VARCHAR(10),
    PhoneNumber VARCHAR(15),
    EmailAddress VARCHAR(100),
    Fax VARCHAR(15),
    Website VARCHAR(100),
    LinkedIn VARCHAR(100),
    Instagram VARCHAR(100),
    Facebook VARCHAR(100),
    TikTok VARCHAR(100),
    YouTube VARCHAR(100),
    WSIB_UserID VARCHAR(50),
    WSIB_Password VARCHAR(50),
    CRA_UserID VARCHAR(50),
    CRA_Password VARCHAR(50),
    Email_UserID VARCHAR(50),
    Email_Password VARCHAR(50),
    FederalTaxAccess VARCHAR(50),
    FederalTaxKey VARCHAR(50),
    ProvincialTaxAccess VARCHAR(50),
    ProvincialTaxKey VARCHAR(50),
    DocumentsLink VARCHAR(255)
);

-- 7. BusinessShareholders Table (BusinessShareholders)
CREATE TABLE BusinessShareholders (
    BusinessShareholderID INT AUTO_INCREMENT PRIMARY KEY,
    BusinessID INT NOT NULL,
    IndividualID INT NOT NULL
);

-- 8. BusinessServices Table (BusinessServices)
CREATE TABLE BusinessServices (
    BusinessServiceID INT AUTO_INCREMENT PRIMARY KEY,
    BusinessID INT NOT NULL,
    HST TINYINT(1),
    HST_DueDate DATE,
    WSIB TINYINT(1),
    WSIB_DueDate DATE,
    Payroll TINYINT(1),
    Payroll_DueDate DATE,
    Paystubs TINYINT(1),
    Paystubs_Date DATE,
    T4 TINYINT(1),
    T4_DueDate DATE,
    CRA_Notes TEXT,
    Corporate_Notes TEXT,
    Client_Notes TEXT,
    LastUpdated DATE,
    LastUpdatedBy INT
);

-- 9. Employees Table (Employees)
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    StreetAddress VARCHAR(100),
    City VARCHAR(50),
    Province VARCHAR(50),
    PostalCode VARCHAR(10),
    JobTitle VARCHAR(50),
    Department VARCHAR(50),
    DateOfJoining DATE,
    Status VARCHAR(20)
);

-- 10. InsolvencyServices Table (InsolvencyServices)
CREATE TABLE InsolvencyServices (
    InsolvencyServiceID INT AUTO_INCREMENT PRIMARY KEY,
    IndividualID INT NOT NULL,
    ServiceType VARCHAR(50),
    Status VARCHAR(20)
);

-- 11. IndividualServices Table (IndividualServices)
CREATE TABLE IndividualServices (
    IndividualID INT PRIMARY KEY,
    IndividualTax TINYINT(1),
    BusinessTax TINYINT(1),
    BusinessRegistration TINYINT(1),
    Consulting TINYINT(1),
    Insolvency TINYINT(1),
    Insurance TINYINT(1),
    Investments TINYINT(1),
    Mortgage TINYINT(1),
    Others TINYINT(1)
);
