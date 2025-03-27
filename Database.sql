-- 1. Families Table (Created First)
CREATE TABLE Families (
    FamilyID INT IDENTITY(1,1) PRIMARY KEY
);

-- 2. BusinessClients Table
CREATE TABLE BusinessClients (
    BusinessID INT IDENTITY(1,1) PRIMARY KEY,
    BusinessName VARCHAR(100) NOT NULL,
    CustomerStatus VARCHAR(10) NOT NULL,
    RegistrationType VARCHAR(30) NOT NULL,
    Activity VARCHAR(50) NOT NULL,
    DirectorName VARCHAR(100) NOT NULL,
    IncorporationNumber VARCHAR(50) NOT NULL,
    RegistrationDate DATE NOT NULL,
    AnnualFilingMonth VARCHAR(20) NOT NULL,
    BusinessNumber VARCHAR(15) NOT NULL,
    Online BIT NOT NULL,
    CRA_AccessCode VARCHAR(20) NULL,
    HST_Frequency VARCHAR(10) NULL,
    WSIB_Frequency VARCHAR(10) NULL,
    Payroll_Frequency VARCHAR(10) NULL,
    PaystubFrequency VARCHAR(10) NULL,
    T4Service BIT NOT NULL,
    BookkeepingService VARCHAR(10) NULL,
    ROE_Service BIT NOT NULL,
    StreetAddress VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Province VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(10) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    EmailAddress VARCHAR(100) NOT NULL,
    Fax VARCHAR(15) NULL,
    Website VARCHAR(100) NULL,
    LinkedIn VARCHAR(100) NULL,
    Instagram VARCHAR(100) NULL,
    Facebook VARCHAR(100) NULL,
    TikTok VARCHAR(100) NULL,
    YouTube VARCHAR(100) NULL,
    DocumentsLink VARCHAR(255) NULL
);

-- 3. Individuals Table (Includes FamilyID and BusinessID)
CREATE TABLE Individuals (
    IndividualID INT IDENTITY(1,1) PRIMARY KEY,
    BusinessID INT NULL,
    FamilyID INT NULL,
    EmployerType VARCHAR(50) NULL,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    SIN CHAR(9) NOT NULL UNIQUE,
    DateOfBirth DATE NOT NULL,
    Relation VARCHAR(50) NOT NULL,
    ResidentStatus VARCHAR(20) NOT NULL,
    ArrivalDate DATE NULL,
    SourceOfIncome VARCHAR(50) NOT NULL,
    YearlyIncome DECIMAL(12,2) NULL,
    Occupation VARCHAR(50) NULL,
    EmployerOrSchool VARCHAR(100) NULL,
    StreetAddress VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Province VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(10) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NULL,
    MaritalStatus VARCHAR(20) NULL,
    Dependants INT NULL,
    Website VARCHAR(100) NULL,
    LinkedIn VARCHAR(100) NULL,
    Instagram VARCHAR(100) NULL,
    Facebook VARCHAR(100) NULL,
    TikTok VARCHAR(100) NULL,
    YouTube VARCHAR(100) NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (FamilyID) REFERENCES Families(FamilyID) ON DELETE SET NULL,
    FOREIGN KEY (BusinessID) REFERENCES BusinessClients(BusinessID) ON DELETE SET NULL
);

-- Now, Add HeadOfFamily to Families
ALTER TABLE Families 
ADD HeadOfFamily INT NULL,
FOREIGN KEY (HeadOfFamily) REFERENCES Individuals(IndividualID) ON DELETE SET NULL;

-- 4. Mortgages Table (Mortgages)
CREATE TABLE Mortgages (
    MortgageID INT IDENTITY(1,1) PRIMARY KEY,
    IndividualID INT NOT NULL,
    HomeOwner BIT,
    Lender VARCHAR(100),
    OutstandingBalance DECIMAL(12,2),
    MarketValue DECIMAL(12,2),
    Term VARCHAR(20),
    InterestRate DECIMAL(5,2),
    RenewalDate DATE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (IndividualID) REFERENCES Individuals(IndividualID) ON DELETE CASCADE
);

-- 5. InvestmentAccounts Table (InvestmentAccounts)
CREATE TABLE InvestmentAccounts (
    InvestmentID INT IDENTITY(1,1) PRIMARY KEY,
    IndividualID INT NOT NULL,
    InvestmentType VARCHAR(50),
    Amount DECIMAL(12,2),
    Carrier VARCHAR(50),
    ReturnRate DECIMAL(5,2),
    FOREIGN KEY (IndividualID) REFERENCES Individuals(IndividualID) ON DELETE CASCADE
);

-- 6. InsurancePolicies Table (InsurancePolicies)
CREATE TABLE InsurancePolicies (
    PolicyID INT IDENTITY(1,1) PRIMARY KEY,
    IndividualID INT NOT NULL,
    PolicyType VARCHAR(50),
    FaceAmount DECIMAL(12,2),
    Term VARCHAR(20),
    Premium DECIMAL(10,2),
    Carrier VARCHAR(50),
    FOREIGN KEY (IndividualID) REFERENCES Individuals(IndividualID) ON DELETE CASCADE
);

-- 7. BusinessShareholders Table (BusinessShareholders)
CREATE TABLE BusinessShareholders (
    BusinessShareholderID INT IDENTITY(1,1) PRIMARY KEY,
    BusinessID INT NOT NULL,
    IndividualID INT NOT NULL,
    FOREIGN KEY (BusinessID) REFERENCES BusinessClients(BusinessID) ON DELETE CASCADE,
    FOREIGN KEY (IndividualID) REFERENCES Individuals(IndividualID) ON DELETE CASCADE
);

-- 8. Employees Table (Employees)
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
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

-- 9. BusinessServices Table (BusinessServices)
CREATE TABLE BusinessServices (
    BusinessServiceID INT IDENTITY(1,1) PRIMARY KEY,
    BusinessID INT NOT NULL,
    HST BIT,
    HST_DueDate DATE,
    WSIB BIT,
    WSIB_DueDate DATE,
    Payroll BIT,
    Payroll_DueDate DATE,
    Paystubs BIT,
    Paystubs_Date DATE,
    T4 BIT,
    T4_DueDate DATE,
    CRA_Notes TEXT,
    Corporate_Notes TEXT,
    Client_Notes TEXT,
    LastUpdated DATE,
    LastUpdatedBy INT,
    FOREIGN KEY (BusinessID) REFERENCES BusinessClients(BusinessID) ON DELETE CASCADE,
	FOREIGN KEY (LastUpdatedBy) REFERENCES Employees(EmployeeID) ON DELETE SET NULL
);

-- 10. InsolvencyServices Table (InsolvencyServices)
CREATE TABLE InsolvencyServices (
    InsolvencyServiceID INT IDENTITY(1,1) PRIMARY KEY,
    IndividualID INT NOT NULL,
    ServiceType VARCHAR(50),
    Status VARCHAR(20),
    FOREIGN KEY (IndividualID) REFERENCES Individuals(IndividualID) ON DELETE CASCADE
);

-- 11. IndividualServices Table (IndividualServices)
CREATE TABLE IndividualServices (
    IndividualServiceID INT IDENTITY(1,1) PRIMARY KEY,
    IndividualID INT NOT NULL,
    IndividualTax BIT,
    BusinessTax BIT,
    BusinessRegistration BIT,
    Consulting BIT,
    Insolvency BIT,
    Insurance BIT,
    Investments BIT,
    Mortgage BIT,
    Others BIT,
    FOREIGN KEY (IndividualID) REFERENCES Individuals(IndividualID) ON DELETE CASCADE
);
