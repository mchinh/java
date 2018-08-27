USE [master]
GO
/****** Object:  Database [QuizSystem]    Script Date: 8/23/2018 1:32:19 PM ******/
CREATE DATABASE [QuizSystem]
GO
ALTER DATABASE [QuizSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuizSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuizSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuizSystem] SET  MULTI_USER 
GO
ALTER DATABASE [QuizSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuizSystem] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuizSystem]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 8/23/2018 1:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NULL,
	[IsCorrectAnswer] [bit] NULL,
	[Content] [nvarchar](500) NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 8/23/2018 1:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](500) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionQuiz]    Script Date: 8/23/2018 1:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionQuiz](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NULL,
	[QuizID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 8/23/2018 1:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[OwnedBy] [int] NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuizSession]    Script Date: 8/23/2018 1:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizSession](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[QuizID] [int] NULL,
	[StartedBy] [int] NULL,
	[StartedDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsInProgress] [bit] NULL,
 CONSTRAINT [PK_QuizSession] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/23/2018 1:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentQuizAnswer]    Script Date: 8/23/2018 1:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentQuizAnswer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[QuizSessionID] [int] NULL,
	[QuizID] [int] NULL,
	[QuestionID] [int] NULL,
	[AnswerID] [bigint] NULL,
	[CreatedTime] [datetime] NULL,
	[UpdatedTime] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentQuizSession]    Script Date: 8/23/2018 1:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentQuizSession](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuizSessionID] [int] NULL,
	[StudentID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 8/23/2018 1:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (1, 1, 1, N'A planet in our solar system')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (2, 1, 0, N'An orbit in our solar system')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (3, 1, 0, N'A comet in our solar system')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (4, 1, 0, N'An asteroid in our solar system')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (5, 3, 1, N'8 minutes')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (6, 3, 0, N'18  minutes')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (7, 3, 0, N'18 seconds')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (8, 3, 0, N'8 seconds')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (9, 3, 0, N'18 hours')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (10, 4, 0, N'Yes, it is')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (11, 4, 0, N'No, it is')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (12, 4, 0, N'Yes, it isn''t')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (13, 4, 1, N'No, it isn''t')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (14, 5, 1, N'Programming')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (15, 5, 0, N'Book Reading')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (16, 5, 0, N'Poem Writing')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (17, 5, 0, N'Paint Teaching')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (18, 6, 1, N'Hard Drive Disk')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (19, 6, 0, N'Hard Do Duck')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (20, 6, 0, N'How Done Dude')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (21, 6, 0, N'Hate Deal Dishes')
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([ID], [Content]) VALUES (1, N'What is Mars called?')
INSERT [dbo].[Question] ([ID], [Content]) VALUES (3, N'How long does light from the sun take to reach the Earth?')
INSERT [dbo].[Question] ([ID], [Content]) VALUES (4, N'Is Java Web hard?')
INSERT [dbo].[Question] ([ID], [Content]) VALUES (5, N'What is the job of a programmer?')
INSERT [dbo].[Question] ([ID], [Content]) VALUES (6, N'HDD is the short form of which?')
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuestionQuiz] ON 

INSERT [dbo].[QuestionQuiz] ([ID], [QuestionID], [QuizID]) VALUES (1, 1, 1)
INSERT [dbo].[QuestionQuiz] ([ID], [QuestionID], [QuizID]) VALUES (2, 3, 1)
INSERT [dbo].[QuestionQuiz] ([ID], [QuestionID], [QuizID]) VALUES (3, 4, 1)
INSERT [dbo].[QuestionQuiz] ([ID], [QuestionID], [QuizID]) VALUES (4, 5, 1)
INSERT [dbo].[QuestionQuiz] ([ID], [QuestionID], [QuizID]) VALUES (5, 6, 1)
SET IDENTITY_INSERT [dbo].[QuestionQuiz] OFF
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([ID], [Title], [CreatedDate], [OwnedBy]) VALUES (1, N'Funny Quiz for Workshop Class', CAST(N'2018-08-23 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Quiz] OFF
SET IDENTITY_INSERT [dbo].[QuizSession] ON 

INSERT [dbo].[QuizSession] ([ID], [Code], [QuizID], [StartedBy], [StartedDate], [EndDate], [IsInProgress]) VALUES (1, N'ABC1234A', 1, 1, CAST(N'2018-08-23 00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[QuizSession] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([ID], [Name]) VALUES (1, N'Tran Binh Duong')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[QuestionQuiz]  WITH CHECK ADD  CONSTRAINT [FK_QuestionQuiz_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[QuestionQuiz] CHECK CONSTRAINT [FK_QuestionQuiz_Question]
GO
ALTER TABLE [dbo].[QuestionQuiz]  WITH CHECK ADD  CONSTRAINT [FK_QuestionQuiz_Quiz] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([ID])
GO
ALTER TABLE [dbo].[QuestionQuiz] CHECK CONSTRAINT [FK_QuestionQuiz_Quiz]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Teacher] FOREIGN KEY([OwnedBy])
REFERENCES [dbo].[Teacher] ([ID])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Teacher]
GO
ALTER TABLE [dbo].[QuizSession]  WITH CHECK ADD  CONSTRAINT [FK_QuizSession_Quiz] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([ID])
GO
ALTER TABLE [dbo].[QuizSession] CHECK CONSTRAINT [FK_QuizSession_Quiz]
GO
ALTER TABLE [dbo].[QuizSession]  WITH CHECK ADD  CONSTRAINT [FK_QuizSession_Teacher] FOREIGN KEY([StartedBy])
REFERENCES [dbo].[Teacher] ([ID])
GO
ALTER TABLE [dbo].[QuizSession] CHECK CONSTRAINT [FK_QuizSession_Teacher]
GO
ALTER TABLE [dbo].[StudentQuizAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuizAnswer_Answer] FOREIGN KEY([AnswerID])
REFERENCES [dbo].[Answer] ([ID])
GO
ALTER TABLE [dbo].[StudentQuizAnswer] CHECK CONSTRAINT [FK_StudentQuizAnswer_Answer]
GO
ALTER TABLE [dbo].[StudentQuizAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuizAnswer_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[StudentQuizAnswer] CHECK CONSTRAINT [FK_StudentQuizAnswer_Question]
GO
ALTER TABLE [dbo].[StudentQuizAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuizAnswer_QuizSession] FOREIGN KEY([QuizSessionID])
REFERENCES [dbo].[QuizSession] ([ID])
GO
ALTER TABLE [dbo].[StudentQuizAnswer] CHECK CONSTRAINT [FK_StudentQuizAnswer_QuizSession]
GO
ALTER TABLE [dbo].[StudentQuizAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuizAnswer_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentQuizAnswer] CHECK CONSTRAINT [FK_StudentQuizAnswer_Student]
GO
ALTER TABLE [dbo].[StudentQuizSession]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuizSession_QuizSession] FOREIGN KEY([QuizSessionID])
REFERENCES [dbo].[QuizSession] ([ID])
GO
ALTER TABLE [dbo].[StudentQuizSession] CHECK CONSTRAINT [FK_StudentQuizSession_QuizSession]
GO
ALTER TABLE [dbo].[StudentQuizSession]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuizSession_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentQuizSession] CHECK CONSTRAINT [FK_StudentQuizSession_Student]
GO
USE [master]
GO
ALTER DATABASE [QuizSystem] SET  READ_WRITE 
GO
