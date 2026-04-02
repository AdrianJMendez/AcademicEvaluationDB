USE DbAcademicEvaluation;
GO

------	INSERTS INICIALES ---------------------
INSERT INTO asset.tblStatusTypes(statusTypeName, description)
VALUES	('EMAIL_VERIFICATION','Estados por los que pasa un correo de verificación de usuario.'),
		('REQUEST','Estados que puede tener una solicitud de evaluación académica.')
GO

INSERT INTO asset.tblStatus(statusName, idStatusType)
VALUES	('VERIFIED',1),('EXPIRED',1),('PENDING',1),
		('pending',2),('in-review',2),('reviewed',2)
GO

INSERT INTO users.tblRoles(roleName,isPublic)
VALUES	('student',1),('employee',1),('admin',1);
GO

INSERT INTO academy.tblCareers(careerCode,careerName,facultyName,totalPeriods,yearLength)
VALUES	('IS','Ingenieria en Sistemas','Ingenieria',15,5),
		('AGE','Administracion de Empresas','Ciencias Economicas',20,6);
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

INSERT INTO academy.tblSubjects(subjectCode,subjectName,idealPeriod,credits,hours,subjectType)
VALUES							
								('IS110',	'Introducción. a la Ingeniería en Sistemas',	1,			3,		3,	'?'),
								('MM110',	'Matematicas',	1,			5,		5,	'?'),
								('MM111',	'Geometría y Trigonometría',	1,			5,		5,	'?'),
								('SC101',	'Sociología',	1,			4,		4,	'?'),
								--SEGUNDO PERIODO
								('MM201',	'Calculo I',	2,			5,		5,	'?'),
								('MM211',	'Vectores y Matrices',	2,			3,		3,	'?'),
								('IN101',	'Ingles I',	2,			4,		4,	'?'),
								--TERCER PERIODO
								('MM314',	'Programación I',	3,			3,		3,	'?'),
								('MM202',	'Calculo II',	3,			5,		5,	'?'),
								('IN102',	'Ingles II',	3,			4,		4,	'?'),
								('EG011',	'Español General I',	3,			4,		4,	'?'),
								--CUARTO PERIODO
								('FS100',	'Física I',	4,		5,		5,	'?'),
								('MM411',	'Ecuaciones Diferenciales',	4,			3,		3,	'?'),
								('IS210',	'Programación II',	4,			4,		4,	'?'),
								('FF101',	'Filosofia',	4,			4,		4,	'?'),
								--QUINTO PERIODO
								('IN103',	'Ingles III',	5,			4,		4,	'?'),
								('DQ101',	'Dibujo I ',	5,			2,		2,	'?'),
								('FS200',	'Fisica II',	5,			5,		5,	'?'),
								('IS311',	'Circuitos Eléctricos',	5,			3,		3,	'?'),
								--SEXTO PERIODO
								('MM420',	'Matematica Discretas',	6,			4,		4,	'?'),
								('DQ102',	'Dibujo II ',	6,			2,		2,	'?'),
								('MM401',	'Estadística',	6,			3,		3,	'?'),
								('IS310',	'Algoritmos y Estructura De Datos',	6,			4,		4,	'?'),
								--SEPTIMO PERIODO
								('IS410',	'Programación Orientada a Objetos',	7,			5,		5,	'?'),
								('IS411',	'Electronica para Ing. en Sistemas',	7,			3,		3,	'?'),
								('IS412',	'Sistemas Operativos I ',	7,			5,		5,	'?'),
								--OCTAVO PERIODO
								('IS501',	'Base de Datos I',	8,			5,		5,	'?'),
								('HH101',	'Historia de Honduras',	8,			4,		4,	'?'),
								('IS510',	'Instalaciones Electricas',	8,			3,		3,	'?'),
								('IS511',	'Redes de Datos I',	8,			4,		4,	'?'),
								--NOVENO PERIODO
								('IS512',	'Sistemas Operativos II',	9,			4,		4,	'?'),
								('IS601',	'Base de Datos II',	9,			4,		4,	'?'),
								('IS603 ',	'Arquitectura de Computadoras',	9,			4,		4,	'?'),
								('IS513',	'Lenguajes de Programacion',	9,			4,		4,	'?'),
								--DECIMO PERIODO
								('IS611',	'Redes de Datos II',	10,			4,		4,	'?'),
								('IS711',	'Diseño Digital',	10,			4,		4,	'?'),
								('IS602',	'Sistemas de Información',	10,			4,		4,	'?'),
								--ONCEAVO PERIODO
								('IS811',	'Seguridad Informática',	11	,		4,		4,	'?'),
								('IS720',	'Administración I',	11,			4,		4,	'?'),
								('IS702',	'Análisis y Diseño',	11,			4,		4,	'?'),
								--DOCEAVO PERIODO
								('IS721',	'Contabilidad I',	12	,		4,		4,	'?'),
								('IS903',	'Auditoria Informática',	12	,		3,		3,	'?'),
								('IS701',	'Inteligencia Artificial',	12,			4,		4,	'?'),
								('IS802',	'Ingeniería en Software',	12	,		4,		4,	'?'),
								--TRECEAVO PERIODO
								('IS820',	'Finanzas Administrativas',	13	,		4,		4,	'?'),
								('IS902',	'Industria del Software',	13	,		4,		4,	'?'),
								('IS904',	'Gerencia Informática',	13	,		4,		4,	'?'),
								--CATORCEAVO PERIODO			POCAS CLASES PARA METER ACA LAS OPTATIVAS DE LA CARRERA
								('IS905',	'Economía Digital',	14	,		5,		5,	'?'),
								('IS906',	'Topicos Especiales y Avanzados',	14	,		3,		3,	'?'),
								--QUINCEAVO PERIODO
								('IS115',	'Seminario de Investigación',	15	,		4,		4,	'?'),
								-----CLASES ELECTIVAS GENERALES
								--AREA DE DEPORTE  // ARTE
								('RR189',	'Ajedrez',	1	,		3,		3,	'?'),
								('RR172',	'Baloncesto',	1	,		3,		3,	'?'),
								('RR171',	'Futbol',	1	,		3,		3,	'?'),
								('RR181',	'Primeros Auxilios',	1	,		3,		3,	'?'),
								--AREA DE HUMANIDADES
								('EO021',	'Tecnicas de Lectura',	1	,		3,		3,	'?'),
								('EO025',	'Redaccion General',	1	,		3,		3,	'?'),
								('EO026',	'Literatura Hondureña',	1	,		3,		3,	'?'),
								--AREA DE CIENCIAS NATURALES
								('BI130',	'Educacion Ambiental',	1	,		3,		3,	'?'),
								('AN111',	'Introduccion a la Astronomia',	1	,		3,		3,	'?')

GO

INSERT INTO academy.tblSubjects(subjectCode,subjectName,idealPeriod,credits,hours,subjectType,isOptative)
VALUES							--CLASES OPTATIVAS DE SISTEMAS
								('IS910',	'Teoría de la Simulación',	14	,		3,		3,	'?',1),
								('IS911',	'Microprocesadores',	14	,		3,		3,	'?',1),
								('IS914',	'Liderazgo para el cambio',	14	,		3,		3,	'?',1),
								('IS912',	'Sistemas Expertos',	14	,		3,		3,	'?',1),
								('IS913',	'Diseño de Compiladores',	14	,		3,		3,	'?',1);
GO

INSERT INTO academy.tblCareerSubjects(idCareer, idSubject)
SELECT 1, idSubject FROM academy.tblSubjects
GO

INSERT INTO academy.tblSubjectPrerequisites(idSubject,idPrerequisiteSubject)
VALUES	( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM211')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM110') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM201')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM110') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM201')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM111') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM202')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM201') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IN102')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IN101') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM314')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM110') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM314')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS110') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'FS100')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM201') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'FS100')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM211') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM411')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM202') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS210')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM314') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IN103')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IN102') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'DQ101')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM211') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'FS200')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'FS100') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS311')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM411') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS311')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'FS100') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM420')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM314') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM420')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'FF101') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'DQ102')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'DQ101') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM401')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM202') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS310')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS210') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS410')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS310') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS411')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS311') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS412')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS310') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS412')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM420') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS501')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM401') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS501')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS410') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS510')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS311') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS511')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS411') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS512')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS412') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS601')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS501') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS603')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS511') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS513')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS410') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS611')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS511') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS711')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS603') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS602')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS513') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS811')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS711') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS811')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS512') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS720')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'MM420') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS702')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS602') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS721')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS720') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS903')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS811') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS701')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS601') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS701')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS602') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS802')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS702') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS820')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS721') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS902')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS802') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS904')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS811') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS906')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS904') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS905')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS820') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS115')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS905') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS910')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS904') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS911')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS603') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS914')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS820') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS912')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS701') ),
		( (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS913')  ,   (SELECT idSubject FROM academy.tblSubjects WHERE subjectCode = 'IS603') )
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
