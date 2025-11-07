CREATE DATABASE LIONROAR;
GO
USE LIONROAR;
GO

-- DEPARTMENT TABLE
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

-- EMPLOYEE TABLE (Parent table)
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    HireDate DATE NOT NULL,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    DeptID INT,
    EmployeeType VARCHAR(50) CHECK (EmployeeType IN ('Software Dev', 'Sales', 'Marketing', 'IT Support', 'HR')),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- EMPLOYEE SUBTYPE TABLES
CREATE TABLE SoftwareDeveloper (
    EmpID INT PRIMARY KEY,
    DevMethod VARCHAR(50),
    TechStack VARCHAR(255),
    ManagementTool VARCHAR(50),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

CREATE TABLE Sales (
    EmpID INT PRIMARY KEY,
    SalesTarget DECIMAL(12,2),
    SalesRegion VARCHAR(100),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

CREATE TABLE Marketing (
    EmpID INT PRIMARY KEY,
    CampaignBudget DECIMAL(12,2),
    MarketingChannels VARCHAR(255),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

CREATE TABLE ITSupport (
    EmpID INT PRIMARY KEY,
    SupportScope VARCHAR(100),
    TechUsed VARCHAR(255),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

-- CLIENT TABLE
CREATE TABLE Client (
    ClientID INT PRIMARY KEY,
    ClientName VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

-- CONTRACT TABLE
CREATE TABLE Contract (
    ContractID INT PRIMARY KEY,
    ContractName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Amount DECIMAL(12,2),
    DeptID INT,
    ClientID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

-- PROJECT TABLE
CREATE TABLE Project (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(50) CHECK (Status IN ('Planning', 'Active', 'On Hold', 'Completed', 'Cancelled')),
    Budget DECIMAL(12,2),
    ProjectManagerID INT,
    FOREIGN KEY (ProjectManagerID) REFERENCES Employee(EmpID)
);

-- REQUIREMENT TABLE
CREATE TABLE Requirement (
    RequirementID INT PRIMARY KEY,
    ProjectID INT,
    ReqName VARCHAR(100) NOT NULL,
    Priority VARCHAR(50),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

-- TIMELINE TABLE
CREATE TABLE Timeline (
    TimelineID INT PRIMARY KEY,
    ProjectID INT,
    PhaseName VARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

-- INVENTORY TABLE (Parent table)
CREATE TABLE Inventory (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Quantity INT DEFAULT 0,
    InventoryType VARCHAR(50) CHECK (InventoryType IN ('Hardware', 'Software'))
);

-- INVENTORY SUBTYPE TABLES
CREATE TABLE HardwareLicense (
    ItemID INT PRIMARY KEY,
    Brand VARCHAR(50),
    Model VARCHAR(50),
    SerialNumber VARCHAR(100) UNIQUE,
    WarrantyExpDate DATE,
    FOREIGN KEY (ItemID) REFERENCES Inventory(ItemID)
);

CREATE TABLE SoftwareLicense (
    ItemID INT PRIMARY KEY,
    SoftwareName VARCHAR(100) NOT NULL,
    Vendor VARCHAR(100),
    LicenseExpDate DATE,
    FOREIGN KEY (ItemID) REFERENCES Inventory(ItemID)
);

-- STOCK LEVEL TABLE
CREATE TABLE StockLevel (
    StockID INT PRIMARY KEY,
    InventoryID INT,
    AvailableQuantity INT,
    LastUpdated DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (InventoryID) REFERENCES Inventory(ItemID)
);

-- SUPPORT TICKET TABLE (Parent table)
CREATE TABLE SupportTicket (
    TicketID INT PRIMARY KEY,
    Status VARCHAR(50),
    ClientID INT,
    AssignedEmpID INT,
    TicketType VARCHAR(50) CHECK (TicketType IN ('Internal', 'External')),
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
    FOREIGN KEY (AssignedEmpID) REFERENCES Employee(EmpID)
);

-- TICKET SUBTYPE TABLES
CREATE TABLE InternalTicket (
    TicketID INT PRIMARY KEY,
    DateOpened DATE,
    DateClosed DATE,
    Status VARCHAR(50),
    EmpID INT,
    FOREIGN KEY (TicketID) REFERENCES SupportTicket(TicketID),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

CREATE TABLE ExternalTicket (
    TicketID INT PRIMARY KEY,
    DateOpened DATE,
    DateClosed DATE,
    ServiceLevel VARCHAR(50),
    ClientID INT,
    FOREIGN KEY (TicketID) REFERENCES SupportTicket(TicketID),
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

-- SERVICE AGREEMENT TABLE
CREATE TABLE ServiceAgreement (
    AgreementID INT PRIMARY KEY,
    ClientID INT,
    ContactName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    DeptID INT,
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- PROJECT EMPLOYEE JUNCTION TABLE
CREATE TABLE ProjectEmployee (
    ProjectID INT,
    EmpID INT,
    Role VARCHAR(50),
    PRIMARY KEY (ProjectID, EmpID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);