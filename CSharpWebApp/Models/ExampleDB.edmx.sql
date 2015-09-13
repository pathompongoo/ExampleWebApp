
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/13/2015 22:53:08
-- Generated from EDMX file: C:\Users\GMzo\documents\visual studio 2015\Projects\ExampleWebApp\CSharpWebApp\Models\ExampleDB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ExampleDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_StudentTeacher_Student]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudentTeacher] DROP CONSTRAINT [FK_StudentTeacher_Student];
GO
IF OBJECT_ID(N'[dbo].[FK_StudentTeacher_Teacher]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudentTeacher] DROP CONSTRAINT [FK_StudentTeacher_Teacher];
GO
IF OBJECT_ID(N'[dbo].[FK_StudentStudentSubject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudentSubjects] DROP CONSTRAINT [FK_StudentStudentSubject];
GO
IF OBJECT_ID(N'[dbo].[FK_TitlePerson]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People] DROP CONSTRAINT [FK_TitlePerson];
GO
IF OBJECT_ID(N'[dbo].[FK_SubjectStudentSubject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudentSubjects] DROP CONSTRAINT [FK_SubjectStudentSubject];
GO
IF OBJECT_ID(N'[dbo].[FK_TeacherSubject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Subjects] DROP CONSTRAINT [FK_TeacherSubject];
GO
IF OBJECT_ID(N'[dbo].[FK_GenderPerson]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People] DROP CONSTRAINT [FK_GenderPerson];
GO
IF OBJECT_ID(N'[dbo].[FK_Student_inherits_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People_Student] DROP CONSTRAINT [FK_Student_inherits_Person];
GO
IF OBJECT_ID(N'[dbo].[FK_Teacher_inherits_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People_Teacher] DROP CONSTRAINT [FK_Teacher_inherits_Person];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Logins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Logins];
GO
IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[Titles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Titles];
GO
IF OBJECT_ID(N'[dbo].[Subjects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Subjects];
GO
IF OBJECT_ID(N'[dbo].[StudentSubjects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StudentSubjects];
GO
IF OBJECT_ID(N'[dbo].[GenderSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GenderSet];
GO
IF OBJECT_ID(N'[dbo].[People_Student]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People_Student];
GO
IF OBJECT_ID(N'[dbo].[People_Teacher]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People_Teacher];
GO
IF OBJECT_ID(N'[dbo].[StudentTeacher]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StudentTeacher];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Logins'
CREATE TABLE [dbo].[Logins] (
    [Id] int  NOT NULL,
    [Username] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [UpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [FirstName_TH] nvarchar(max)  NOT NULL,
    [FirstName_EN] nvarchar(max)  NOT NULL,
    [LastName_TH] nvarchar(max)  NOT NULL,
    [LastName_EN] nvarchar(max)  NOT NULL,
    [Age] smallint  NOT NULL,
    [Id] int IDENTITY(1,1) NOT NULL,
    [UpdatedDate] datetime  NOT NULL,
    [Title_Id] int  NOT NULL,
    [Gender_Id] int  NOT NULL
);
GO

-- Creating table 'Titles'
CREATE TABLE [dbo].[Titles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name_TH] nvarchar(max)  NOT NULL,
    [Name_EN] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Subjects'
CREATE TABLE [dbo].[Subjects] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name_TH] nvarchar(max)  NOT NULL,
    [Name_EN] nvarchar(max)  NOT NULL,
    [UpdatedDate] datetime  NOT NULL,
    [Teacher_Id] int  NOT NULL
);
GO

-- Creating table 'StudentSubjects'
CREATE TABLE [dbo].[StudentSubjects] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Grade] real  NOT NULL,
    [UpdatedDate] datetime  NOT NULL,
    [Student_Id] int  NOT NULL,
    [Subject_Id] int  NOT NULL
);
GO

-- Creating table 'GenderSet'
CREATE TABLE [dbo].[GenderSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name_TH] nvarchar(max)  NOT NULL,
    [Name_EN] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'People_Student'
CREATE TABLE [dbo].[People_Student] (
    [GPA] real  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'People_Teacher'
CREATE TABLE [dbo].[People_Teacher] (
    [ClassRoom] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'StudentTeacher'
CREATE TABLE [dbo].[StudentTeacher] (
    [Student_Id] int  NOT NULL,
    [Teachers_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Logins'
ALTER TABLE [dbo].[Logins]
ADD CONSTRAINT [PK_Logins]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Titles'
ALTER TABLE [dbo].[Titles]
ADD CONSTRAINT [PK_Titles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Subjects'
ALTER TABLE [dbo].[Subjects]
ADD CONSTRAINT [PK_Subjects]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StudentSubjects'
ALTER TABLE [dbo].[StudentSubjects]
ADD CONSTRAINT [PK_StudentSubjects]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'GenderSet'
ALTER TABLE [dbo].[GenderSet]
ADD CONSTRAINT [PK_GenderSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'People_Student'
ALTER TABLE [dbo].[People_Student]
ADD CONSTRAINT [PK_People_Student]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'People_Teacher'
ALTER TABLE [dbo].[People_Teacher]
ADD CONSTRAINT [PK_People_Teacher]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Student_Id], [Teachers_Id] in table 'StudentTeacher'
ALTER TABLE [dbo].[StudentTeacher]
ADD CONSTRAINT [PK_StudentTeacher]
    PRIMARY KEY CLUSTERED ([Student_Id], [Teachers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Student_Id] in table 'StudentTeacher'
ALTER TABLE [dbo].[StudentTeacher]
ADD CONSTRAINT [FK_StudentTeacher_Student]
    FOREIGN KEY ([Student_Id])
    REFERENCES [dbo].[People_Student]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Teachers_Id] in table 'StudentTeacher'
ALTER TABLE [dbo].[StudentTeacher]
ADD CONSTRAINT [FK_StudentTeacher_Teacher]
    FOREIGN KEY ([Teachers_Id])
    REFERENCES [dbo].[People_Teacher]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentTeacher_Teacher'
CREATE INDEX [IX_FK_StudentTeacher_Teacher]
ON [dbo].[StudentTeacher]
    ([Teachers_Id]);
GO

-- Creating foreign key on [Student_Id] in table 'StudentSubjects'
ALTER TABLE [dbo].[StudentSubjects]
ADD CONSTRAINT [FK_StudentStudentSubject]
    FOREIGN KEY ([Student_Id])
    REFERENCES [dbo].[People_Student]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentStudentSubject'
CREATE INDEX [IX_FK_StudentStudentSubject]
ON [dbo].[StudentSubjects]
    ([Student_Id]);
GO

-- Creating foreign key on [Title_Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [FK_TitlePerson]
    FOREIGN KEY ([Title_Id])
    REFERENCES [dbo].[Titles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TitlePerson'
CREATE INDEX [IX_FK_TitlePerson]
ON [dbo].[People]
    ([Title_Id]);
GO

-- Creating foreign key on [Subject_Id] in table 'StudentSubjects'
ALTER TABLE [dbo].[StudentSubjects]
ADD CONSTRAINT [FK_SubjectStudentSubject]
    FOREIGN KEY ([Subject_Id])
    REFERENCES [dbo].[Subjects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubjectStudentSubject'
CREATE INDEX [IX_FK_SubjectStudentSubject]
ON [dbo].[StudentSubjects]
    ([Subject_Id]);
GO

-- Creating foreign key on [Teacher_Id] in table 'Subjects'
ALTER TABLE [dbo].[Subjects]
ADD CONSTRAINT [FK_TeacherSubject]
    FOREIGN KEY ([Teacher_Id])
    REFERENCES [dbo].[People_Teacher]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TeacherSubject'
CREATE INDEX [IX_FK_TeacherSubject]
ON [dbo].[Subjects]
    ([Teacher_Id]);
GO

-- Creating foreign key on [Gender_Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [FK_GenderPerson]
    FOREIGN KEY ([Gender_Id])
    REFERENCES [dbo].[GenderSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GenderPerson'
CREATE INDEX [IX_FK_GenderPerson]
ON [dbo].[People]
    ([Gender_Id]);
GO

-- Creating foreign key on [Id] in table 'People_Student'
ALTER TABLE [dbo].[People_Student]
ADD CONSTRAINT [FK_Student_inherits_Person]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'People_Teacher'
ALTER TABLE [dbo].[People_Teacher]
ADD CONSTRAINT [FK_Teacher_inherits_Person]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------