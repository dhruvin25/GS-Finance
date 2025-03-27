-- 1. Families Table (Primary)
CREATE TABLE Families (
    FamilyID INT AUTO_INCREMENT PRIMARY KEY,
    HeadOfFamily INT UNIQUE, -- One Individual as the head
    FOREIGN KEY (HeadOfFamily) REFERENCES Individuals(IndividualID) ON DELETE SET NULL
);

-- 2. Individuals Table
CREATE TABLE Individuals (
    IndividualID INT AUTO_INCREMENT PRIMARY KEY,
    BusinessID INT NULL, -- Nullable as not all individuals belong to a business
    FamilyID INT NULL, 
    EmployerType VARCHAR(50),
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    SIN VARCHAR(11) UNIQUE,
    DateOfBirth DATE NOT NULL,
    Relation VARCHAR(50),
    ResidentStatus VARCHAR(20),
    ArrivalDate DATE NULL,
    SourceOfIncome VARCHAR(50),
    YearlyIncome DECIMAL(12,2),
    Occupation VARCHAR(50),
    EmployerOrSchool VARCHAR(100),
    StreetAddress VARCHAR(100),
    City VARCHAR(50),
    Province VARCHAR(50),
    PostalCode VARCHAR(10),
    Phone VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE,
    MaritalStatus VARCHAR(20),
    Dependants INT DEFAULT 0,
    Website VARCHAR(100),
    LinkedIn VARCHAR(100),
    Instagram VARCHAR(100),
    Facebook VARCHAR(100),
    TikTok VARCHAR(100),
    YouTube VARCHAR(100),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (FamilyID) REFERENCES Families(FamilyID) ON DELETE SET NULL
);

-- 3. Mortgages Table
CREATE TABLE Mortgages (
    MortgageID INT AUTO_INCREMENT PRIMARY KEY,
    IndividualID INT NOT NULL,
    HomeOwner BOOLEAN DEFAULT FALSE,
    Lender VARCHAR(100),
    OutstandingBalance DECIMAL(12,2) DEFAULT 0,
    MarketValue DECIMAL(12,2),
    Term VARCHAR(20),
    InterestRate DECIMAL(5,2),
    RenewalDate DATE NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (IndividualID) REFERENCES Individuals(IndividualID) ON DELETE CASCADE
);

-- 4. InvestmentAccounts Table
CREATE TABLE InvestmentAccounts (
    InvestmentID INT AUTO_INCREMENT PRIMARY KEY,
    IndividualID INT NOT NULL,
    InvestmentType VARCHAR(50),
    Amount DECIMAL(12,2),
    Carrier VARCHAR(50),
    ReturnRate DECIMAL(5,2),
    FOREIGN KEY (IndividualID) REFERENCES Individuals(IndividualID) ON DELETE CASCADE
);

-- 5. InsurancePolicies Table
CREATE TABLE InsurancePolicies (
    PolicyID INT AUTO_INCREMENT PRIMARY KEY,
    IndividualID INT NOT NULL,
    PolicyType VARCHAR(50),
    FaceAmount DECIMAL(12,2),
    Term VARCHAR(20),
    Premium DECIMAL(10,2),
    Carrier VARCHAR(50),
    FOREIGN KEY (IndividualID) REFERENCES Individuals(IndividualID) ON DELETE CASCADE
);

-- 6. BusinessClients Table
CREATE TABLE BusinessClients (
    BusinessID INT AUTO_INCREMENT PRIMARY KEY,
    BusinessName VARCHAR(100) NOT NULL,
    CustomerStatus VARCHAR(20),
    RegistrationType VARCHAR(30),
    Activity VARCHAR(50),
    DirectorName VARCHAR(100),
    IncorporationNumber VARCHAR(50) UNIQUE,
    RegistrationDate DATE NULL,
    AnnualFilingMonth VARCHAR(20),
    BusinessNumber VARCHAR(15) UNIQUE,
    Online BOOLEAN DEFAULT FALSE,
    CRA_AccessCode VARCHAR(20),
    HST_Frequency VARCHAR(10),
    WSIB_Frequency VARCHAR(10),
    Payroll_Frequency VARCHAR(10),
    PaystubFrequency VARCHAR(10),
    T4Service BOOLEAN DEFAULT FALSE,
    BookkeepingService VARCHAR(20),
    ROE_Service BOOLEAN DEFAULT FALSE,
    StreetAddress VARCHAR(100),
    City VARCHAR(50),
    Province VARCHAR(50),
    PostalCode VARCHAR(10),
    PhoneNumber VARCHAR(15) UNIQUE,
    EmailAddress VARCHAR(100) UNIQUE,
    Fax VARCHAR(15),
    Website VARCHAR(100),
    LinkedIn VARCHAR(100),
    Instagram VARCHAR(100),
    Facebook VARCHAR(100),
    TikTok VARCHAR(100),
    YouTube VARCHAR(100),
    DocumentsLink VARCHAR(255)
);

-- 7. BusinessShareholders Table (Many-to-Many)
CREATE TABLE BusinessShareholders (
    BusinessShareholderID INT AUTO_INCREMENT PRIMARY KEY,
    BusinessID INT NOT NULL,
    IndividualID INT NOT NULL,
    FOREIGN KEY (BusinessID) REFERENCES BusinessClients(BusinessID) ON DELETE CASCADE,
    FOREIGN KEY (IndividualID) REFERENCES Individuals(IndividualID) ON DELETE CASCADE
);

-- 8. BusinessServices Table
CREATE TABLE BusinessServices (
    BusinessServiceID INT AUTO_INCREMENT PRIMARY KEY,
    BusinessID INT NOT NULL,
    HST BOOLEAN DEFAULT FALSE,
    HST_DueDate DATE NULL,
    WSIB BOOLEAN DEFAULT FALSE,
    WSIB_DueDate DATE NULL,
    Payroll BOOLEAN DEFAULT FALSE,
    Payroll_DueDate DATE NULL,
    Paystubs BOOLEAN DEFAULT FALSE,
    Paystubs_Date DATE NULL,
    T4 BOOLEAN DEFAULT FALSE,
    T4_DueDate DATE NULL,
    CRA_Notes TEXT,
    Corporate_Notes TEXT,
    Client_Notes TEXT,
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastUpdatedBy INT NULL,
    FOREIGN KEY (BusinessID) REFERENCES BusinessClients(BusinessID) ON DELETE CASCADE
);

-- 9. Employees Table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE,
    StreetAddress VARCHAR(100),
    City VARCHAR(50),
    Province VARCHAR(50),
    PostalCode VARCHAR(10),
    JobTitle VARCHAR(50),
    Department VARCHAR(50),
    DateOfJoining DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Active'
);

-- 10. InsolvencyServices Table
CREATE TABLE InsolvencyServices (
    InsolvencyServiceID INT AUTO_INCREMENT PRIMARY KEY,
    IndividualID INT NOT NULL,
    ServiceType VARCHAR(50),
    Status VARCHAR(20),
    FOREIGN KEY (IndividualID) REFERENCES Individuals(IndividualID) ON DELETE CASCADE
);

-- 11. IndividualServices Table
CREATE TABLE IndividualServices (
    IndividualServiceID INT AUTO_INCREMENT PRIMARY KEY,
    IndividualID INT NOT NULL,
    IndividualTax BOOLEAN DEFAULT FALSE,
    BusinessTax BOOLEAN DEFAULT FALSE,
    BusinessRegistration BOOLEAN DEFAULT FALSE,
    Consulting BOOLEAN DEFAULT FALSE,
    Insolvency BOOLEAN DEFAULT FALSE,
    Insurance BOOLEAN DEFAULT FALSE,
    Investments BOOLEAN DEFAULT FALSE,
    Mortgage BOOLEAN DEFAULT FALSE,
    Others BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (IndividualID) REFERENCES Individuals(IndividualID) ON DELETE CASCADE
);
