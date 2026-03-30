USE DbAcademicEvaluation;
GO

------	INSERTS INICIALES ---------------------

INSERT INTO users.tblRoles(roleName,isPublic)
VALUES	('student',1),('employee',1),('admin',1);
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