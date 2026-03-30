USE DbAcademicEvaluation;
GO

------	INSERTS INICIALES ---------------------

INSERT INTO users.tblRoles(roleName,isPublic)
VALUES	('student',1),('employee',1),('admin',1);
GO

INSERT INTO academy.tblCareers(careerCode,careerName,facultyName,totalPeriods,yearLength)
VALUES	('IS','Ingenieria en Sistemas','Ingenieria',15,5),
		('AGE','Administracion de Empresas','Ciencias Economicas',20,6);
GO

INSERT INTO request.tblRequestStatus(statusName)
VALUES ('pending'),('in-review'),('reviewed');
GO

INSERT INTO request.tblDiscrepancyTypes(typeName)
VALUES	('sickness'),('death'),('unexpected_event'),('other');
GO

INSERT INTO request.tblScoringParameters (parameterName, parameterValue)
VALUES 
('base_score',100),
('delay_penalty_per_period',2),
('max_delay_penalty',30),
('no_impact_adjustment',-5),
('low_impact_adjustment',-3),
('high_impact_adjustment',5);
GO

INSERT INTO academy.tblSubjects(idCareer,subjectCode,subjectName,idealPeriod,credits,hours,subjectType)
VALUES	(1,'MM-110','Matematicas',1,5,5,'?'),
		(1,'IS-110','Introduccion a ingenieria en sistemas',1,3,3,'?'),
		(1,'MM-314','Programación I ',2,3,3,'?'),
		(1,'IS-210','Programación II ',1,4,4,'?');
GO

INSERT INTO academy.tblSubjectPrerequisites(idSubject,idPrerequisiteSubject)
VALUES	( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM-314')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM-110') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM-314')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS-110') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS-210')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM-314') )
GO

------------------- INSERTS DE PRUEBA ----------------------------

INSERT INTO users.tblUsers(email,password,name,idRole)
VALUES	('estudiante@gmail.com','cea115f6db0fcae5bc6b1148d07249e446d0e295382fb562e6ca4d7a354525fe','Fulano de Tal',1);
GO

INSERT INTO users.tblStudents(idUser,accountNumber,enrollmentDate,currentPeriod)
VALUES	(1,'20221004546',GETDATE(),2);
GO

INSERT INTO users.tblStudentCareers(idStudent,idCareer)
VALUES	(1,1),
		(1,2);
