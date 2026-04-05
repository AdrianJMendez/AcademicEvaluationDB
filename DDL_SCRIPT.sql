
--IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DbAcademicEvaluation')
--BEGIN
--    CREATE DATABASE DbAcademicEvaluation;
--END
--GO

--USE DbAcademicEvaluation;
--GO

--CREATE LOGIN UserAcademicEvaluation WITH PASSWORD = 'LOSFABULOSOSCADILLAC11',
--CHECK_POLICY = OFF,
--CHECK_EXPIRATION = OFF;
--GO

--CREATE USER UserAcademicEvaluation FOR LOGIN UserAcademicEvaluation;
--EXEC sp_addrolemember N'db_owner', N'UserAcademicEvaluation';
--GO

------------ SCHEMA -------------------
CREATE SCHEMA academy;
GO

CREATE SCHEMA users;
GO

CREATE SCHEMA request;
GO

CREATE SCHEMA asset;
GO

------------- ACADEMY ---------------------
CREATE TABLE academy.tblCareers (
    idCareer INTEGER PRIMARY KEY IDENTITY,
    careerCode NVARCHAR(20) NOT NULL,
    careerName NVARCHAR(MAX) NOT NULL,
    description NVARCHAR(MAX),
    facultyName NVARCHAR(MAX),
	totalPeriods INTEGER NOT NULL,
	yearLength INTEGER NOT NULL,
    isActive BIT DEFAULT 1,	
	optativesQty INTEGER NOT NULL,
	electivesQty INTEGER NOT NULL,
	CONSTRAINT ukCareer_CareerCode
		UNIQUE(careerCode)
);

CREATE TABLE academy.tblSubjects (
    idSubject INTEGER PRIMARY KEY IDENTITY,
    subjectCode NVARCHAR(20) NOT NULL,
    subjectName NVARCHAR(MAX) NOT NULL,
    idealPeriod INTEGER NOT NULL,
    credits INTEGER,
    hours INTEGER,
    subjectType NVARCHAR(50),		-----VERIFICAR QUE TIPOS EXISTIRIAN
    description NVARCHAR(MAX),
    isOptative BIT DEFAULT 0,		----- PARA CLASES OPTATIVAS DE UNA CARRERA (SISTEMAS EXPERTOS EJ)
	CONSTRAINT ukSubject_SubjectCode
		UNIQUE (subjectCode)
);

CREATE TABLE academy.tblCareerSubjects(
	idCareerSubject INTEGER PRIMARY KEY IDENTITY,
	idCareer INTEGER NOT NULL,
	idSubject INTEGER NOT NULL,
	isElective BIT DEFAULT 0,
	CONSTRAINT fkCareerSubject_Career
		FOREIGN KEY (idCareer) REFERENCES academy.tblCareers(idCareer),
	CONSTRAINT fkCareerSubject
		FOREIGN KEY (idSubject) REFERENCES academy.tblSubjects(idSubject),
	CONSTRAINT ukCareer_Subject
		UNIQUE(idCareer,idSubject)
);


CREATE TABLE academy.tblSubjectPrerequisites (
    idPrerequisite INTEGER IDENTITY PRIMARY KEY,
    idSubject INTEGER NOT NULL,
    idPrerequisiteSubject INTEGER NOT NULL,
    isStrict BIT DEFAULT 1,
	CONSTRAINT fkPrerequisite_Subject
		FOREIGN KEY (idSubject) REFERENCES academy.tblSubjects(idSubject),
	CONSTRAINT fkPrerequisite_PrerequisiteSubject
		FOREIGN KEY (idPrerequisiteSubject) REFERENCES academy.tblSubjects(idSubject),
	CONSTRAINT ukPrerequisite_Subject
		UNIQUE (idSubject,idPrerequisiteSubject)
);


----------------- USERS --------------------
CREATE TABLE users.tblRoles(
	idRole INTEGER PRIMARY KEY IDENTITY,
	roleName NVARCHAR(200) NOT NULL,
	isPublic BIT DEFAULT 1
	CONSTRAINT ukRole_RoleName
		UNIQUE(roleName)
);

CREATE TABLE users.tblUsers (
    idUser INTEGER PRIMARY KEY IDENTITY,
    email VARCHAR(255) NOT NULL,
	password NVARCHAR(MAX) NOT NULL,
    name NVARCHAR(MAX) NOT NULL,
    idRole INTEGER NOT NULL,
    isActive BIT DEFAULT 1,
	isVerified BIT DEFAULT 0,
    --createdAt DATETIME DEFAULT GETDATE(),
    --updatedAt DATETIME DEFAULT GETDATE(),
    lastLoginAt DATETIME
	CONSTRAINT fkUser_Role
		FOREIGN KEY (idRole) REFERENCES users.tblRoles(idRole),
	CONSTRAINT ukUser_Email
		UNIQUE (email)
);

CREATE TABLE users.tblStudents (
    idStudent INTEGER PRIMARY KEY IDENTITY,
	idUser INTEGER NOT NULL,
    accountNumber NVARCHAR(50) NOT NULL,
    enrollmentDate DATE,
    currentPeriod INTEGER,
	CONSTRAINT fkStudent_User
		FOREIGN KEY (idUser) REFERENCES users.tblUsers(idUser),
	CONSTRAINT ukStudent_AccountNumber
		UNIQUE (accountNumber),
	CONSTRAINT ukStudent_User
		UNIQUE(idUser)
);

CREATE TABLE users.tblEmployees (
    idEmployee INTEGER PRIMARY KEY IDENTITY,
	idUser INTEGER NOT NULL,
    employeeCode NVARCHAR(50) NOT NULL,
    department NVARCHAR(MAX),
    position VARCHAR(MAX),
    hireDate DATE,
	CONSTRAINT fkEmployee_User
		FOREIGN KEY (idUser) REFERENCES users.tblUsers(idUser),
	CONSTRAINT ukEmployee_EmployeeCode
		UNIQUE(employeeCode),
	CONSTRAINT ukEmployee_User
		UNIQUE(idUser)
);

CREATE TABLE users.tblStudentCareers(
	idStudentCareer INTEGER PRIMARY KEY IDENTITY,
	idStudent INTEGER NOT NULL,
	idCareer INTEGER NOT NULL,
	isActive BIT DEFAULT 1,
	CONSTRAINT fkStudentCareers_Student
		FOREIGN KEY (idStudent) REFERENCES users.tblStudents(idStudent),
	CONSTRAINT fkStudentCareers_Career
		FOREIGN KEY (idCareer) REFERENCES academy.tblCareers(idCareer),
	CONSTRAINT ukStudent_Career
		UNIQUE(idStudent,idCareer)
);


---------------------------- ASSET ------------------------------------
CREATE TABLE asset.tblStatusTypes(
	idStatusType INTEGER PRIMARY KEY IDENTITY,
	statusTypeName NVARCHAR(MAX) NOT NULL,
	description NVARCHAR(MAX) NOT NULL
);

CREATE TABLE asset.tblStatus(
	idStatus INTEGER PRIMARY KEY IDENTITY,
	statusName NVARCHAR(MAX) NOT NULL,
	idStatusType INTEGER NOT NULL,
	CONSTRAINT fkStatus_StatusType
	FOREIGN KEY (idStatusType) REFERENCES asset.tblStatusTypes(idStatusType)
);

CREATE TABLE asset.tblEmailTemplates(
	idEmailTemplate INTEGER PRIMARY KEY IDENTITY,
	templateName NVARCHAR(200) NOT NULL,
	content NVARCHAR(MAX) NOT NULL,
	CONSTRAINT ukEmailTemplate_TemplateName
		UNIQUE(templateName)
);

CREATE TABLE asset.tblEmailVerifications (
    idEmailVerification INTEGER IDENTITY PRIMARY KEY,
    idUser INTEGER NOT NULL,
    code NVARCHAR(6) NOT NULL,
    failedAttempts INTEGER DEFAULT 0,
    createdAt DATETIME DEFAULT GETDATE(),
    expiresAt DATETIME NOT NULL,
    verifiedAt DATETIME NULL,
    idStatus INTEGER NOT NULL DEFAULT 3,
    originIP NVARCHAR(45) NULL,
    userAgent NVARCHAR(500) NULL,
    CONSTRAINT fkVerificationEmail_User 
	FOREIGN KEY (idUser) REFERENCES users.tblUsers(idUser),
	CONSTRAINT fkVerificationEmail_Status
		FOREIGN KEY (idStatus) REFERENCES asset.tblStatus(idStatus),
    CONSTRAINT ckEmailVerification_FailedAttempts 
	CHECK ((failedAttempts >= 0 AND failedAttempts <= 5)),
);

---------------------------- REQUESTS ----------------------------------

CREATE TABLE request.tblDiscrepancyTypes(
	idDiscrepancyType INTEGER PRIMARY KEY IDENTITY,
	typeName NVARCHAR(50) NOT NULL,
	CONSTRAINT ukDiscrepancyType_TypeName
		UNIQUE (typeName)
);

CREATE TABLE request.tblRequests (
    idRequest INTEGER IDENTITY PRIMARY KEY,
    idStudentCareer INTEGER NOT NULL,
	idStatus INTEGER NOT NULL,
    submittedAt DATETIME DEFAULT GETDATE(),
    reviewedAt DATETIME,
    idEmployeeReviewer INTEGER,
    finalScore DECIMAL(5,2),
    generatedReportUrl NVARCHAR(MAX),
    notes NVARCHAR(MAX),
	CONSTRAINT fkRequest_StudentCareer
		FOREIGN KEY (idStudentCareer) REFERENCES users.tblStudentCareers(idStudentCareer),
	CONSTRAINT fkRequest_EmployeeReviewer
		FOREIGN KEY (idEmployeeReviewer) REFERENCES users.tblEmployees(idEmployee),
	CONSTRAINT fkRequest_Status
		FOREIGN KEY (idStatus) REFERENCES asset.tblStatus(idStatus)
);

CREATE TABLE request.tblDiscrepancies (
    idDiscrepancy INTEGER PRIMARY KEY IDENTITY,
	idDiscrepancyType INTEGER NOT NULL,
	idRequest INTEGER NOT NULL,
    expectedPeriod INTEGER,
    actualPeriod INTEGER,
    description NVARCHAR(MAX),
    periodDifference AS (actualPeriod - expectedPeriod) PERSISTED,
    severity NVARCHAR(MAX),
    detectedAt DATETIME DEFAULT GETDATE(),
	CONSTRAINT fkDiscrepancy_DiscrepancyType
		FOREIGN KEY (idDiscrepancyType) REFERENCES request.tblDiscrepancyTypes(idDiscrepancyType),
	CONSTRAINT fkDiscrepancy_Request
		FOREIGN KEY (idRequest) REFERENCES request.tblRequests(idRequest)
);


CREATE TABLE request.tblJustifications (
    idJustification INTEGER IDENTITY PRIMARY KEY,
    title NVARCHAR(MAX),
    description NVARCHAR(MAX),
    impactLevel NVARCHAR(MAX),
    employeeComments NVARCHAR(MAX),
    submittedAt DATETIME DEFAULT GETDATE(),
    reviewedAt DATETIME
);

CREATE TABLE request.tblJustificationDiscrepancies(
	idJustificationDiscrepancy INTEGER PRIMARY KEY IDENTITY,
	idJustification INTEGER NOT NULL,
	idDiscrepancy INTEGER NOT NULL,
	CONSTRAINT fkJustificationDiscrepancy_Justification
		FOREIGN KEY (idJustification) REFERENCES request.tblJustifications(idJustification),
	CONSTRAINT fkJustificationDiscrepancy_Discrepancy
		FOREIGN KEY (idDiscrepancy) REFERENCES request.tblDiscrepancies(idDiscrepancy),
	CONSTRAINT ukJustification_Discrepancy
		UNIQUE ( idDiscrepancy, idJustification)
);

CREATE TABLE request.tblScoreCalculations (
    idScoreCalculation INTEGER IDENTITY PRIMARY KEY,
    idRequest INTEGER NOT NULL,
    baseScore DECIMAL(5,2) DEFAULT 100,
    totalDelay INTEGER DEFAULT 0,
    delayPenalty DECIMAL(5,2) DEFAULT 0,
    impactAdjustment DECIMAL(5,2) DEFAULT 0,
    finalScore DECIMAL(5,2),
    discrepanciesCount INTEGER DEFAULT 0,
    calculatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT fkScoreCalculation_Request
		FOREIGN KEY (idRequest) REFERENCES request.tblRequests(idRequest),
	CONSTRAINT ukScoreCalculation_Request
		UNIQUE (idRequest)
);

CREATE TABLE request.tblScoringParameters (
    idScoringParameter INTEGER IDENTITY PRIMARY KEY,
    parameterName NVARCHAR(100) NOT NULL,
    parameterValue DECIMAL(10,2),
    description NVARCHAR(MAX),
    isActive BIT DEFAULT 1,
    --createdAt DATETIME DEFAULT GETDATE(),
    --updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT uk_ScoringParameter_ParameterName
		UNIQUE (parameterName)
);

CREATE TABLE request.tblRequestImages (
	idRequestImage INTEGER IDENTITY PRIMARY KEY,
	idRequest INTEGER NOT NULL,
	imageName NVARCHAR(255) NOT NULL,
	imageUrl NVARCHAR(MAX) NOT NULL,
	thumbnailUrl NVARCHAR(MAX) NOT NULL,
	CONSTRAINT fkRequestImage_Request
		FOREIGN KEY (idRequest) REFERENCES request.tblRequests(idRequest)
);

CREATE TABLE request.tblRequestReports (
	idRequestReport INTEGER IDENTITY PRIMARY KEY,
	idRequest INTEGER NOT NULL,
	fileName NVARCHAR(255) NOT NULL,
	mimeType NVARCHAR(100) NOT NULL DEFAULT 'application/pdf',
	reportData VARBINARY(MAX) NOT NULL,
	generatedAt DATETIME DEFAULT GETDATE(),
	CONSTRAINT fkRequestReport_Request
		FOREIGN KEY (idRequest) REFERENCES request.tblRequests(idRequest),
	CONSTRAINT ukRequestReport_Request
		UNIQUE (idRequest)
);

CREATE TABLE request.tblRequestAcademicHistories(
	idRequestAcademicHistory INTEGER PRIMARY KEY IDENTITY,
	idRequest INTEGER NOT NULL,
	jsonContent NVARCHAR(MAX) NOT NULL,
	academicAverage DECIMAL(6,2) NOT NULL,
	CONSTRAINT fkAcademicHistory_Request
		FOREIGN KEY (idRequest) REFERENCES request.tblRequests(idRequest),
	CONSTRAINT ukAcademicHistory_Request
		UNIQUE(idRequest)
);

