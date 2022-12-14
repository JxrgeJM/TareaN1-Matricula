USE [master]
GO
/****** Object:  Database [TareaN1_GestionMatricula]    Script Date: 23/10/2022 10:14:36 ******/
CREATE DATABASE [TareaN1_GestionMatricula]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TareaN1_GestionMatricula', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TareaN1_GestionMatricula.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TareaN1_GestionMatricula_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TareaN1_GestionMatricula_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TareaN1_GestionMatricula].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET ARITHABORT OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET RECOVERY FULL 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET  MULTI_USER 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TareaN1_GestionMatricula', N'ON'
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET QUERY_STORE = OFF
GO
USE [TareaN1_GestionMatricula]
GO
/****** Object:  User [UserMatricula]    Script Date: 23/10/2022 10:14:36 ******/
CREATE USER [UserMatricula] FOR LOGIN [UserMatricula] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[TB_Curso]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Curso](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Costo] [decimal](18, 2) NOT NULL,
	[TipoEscuela] [int] NOT NULL,
 CONSTRAINT [PK_TB_Curso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Estudiante]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Estudiante](
	[Identificacion] [varchar](20) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido1] [varchar](200) NOT NULL,
	[Apellido2] [varchar](200) NOT NULL,
	[FNacimiento] [date] NOT NULL,
	[FIngreso] [date] NOT NULL,
 CONSTRAINT [PK_TB_Estudiante] PRIMARY KEY CLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Matricula]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Matricula](
	[Estudiante] [varchar](20) NOT NULL,
	[Curso] [int] NOT NULL,
	[Cuatrimestre] [int] NOT NULL,
	[FMatricula] [datetime] NOT NULL,
	[Costo] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TB_Matricula] PRIMARY KEY CLUSTERED 
(
	[Estudiante] ASC,
	[Curso] ASC,
	[Cuatrimestre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_TipoEscuela]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_TipoEscuela](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TB_TipoEscuela] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TB_Curso] ([Id], [Nombre], [Descripcion], [Costo], [TipoEscuela]) VALUES (1, N'MATEMÁTICAS 1', N'INTRODUCCIÓN A LAS MATEMATICÁS', CAST(39800.70 AS Decimal(18, 2)), 1)
INSERT [dbo].[TB_Curso] ([Id], [Nombre], [Descripcion], [Costo], [TipoEscuela]) VALUES (2, N'MATEMÁTICAS 2', N'CALCULO 1', CAST(42200.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[TB_Curso] ([Id], [Nombre], [Descripcion], [Costo], [TipoEscuela]) VALUES (3, N'MATEMÁTICAS 3', N'CALCULO 2', CAST(42200.25 AS Decimal(18, 2)), 1)
INSERT [dbo].[TB_Curso] ([Id], [Nombre], [Descripcion], [Costo], [TipoEscuela]) VALUES (4, N'FUNDAMENTOS', N'FUNDAMENTOS DE PROGRAMACIÓN', CAST(37580.10 AS Decimal(18, 2)), 3)
INSERT [dbo].[TB_Curso] ([Id], [Nombre], [Descripcion], [Costo], [TipoEscuela]) VALUES (5, N'PROGRAMACIÓN 1', N'PROGRAMACIÓN NIVEL 1', CAST(35695.60 AS Decimal(18, 2)), 3)
INSERT [dbo].[TB_Curso] ([Id], [Nombre], [Descripcion], [Costo], [TipoEscuela]) VALUES (6, N'PROGRAMACIÓN 2', N'PROGRAMACIÓN NIVEL 2', CAST(39752.98 AS Decimal(18, 2)), 3)
INSERT [dbo].[TB_Curso] ([Id], [Nombre], [Descripcion], [Costo], [TipoEscuela]) VALUES (7, N'LITERATURA COSTARRICENSE', N'NIVEL 1', CAST(98500.10 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[TB_Estudiante] ([Identificacion], [Nombre], [Apellido1], [Apellido2], [FNacimiento], [FIngreso]) VALUES (N'206320620', N'JORGE', N'JIMENEZ', N'MELENDEZ', CAST(N'1987-04-28' AS Date), CAST(N'2022-10-18' AS Date))
INSERT [dbo].[TB_Estudiante] ([Identificacion], [Nombre], [Apellido1], [Apellido2], [FNacimiento], [FIngreso]) VALUES (N'909990999', N'PABLO', N'HIDALGO', N'JIMENEZ', CAST(N'2000-02-16' AS Date), CAST(N'2022-10-23' AS Date))
GO
INSERT [dbo].[TB_Matricula] ([Estudiante], [Curso], [Cuatrimestre], [FMatricula], [Costo]) VALUES (N'206320620', 1, 32022, CAST(N'2022-10-23T09:43:52.033' AS DateTime), CAST(39800.70 AS Decimal(18, 2)))
INSERT [dbo].[TB_Matricula] ([Estudiante], [Curso], [Cuatrimestre], [FMatricula], [Costo]) VALUES (N'206320620', 4, 32022, CAST(N'2022-10-23T09:44:14.720' AS DateTime), CAST(37580.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[TB_TipoEscuela] ([Id], [Nombre]) VALUES (1, N'MATEMÁTICAS')
INSERT [dbo].[TB_TipoEscuela] ([Id], [Nombre]) VALUES (2, N'LITERATURA')
INSERT [dbo].[TB_TipoEscuela] ([Id], [Nombre]) VALUES (3, N'ING. INFORMÁTICA')
GO
ALTER TABLE [dbo].[TB_Curso]  WITH CHECK ADD  CONSTRAINT [FK_TB_Curso_TB_TipoEscuela] FOREIGN KEY([TipoEscuela])
REFERENCES [dbo].[TB_TipoEscuela] ([Id])
GO
ALTER TABLE [dbo].[TB_Curso] CHECK CONSTRAINT [FK_TB_Curso_TB_TipoEscuela]
GO
ALTER TABLE [dbo].[TB_Matricula]  WITH CHECK ADD  CONSTRAINT [FK_TB_Matricula_TB_Curso] FOREIGN KEY([Curso])
REFERENCES [dbo].[TB_Curso] ([Id])
GO
ALTER TABLE [dbo].[TB_Matricula] CHECK CONSTRAINT [FK_TB_Matricula_TB_Curso]
GO
ALTER TABLE [dbo].[TB_Matricula]  WITH CHECK ADD  CONSTRAINT [FK_TB_Matricula_TB_Estudiante] FOREIGN KEY([Estudiante])
REFERENCES [dbo].[TB_Estudiante] ([Identificacion])
GO
ALTER TABLE [dbo].[TB_Matricula] CHECK CONSTRAINT [FK_TB_Matricula_TB_Estudiante]
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarCurso]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AgregarCurso] 
	@pNombre VARCHAR(50),
	@pDescripcion VARCHAR(100),
	@pCosto DECIMAL(18,2),
	@pTipoEscuela INT
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [dbo].[TB_Curso] VALUES ((SELECT ISNULL(MAX(Id), 0) + 1 FROM [dbo].[TB_Curso]), @pNombre, @pDescripcion, @pCosto, @pTipoEscuela);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarEstudiante]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AgregarEstudiante] 
	@pIdentificacion VARCHAR(20),
	@pNombre VARCHAR(50),
	@pApellido1 VARCHAR(200),
	@pApellido2 VARCHAR(200),
	@pFNacimiento DATE,
	@pFIngreso DATE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [dbo].[TB_Estudiante] VALUES (@pIdentificacion, @pNombre, @pApellido1, @pApellido2, @pFNacimiento, @pFIngreso);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarMatricula]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AgregarMatricula] 
	@pEstudiante VARCHAR(20),
	@pCurso INT,
	@pCuatrimestre INT,
	@pFMatricula DATETIME,
	@pCosto DECIMAL(18,2)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [dbo].[TB_Matricula] VALUES(@pEstudiante, @pCurso, @pCuatrimestre, @pFMatricula, @pCosto);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BorrarMatricula]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_BorrarMatricula]
	@pEstudiante VARCHAR(20),
	@pCurso INT,
	@pCuatrimestre INT
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM [dbo].[TB_Matricula] WHERE [Estudiante] = @pEstudiante AND [Curso] = @pCurso AND [Cuatrimestre] = @pCuatrimestre;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultaCantidadCursosMatriculados]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ConsultaCantidadCursosMatriculados]
	@pCuatrimestre INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT COUNT(DISTINCT Curso) Cantidad
	FROM [TareaN1_GestionMatricula].[dbo].[TB_Matricula]
	WHERE Cuatrimestre = @pCuatrimestre
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultaIngresosCuatrimestre]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ConsultaIngresosCuatrimestre] 
	@pCuatrimestre INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT SUM([Costo]) Total
	FROM [dbo].[TB_Matricula]
	WHERE Cuatrimestre = @pCuatrimestre
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultaMatriculadosCuatrimestre]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ConsultaMatriculadosCuatrimestre] 
	@pCuatrimestre INT,
	@pIdCurso INT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT T2.[Identificacion]
		  ,T2.[Nombre]
		  ,T2.[Apellido1]
		  ,T2.[Apellido2]
		  ,T2.[FNacimiento]
		  ,T2.[FIngreso]
	  FROM [dbo].[TB_Matricula] T1
	  INNER JOIN [dbo].[TB_Estudiante] T2 ON T1.Estudiante = T2.Identificacion
	  WHERE T1.Cuatrimestre = @pCuatrimestre AND T1.Curso = @pIdCurso
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarCursos]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ListarCursos] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [Id]
      ,[Nombre]
      ,[Descripcion]
      ,[Costo]
      ,[TipoEscuela]
	FROM [dbo].[TB_Curso]
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarEstudiantes]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ListarEstudiantes] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [Identificacion]
      ,[Nombre]
      ,[Apellido1]
      ,[Apellido2]
      ,[FNacimiento]
      ,[FIngreso]
  FROM [dbo].[TB_Estudiante];
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarMatricula]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ListarMatricula]
	@pCuatrimestre INT,
	@pEstudiante VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [Estudiante]
      ,[Curso]
      ,[Cuatrimestre]
      ,[FMatricula]
      ,[Costo]
  FROM [dbo].[TB_Matricula]
  WHERE [Cuatrimestre] = @pCuatrimestre
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarMatriculaEstudiante]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ListarMatriculaEstudiante]
	@pCuatrimestre INT,
	@pEstudiante VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [Estudiante]
      ,[Curso]
      ,[Cuatrimestre]
      ,[FMatricula]
      ,T1.[Costo]
	  ,T2.Nombre
	  ,T2.Descripcion
  FROM [dbo].[TB_Matricula] T1
  INNER JOIN [dbo].[TB_Curso] T2 ON T1.Curso = T2.Id
  WHERE [Cuatrimestre] = @pCuatrimestre AND [Estudiante] = @pEstudiante
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarTipoEscuela]    Script Date: 23/10/2022 10:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ListarTipoEscuela] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [Id]
      ,[Nombre]
	FROM [dbo].[TB_TipoEscuela]
END
GO
USE [master]
GO
ALTER DATABASE [TareaN1_GestionMatricula] SET  READ_WRITE 
GO
