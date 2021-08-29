USE [DapperDb]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 29/08/2021 20:06:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 29/08/2021 20:06:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Forename] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[GradeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentEmail]    Script Date: 29/08/2021 20:06:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentEmail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[EmailAddress] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Grade] ON 
GO
INSERT [dbo].[Grade] ([Id], [Title]) VALUES (1, N'10th Kup')
GO
INSERT [dbo].[Grade] ([Id], [Title]) VALUES (2, N'9th Kup')
GO
INSERT [dbo].[Grade] ([Id], [Title]) VALUES (3, N'8th Kup')
GO
SET IDENTITY_INSERT [dbo].[Grade] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 
GO
INSERT [dbo].[Student] ([Id], [Forename], [Surname], [DateOfBirth], [GradeId]) VALUES (1, N'Stefanie', N'Wardle', CAST(N'2005-06-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Student] ([Id], [Forename], [Surname], [DateOfBirth], [GradeId]) VALUES (2, N'Rose', N'Foster', CAST(N'2011-10-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Student] ([Id], [Forename], [Surname], [DateOfBirth], [GradeId]) VALUES (3, N'Abbie', N'Bannister', CAST(N'2003-03-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Student] ([Id], [Forename], [Surname], [DateOfBirth], [GradeId]) VALUES (4, N'Joshua', N'Davis', CAST(N'2012-09-01T00:00:00.000' AS DateTime), 2)
GO
INSERT [dbo].[Student] ([Id], [Forename], [Surname], [DateOfBirth], [GradeId]) VALUES (5, N'Kaden', N'Jensen', CAST(N'2007-02-01T00:00:00.000' AS DateTime), 3)
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentEmail] ON 
GO
INSERT [dbo].[StudentEmail] ([Id], [StudentId], [EmailAddress]) VALUES (1, 1, N'stefw@email.com')
GO
INSERT [dbo].[StudentEmail] ([Id], [StudentId], [EmailAddress]) VALUES (2, 2, N'jdavis@email.com')
GO
INSERT [dbo].[StudentEmail] ([Id], [StudentId], [EmailAddress]) VALUES (3, 1, N'stefward5@email.com')
GO
SET IDENTITY_INSERT [dbo].[StudentEmail] OFF
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([Id])
GO
ALTER TABLE [dbo].[StudentEmail]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[usp_GetStudentById]    Script Date: 29/08/2021 20:06:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetStudentById] 
	@Id INT
AS

BEGIN
	SELECT      * 
	FROM        dbo.Student s
	LEFT JOIN   dbo.StudentEmail se ON s.Id = se.StudentId
	LEFT JOIN   dbo.Grade g ON s.GradeId = g.Id
	WHERE       s.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetStudents]    Script Date: 29/08/2021 20:06:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetStudents]
	
AS

BEGIN
    SELECT      * 
    FROM        dbo.Student s
    LEFT JOIN   dbo.Grade g ON s.GradeId = g.Id
END
GO
