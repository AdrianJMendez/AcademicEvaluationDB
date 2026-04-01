USE DbAcademicEvaluation;
GO

------	INSERTS INICIALES ---------------------
INSERT INTO asset.tblStatusTypes(statusTypeName, description)
VALUES	('EMAIL_VERIFICATION','Estados por los que pasa un correo de verificación de usuario.')
GO

INSERT INTO asset.tblStatus(statusName, idStatusType)
VALUES	('VERIFIED',1),('EXPIRED',1),('PENDING',1)
GO

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


INSERT INTO asset.tblEmailTemplates(templateName,content)
VALUES ('VERIFICATION','
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Verifica tu correo</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        line-height: 1.6;
                        color: #333;
                        margin: 0;
                        padding: 0;
                        background-color: #f4f4f4;
                    }
                    .container {
                        max-width: 600px;
                        margin: 20px auto;
                        padding: 0;
                        background-color: #ffffff;
                        border-radius: 8px;
                        overflow: hidden;
                        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                    }
                    .header {
                        background-color: #4CAF50;
                        color: white;
                        padding: 30px 20px;
                        text-align: center;
                    }
                    .header h1 {
                        margin: 0;
                        font-size: 24px;
                    }
                    .content {
                        padding: 30px 20px;
                    }
                    .greeting {
                        font-size: 18px;
                        margin-bottom: 20px;
                    }
                    .message {
                        margin-bottom: 30px;
                        color: #555;
                    }
                    .code-container {
                        text-align: center;
                        margin: 30px 0;
                        padding: 20px;
                        background-color: #f8f9fa;
                        border-radius: 8px;
                    }
                    .code {
                        font-size: 32px;
                        font-weight: bold;
                        letter-spacing: 5px;
                        color: #4CAF50;
                        font-family: monospace;
                    }
                    .expiry {
                        text-align: center;
                        font-size: 12px;
                        color: #888;
                        margin-top: 20px;
                    }
                    .footer {
                        background-color: #f8f9fa;
                        padding: 20px;
                        text-align: center;
                        font-size: 12px;
                        color: #888;
                        border-top: 1px solid #e0e0e0;
                    }
                    .button {
                        display: inline-block;
                        padding: 12px 24px;
                        background-color: #4CAF50;
                        color: white;
                        text-decoration: none;
                        border-radius: 4px;
                        margin-top: 20px;
                    }
                    @media only screen and (max-width: 600px) {
                        .container {
                            margin: 10px;
                        }
                        .code {
                            font-size: 24px;
                            letter-spacing: 3px;
                        }
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <h1>Verifica tu correo electrónico</h1>
                    </div>
                    <div class="content">
                        <div class="greeting">
                            Hola {{name}},
                        </div>
                        <div class="message">
                            Gracias por registrarte en nuestra plataforma. Para completar tu registro,
                            por favor utiliza el siguiente código de verificación:
                        </div>
                        <div class="code-container">
                            <div class="code">{{code}}</div>
                        </div>
                        <div class="message">
                            Este código expirará el <strong>{{expiresAt}}</strong>.
                            Si no solicitaste este código, puedes ignorar este correo.
                        </div>
                        <div class="expiry">
                            Por razones de seguridad, no compartas este código con nadie.
                        </div>
                    </div>
                    <div class="footer">
                        <p>Este es un correo automático, por favor no responder.</p>
                    </div>
                </div>
            </body>
            </html>
        '),
		('PASSWORDRESET','<!DOCTYPE html>
            <html>
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Recuperación de contraseña</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        line-height: 1.6;
                        color: #333;
                        margin: 0;
                        padding: 0;
                        background-color: #f4f4f4;
                    }
                    .container {
                        max-width: 600px;
                        margin: 20px auto;
                        padding: 0;
                        background-color: #ffffff;
                        border-radius: 8px;
                        overflow: hidden;
                        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                    }
                    .header {
                        background-color: #ff9800;
                        color: white;
                        padding: 30px 20px;
                        text-align: center;
                    }
                    .content {
                        padding: 30px 20px;
                    }
                    .button {
                        display: inline-block;
                        padding: 12px 24px;
                        background-color: #ff9800;
                        color: white;
                        text-decoration: none;
                        border-radius: 4px;
                        margin: 20px 0;
                    }
                    .warning {
                        background-color: #fff3e0;
                        padding: 15px;
                        border-radius: 4px;
                        margin: 20px 0;
                        font-size: 14px;
                        color: #e65100;
                    }
                    .footer {
                        background-color: #f8f9fa;
                        padding: 20px;
                        text-align: center;
                        font-size: 12px;
                        color: #888;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <h1>Recuperación de contraseña</h1>
                    </div>
                    <div class="content">
                        <div class="greeting">
                            Hola {{name}},
                        </div>
                        <div class="message">
                            Recibimos una solicitud para restablecer tu contraseña. 
                            Si no realizaste esta solicitud, puedes ignorar este correo.
                        </div>
                        <div style="text-align: center;">
                            <a href="{{resetUrl}}" class="button">Restablecer contraseña</a>
                        </div>
                        <div class="warning">
                            Este enlace expirará en {{expiresAt}}. 
                            Si no puedes acceder al botón, copia y pega el siguiente enlace en tu navegador:
                            <br><br>
                            {{resetUrl}}
                        </div>
                    </div>
                    <div class="footer">
                        <p>Por razones de seguridad, no compartas este enlace con nadie.</p>
                    </div>
                </div>
            </body>
            </html>');
GO

------------------- INSERTS DE PRUEBA ----------------------------

INSERT INTO users.tblUsers(email,password,name,idRole,isVerified)
VALUES	('estudiante@gmail.com','cea115f6db0fcae5bc6b1148d07249e446d0e295382fb562e6ca4d7a354525fe','Fulano de Tal',1,1),
		('admin@gmail.com','cea115f6db0fcae5bc6b1148d07249e446d0e295382fb562e6ca4d7a354525fe','Fulano Administrador',1,1);
GO

INSERT INTO users.tblStudents(idUser,accountNumber,enrollmentDate,currentPeriod)
VALUES	(1,'20221004546',GETDATE(),2);
GO

INSERT INTO users.tblStudentCareers(idStudent,idCareer)
VALUES	(1,1),
		(1,2);
