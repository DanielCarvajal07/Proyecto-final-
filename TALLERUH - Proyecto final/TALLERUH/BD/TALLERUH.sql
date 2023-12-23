
CREATE DATABASE TALLERUH
GO

USE TALLERUH
GO

CREATE TABLE Usuarios --1
(
	UsuarioID int identity (10,1) PRIMARY KEY,
	Nombre varchar (50) NOT NULL,
	CorreoElectronico varchar (50) NOT NULL,
	Telefono varchar (50) NOT NULL

)
GO
CREATE TABLE Tecnicos --2
(
	TecnicoID int identity (20,1) PRIMARY KEY,
	Nombre varchar (50) NOT NULL,
	Especialidad varchar (50) NOT NULL,

)
GO
CREATE TABLE Equipos --3
(
	EquipoID int identity (30,1),
	UsuarioID int ,

	TipoEquipo varchar (15) NOT NULL, -- Primaria
	Modelo varchar (15) NOT NULL, -- Primaria
	CONSTRAINT fk_UsuarioID FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID), -- Segundaria
	CONSTRAINT fk_EquipoID PRIMARY KEY (EquipoID) -- Primaria

)
GO
CREATE TABLE Reparaciones --4
(
	ReparacionID int identity (40,1),
	EquipoID int,
	
	Estado varchar (15) NOT NULL, -- Primaria
	FechaSolicitud datetime NOT NULL CONSTRAINT df_fecha DEFAULT GETDATE(), -- Primaria
	CONSTRAINT fk_CodEquipoID FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID), -- Segundaria
	CONSTRAINT fk_ReparacionID PRIMARY KEY (ReparacionID) -- Primaria

)
GO
CREATE TABLE Asignaciones --5
(
	AsignacionID int identity (50,1),
	TecnicoID int,
	ReparacionID int,
	
	CONSTRAINT fk_ReparacionID1 FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID), -- Segundaria
	CONSTRAINT fk_TecnicoID FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(TecnicoID), -- Segundaria
	FechaAsignacion datetime NOT NULL CONSTRAINT df_fechaAsig DEFAULT GETDATE(), -- Primaria
	CONSTRAINT fk_AsignacionID PRIMARY KEY (AsignacionID) -- Primaria
)
GO
CREATE TABLE DetallesReparacion --6
(
	DetalleID int identity (60,1),
	ReparacionID int ,
	
	CONSTRAINT fk_CodReparacionID2 FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID), -- Segundaria
	Descripcion varchar (50) NOT NULL, -- Primaria
	FechaIncio datetime NOT NULL CONSTRAINT df_fechaInicio DEFAULT GETDATE(), -- Primaria
	FechaFin datetime NOT NULL CONSTRAINT df_fechaFin DEFAULT GETDATE(), -- Primaria
	CONSTRAINT fk_DetalleID PRIMARY KEY (DetalleID) -- Primaria
)
GO


-- Tablas adicionales

CREATE TABLE TiposLista --Adicional 1 - Dimencional, Masa, Volumen, Electrico
(
	
	TipoEquipo varchar (15) NOT NULL,
	
)
GO
CREATE TABLE TiposListaEspecialidad --Adicional 2 - Mecanica, Hidraulica, Plomeria, Ingenieria
(
	
	TipoEspecialidad varchar (15) NOT NULL,
	
)
GO
CREATE TABLE TiposEstadoReparacion --Adicional 3 - Pendiente, Asignada, En proceso, Completada
(
	
	TipoEstado varchar (15) NOT NULL,
	
)
GO
-- PROCEDEMIENTOS ALMACENADOS Usuario
CREATE PROCEDURE AGREGARUSUARIO

	@Nombre VARCHAR(50),
	@Correo VARCHAR(50),
	@Telefono VARCHAR(50)
AS
	BEGIN 
		INSERT INTO Usuarios (Nombre, CorreoElectronico, Telefono)
		VALUES (@Nombre, @Correo, @Telefono)
	END
GO

CREATE PROCEDURE BORRARUSUARIO

	@CODIGO INT 
	AS
		BEGIN 
			DELETE Usuarios WHERE UsuarioID = @CODIGO
		END
GO
CREATE PROCEDURE ACTUALIZARUSUARIO
	@CODIGO INT,
	@Nombre VARCHAR(50),
	@Correo VARCHAR(50),
	@Telefono VARCHAR(50)
	AS
		BEGIN
			UPDATE Usuarios SET Nombre = @Nombre WHERE UsuarioID = @CODIGO
			UPDATE Usuarios SET CorreoElectronico = @Correo WHERE UsuarioID = @CODIGO
			UPDATE Usuarios SET Telefono = @Telefono WHERE UsuarioID = @CODIGO
		END
GO
CREATE PROCEDURE CONSULTAUSUARIO_FILTRO
	@CODIGO INT
	AS
		BEGIN
			SELECT * FROM Usuarios WHERE UsuarioID = @CODIGO
		END
GO

-- PROCEDEMIENTOS ALMACENADOS Tecnicos

CREATE PROCEDURE AGREGARTECNICO

	@Nombre VARCHAR(50),
	@Especialidad VARCHAR(50)
	
AS
	BEGIN 
		INSERT INTO Tecnicos (Nombre, Especialidad)
		VALUES (@Nombre, @Especialidad)
	END
GO
CREATE PROCEDURE BORRARTECNICO

	@CODIGO INT 
	AS
		BEGIN 
			DELETE Tecnicos WHERE TecnicoID = @CODIGO
		END
GO
CREATE PROCEDURE ACTUALIZARTECNICO
	@CODIGO INT,
	@Nombre VARCHAR(50),
	@Especialidad VARCHAR(50)

	AS
		BEGIN
			UPDATE Tecnicos SET Nombre = @Nombre WHERE TecnicoID = @CODIGO
			UPDATE Tecnicos SET Especialidad = @Especialidad WHERE TecnicoID = @CODIGO
			
		END
GO

CREATE PROCEDURE CONSULTATECNICO_FILTRO
	@CODIGO INT
	AS
		BEGIN
			SELECT * FROM Tecnicos WHERE TecnicoID = @CODIGO
		END
GO
-- PROCEDEMIENTOS ALMACENADOS Equipos
CREATE PROCEDURE AGREGAREQUIPO

	@UsuarioID int,
	@TipoEquipo VARCHAR(50),
	@Modelo VARCHAR(50)

	
AS
	BEGIN 
		INSERT INTO Equipos (UsuarioID, TipoEquipo, Modelo)
		VALUES (@UsuarioID, @TipoEquipo, @Modelo)
	END
GO
CREATE PROCEDURE BORRAREQUIPO

	@CODIGO INT 
	AS
		BEGIN 
			DELETE Equipos WHERE EquipoID = @CODIGO
		END
GO
CREATE PROCEDURE ACTUALIZAREQUIPO
	@CODIGO INT,
	@UsuarioID int,
	@TipoEquipo VARCHAR(50),
	@Modelo VARCHAR(50)

	AS
		BEGIN
			UPDATE Equipos SET UsuarioID = @UsuarioID WHERE EquipoID = @CODIGO
			UPDATE Equipos SET TipoEquipo = @TipoEquipo WHERE EquipoID = @CODIGO
			UPDATE Equipos SET Modelo = @Modelo WHERE EquipoID = @CODIGO
		END
Go
CREATE PROCEDURE CONSULTAEQUIPO_FILTRO
	@CODIGO INT
	AS
		BEGIN
			SELECT * FROM Equipos  WHERE EquipoID  = @CODIGO
		END
GO
--Procedimientos Tablas Adicional
CREATE PROCEDURE AGREGAREquipoLISTA

	@Tipo VARCHAR(50)

	AS
		BEGIN 
			INSERT INTO TiposLista (TipoEquipo)
			VALUES (@Tipo)
		END
GO
CREATE PROCEDURE AGREGAREspecialidadLISTA

	@Tipo VARCHAR(50)

	AS
		BEGIN 
			INSERT INTO TiposListaEspecialidad (TipoEspecialidad)
			VALUES (@Tipo)
		END
Go
CREATE PROCEDURE AGREGAREstadoLISTA

	@Tipo VARCHAR(15)

	AS
		BEGIN 
			INSERT INTO TiposEstadoReparacion (TipoEstado)
			VALUES (@Tipo)
		END
Go
EXEC AGREGAREquipoLISTA 'Electrico' --Adicional 1 - Dimencional, Masa, Volumen, Electrico
EXEC AGREGAREquipoLISTA 'Dimencional' --Adicional 1 - Dimencional, Masa, Volumen, Electrico
EXEC AGREGAREquipoLISTA 'Masa' --Adicional 1 - Dimencional, Masa, Volumen, Electrico
EXEC AGREGAREquipoLISTA 'Volumen' --Adicional 1 - Dimencional, Masa, Volumen, Electrico

EXEC AGREGAREspecialidadLISTA 'Ingenieria' --Adicional 2 - Mecanica, Hidraulica, Plomeria, Ingenieria
EXEC AGREGAREspecialidadLISTA 'Mecanica' --Adicional 2 - Mecanica, Hidraulica, Plomeria, Ingenieria
EXEC AGREGAREspecialidadLISTA 'Hidraulica'
EXEC AGREGAREspecialidadLISTA 'Plomeria'
EXEC AGREGAREspecialidadLISTA 'Informatica'


EXEC AGREGAREstadoLISTA 'Pendiente' --Adicional 3 - Pendiente, Asignada, Detenido, En proceso, Completada
EXEC AGREGAREstadoLISTA 'Asignada' --Adicional 3 - Pendiente, Asignada, Detenido, En proceso, Completada
EXEC AGREGAREstadoLISTA 'Detenido'
EXEC AGREGAREstadoLISTA 'En proceso'
EXEC AGREGAREstadoLISTA 'Completada'



GO

-- PROCEDEMIENTOS ALMACENADOS -Continuacion de examen!! 

-- Detalle de reparacion

CREATE PROCEDURE AGREGAR_DETALLEREPARACION
	@ReparacionID int,
    @Descripcion varchar (50),
    @FechaIncio DATETIME,
    @FechaFin DATETIME
AS
BEGIN 
    INSERT INTO DetallesReparacion (ReparacionID, Descripcion, FechaIncio, FechaFin)
    VALUES (@ReparacionID, @Descripcion, @FechaIncio, @FechaFin)
END
Go

CREATE PROCEDURE ACTUALIZAR_DETALLEREPARACION

	@DetalleID int,
	@ReparacionID int,
    @Descripcion varchar (50),
    @FechaIncio DATETIME,
    @FechaFin DATETIME

	AS
		BEGIN
			UPDATE DetallesReparacion SET ReparacionID = @ReparacionID WHERE DetalleID = @DetalleID
			UPDATE DetallesReparacion SET Descripcion = @Descripcion WHERE DetalleID = @DetalleID
			UPDATE DetallesReparacion SET FechaIncio = @FechaIncio WHERE DetalleID = @DetalleID
			UPDATE DetallesReparacion SET FechaFin = @FechaFin WHERE DetalleID = @DetalleID
		END
Go


-- Asignaciones
CREATE PROCEDURE AGREGARASIGNACION
    @ReparacionID int,
    @TecnicoID int,
    @FechaAsignacion DATETIME
AS
BEGIN 
    INSERT INTO Asignaciones (ReparacionID, TecnicoID, FechaAsignacion)
    VALUES (@ReparacionID, @TecnicoID, @FechaAsignacion)
END
Go
CREATE PROCEDURE BORRARASIGNACION

	@CODIGO INT 
	AS
		BEGIN 
			DELETE Asignaciones WHERE AsignacionID = @CODIGO
		END
Go
CREATE PROCEDURE ACTUALIZARASIGNACION
	@CODIGO INT,
	@ReparacionID int,
	@TecnicoID int,
	@FechaAsignacion DATETIME

	AS
		BEGIN
			UPDATE Asignaciones SET ReparacionID = @ReparacionID WHERE AsignacionID = @CODIGO
			UPDATE Asignaciones SET TecnicoID = @TecnicoID WHERE AsignacionID = @CODIGO
			UPDATE Asignaciones SET FechaAsignacion = @FechaAsignacion WHERE AsignacionID = @CODIGO
		END
Go
CREATE PROCEDURE CONSULTAASIGNACION_FILTRO
	@CODIGO INT
	AS
		BEGIN
			SELECT * FROM Asignaciones  WHERE AsignacionID  = @CODIGO
		END
GO
-- Reparacion: Agregar metodos

CREATE PROCEDURE AGREGAR_REPARACION
	@EquipoID int,
    @Estado varchar (50),
    @FechaSolicitud DATETIME
    
AS
BEGIN 
    INSERT INTO Reparaciones (EquipoID, Estado, FechaSolicitud)
    VALUES (@EquipoID, @Estado, @FechaSolicitud)
END
Go

CREATE PROCEDURE ACTUALIZAR_REPARACION

	@ReparacionID int,
	@EquipoID int,
    @Estado varchar (50),
    @FechaSolicitud DATETIME

	AS
		BEGIN
			UPDATE Reparaciones SET EquipoID = @EquipoID WHERE ReparacionID = @ReparacionID
			UPDATE Reparaciones SET Estado = @Estado WHERE ReparacionID = @ReparacionID
			UPDATE Reparaciones SET FechaSolicitud = @FechaSolicitud WHERE ReparacionID = @ReparacionID

		END
Go











-- Detalle Reparacion : Agregar metodos
-- Login 
Create Table LoginUsuarios 
(
	IDUsuario int identity,
	Correo varchar(50) NOT NULL,
	Clave varchar(50) NOT NULL,
	Nombre Varchar(50) NOT NULL

	Constraint pk_IDUsuario Primary Key (IDUsuario),
	Constraint uq_Correo UNIQUE (Correo)
)
GO
Create Table LoginRoles 
(
	IDRol int identity,
	Descripcion varchar(50) NOT NULL	

	Constraint pk_IDRol Primary Key (IDRol)
)
GO
Create Table LoginUsuariosYRoles
(
	ID int identity,
	IDUsuario int,
	IDRol int,

	Constraint pk_IDUsuarioRoles Primary Key (ID),
	Constraint pk_UsuarioID Foreign Key (IDUsuario) references LoginUsuarios(IDUsuario),
	Constraint fk_IdRol FOREIGN KEY (IDRol) References LoginRoles(IDRol)
)
GO
create procedure ValidarUsuario
	@Correo varchar(50),
	@Contraseña varchar(50)
AS
	BEGIN
		select Correo , Clave from LoginUsuarios where Correo = @Correo and Clave = @Contraseña
	END
GO










--Generacion de datos por defecto
Exec AGREGARUSUARIO 'Andres', 'Andres96@gmail.com', '2290-5110'
Exec AGREGAREQUIPO 10, 'Electrico', 'Caterpilar'


INSERT INTO LoginUsuarios (Correo, Clave, Nombre)
    VALUES ('Admin', 'Admin', 'Admin')

Exec AGREGAREQUIPO 10, 'Electrico', 'Caterpilar'

EXEC AGREGAR_REPARACION 30, 'Pendiente', '2023-12-22'

Exec AGREGARTECNICO 'Juan', 'Ingenieria'
Exec AGREGARASIGNACION 40, 20, '2023-12-22'


Exec ACTUALIZAR_REPARACION 40, 30, 'Pendiente', '2023-12-23'




--Inner Join


	SELECT T.Nombre, T.Especialidad, A.FechaAsignacion, A.AsignacionID
	FROM Asignaciones A
	INNER JOIN  Tecnicos T
	ON T.TecnicoID = A.TecnicoID




--CREATE PROCEDURE INNERJOIN4
--    @ROL Varchar(20),
--    @TECNICOID int = 0
--AS
--BEGIN
--    IF @ROL = 'Admin'
--    BEGIN
--        SELECT Tecnicos.nombre, Tecnicos.especialidad, A.FechaAsignacion, A.AsignacionID
--        FROM Tecnicos
--        INNER JOIN Asignaciones A ON Tecnicos.TecnicoID = A.TecnicoID
--    END
--    ELSE
--    BEGIN
--        SELECT Tecnicos.nombre, Tecnicos.especialidad, A.FechaAsignacion, A.AsignacionID
--        FROM Tecnicos
--        INNER JOIN Asignaciones A ON Tecnicos.TecnicoID = A.TecnicoID
--        WHERE Tecnicos.TecnicoID = @TECNICOID
--    END
--END
--GO



