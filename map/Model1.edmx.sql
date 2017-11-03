
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/03/2017 16:44:06
-- Generated from EDMX file: C:\Users\LAPTOP\Source\Repos\map\map\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MiBasesita];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UsuarioReserva]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReservaSet] DROP CONSTRAINT [FK_UsuarioReserva];
GO
IF OBJECT_ID(N'[dbo].[FK_DocumentoReserva]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReservaSet] DROP CONSTRAINT [FK_DocumentoReserva];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioPrestamo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PrestamoSet] DROP CONSTRAINT [FK_UsuarioPrestamo];
GO
IF OBJECT_ID(N'[dbo].[FK_PrestamoDetalle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DetalleSet] DROP CONSTRAINT [FK_PrestamoDetalle];
GO
IF OBJECT_ID(N'[dbo].[FK_MultaDetalle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MultaSet] DROP CONSTRAINT [FK_MultaDetalle];
GO
IF OBJECT_ID(N'[dbo].[FK_DocumentoEjemplar]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EjemplarSet] DROP CONSTRAINT [FK_DocumentoEjemplar];
GO
IF OBJECT_ID(N'[dbo].[FK_EjemplarDetalle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DetalleSet] DROP CONSTRAINT [FK_EjemplarDetalle];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoriaDocumento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DocumentoSet] DROP CONSTRAINT [FK_CategoriaDocumento];
GO
IF OBJECT_ID(N'[dbo].[FK_DocumentoAutoria]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AutoriaSet] DROP CONSTRAINT [FK_DocumentoAutoria];
GO
IF OBJECT_ID(N'[dbo].[FK_AutorAutoria]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AutoriaSet] DROP CONSTRAINT [FK_AutorAutoria];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UsuarioSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsuarioSet];
GO
IF OBJECT_ID(N'[dbo].[ReservaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReservaSet];
GO
IF OBJECT_ID(N'[dbo].[DocumentoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DocumentoSet];
GO
IF OBJECT_ID(N'[dbo].[EjemplarSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EjemplarSet];
GO
IF OBJECT_ID(N'[dbo].[CategoriaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategoriaSet];
GO
IF OBJECT_ID(N'[dbo].[DetalleSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DetalleSet];
GO
IF OBJECT_ID(N'[dbo].[PrestamoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrestamoSet];
GO
IF OBJECT_ID(N'[dbo].[MultaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MultaSet];
GO
IF OBJECT_ID(N'[dbo].[AutorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AutorSet];
GO
IF OBJECT_ID(N'[dbo].[AutoriaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AutoriaSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UsuarioSet'
CREATE TABLE [dbo].[UsuarioSet] (
    [Id] int  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Plan] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ReservaSet'
CREATE TABLE [dbo].[ReservaSet] (
    [Fecha] datetime  NOT NULL,
    [Posicion] int  NOT NULL,
    [Estado] nvarchar(max)  NOT NULL,
    [UsuarioId] int  NOT NULL,
    [DocumentoIndex] int  NOT NULL
);
GO

-- Creating table 'DocumentoSet'
CREATE TABLE [dbo].[DocumentoSet] (
    [Index] int  NOT NULL,
    [Titulo] nvarchar(max)  NOT NULL,
    [Tipo] nvarchar(max)  NOT NULL,
    [CategoriaId] int  NOT NULL
);
GO

-- Creating table 'EjemplarSet'
CREATE TABLE [dbo].[EjemplarSet] (
    [CodBarras] int  NOT NULL,
    [Numero] int  NOT NULL,
    [Estado] nvarchar(max)  NOT NULL,
    [DocumentoIndex] int  NOT NULL
);
GO

-- Creating table 'CategoriaSet'
CREATE TABLE [dbo].[CategoriaSet] (
    [Id] int  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [DiasPrestamo] int  NOT NULL,
    [MultaDia] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'DetalleSet'
CREATE TABLE [dbo].[DetalleSet] (
    [FechaDev] datetime  NULL,
    [PrestamoId] int  NOT NULL,
    [EjemplarCodBarras] int  NOT NULL
);
GO

-- Creating table 'PrestamoSet'
CREATE TABLE [dbo].[PrestamoSet] (
    [Id] int  NOT NULL,
    [Fecha] datetime  NOT NULL,
    [UsuarioId] int  NOT NULL
);
GO

-- Creating table 'MultaSet'
CREATE TABLE [dbo].[MultaSet] (
    [Id] int  NOT NULL,
    [Valor] decimal(18,0)  NOT NULL,
    [FechaCanc] datetime  NULL,
    [Detalle_PrestamoId] int  NOT NULL,
    [Detalle_EjemplarCodBarras] int  NOT NULL
);
GO

-- Creating table 'AutorSet'
CREATE TABLE [dbo].[AutorSet] (
    [Id] int  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AutoriaSet'
CREATE TABLE [dbo].[AutoriaSet] (
    [Rol] nvarchar(max)  NOT NULL,
    [DocumentoIndex] int  NOT NULL,
    [AutorId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UsuarioSet'
ALTER TABLE [dbo].[UsuarioSet]
ADD CONSTRAINT [PK_UsuarioSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [UsuarioId], [DocumentoIndex] in table 'ReservaSet'
ALTER TABLE [dbo].[ReservaSet]
ADD CONSTRAINT [PK_ReservaSet]
    PRIMARY KEY CLUSTERED ([UsuarioId], [DocumentoIndex] ASC);
GO

-- Creating primary key on [Index] in table 'DocumentoSet'
ALTER TABLE [dbo].[DocumentoSet]
ADD CONSTRAINT [PK_DocumentoSet]
    PRIMARY KEY CLUSTERED ([Index] ASC);
GO

-- Creating primary key on [CodBarras] in table 'EjemplarSet'
ALTER TABLE [dbo].[EjemplarSet]
ADD CONSTRAINT [PK_EjemplarSet]
    PRIMARY KEY CLUSTERED ([CodBarras] ASC);
GO

-- Creating primary key on [Id] in table 'CategoriaSet'
ALTER TABLE [dbo].[CategoriaSet]
ADD CONSTRAINT [PK_CategoriaSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [PrestamoId], [EjemplarCodBarras] in table 'DetalleSet'
ALTER TABLE [dbo].[DetalleSet]
ADD CONSTRAINT [PK_DetalleSet]
    PRIMARY KEY CLUSTERED ([PrestamoId], [EjemplarCodBarras] ASC);
GO

-- Creating primary key on [Id] in table 'PrestamoSet'
ALTER TABLE [dbo].[PrestamoSet]
ADD CONSTRAINT [PK_PrestamoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MultaSet'
ALTER TABLE [dbo].[MultaSet]
ADD CONSTRAINT [PK_MultaSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AutorSet'
ALTER TABLE [dbo].[AutorSet]
ADD CONSTRAINT [PK_AutorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [DocumentoIndex], [AutorId] in table 'AutoriaSet'
ALTER TABLE [dbo].[AutoriaSet]
ADD CONSTRAINT [PK_AutoriaSet]
    PRIMARY KEY CLUSTERED ([DocumentoIndex], [AutorId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UsuarioId] in table 'ReservaSet'
ALTER TABLE [dbo].[ReservaSet]
ADD CONSTRAINT [FK_UsuarioReserva]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[UsuarioSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [DocumentoIndex] in table 'ReservaSet'
ALTER TABLE [dbo].[ReservaSet]
ADD CONSTRAINT [FK_DocumentoReserva]
    FOREIGN KEY ([DocumentoIndex])
    REFERENCES [dbo].[DocumentoSet]
        ([Index])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DocumentoReserva'
CREATE INDEX [IX_FK_DocumentoReserva]
ON [dbo].[ReservaSet]
    ([DocumentoIndex]);
GO

-- Creating foreign key on [UsuarioId] in table 'PrestamoSet'
ALTER TABLE [dbo].[PrestamoSet]
ADD CONSTRAINT [FK_UsuarioPrestamo]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[UsuarioSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioPrestamo'
CREATE INDEX [IX_FK_UsuarioPrestamo]
ON [dbo].[PrestamoSet]
    ([UsuarioId]);
GO

-- Creating foreign key on [PrestamoId] in table 'DetalleSet'
ALTER TABLE [dbo].[DetalleSet]
ADD CONSTRAINT [FK_PrestamoDetalle]
    FOREIGN KEY ([PrestamoId])
    REFERENCES [dbo].[PrestamoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Detalle_PrestamoId], [Detalle_EjemplarCodBarras] in table 'MultaSet'
ALTER TABLE [dbo].[MultaSet]
ADD CONSTRAINT [FK_MultaDetalle]
    FOREIGN KEY ([Detalle_PrestamoId], [Detalle_EjemplarCodBarras])
    REFERENCES [dbo].[DetalleSet]
        ([PrestamoId], [EjemplarCodBarras])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MultaDetalle'
CREATE INDEX [IX_FK_MultaDetalle]
ON [dbo].[MultaSet]
    ([Detalle_PrestamoId], [Detalle_EjemplarCodBarras]);
GO

-- Creating foreign key on [DocumentoIndex] in table 'EjemplarSet'
ALTER TABLE [dbo].[EjemplarSet]
ADD CONSTRAINT [FK_DocumentoEjemplar]
    FOREIGN KEY ([DocumentoIndex])
    REFERENCES [dbo].[DocumentoSet]
        ([Index])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DocumentoEjemplar'
CREATE INDEX [IX_FK_DocumentoEjemplar]
ON [dbo].[EjemplarSet]
    ([DocumentoIndex]);
GO

-- Creating foreign key on [EjemplarCodBarras] in table 'DetalleSet'
ALTER TABLE [dbo].[DetalleSet]
ADD CONSTRAINT [FK_EjemplarDetalle]
    FOREIGN KEY ([EjemplarCodBarras])
    REFERENCES [dbo].[EjemplarSet]
        ([CodBarras])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EjemplarDetalle'
CREATE INDEX [IX_FK_EjemplarDetalle]
ON [dbo].[DetalleSet]
    ([EjemplarCodBarras]);
GO

-- Creating foreign key on [CategoriaId] in table 'DocumentoSet'
ALTER TABLE [dbo].[DocumentoSet]
ADD CONSTRAINT [FK_CategoriaDocumento]
    FOREIGN KEY ([CategoriaId])
    REFERENCES [dbo].[CategoriaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriaDocumento'
CREATE INDEX [IX_FK_CategoriaDocumento]
ON [dbo].[DocumentoSet]
    ([CategoriaId]);
GO

-- Creating foreign key on [DocumentoIndex] in table 'AutoriaSet'
ALTER TABLE [dbo].[AutoriaSet]
ADD CONSTRAINT [FK_DocumentoAutoria]
    FOREIGN KEY ([DocumentoIndex])
    REFERENCES [dbo].[DocumentoSet]
        ([Index])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AutorId] in table 'AutoriaSet'
ALTER TABLE [dbo].[AutoriaSet]
ADD CONSTRAINT [FK_AutorAutoria]
    FOREIGN KEY ([AutorId])
    REFERENCES [dbo].[AutorSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AutorAutoria'
CREATE INDEX [IX_FK_AutorAutoria]
ON [dbo].[AutoriaSet]
    ([AutorId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------