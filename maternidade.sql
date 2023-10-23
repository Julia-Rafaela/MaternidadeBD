CREATE DATABASE maternidade
GO
USE maternidade

GO
CREATE TABLE mae(
ID_Mae         INT				NOT NULL IDENTITY(1001,1),
nome           VARCHAR(60)      NOT NULL,
logradouro     VARCHAR(100)     NOT NULL,
numero         INT              NOT NULL CHECK (numero > 0),
cep            CHAR(8)          NOT NULL CHECK (cep = 08),
complemento    VARCHAR(200)     NOT NULL,
telefone       CHAR(10)         NOT NULL CHECK(telefone = 10),
data_nasc       DATE            NOT NULL
PRIMARY KEY (ID_Mae)
)

GO
CREATE TABLE bebe(
ID_Bebe         INT				NOT NULL IDENTITY(1,1),
nome            VARCHAR(60)     NOT NULL,
data_nasc       DATE            NOT NULL DEFAULT('23-10-2023') ,
altura          DECIMAL(7,2)	NOT NULL CHECK (altura > 0),
peso            DECIMAL(4,3)	NOT NULL CHECK (peso > 0),
ID_Mae         INT				NOT NULL
PRIMARY KEY(ID_Bebe)
FOREIGN KEY(ID_Mae) REFERENCES mae(ID_Mae)
)

GO 
CREATE TABLE medico(
CRM_Numero				INT         	NOT NULL,
CRM_UF				    CHAR(2)        	NOT NULL,
nome		            VARCHAR(60)		NOT NULL,
telefone_cel            CHAR(11)        NOT NULL CHECK(telefone_cel = 11) UNIQUE,
especialidade           VARCHAR(30)     NOT NULL
PRIMARY KEY (CRM_Numero,CRM_UF)
)

GO
CREATE TABLE bebe_medico(
ID_Bebe         INT				NOT NULL,
CRM_Numero		INT         	NOT NULL,
CRM_UF		    CHAR(2)        	NOT NULL
PRIMARY KEY (ID_bebe, CRM_Numero, CRM_UF)
FOREIGN KEY (ID_bebe) REFERENCES bebe(ID_bebe),
FOREIGN KEY (CRM_Numero, CRM_UF) REFERENCES medico(CRM_Numero, CRM_UF)
)
