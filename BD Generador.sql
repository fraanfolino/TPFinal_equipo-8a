USE [master]
GO
/****** Object:  Database [ECOMMERCE_P3]    Script Date: 11/7/2025 19:31:11 ******/
CREATE DATABASE [ECOMMERCE_P3]

GO
ALTER DATABASE [ECOMMERCE_P3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ECOMMERCE_P3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECOMMERCE_P3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECOMMERCE_P3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ECOMMERCE_P3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECOMMERCE_P3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET RECOVERY FULL 
GO
ALTER DATABASE [ECOMMERCE_P3] SET  MULTI_USER 
GO
ALTER DATABASE [ECOMMERCE_P3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECOMMERCE_P3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECOMMERCE_P3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECOMMERCE_P3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ECOMMERCE_P3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ECOMMERCE_P3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ECOMMERCE_P3] SET QUERY_STORE = ON
GO
ALTER DATABASE [ECOMMERCE_P3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ECOMMERCE_P3]
GO
/****** Object:  Table [dbo].[Carrito]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[idCarro] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCarro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria_talle]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria_talle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoria_id] [int] NOT NULL,
	[talle_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipo_talle_id] [int] NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[direcciones]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direcciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[calle] [varchar](255) NULL,
	[numero] [varchar](20) NULL,
	[piso] [varchar](10) NULL,
	[departamento] [varchar](10) NULL,
	[ciudad] [varchar](100) NULL,
	[provincia] [varchar](100) NULL,
	[codigo_postal] [varchar](20) NULL,
	[pais] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[imagenes_productos]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[imagenes_productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[producto_id] [int] NOT NULL,
	[url_imagen] [varchar](255) NOT NULL,
	[es_principal] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemCarrito]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemCarrito](
	[idItemCarro] [int] IDENTITY(1,1) NOT NULL,
	[id_carrito] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[id_talle] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idItemCarro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marcas]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marcas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedido_detalle]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido_detalle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pedido_id] [int] NOT NULL,
	[producto_id] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
	[talle_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidoDetalleV2]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoDetalleV2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PedidoId] [int] NOT NULL,
	[NombreProducto] [varchar](200) NULL,
	[TalleEtiqueta] [varchar](50) NULL,
	[Cantidad] [int] NULL,
	[PrecioUnitario] [decimal](18, 2) NULL,
	[IdProducto] [int] NULL,
	[IdTalle] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedidos]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedidos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[cliente_id] [int] NOT NULL,
	[total] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidosV2]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidosV2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[NombreCliente] [varchar](200) NULL,
	[Email] [varchar](200) NULL,
	[Telefono] [varchar](50) NULL,
	[ModalidadEntrega] [varchar](50) NULL,
	[Direccion] [varchar](300) NULL,
	[FormaPago] [varchar](50) NULL,
	[Total] [decimal](18, 2) NULL,
	[EstadoPedido] [varchar](50) NULL,
	[FechaPedido] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto_talle]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto_talle](
	[producto_id] [int] NOT NULL,
	[talle_id] [int] NOT NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[producto_id] ASC,
	[talle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [text] NULL,
	[precio] [decimal](10, 2) NOT NULL,
	[categoria_id] [int] NULL,
	[marca_id] [int] NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talles]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[etiqueta] [varchar](50) NOT NULL,
	[tipo_talle_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_talle]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_talle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[pass] [varchar](255) NOT NULL,
	[nombre] [varchar](100) NULL,
	[apellido] [varchar](100) NULL,
	[direccion_id] [int] NULL,
	[url_imagen_perfil] [varchar](255) NULL,
	[es_admin] [bit] NULL,
	[fecha_nacimiento] [date] NULL,
	[creado_en] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carrito] ON 

INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (1, 1, CAST(N'2025-07-07T11:55:27.453' AS DateTime), 1)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (2, 2, CAST(N'2025-07-08T08:56:36.127' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (3, 2, CAST(N'2025-07-08T09:01:19.880' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (4, 2, CAST(N'2025-07-08T10:11:32.740' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (5, 3, CAST(N'2025-07-08T12:11:20.510' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (6, 2, CAST(N'2025-07-08T14:53:54.310' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (7, 2, CAST(N'2025-07-08T15:00:42.420' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (8, 2, CAST(N'2025-07-08T15:40:12.990' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (9, 2, CAST(N'2025-07-08T15:51:18.283' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (10, 2, CAST(N'2025-07-08T16:00:07.890' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (11, 2, CAST(N'2025-07-08T16:07:49.610' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (12, 2, CAST(N'2025-07-08T16:08:52.247' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (13, 2, CAST(N'2025-07-08T16:16:16.440' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (14, 2, CAST(N'2025-07-08T16:24:26.877' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (15, 2, CAST(N'2025-07-08T16:27:03.170' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (16, 3, CAST(N'2025-07-09T08:51:44.373' AS DateTime), 1)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (17, 2, CAST(N'2025-07-09T10:02:18.047' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (18, 4, CAST(N'2025-07-09T10:11:35.590' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (19, 2, CAST(N'2025-07-11T18:11:54.820' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (20, 2, CAST(N'2025-07-11T19:01:47.500' AS DateTime), 1)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (21, 6, CAST(N'2025-07-11T19:04:15.850' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (22, 6, CAST(N'2025-07-11T19:07:09.920' AS DateTime), 0)
INSERT [dbo].[Carrito] ([idCarro], [id_usuario], [fecha_creacion], [activo]) VALUES (23, 6, CAST(N'2025-07-11T19:08:34.347' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Carrito] OFF
GO
SET IDENTITY_INSERT [dbo].[categoria_talle] ON 

INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (1, 4, 12)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (2, 4, 13)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (3, 4, 14)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (4, 4, 15)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (5, 4, 16)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (6, 3, 15)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (7, 3, 14)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (8, 3, 13)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (9, 3, 16)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (10, 3, 12)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (11, 2, 1)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (12, 2, 2)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (13, 2, 3)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (14, 2, 4)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (15, 2, 5)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (16, 2, 6)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (17, 2, 7)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (18, 2, 8)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (19, 2, 9)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (20, 2, 10)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (21, 2, 11)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (22, 1, 1)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (23, 1, 2)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (24, 1, 3)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (25, 1, 4)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (26, 1, 5)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (27, 1, 6)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (28, 1, 7)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (29, 1, 8)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (30, 1, 9)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (31, 1, 10)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (32, 1, 11)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (33, 5, 15)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (34, 5, 14)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (35, 5, 13)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (36, 5, 16)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (37, 5, 12)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (38, 6, 15)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (39, 6, 14)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (40, 6, 13)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (41, 6, 16)
INSERT [dbo].[categoria_talle] ([id], [categoria_id], [talle_id]) VALUES (42, 6, 12)
SET IDENTITY_INSERT [dbo].[categoria_talle] OFF
GO
SET IDENTITY_INSERT [dbo].[categorias] ON 

INSERT [dbo].[categorias] ([id], [nombre], [tipo_talle_id], [activo]) VALUES (1, N'Zapatillas', 1, 1)
INSERT [dbo].[categorias] ([id], [nombre], [tipo_talle_id], [activo]) VALUES (2, N'Zapatos', 1, 1)
INSERT [dbo].[categorias] ([id], [nombre], [tipo_talle_id], [activo]) VALUES (3, N'Remeras', 2, 1)
INSERT [dbo].[categorias] ([id], [nombre], [tipo_talle_id], [activo]) VALUES (4, N'Buzos', 2, 1)
INSERT [dbo].[categorias] ([id], [nombre], [tipo_talle_id], [activo]) VALUES (5, N'Short', 2, 1)
INSERT [dbo].[categorias] ([id], [nombre], [tipo_talle_id], [activo]) VALUES (6, N'Pantalones', 2, 1)
SET IDENTITY_INSERT [dbo].[categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[imagenes_productos] ON 

INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (5, 2, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/7c4f9b393f0b8cb75f2b74fe5e9e52aa/r/e/remera-nike-knit-top-beige-510020fn2645247-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (6, 2, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/r/e/remera-nike-knit-top-beige-510020fn2645247-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (13, 4, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/7c4f9b393f0b8cb75f2b74fe5e9e52aa/z/a/zapatilas-adidas-grand-court-base-00s-amarilla-100010ih6188001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (14, 4, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatilas-adidas-grand-court-base-00s-amarilla-100010ih6188001-6.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (19, 1, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/7c4f9b393f0b8cb75f2b74fe5e9e52aa/r/e/remera-adidas-negra-10002egd9303001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (20, 1, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/r/e/remera-adidas-negra-10002egd9303001-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (21, 3, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/7c4f9b393f0b8cb75f2b74fe5e9e52aa/r/e/remera-nike-run-trail-gris-510020dz2727015-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (22, 3, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/r/e/remera-nike-run-trail-gris-510020dz2727015-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (23, 5, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-adidas-grand-court-base-00s-mujer-verde-100010jq3599001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (24, 5, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-adidas-grand-court-base-00s-mujer-verde-100010jq3599001-3.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (25, 5, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-adidas-grand-court-base-00s-mujer-verde-100010jq3599001-6.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (29, 7, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-nike-club-negro-68527360-510020fn3888010-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (30, 7, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-nike-club-negro-68527360-510020fn3888010-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (39, 12, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-de-huracan-medio-cierre-kappa-entrenamiento-rojo-39502382f1rwf67-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (40, 12, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-de-huracan-medio-cierre-kappa-entrenamiento-rojo-39502382f1rwf67-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (41, 13, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-con-capucha-kappa-authentic-haris-negro-3950234157dw005-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (42, 13, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-con-capucha-kappa-authentic-haris-negro-3950234157dw005-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (43, 14, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-de-running-adidas-galaxy-7-mujer-blanca-100010jq2605001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (44, 14, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-de-running-adidas-galaxy-7-mujer-blanca-100010jq2605001-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (45, 15, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-nike-court-vision-low-blanca-40143758-510010hv0927097-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (46, 15, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-nike-court-vision-low-blanca-40143758-510010hv0927097-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (51, 10, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-adidas-x-disney-mickey-mouse-ni-o-ni-a-negro-100020jm0827001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (52, 10, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-adidas-x-disney-mickey-mouse-ni-o-ni-a-negro-100020jm0827001-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (53, 9, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-adidas-all-szn-soft-lux-mujer-rosa-100020kd9772001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (54, 9, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-adidas-all-szn-soft-lux-mujer-rosa-100020kd9772001-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (55, 8, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/7c4f9b393f0b8cb75f2b74fe5e9e52aa/b/u/buzo-adidas-classics-trefoil-negro-10002eim4500001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (56, 8, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-adidas-classics-trefoil-negro-10002eim4500001-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (57, 6, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-adidas-grand-court-base-2-0-mujer-lila-100010id1196001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (58, 6, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-adidas-grand-court-base-2-0-mujer-lila-100010id1196001-5.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (59, 6, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-adidas-grand-court-base-2-0-mujer-lila-100010id1196001-6.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (60, 11, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-con-capucha-kappa-logo-elisa-mujer-gris-39502381u6ew08y-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (61, 11, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-con-capucha-kappa-logo-elisa-mujer-gris-39502381u6ew08y-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (62, 16, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-adidas-grand-court-minnie-bebe-blanca-100010jr8130001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (63, 16, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-adidas-grand-court-minnie-bebe-blanca-100010jr8130001-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (64, 17, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-de-running-reebok-energen-lite-plus-3-mujer-azul-11101kel9320001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (65, 17, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-de-running-reebok-energen-lite-plus-3-mujer-azul-11101kel9320001-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (66, 18, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-puma-caven-2-0-mujer-blanca-76410602-640010394915061-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (67, 18, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-puma-caven-2-0-mujer-blanca-76410602-640010394915061-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (71, 19, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/7c4f9b393f0b8cb75f2b74fe5e9e52aa/z/a/zapatillas-de-running-puma-skyrocket-lite-roja-640010310001008-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (72, 19, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/7c4f9b393f0b8cb75f2b74fe5e9e52aa/z/a/zapatillas-de-running-puma-skyrocket-lite-roja-640010310001008-4.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (73, 19, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-de-running-puma-skyrocket-lite-roja-640010310001008-7.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (74, 20, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/7c4f9b393f0b8cb75f2b74fe5e9e52aa/b/u/buzo-medio-cierre-de-futbol-puma-king-pro-blanco-640020658348008-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (75, 20, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-medio-cierre-de-futbol-puma-king-pro-blanco-640020658348008-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (78, 21, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-con-capucha-de-independiente-ftbculture-rojo-640020684272002-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (79, 21, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/b/u/buzo-con-capucha-de-independiente-ftbculture-rojo-640020684272002-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (80, 22, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-puma-team-8-pulgadas-negro-640020621334001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (81, 22, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-puma-team-8-pulgadas-negro-640020621334001-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (82, 23, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-nike-club-flow-marino-510020fb7440493-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (83, 23, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-nike-club-flow-marino-510020fb7440493-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (84, 24, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-de-boca-adidas-azul-100020jp3314001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (85, 24, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-de-boca-adidas-azul-100020jp3314001-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (88, 25, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-puma-ess-block-tr-negro-640020672753001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (89, 25, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-puma-ess-block-tr-negro-640020672753001-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (90, 26, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-adidas-og-unisex-crudo-10002ejn1173001.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (91, 26, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-adidas-og-unisex-crudo-10002ejn1173001-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (94, 27, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-de-ba-o-puma-cat-logo-lila-641020938062001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (95, 27, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-de-ba-o-puma-cat-logo-lila-641020938062001-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (96, 28, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-de-futbol-kappa-porto-azul-39502311j65w193-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (97, 28, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-de-futbol-kappa-porto-azul-39502311j65w193-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (98, 29, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-de-boca-adidas-arquero-celeste-100020jd4470001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (99, 29, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-de-boca-adidas-arquero-celeste-100020jd4470001-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (100, 30, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-adidas-de-running-adizero-gel-negro-100020ix2829001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (101, 30, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/s/h/short-adidas-de-running-adizero-gel-negro-100020ix2829001-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (102, 31, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/7c4f9b393f0b8cb75f2b74fe5e9e52aa/z/a/zapatillas-nike-court-vision-low-mujer-blanca-47124811-510010dh3158101-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (103, 31, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-nike-court-vision-low-mujer-blanca-47124811-510010dh3158101-2.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (104, 32, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/p/a/pantalon-topper-frs-azul-800020167614001-1.jpg', 0)
INSERT [dbo].[imagenes_productos] ([id], [producto_id], [url_imagen], [es_principal]) VALUES (105, 32, N'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/p/a/pantalon-topper-frs-azul-800020167614001-2.jpg', 0)
SET IDENTITY_INSERT [dbo].[imagenes_productos] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemCarrito] ON 

INSERT [dbo].[ItemCarrito] ([idItemCarro], [id_carrito], [id_producto], [id_talle], [cantidad]) VALUES (4, 20, 15, 6, 1)
INSERT [dbo].[ItemCarrito] ([idItemCarro], [id_carrito], [id_producto], [id_talle], [cantidad]) VALUES (9, 23, 11, 12, 1)
SET IDENTITY_INSERT [dbo].[ItemCarrito] OFF
GO
SET IDENTITY_INSERT [dbo].[marcas] ON 

INSERT [dbo].[marcas] ([id], [nombre], [activo]) VALUES (1, N'Nike', 1)
INSERT [dbo].[marcas] ([id], [nombre], [activo]) VALUES (2, N'Adidas', 1)
INSERT [dbo].[marcas] ([id], [nombre], [activo]) VALUES (3, N'Kappa', 1)
INSERT [dbo].[marcas] ([id], [nombre], [activo]) VALUES (4, N'Reebok', 1)
INSERT [dbo].[marcas] ([id], [nombre], [activo]) VALUES (5, N'Puma', 1)
INSERT [dbo].[marcas] ([id], [nombre], [activo]) VALUES (6, N'Topper', 1)
SET IDENTITY_INSERT [dbo].[marcas] OFF
GO
SET IDENTITY_INSERT [dbo].[PedidoDetalleV2] ON 

INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (1, 1, N'Remera Adidas Negra', N'L', 4, CAST(43699.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (2, 2, N'Remera Nike Run Trail Gris', N'XS', 2, CAST(55999.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (3, 2, N'Zapatilas Adidas Grand Court ', N'38', 1, CAST(99999.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (4, 3, N'Remera Adidas Negra', N'L', 1, CAST(43699.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (5, 3, N'Zapatilas Adidas Grand Court ', N'35', 1, CAST(99999.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (6, 4, N'Remera Adidas Negra', N'L', 1, CAST(43699.00 AS Decimal(18, 2)), 15, 1)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (7, 5, N'Zapatilas Adidas Grand Court ', N'37', 1, CAST(99999.00 AS Decimal(18, 2)), 3, 4)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (8, 7, N'Remera Nike Knit Top Beige', N'XS', 2, CAST(99999.00 AS Decimal(18, 2)), 12, 2)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (9, 8, N'Zapatilas Adidas Grand Court ', N'35', 10, CAST(99999.00 AS Decimal(18, 2)), 1, 4)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (10, 9, N'Zapatilas Adidas Grand Court ', N'42', 5, CAST(99999.00 AS Decimal(18, 2)), 4, 8)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (11, 10, N'Zapatilas Adidas Grand Court ', N'43', 5, CAST(99999.00 AS Decimal(18, 2)), 4, 9)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (12, 11, N'Zapatilas Adidas Grand Court ', N'41', 7, CAST(99999.00 AS Decimal(18, 2)), 4, 7)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (13, 12, N'Zapatilas Adidas Grand Court ', N'45', 3, CAST(99999.00 AS Decimal(18, 2)), 4, 11)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (14, 13, N'Remera Nike Knit Top Beige', N'XS', 1, CAST(99999.00 AS Decimal(18, 2)), 2, 12)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (15, 14, N'Zapatilas Adidas Grand Court ', N'35', 5, CAST(99999.00 AS Decimal(18, 2)), 4, 1)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (16, 15, N'Zapatilas Adidas Grand Court ', N'35', 14, CAST(99999.00 AS Decimal(18, 2)), 4, 1)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (17, 16, N'Remera Nike Knit Top Beige', N'XS', 2, CAST(99999.00 AS Decimal(18, 2)), 2, 12)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (18, 17, N' Zapatillas Nike Court Vision Low Mujer Blanca', N'35', 1, CAST(139000.00 AS Decimal(18, 2)), 31, 1)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (19, 18, N'Zapatillas Adidas Lila', N'37', 1, CAST(89999.00 AS Decimal(18, 2)), 6, 3)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (20, 18, N'Buzo Con Capucha Kappa ', N'XS', 1, CAST(42499.00 AS Decimal(18, 2)), 11, 12)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (21, 19, N'Buzo De Huracan Entrenamiento', N'XS', 1, CAST(96999.00 AS Decimal(18, 2)), 12, 12)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (22, 19, N'Buzo Con Capucha Kappa ', N'XL', 1, CAST(42499.00 AS Decimal(18, 2)), 11, 16)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (23, 20, N'Zapatillas De Running Adidas Galaxy 7', N'35', 1, CAST(89999.00 AS Decimal(18, 2)), 14, 1)
INSERT [dbo].[PedidoDetalleV2] ([Id], [PedidoId], [NombreProducto], [TalleEtiqueta], [Cantidad], [PrecioUnitario], [IdProducto], [IdTalle]) VALUES (24, 20, N'Zapatillas Adidas Lila', N'35', 1, CAST(89999.00 AS Decimal(18, 2)), 6, 1)
SET IDENTITY_INSERT [dbo].[PedidoDetalleV2] OFF
GO
SET IDENTITY_INSERT [dbo].[PedidosV2] ON 

INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (1, 2, N'Admin', N'admin@admin.com', N'+5493415401404', N'Retiro', N'Av. Medrano 951, Almagro', N'Mercado Pago (+5%)', CAST(183535.80 AS Decimal(18, 2)), N'Cancelado', CAST(N'2025-07-08T09:01:02.690' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (2, 2, N'Admin', N'admin@admin.com', N'+5493415401404', N'Retiro', N'Av. Medrano 951, Almagro', N'Tarjeta de Crédito (+10%)', CAST(233196.70 AS Decimal(18, 2)), N'Cancelado', CAST(N'2025-07-08T09:22:11.503' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (3, 3, N'Usuario 2 Apellido', N'user2@user2.com', N'+5493415401404', N'Retiro', N'Av. Medrano 951, Almagro', N'Mercado Pago (+5%)', CAST(150882.90 AS Decimal(18, 2)), N'Entregado', CAST(N'2025-07-08T12:11:33.837' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (4, 2, N'user Apellido', N'user@user.com', N'+5493415401404', N'Retiro', N'Av. Medrano 951, Almagro', N'Mercado Pago (+5%)', CAST(45883.95 AS Decimal(18, 2)), N'Cancelado', CAST(N'2025-07-08T14:49:36.863' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (5, 2, N'user Apellido', N'user@user.com', N'', N'Retiro', N'Av. Medrano 951, Almagro', N'Tarjeta de Crédito (+10%)', CAST(109998.90 AS Decimal(18, 2)), N'Cancelado', CAST(N'2025-07-08T14:54:00.017' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (6, 2, N'user Apellido', N'user@user.com', N'', N'Retiro', N'Av. Yrigoyen 288, Gral. Pacheco', N'Tarjeta de Crédito (+10%)', CAST(219997.80 AS Decimal(18, 2)), N'Pendiente', CAST(N'2025-07-08T15:15:31.420' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (7, 2, N'user Apellido', N'user@user.com', N'', N'Retiro', N'Av. Medrano 951, Almagro', N'Mercado Pago (+5%)', CAST(209997.90 AS Decimal(18, 2)), N'Cancelado', CAST(N'2025-07-08T15:16:20.197' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (8, 2, N'user Apellido', N'user@user.com', N'+5493415401404', N'Retiro', N'Av. Medrano 951, Almagro', N'Mercado Pago (+5%)', CAST(1049989.50 AS Decimal(18, 2)), N'Cancelado', CAST(N'2025-07-08T15:40:26.310' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (9, 2, N'user Apellido', N'user@user.com', N'+5493415401404', N'Retiro', N'Av. Medrano 951, Almagro', N'Mercado Pago (+5%)', CAST(524994.75 AS Decimal(18, 2)), N'Cancelado', CAST(N'2025-07-08T15:51:30.020' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (10, 2, N'user Apellido', N'user@user.com', N'+5493415401404', N'Retiro', N'París 532, Haedo', N'Mercado Pago (+5%)', CAST(524994.75 AS Decimal(18, 2)), N'Cancelado', CAST(N'2025-07-08T16:00:17.757' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (11, 2, N'user Apellido', N'user@user.com', N'+5493415401404', N'Retiro', N'Av. Medrano 951, Almagro', N'Mercado Pago (+5%)', CAST(734992.65 AS Decimal(18, 2)), N'Cancelado', CAST(N'2025-07-08T16:07:59.447' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (12, 2, N'user Apellido', N'user@user.com', N'+5493415401404', N'Retiro', N'Av. Medrano 951, Almagro', N'Tarjeta de Crédito (+10%)', CAST(329996.70 AS Decimal(18, 2)), N'Cancelado', CAST(N'2025-07-08T16:09:03.120' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (13, 2, N'user Apellido', N'user@user.com', N'+5493415401404', N'Retiro', N'Av. Medrano 951, Almagro', N'Tarjeta de Crédito (+10%)', CAST(109998.90 AS Decimal(18, 2)), N'Cancelado', CAST(N'2025-07-08T16:16:22.457' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (14, 2, N'user Apellido', N'user@user.com', N'+5493415401404', N'Envio', N'ss', N'Mercado Pago (+5%)', CAST(524994.75 AS Decimal(18, 2)), N'Cancelado', CAST(N'2025-07-08T16:24:38.077' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (15, 2, N'user Apellido', N'user@user.com', N'+5493415401404', N'Retiro', N'Av. Medrano 951, Almagro', N'Mercado Pago (+5%)', CAST(1469985.30 AS Decimal(18, 2)), N'Cancelado', CAST(N'2025-07-08T16:32:34.370' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (16, 4, N'nico Apellido', N'calcagno.nico@gmail.com', N'+5493415401404', N'Retiro', N'Av. Medrano 951, Almagro', N'Mercado Pago (+5%)', CAST(209997.90 AS Decimal(18, 2)), N'Cancelado', CAST(N'2025-07-09T10:11:47.503' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (17, 2, N'user Apellido', N'user@user.com', N'3415542411', N'Retiro', N'Av. Medrano 951, Almagro', N'Mercado Pago (+5%)', CAST(145950.00 AS Decimal(18, 2)), N'Entregado', CAST(N'2025-07-11T18:11:47.103' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (18, 2, N'user Apellido', N'user@user.com', N'3415542411', N'Envio', N'av siempre viva 1234', N'Transferencia (-3%)', CAST(128523.06 AS Decimal(18, 2)), N'Entregado', CAST(N'2025-07-11T18:12:19.233' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (19, 6, N'nicolas Apellido', N'aaa@aa.com', N'551546', N'Retiro', N'Av. Medrano 951, Almagro', N'Tarjeta de Crédito (+10%)', CAST(153447.80 AS Decimal(18, 2)), N'Entregado', CAST(N'2025-07-11T19:06:12.657' AS DateTime))
INSERT [dbo].[PedidosV2] ([Id], [ClienteId], [NombreCliente], [Email], [Telefono], [ModalidadEntrega], [Direccion], [FormaPago], [Total], [EstadoPedido], [FechaPedido]) VALUES (20, 6, N'nicolas Apellido', N'aaa@aa.com', N'3415542411', N'Envio', N'av siempre viva 1234', N'Transferencia (-3%)', CAST(174598.06 AS Decimal(18, 2)), N'Entregado', CAST(N'2025-07-11T19:07:30.627' AS DateTime))
SET IDENTITY_INSERT [dbo].[PedidosV2] OFF
GO
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (1, 12, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (1, 13, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (1, 14, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (1, 15, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (1, 16, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (2, 12, 9)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (2, 13, 9)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (2, 14, 11)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (2, 15, 11)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (2, 16, 9)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (3, 12, 10)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (3, 13, 13)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (3, 14, 13)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (3, 15, 13)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (3, 16, 10)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (4, 1, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (4, 2, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (4, 3, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (4, 4, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (4, 5, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (4, 6, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (4, 7, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (4, 8, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (4, 9, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (4, 10, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (4, 11, 15)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (5, 1, 6)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (5, 2, 7)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (5, 3, 7)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (5, 4, 7)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (5, 5, 1)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (5, 6, 6)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (5, 7, 1)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (5, 9, 9)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (5, 10, 9)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (6, 1, 44)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (6, 2, 30)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (6, 3, 29)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (7, 13, 6)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (7, 15, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (7, 16, 9)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (8, 13, 11)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (8, 14, 8)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (8, 16, 11)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (9, 12, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (9, 14, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (10, 13, 3)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (10, 14, 3)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (10, 15, 5)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (10, 16, 5)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (11, 12, 3)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (11, 13, 7)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (11, 16, 3)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (12, 12, 6)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (12, 14, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (12, 15, 11)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (12, 16, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (13, 13, 1)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (13, 15, 1)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (14, 1, 2)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (14, 2, 7)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (14, 3, 5)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (15, 6, 5)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (15, 7, 9)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (15, 8, 5)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (15, 10, 7)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (16, 1, 6)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (17, 5, 8)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (17, 6, 8)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (17, 7, 11)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (17, 8, 13)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (18, 2, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (18, 4, 6)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (19, 1, 10)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (19, 4, 6)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (19, 5, 6)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (19, 8, 6)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (20, 13, 10)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (20, 14, 8)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (20, 16, 8)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (21, 13, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (21, 15, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (21, 16, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (22, 14, 8)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (22, 15, 1)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (22, 16, 8)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (23, 13, 2)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (23, 14, 2)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (24, 15, 2)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (25, 13, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (25, 15, 1)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (25, 16, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (26, 15, 2)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (27, 14, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (27, 15, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (28, 12, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (28, 13, 7)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (28, 15, 6)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (29, 13, 3)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (29, 15, 6)
GO
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (29, 16, 9)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (30, 12, 7)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (30, 13, 7)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (30, 14, 7)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (30, 15, 10)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (30, 16, 7)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (31, 1, 8)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (31, 2, 7)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (31, 5, 2)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (31, 8, 7)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (31, 10, 9)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (32, 13, 4)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (32, 15, 9)
INSERT [dbo].[producto_talle] ([producto_id], [talle_id], [cantidad]) VALUES (32, 16, 4)
GO
SET IDENTITY_INSERT [dbo].[productos] ON 

INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (1, N'Remera Adidas Negra', N'Esta remera ADIDAS inspirada en este deporte, rinde tributo a la unidad con un estampado en el frente que representa a la Tierra como un balon de básquet.', CAST(436911.00 AS Decimal(10, 2)), 3, 2, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (2, N'Remera Nike Knit Top Beige', N'Hecha con tejido Knit premium de alta densidad, esta remera de manga corta de nuestra colección Nike Life es la versión mejorada de un imprescindible cotidiano.', CAST(99999.00 AS Decimal(10, 2)), 3, 1, 0)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (3, N'Remera Nike Run Trail Gris', N'Confeccionada con algodón ligero en un ajuste relajado para el uso diario e informal, esta remera NIKE luce gráficos estampados en el pecho.', CAST(55999.00 AS Decimal(10, 2)), 3, 1, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (4, N'Zapatilas Adidas Grand Court ', N'Base 00s Amarilla', CAST(99999.00 AS Decimal(10, 2)), 1, 2, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (5, N'Zapatillas Adidas Grand Court', N'Actualizadas para el mundo de hoy pero inmediatamente reconocibles, estas zapatillas ADIDAS le imprimen algo de la influencia clásica de las ADIDAS Grand Court a tu estilo de vida.', CAST(99999.00 AS Decimal(10, 2)), 1, 2, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (6, N'Zapatillas Adidas Lila', N'Una vez tengas la versión actualizada de este clásico en tu colección, no vas a querer usar otras zapatillas.
Las 3 Tiras le confieren un toque deportivo a cualquier outfit.', CAST(89999.00 AS Decimal(10, 2)), 1, 2, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (7, N'Buzo Nike Club Negro', N'Este clásico buzo está confeccionado con un suave tejido French terry de densidad media y bucles sin cepillar en el interior para ofrecer calidez y transpirabilidad.', CAST(94999.00 AS Decimal(10, 2)), 4, 1, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (8, N'Buzo Adidas Classics Trefoil Negro', N'Optá por un look casual con este buzo de cuello redondo y diseño atemporal adidas Adicolor Classics Trefoil.', CAST(91999.00 AS Decimal(10, 2)), 4, 2, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (9, N'Buzo Adidas Soft Lux', N'Con este buzo adidas, la comodidad y el estilo van de la mano.
Dejate envolver por su tela suave y liviana, y disfrutá de un calce suelto que te invita a moverte con total libertad.', CAST(89999.00 AS Decimal(10, 2)), 4, 2, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (10, N'Buzo Adidas X Disney ', N'A los niños les encantará lucir a su personaje favorito de Disney en este cómodo buzo de ADIDAS.
Confeccionado con tejido entrelazado deportivo y de corte holgado, el buzo se destaca por su clásico estampado de Mickey Mouse realizado en tinta luminosa.', CAST(54999.00 AS Decimal(10, 2)), 4, 2, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (11, N'Buzo Con Capucha Kappa ', N'Un diseño inspirado en los archivos de KAPPA, este buzo es ideal para vos.
Buzo con capucha.', CAST(42499.00 AS Decimal(10, 2)), 4, 3, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (12, N'Buzo De Huracan Entrenamiento', N'Segui tu pasion por Huracan con KAPPA.
Cuello con medio cierre.
Puños elastizados.', CAST(96999.00 AS Decimal(10, 2)), 4, 3, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (13, N'Buzo Con Capucha Kappa Authentic Haris', N'Buzo en french terry con capucha regulable.
Bolsillo frontal.
Puños y cintura elastizados.', CAST(53999.00 AS Decimal(10, 2)), 4, 3, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (14, N'Zapatillas De Running Adidas Galaxy 7', N'Cada carrera es un viaje de descubrimiento.
Ponete estas zapatillas de running ADIDAS y liberá tu potencial.', CAST(89999.00 AS Decimal(10, 2)), 1, 2, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (15, N'Zapatillas Nike Court Vision Low Blanca', N'El estilo Fastbreak del basquetbol de los 80 se une a la cultura trepidante del deporte de hoy en día en las nuevas NIKE Court Vision Low.', CAST(139999.00 AS Decimal(10, 2)), 1, 1, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (16, N'Zapatillas Adidas Grand Court Minnie', N'Minnie Mouse lleva casi un siglo entreteniendo a los niños, y estas zapatillas ADIDAS traen su encanto característico a una nueva generación.', CAST(64999.00 AS Decimal(10, 2)), 1, 2, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (17, N'Zapatillas De Running Reebok ', N'Ponetelas para correr y no te las saques en todo el día.
Estas zapatillas de REEBOK para mujer amortiguan tus pies con una entresuela que proporciona confort óptimo y sujeción permanente.', CAST(44999.00 AS Decimal(10, 2)), 1, 4, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (18, N'Zapatillas Puma Caven', N'Las PUMA Caven 2.0 se inspiran en la vida universitaria de los años 90 para crear un diseño que evoca con nostalgia la estética retro.', CAST(123000.00 AS Decimal(10, 2)), 1, 5, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (19, N'Zapatillas De Running Puma Skyrocket', N'Diseñadas para el corredor moderno, estas zapatillas para correr combinan función y forma en perfecta armonía.', CAST(63749.00 AS Decimal(10, 2)), 1, 5, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (20, N'Buzo Medio Cierre De Futbol ', N'Ponete este buzo medio cierre KING Pro y complementa tus nuevos botines de fútbol KING.
Presenta material de alto rendimiento que absorbe la humedad por lo que te mantendrás seco incluso mientras sudas en el campo de entrenamiento o en la cancha.', CAST(118499.00 AS Decimal(10, 2)), 4, 1, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (21, N'Buzo Con Capucha De Independiente', N'Alentá al rojo donde sea que vayas y senti la comodidad con este buzo de PUMA.', CAST(72500.00 AS Decimal(10, 2)), 4, 5, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (22, N'Short Puma Team Negro', N'PUMA ha definido el deporte desde 1948, y estos shorts PUMA Team tienen un corte holgado de inspiración retro que refleja orgullosamente ese legado.', CAST(79500.00 AS Decimal(10, 2)), 5, 5, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (23, N'Short Nike Club Flow Azul', N'Hechos con tejido Woven ligero, estos shorts NIKE son un básico para el calor.
Su diseño llega arriba de la rodilla, son ideales para las actividades bajo el sol.', CAST(99500.00 AS Decimal(10, 2)), 5, 1, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (24, N'Short De Boca Adidas Azul', N'Aeroready
Logo ADIDAS bordado.
Escudo CABJ aplicado.', CAST(79800.00 AS Decimal(10, 2)), 5, 2, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (25, N'Short Puma Ess+ Block TR Negro', N'Comodidad y estilo asegurados con PUMA', CAST(48999.00 AS Decimal(10, 2)), 5, 5, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (26, N'Short Adidas OG Unisex Crudo', N'Poné a prueba tu estilo sin pisar la cancha con estos shorts de básquet ADIDAS Originals.
Su estructura de malla y su corte relajado y amplio se combinan para ofrecer comodidad sin esfuerzo y facilidad de uso en días de clima cálido.', CAST(79000.00 AS Decimal(10, 2)), 5, 2, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (27, N'Short De Baño Puma Cat Logo Lila', N'Preparate para tus días de pileta o playa con PUMA.
Cintura elastizada con cordón de ajuste.', CAST(44100.00 AS Decimal(10, 2)), 5, 5, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (28, N'Short De Futbol Kappa Porto Azul', N'Entrenamientos sin limites con KAPPA.
Tecnología Kombat, registrada por la marca KAPPA para optimizar la performance de alta competencia, basada en la liviandad, elasticidad y justa evaporación de la transpiración.', CAST(29500.00 AS Decimal(10, 2)), 5, 3, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (29, N'Short De Boca Adidas Arquero Celeste', N'Equipate con lo último de Boca con ADIDAS.
El tejido Aeroready favorece el secado rápido, ya que al ser un tejido ultraligero, absorbe el sudor para alejarlo de la piel y hacer que se evapore rápidamente.', CAST(32499.00 AS Decimal(10, 2)), 5, 2, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (30, N'Short Adidas De Running Adizero', N'Sin importar si estás acumulando kilómetros o buscando una marca personal, estos shorts de running adidas están diseñados para la velocidad.', CAST(59600.00 AS Decimal(10, 2)), 5, 2, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (31, N' Zapatillas Nike Court Vision Low Mujer Blanca', N'El estilo Fastbreak del basquetbol de los 80 se une a la cultura trepidante del deporte de hoy en día en las nuevas NIKE Court Vision Low.', CAST(139000.00 AS Decimal(10, 2)), 1, 1, 1)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [categoria_id], [marca_id], [activo]) VALUES (32, N'Pantalon Topper FRS Azul', N'Comodidad para tu día a día con TOPPER.
Cintura elastizada con cordón de ajuste.
Bolsillos laterales.', CAST(49999.00 AS Decimal(10, 2)), 6, 6, 1)
SET IDENTITY_INSERT [dbo].[productos] OFF
GO
SET IDENTITY_INSERT [dbo].[talles] ON 

INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (1, N'35', 1)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (2, N'36', 1)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (3, N'37', 1)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (4, N'38', 1)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (5, N'39', 1)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (6, N'40', 1)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (7, N'41', 1)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (8, N'42', 1)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (9, N'43', 1)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (10, N'44', 1)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (11, N'45', 1)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (15, N'L', 2)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (14, N'M', 2)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (13, N'S', 2)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (16, N'XL', 2)
INSERT [dbo].[talles] ([id], [etiqueta], [tipo_talle_id]) VALUES (12, N'XS', 2)
SET IDENTITY_INSERT [dbo].[talles] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_talle] ON 

INSERT [dbo].[tipo_talle] ([id], [nombre]) VALUES (1, N'Numericos')
INSERT [dbo].[tipo_talle] ([id], [nombre]) VALUES (2, N'Letras')
SET IDENTITY_INSERT [dbo].[tipo_talle] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id], [email], [pass], [nombre], [apellido], [direccion_id], [url_imagen_perfil], [es_admin], [fecha_nacimiento], [creado_en]) VALUES (1, N'admin@admin.com', N'admin1', N'Admin', N'Apellido', NULL, N'https://i.blogs.es/f7234d/imagen/500_333.webp', 1, CAST(N'1988-08-24' AS Date), CAST(N'2025-07-07T11:54:36.550' AS DateTime))
INSERT [dbo].[usuarios] ([id], [email], [pass], [nombre], [apellido], [direccion_id], [url_imagen_perfil], [es_admin], [fecha_nacimiento], [creado_en]) VALUES (2, N'user@user.com', N'usuario', N'user', N'Apellido', NULL, N'https://img.freepik.com/foto-gratis/joven-hombre-barbudo-camisa-rayas_273609-5646.jpg?semt=ais_items_boosted&w=740', 0, CAST(N'2025-09-25' AS Date), CAST(N'2025-07-08T08:56:30.053' AS DateTime))
INSERT [dbo].[usuarios] ([id], [email], [pass], [nombre], [apellido], [direccion_id], [url_imagen_perfil], [es_admin], [fecha_nacimiento], [creado_en]) VALUES (3, N'user2@user2.com', N'usuario2', N'Usuario 2', N'Apellido', NULL, N'Ingrese URL de imagen', 0, CAST(N'2000-01-01' AS Date), CAST(N'2025-07-08T12:11:15.467' AS DateTime))
INSERT [dbo].[usuarios] ([id], [email], [pass], [nombre], [apellido], [direccion_id], [url_imagen_perfil], [es_admin], [fecha_nacimiento], [creado_en]) VALUES (4, N'calcagno.nico@gmail.com', N'123456', N'nico', N'Apellido', NULL, N'Ingrese URL de imagen', 0, CAST(N'2000-01-01' AS Date), CAST(N'2025-07-09T10:11:29.027' AS DateTime))
INSERT [dbo].[usuarios] ([id], [email], [pass], [nombre], [apellido], [direccion_id], [url_imagen_perfil], [es_admin], [fecha_nacimiento], [creado_en]) VALUES (5, N'user2@user.com', N'usuario', N'Nico', N'Apellido', NULL, N'Ingrese URL de imagen', 0, CAST(N'1988-09-24' AS Date), CAST(N'2025-07-11T19:02:35.457' AS DateTime))
INSERT [dbo].[usuarios] ([id], [email], [pass], [nombre], [apellido], [direccion_id], [url_imagen_perfil], [es_admin], [fecha_nacimiento], [creado_en]) VALUES (6, N'aaa@aa.com', N'nicolas', N'nicolas', N'Apellido', NULL, N'Ingrese URL de imagen', 0, CAST(N'2000-01-01' AS Date), CAST(N'2025-07-11T19:03:48.113' AS DateTime))
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__categori__72AFBCC6AD6B1830]    Script Date: 11/7/2025 19:31:12 ******/
ALTER TABLE [dbo].[categorias] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__marcas__72AFBCC610D5F655]    Script Date: 11/7/2025 19:31:12 ******/
ALTER TABLE [dbo].[marcas] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_talles_etiqueta_tipo]    Script Date: 11/7/2025 19:31:12 ******/
ALTER TABLE [dbo].[talles] ADD  CONSTRAINT [UQ_talles_etiqueta_tipo] UNIQUE NONCLUSTERED 
(
	[etiqueta] ASC,
	[tipo_talle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__usuarios__AB6E6164C5842AEF]    Script Date: 11/7/2025 19:31:12 ******/
ALTER TABLE [dbo].[usuarios] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carrito] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Carrito] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[categorias] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[imagenes_productos] ADD  DEFAULT ((0)) FOR [es_principal]
GO
ALTER TABLE [dbo].[marcas] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[pedidos] ADD  CONSTRAINT [DF_Pedidos_Fecha]  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[pedidos] ADD  CONSTRAINT [DF_Pedidos_Total]  DEFAULT ((0)) FOR [total]
GO
ALTER TABLE [dbo].[PedidosV2] ADD  DEFAULT ('Pendiente') FOR [EstadoPedido]
GO
ALTER TABLE [dbo].[PedidosV2] ADD  DEFAULT (getdate()) FOR [FechaPedido]
GO
ALTER TABLE [dbo].[producto_talle] ADD  DEFAULT ((0)) FOR [cantidad]
GO
ALTER TABLE [dbo].[productos] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((0)) FOR [es_admin]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT (getdate()) FOR [creado_en]
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[categoria_talle]  WITH CHECK ADD FOREIGN KEY([categoria_id])
REFERENCES [dbo].[categorias] ([id])
GO
ALTER TABLE [dbo].[categoria_talle]  WITH CHECK ADD FOREIGN KEY([categoria_id])
REFERENCES [dbo].[categorias] ([id])
GO
ALTER TABLE [dbo].[categoria_talle]  WITH CHECK ADD FOREIGN KEY([talle_id])
REFERENCES [dbo].[talles] ([id])
GO
ALTER TABLE [dbo].[categoria_talle]  WITH CHECK ADD FOREIGN KEY([talle_id])
REFERENCES [dbo].[talles] ([id])
GO
ALTER TABLE [dbo].[categorias]  WITH CHECK ADD  CONSTRAINT [FK_categorias_tipo_talle] FOREIGN KEY([tipo_talle_id])
REFERENCES [dbo].[tipo_talle] ([id])
GO
ALTER TABLE [dbo].[categorias] CHECK CONSTRAINT [FK_categorias_tipo_talle]
GO
ALTER TABLE [dbo].[imagenes_productos]  WITH CHECK ADD FOREIGN KEY([producto_id])
REFERENCES [dbo].[productos] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemCarrito]  WITH CHECK ADD FOREIGN KEY([id_carrito])
REFERENCES [dbo].[Carrito] ([idCarro])
GO
ALTER TABLE [dbo].[ItemCarrito]  WITH CHECK ADD FOREIGN KEY([id_carrito])
REFERENCES [dbo].[Carrito] ([idCarro])
GO
ALTER TABLE [dbo].[ItemCarrito]  WITH CHECK ADD FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[ItemCarrito]  WITH CHECK ADD FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[ItemCarrito]  WITH CHECK ADD FOREIGN KEY([id_talle])
REFERENCES [dbo].[talles] ([id])
GO
ALTER TABLE [dbo].[ItemCarrito]  WITH CHECK ADD FOREIGN KEY([id_talle])
REFERENCES [dbo].[talles] ([id])
GO
ALTER TABLE [dbo].[pedido_detalle]  WITH CHECK ADD FOREIGN KEY([pedido_id])
REFERENCES [dbo].[pedidos] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[pedido_detalle]  WITH CHECK ADD FOREIGN KEY([producto_id])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[pedido_detalle]  WITH CHECK ADD FOREIGN KEY([producto_id])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[pedido_detalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidoDetalle_Pedido] FOREIGN KEY([pedido_id])
REFERENCES [dbo].[pedidos] ([id])
GO
ALTER TABLE [dbo].[pedido_detalle] CHECK CONSTRAINT [FK_PedidoDetalle_Pedido]
GO
ALTER TABLE [dbo].[pedido_detalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidoDetalle_Producto] FOREIGN KEY([producto_id])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[pedido_detalle] CHECK CONSTRAINT [FK_PedidoDetalle_Producto]
GO
ALTER TABLE [dbo].[pedido_detalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidoDetalle_Talle] FOREIGN KEY([talle_id])
REFERENCES [dbo].[talles] ([id])
GO
ALTER TABLE [dbo].[pedido_detalle] CHECK CONSTRAINT [FK_PedidoDetalle_Talle]
GO
ALTER TABLE [dbo].[PedidoDetalleV2]  WITH CHECK ADD  CONSTRAINT [FK_PedidoDetalle_Pedidov2] FOREIGN KEY([PedidoId])
REFERENCES [dbo].[PedidosV2] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PedidoDetalleV2] CHECK CONSTRAINT [FK_PedidoDetalle_Pedidov2]
GO
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Usuario] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[pedidos] CHECK CONSTRAINT [FK_Pedidos_Usuario]
GO
ALTER TABLE [dbo].[producto_talle]  WITH CHECK ADD FOREIGN KEY([producto_id])
REFERENCES [dbo].[productos] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[producto_talle]  WITH CHECK ADD FOREIGN KEY([talle_id])
REFERENCES [dbo].[talles] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD FOREIGN KEY([categoria_id])
REFERENCES [dbo].[categorias] ([id])
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD FOREIGN KEY([categoria_id])
REFERENCES [dbo].[categorias] ([id])
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD FOREIGN KEY([marca_id])
REFERENCES [dbo].[marcas] ([id])
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD FOREIGN KEY([marca_id])
REFERENCES [dbo].[marcas] ([id])
GO
ALTER TABLE [dbo].[talles]  WITH CHECK ADD  CONSTRAINT [FK_talles_tipo_talle] FOREIGN KEY([tipo_talle_id])
REFERENCES [dbo].[tipo_talle] ([id])
GO
ALTER TABLE [dbo].[talles] CHECK CONSTRAINT [FK_talles_tipo_talle]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD FOREIGN KEY([direccion_id])
REFERENCES [dbo].[direcciones] ([id])
ON DELETE SET NULL
GO
/****** Object:  StoredProcedure [dbo].[chequearCategoriaActiva]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chequearCategoriaActiva]
    @id INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @activo BIT;

    SELECT @activo = activo
    FROM categorias
    WHERE id = @id;

    IF @activo IS NULL
        SET @activo = 0;

    SELECT @activo AS CategoriaActiva;
END
GO
/****** Object:  StoredProcedure [dbo].[chequearMarcaActiva]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chequearMarcaActiva]
    @id INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @activo BIT;

    SELECT @activo = activo
    FROM marcas
    WHERE id = @id;

    IF @activo IS NULL
        SET @activo = 0;

    SELECT @activo AS MarcaActiva;
END
GO
/****** Object:  StoredProcedure [dbo].[ListarMarcas2]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarMarcas2] 
AS 
BEGIN 
		SELECT id, nombre FROM Marcas WHERE activo = 1;
		
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarClaveUsuario]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ActualizarClaveUsuario]
    @Id INT,
    @pass VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE usuarios
    SET pass = @pass
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarUsuario]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarUsuario]
    @Id INT,
    @nombre VARCHAR(50),
    @apellido VARCHAR(50),
    @fechanacimiento DATE,
    @urlImagenPerfil VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- Si no existe duplicado, actualiza
    UPDATE usuarios
    SET 
        nombre = @nombre,
        apellido = @apellido,
        fecha_nacimiento = @fechanacimiento,
        url_imagen_perfil = @urlImagenPerfil
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarOActualizarItemCarrito]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarOActualizarItemCarrito]
  @idCarrito  INT,
  @idProducto INT,
  @idTalle    INT,
  @cantidad   INT
AS
BEGIN
  SET NOCOUNT ON;

  IF EXISTS(
    SELECT 1
      FROM ItemCarrito
     WHERE id_carrito  = @idCarrito
       AND id_producto = @idProducto
       AND id_talle    = @idTalle
  )
    UPDATE ItemCarrito
       SET cantidad = cantidad + @cantidad
     WHERE id_carrito  = @idCarrito
       AND id_producto = @idProducto
       AND id_talle    = @idTalle;
  ELSE
    INSERT INTO ItemCarrito(id_carrito,id_producto,id_talle,cantidad)
    VALUES(@idCarrito,@idProducto,@idTalle,@cantidad);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarStockProductoTalle]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AgregarStockProductoTalle]
    @ProductoID INT,
    @EtiquetaTalle VARCHAR(50),
    @CantidadAgregar INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @TalleID INT;

    IF @ProductoID IS NULL
    BEGIN
        RAISERROR('El producto no existe.', 16, 1);
        RETURN;
    END

    SELECT @TalleID = id FROM talles WHERE etiqueta = @EtiquetaTalle;

    IF @TalleID IS NULL
    BEGIN
        RAISERROR('El talle no existe.', 16, 1);
        RETURN;
    END

    IF EXISTS (
        SELECT 1 FROM producto_talle 
        WHERE producto_id = @ProductoID AND talle_id = @TalleID
    )
    BEGIN
        UPDATE producto_talle
        SET cantidad = cantidad + @CantidadAgregar
        WHERE producto_id = @ProductoID AND talle_id = @TalleID;
    END
    ELSE
    BEGIN
        INSERT INTO producto_talle (producto_id, talle_id, cantidad)
        VALUES (@ProductoID, @TalleID, @CantidadAgregar);
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarUsuario]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_AgregarUsuario]
    @Email NVARCHAR(100),
    @Pass NVARCHAR(100),
    @Nombre NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Usuarios (email, pass, nombre, apellido, url_imagen_perfil, es_admin,fecha_nacimiento)
    VALUES (@Email, @Pass, @Nombre, 'Apellido', 'Ingrese URL de imagen', 0, '2000-01-01');

    SELECT SCOPE_IDENTITY() AS id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AltaCategoria]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AltaCategoria]
    @id INT
AS
BEGIN
    UPDATE categorias
    SET activo = 1
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AltaMarca]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_AltaMarca]
    @id INT
AS
BEGIN
    UPDATE marcas
    SET activo = 1
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AltaProducto]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_AltaProducto]
    @id INT
AS
BEGIN
    UPDATE productos
    SET activo = 1
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_BajaCategoria]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BajaCategoria]
    @id INT
AS
BEGIN
    UPDATE categorias
    SET activo = 0
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_BajaMarca]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_BajaMarca]
    @id INT
AS
BEGIN
    UPDATE marcas
    SET activo = 0
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_BajaProducto]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_BajaProducto]
    @id INT
AS
BEGIN
    UPDATE productos
    SET activo = 0
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CancelarPedido]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CancelarPedido]
    @id INT
AS
BEGIN
    UPDATE PedidosV2
    SET EstadoPedido = 'Cancelado'
    WHERE Id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConfirmarEntrega]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConfirmarEntrega]
@id INT
AS
BEGIN
    UPDATE PedidosV2
    SET EstadoPedido = 'Entregado'
    WHERE Id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConfirmarEnvio]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConfirmarEnvio]
@id INT
AS
BEGIN
    UPDATE PedidosV2
    SET EstadoPedido = 'Enviado'
    WHERE Id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConfirmarPedido]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConfirmarPedido]
    @id INT
AS
BEGIN
    UPDATE PedidosV2
    SET EstadoPedido = 'Confirmado'
    WHERE Id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConfirmarRetiro]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConfirmarRetiro]
    @IdPedido INT
AS
BEGIN
    UPDATE PedidosV2
    SET EstadoPedido = 'Entregado'
    WHERE Id = @IdPedido
END
GO
/****** Object:  StoredProcedure [dbo].[sp_descontarStock]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_descontarStock]
    @idProducto INT,
    @idTalle INT,
    @cantidad INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM producto_talle
        WHERE producto_id = @idProducto
          AND talle_id = @idTalle
          AND cantidad >= @cantidad
    )
    BEGIN
        UPDATE Producto_Talle
        SET cantidad = cantidad - @cantidad
        WHERE  producto_id = @idProducto AND talle_id = @idTalle;
    END
    ELSE
    BEGIN
    
        RAISERROR('Stock insuficiente para el producto o talle solicitado.', 16, 1);
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DescontarStockPorPedido]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DescontarStockPorPedido]
    @idPedido INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Descontar directamente la cantidad del stock
    UPDATE pt
    SET pt.cantidad = pt.cantidad - pd.Cantidad
    FROM PedidoDetalleV2 pd
    JOIN producto_talle pt ON pt.producto_id = pd.IdProducto AND pt.talle_id = pd.IdTalle
    WHERE pd.PedidoId = @idPedido;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DescontarStockProductoTalle]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DescontarStockProductoTalle]
    @ProductoID INT,
    @EtiquetaTalle VARCHAR(50),
    @CantidadDescontar INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TalleID INT;
    DECLARE @CantidadActual INT;

    IF @ProductoID IS NULL
    BEGIN
        RAISERROR('El producto no existe.', 16, 1);
        RETURN;
    END

    -- Obtener ID del talle
    SELECT @TalleID = id FROM talles WHERE etiqueta = @EtiquetaTalle;

    IF @TalleID IS NULL
    BEGIN
        RAISERROR('El talle no existe.', 16, 1);
        RETURN;
    END

    -- Verificar si hay stock suficiente
    SELECT @CantidadActual = cantidad 
    FROM producto_talle 
    WHERE producto_id = @ProductoID AND talle_id = @TalleID;

    IF @CantidadActual IS NULL
    BEGIN
        RAISERROR('No existe stock para ese producto y talle.', 16, 1);
        RETURN;
    END

    IF @CantidadActual < @CantidadDescontar
    BEGIN
        RAISERROR('No hay stock suficiente para descontar.', 16, 1);
        RETURN;
    END

    -- Restar la cantidad
    UPDATE producto_talle
    SET cantidad = cantidad - @CantidadDescontar
    WHERE producto_id = @ProductoID AND talle_id = @TalleID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DevolverStockPorPedido]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DevolverStockPorPedido]
    @idPedido INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Sumar directamente la cantidad al stock
    UPDATE pt
    SET pt.cantidad = pt.cantidad + pd.Cantidad
    FROM PedidoDetalleV2 pd
    JOIN producto_talle pt ON pt.producto_id = pd.IdProducto AND pt.talle_id = pd.IdTalle
    WHERE pd.PedidoId = @idPedido;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteEmailUsuario]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ExisteEmailUsuario]
    @Email NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 1
    FROM usuarios
    WHERE email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[sp_FiltrarProductosPorCategoria]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_FiltrarProductosPorCategoria]
    @categoria INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        p.id AS Id,
        p.nombre AS Nombre,
        p.descripcion AS Descripcion,
        p.precio AS Precio,
        c.id AS IDCategoria,
        c.nombre AS Categoria,
        m.id AS IDMarca,
        m.nombre AS Marca,
        ip.url_imagen AS UrlImagen
    FROM productos p
    LEFT JOIN categorias c ON p.categoria_id = c.id
    LEFT JOIN marcas m ON p.marca_id = m.id
    LEFT JOIN imagenes_productos ip ON ip.producto_id = p.id
    WHERE p.activo = 1
      AND EXISTS (
          SELECT 1
          FROM producto_talle pt
          WHERE pt.producto_id = p.id AND ISNULL(pt.cantidad, 0) > 0
      )
      AND (@categoria IS NULL OR p.categoria_id = @categoria)
    ORDER BY p.id, ip.es_principal DESC, ip.id;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_FiltrarProductosPorMarca]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_FiltrarProductosPorMarca]
    @marca INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        p.id AS Id,
        p.nombre AS Nombre,
        p.descripcion AS Descripcion,
        p.precio AS Precio,
        c.id AS IDCategoria,
        c.nombre AS Categoria,
        m.id AS IDMarca,
        m.nombre AS Marca,
        ip.url_imagen AS UrlImagen
    FROM productos p
    LEFT JOIN categorias c ON p.categoria_id = c.id
    LEFT JOIN marcas m ON p.marca_id = m.id
    LEFT JOIN imagenes_productos ip ON ip.producto_id = p.id
    WHERE p.activo = 1
      AND EXISTS (
          SELECT 1
          FROM producto_talle pt
          WHERE pt.producto_id = p.id AND ISNULL(pt.cantidad, 0) > 0
      )
      AND (@marca IS NULL OR p.marca_id = @marca)
    ORDER BY p.id, ip.es_principal DESC, ip.id;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarCategoria]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarCategoria]
    @nombre NVARCHAR(100),
    @tipo_talle_id INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM categorias WHERE nombre = @nombre)
    BEGIN
        RAISERROR('La categoría ya existe.', 16, 1);
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM tipo_talle WHERE id = @tipo_talle_id)
    BEGIN
        RAISERROR('El Talle no existe.', 16, 1);
        RETURN;
    END

    -- Insertar la categoría
    INSERT INTO categorias (nombre, tipo_talle_id)
    VALUES (@nombre, @tipo_talle_id);

    -- Obtener el ID de la categoría recién insertada
    DECLARE @categoria_id INT = SCOPE_IDENTITY();

    -- Insertar los talles asociados al tipo de talle
    INSERT INTO categoria_talle (categoria_id, talle_id)
    SELECT @categoria_id, t.id
    FROM talles t
    WHERE t.tipo_talle_id = @tipo_talle_id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarImagenProducto]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarImagenProducto]
    @producto_id INT,
    @url_imagen NVARCHAR(500),
    @es_principal BIT
AS
BEGIN
    INSERT INTO imagenes_productos (producto_id, url_imagen, es_principal)
    VALUES (@producto_id, @url_imagen, @es_principal);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarMarca]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[sp_InsertarMarca]
    @nombre NVARCHAR(100)
AS
BEGIN
    -- Validar si ya existe unamarca con el mismo nombre
    IF EXISTS (SELECT 1 FROM marcas WHERE nombre = @nombre)
    BEGIN
        RAISERROR('La marca ya existe.', 16, 1);
        RETURN;
    END

    INSERT INTO marcas (nombre)
    VALUES (@nombre);

END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarProducto]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_InsertarProducto]
    @nombre NVARCHAR(100),
    @descripcion NVARCHAR(255),
    @precio DECIMAL(10,2),
    @categoria_id INT,
    @marca_id INT
AS
BEGIN
    INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id)
    VALUES (@nombre, @descripcion, @precio, @categoria_id, @marca_id);

    SELECT SCOPE_IDENTITY(); -- Esto sí devuelve un valor escalar
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarTalle]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarTalle]
    @etiqueta NVARCHAR(100),
    @tipo_talle_id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO talles (etiqueta, tipo_talle_id)
    VALUES (@etiqueta, @tipo_talle_id);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarTipoTalle]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_InsertarTipoTalle]
    @nombre NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM tipo_talle
        WHERE nombre = @nombre
    )
    BEGIN
        RAISERROR('El tipo ya existe.', 16, 1);
		RETURN;
    END

    INSERT INTO tipo_talle (nombre)
    VALUES (@nombre);

    SELECT SCOPE_IDENTITY() AS id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarCategorias]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListarCategorias]
AS
BEGIN
    SELECT 
        c.id AS 'id',
        c.nombre AS 'nombre',
        tt.nombre AS 'tipotalle',
        c.activo AS 'activo'
    FROM categorias c
    LEFT JOIN tipo_talle tt ON c.tipo_talle_id = tt.id
    ORDER BY c.nombre;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarMarcas]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ListarMarcas]
AS
BEGIN
    SELECT * From marcas;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarProductosConStock]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ListarProductosConStock]
AS
BEGIN
    SELECT 
        p.id AS Id,
        p.nombre AS Nombre,
        p.descripcion AS Descripcion,
        p.precio AS Precio,
        c.id AS IDCategoria,
        c.nombre AS Categoria,
		c.activo AS CActivo,
        m.id AS IDMarca,
        m.nombre AS Marca,
		m.activo AS MActivo,
        ip.url_imagen AS UrlImagen
    FROM productos p
    -- Traer categoría y marca aunque sean nulas
    LEFT JOIN categorias c ON p.categoria_id = c.id
    LEFT JOIN marcas m ON p.marca_id = m.id
    -- Traer todas las imágenes (si hay)
    LEFT JOIN imagenes_productos ip ON ip.producto_id = p.id
    -- Filtrar productos con stock positivo Y activos
    WHERE p.activo = 1
      AND EXISTS (
          SELECT 1
          FROM producto_talle pt
          WHERE pt.producto_id = p.id AND pt.cantidad > 0
      )
    ORDER BY p.id, ip.es_principal DESC, ip.id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarProductosPorMarcayCategoria]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ListarProductosPorMarcayCategoria]
    @MarcaNombre VARCHAR(100) = NULL,
    @CategoriaNombre VARCHAR(100) = NULL
AS
BEGIN
    SELECT 
        p.id AS Id,
        p.nombre AS Nombre,
        p.descripcion AS Descripcion,
        p.precio AS Precio,
        c.id AS IdCategoria,           -- ← agregado
        c.nombre AS Categoria,
        m.id AS IdMarca,               -- ← agregado
        m.nombre AS Marca,
        ip.url_imagen AS UrlImagen
    FROM productos p
    LEFT JOIN categorias c ON p.categoria_id = c.id
    LEFT JOIN marcas m ON p.marca_id = m.id
    OUTER APPLY (
        SELECT TOP 1 ip.url_imagen
        FROM imagenes_productos ip
        WHERE ip.producto_id = p.id
        ORDER BY ip.id
    ) ip
	LEFT JOIN producto_talle pt ON pt.producto_id = p.id AND pt.cantidad > 0
    WHERE 
        (@MarcaNombre IS NULL OR m.nombre = @MarcaNombre)
        AND (@CategoriaNombre IS NULL OR c.nombre = @CategoriaNombre)
	ORDER BY p.id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarTalles]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListarTalles]
    @id INT
AS
BEGIN
    SELECT t.*
    FROM productos p
    INNER JOIN categorias c ON p.categoria_id = c.id
    INNER JOIN categoria_talle ct ON c.id = ct.categoria_id
    INNER JOIN talles t ON ct.talle_id = t.id
    WHERE p.Id = @id
    ORDER BY 
        CASE 
            WHEN ISNUMERIC(t.etiqueta) = 1 THEN TRY_CAST(t.etiqueta AS INT)
            ELSE NULL 
        END,
        t.etiqueta;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarTallesPorTipo]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListarTallesPorTipo]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        tt.id AS [id],
        tt.nombre AS [Tipo de talle],
        STRING_AGG(t.etiqueta, '-' ) WITHIN GROUP (ORDER BY t.etiqueta) AS [Etiquetas]
    FROM 
        tipo_talle tt
    JOIN 
        talles t ON t.tipo_talle_id = tt.id
    GROUP BY 
        tt.id, tt.nombre;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarTipoTalle]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ListarTipoTalle]
    @idTipoTalle INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        tt.id AS [id],
        tt.nombre AS [Tipo de talle],
        t.etiqueta AS [Etiqueta]
    FROM 
        tipo_talle tt
    JOIN 
        talles t ON t.tipo_talle_id = tt.id
    WHERE 
        @idTipoTalle IS NULL OR tt.id = @idTipoTalle
    ORDER BY 
        tt.id, t.etiqueta;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarTodosLosProductosSinImagen]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListarTodosLosProductosSinImagen]
AS
BEGIN
    SELECT 
        p.id           AS Id,
        p.nombre       AS Nombre,
        p.descripcion  AS Descripcion,
        p.precio       AS Precio,
        c.id           AS IdCategoria,
        c.nombre       AS Categoria,
        m.id           AS IdMarca,
        m.nombre       AS Marca,
        -- Calculamos el nuevo 'Activo':
        CASE 
            WHEN p.activo = 1 
              AND ISNULL(c.activo, 0) = 1 
              AND ISNULL(m.activo, 0) = 1 
            THEN 1 
            ELSE 0 
        END AS Activo
    FROM productos p
    LEFT JOIN categorias c 
      ON p.categoria_id = c.id
    LEFT JOIN marcas m 
      ON p.marca_id = m.id
    ORDER BY p.id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginUsuario]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_LoginUsuario]
    @Email VARCHAR(255),
    @Pass VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        id,
        email,
        pass,
        es_admin,
        url_imagen_perfil,
        nombre,
        apellido,
        fecha_nacimiento
    FROM usuarios
    WHERE email = @Email AND pass = @Pass
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarCategoria]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ModificarCategoria]
    @id INT,
    @nombrenuevo NVARCHAR(100),
    @tipo_talle_id INT
AS
BEGIN
    -- Validar si ya existe otra categoría con el mismo nombre
    IF EXISTS (SELECT 1 FROM categorias WHERE nombre = @nombrenuevo AND id <> @id)
    BEGIN
        RAISERROR('La categoría ya existe.', 16, 1);
        RETURN;
    END

    -- Validar si el tipo de talle existe
    IF NOT EXISTS (SELECT 1 FROM tipo_talle WHERE id = @tipo_talle_id)
    BEGIN
        RAISERROR ('El tipo de talle no existe.', 16, 1);
        RETURN;
    END

    -- Obtener el tipo_talle_id actual de la categoría
    DECLARE @tipo_talle_actual INT;
    SELECT @tipo_talle_actual = tipo_talle_id FROM categorias WHERE id = @id;

    -- Actualizar nombre y tipo_talle_id
    UPDATE categorias
    SET nombre = @nombrenuevo,
        tipo_talle_id = @tipo_talle_id
    WHERE id = @id;

    -- Si el tipo_talle_id cambió, actualizar talles relacionados
    IF @tipo_talle_actual <> @tipo_talle_id
    BEGIN
        -- Primero, eliminar el stock relacionado a los talles actuales de la categoría
        DELETE pt
        FROM producto_talle pt
        INNER JOIN productos p ON pt.producto_id = p.id
        WHERE p.categoria_id = @id;

        -- Eliminar los talles actuales de la categoría
        DELETE FROM categoria_talle WHERE categoria_id = @id;

        -- Insertar los nuevos talles correspondientes al nuevo tipo
        INSERT INTO categoria_talle (categoria_id, talle_id)
        SELECT @id, t.id
        FROM talles t
        WHERE t.tipo_talle_id = @tipo_talle_id;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarEmailUsuario]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ModificarEmailUsuario]
  @IdUsuario INT,
  @NuevoEmail VARCHAR(255)
AS
BEGIN
  SET NOCOUNT ON;

  -- Verifica si el nuevo email ya está en uso por otro usuario
  IF EXISTS (
    SELECT 1 
    FROM usuarios 
    WHERE email = @NuevoEmail AND id <> @IdUsuario
  )
  BEGIN
    RAISERROR('El email ya está en uso por otro usuario.', 16, 1);
    RETURN;
  END

  -- Actualiza el email si no está duplicado
  UPDATE usuarios
  SET email = @NuevoEmail
  WHERE id = @IdUsuario;

  -- Verifica si el usuario existía
  IF @@ROWCOUNT = 0
  BEGIN
    RAISERROR('No se encontró el usuario con el ID especificado.', 16, 1);
    RETURN;
  END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarMarca]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ModificarMarca]
    @id INT,
    @nombrenuevo NVARCHAR(100)
AS
BEGIN
    -- Validar si ya existe otra marca con el mismo nombre
    IF EXISTS (SELECT 1 FROM marcas WHERE nombre = @nombrenuevo AND id <> @id)
    BEGIN
        RAISERROR('La marca ya existe.', 16, 1);
        RETURN;
    END

    -- Actualizar nombre y tipo_talle_id
    UPDATE marcas
    SET nombre = @nombrenuevo
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarProducto]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ModificarProducto]
    @producto_id INT,
    @nombre NVARCHAR(100),
    @descripcion NVARCHAR(255),
    @precio DECIMAL(10,2),
    @categoria_id INT,
    @marca_id INT
AS
BEGIN
    UPDATE productos
    SET nombre = @nombre,
        descripcion = @descripcion,
        precio = @precio,
        categoria_id = @categoria_id,
        marca_id = @marca_id
WHERE  id = @producto_id;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarTipoTalle]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ModificarTipoTalle]
    @tipoTalleId INT,
    @nuevoNombre VARCHAR(50),
    @etiquetasCSV VARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -------------------------
    -- 1. Cambiar el nombre si es diferente
    -------------------------
    DECLARE @nombreActual VARCHAR(50);
    SELECT @nombreActual = nombre FROM tipo_talle WHERE id = @tipoTalleId;

    IF @nombreActual IS NULL
    BEGIN
        THROW 50001, 'El tipo_talle especificado no existe.', 1;
    END

    IF @nombreActual <> @nuevoNombre
    BEGIN
        UPDATE tipo_talle
        SET nombre = @nuevoNombre
        WHERE id = @tipoTalleId;
    END

    -------------------------
    -- 2. Procesar las etiquetas CSV
    -------------------------
    DECLARE @nuevosTalles TABLE (etiqueta VARCHAR(50));

    DECLARE @pos INT = 0, @nextPos INT, @etiqueta VARCHAR(50);
    SET @etiquetasCSV = @etiquetasCSV + ',' -- asegurar ciclo

    WHILE CHARINDEX(',', @etiquetasCSV, @pos + 1) > 0
    BEGIN
        SET @nextPos = CHARINDEX(',', @etiquetasCSV, @pos + 1);
        SET @etiqueta = LTRIM(RTRIM(SUBSTRING(@etiquetasCSV, @pos + 1, @nextPos - @pos - 1)));
        IF @etiqueta <> ''
            INSERT INTO @nuevosTalles VALUES (@etiqueta);
        SET @pos = @nextPos;
    END

    -------------------------
    -- 3. Insertar nuevos talles que no existan
    -------------------------
    INSERT INTO talles (etiqueta, tipo_talle_id)
    SELECT etiqueta, @tipoTalleId
    FROM @nuevosTalles nt
    WHERE NOT EXISTS (
        SELECT 1 FROM talles t
        WHERE t.etiqueta = nt.etiqueta AND t.tipo_talle_id = @tipoTalleId
    );
	-- 3.b Asociar nuevos talles con categorías que usaban este tipo_talle
	DECLARE @categoriaId INT;
	SELECT @categoriaId = c.id
	FROM categorias c
	WHERE c.tipo_talle_id = @tipoTalleId;

	-- Si hay categoría que usa ese tipo_talle, insertá en categoria_talle
	IF @categoriaId IS NOT NULL
	BEGIN
		INSERT INTO categoria_talle (categoria_id, talle_id)
		SELECT @categoriaId, t.id
		FROM talles t
		WHERE t.tipo_talle_id = @tipoTalleId
		AND NOT EXISTS (
			SELECT 1 FROM categoria_talle ct
			WHERE ct.categoria_id = @categoriaId AND ct.talle_id = t.id
		);
	END
    -------------------------
    -- 4. Detectar talles a eliminar
    -------------------------
    DECLARE @tallesActuales TABLE (id INT, etiqueta VARCHAR(50));
    INSERT INTO @tallesActuales
    SELECT id, etiqueta FROM talles WHERE tipo_talle_id = @tipoTalleId;

    DECLARE @tallesEliminar TABLE (id INT);
    INSERT INTO @tallesEliminar (id)
    SELECT t.id
    FROM @tallesActuales t
    WHERE NOT EXISTS (
        SELECT 1 FROM @nuevosTalles nt WHERE nt.etiqueta = t.etiqueta
    );

    -------------------------
    -- 5. Eliminar stock y relaciones
    -------------------------

	DELETE pt FROM producto_talle pt JOIN @tallesEliminar te ON pt.talle_id = te.id;
	DELETE ct FROM categoria_talle ct JOIN @tallesEliminar te ON ct.talle_id = te.id;
	DELETE ic FROM ItemCarrito ic JOIN @tallesEliminar te ON ic.id_talle = te.id;
	DELETE pd FROM pedido_detalle pd JOIN @tallesEliminar te ON pd.talle_id = te.id;
	DELETE t  FROM talles t         JOIN @tallesEliminar te ON t.id = te.id;



	-- Asociar todos los talles del tipo_talle a las categorías que lo usen
INSERT INTO categoria_talle (categoria_id, talle_id)
SELECT c.id, t.id
FROM categorias c
JOIN talles t ON t.tipo_talle_id = c.tipo_talle_id
LEFT JOIN categoria_talle ct ON ct.categoria_id = c.id AND ct.talle_id = t.id
WHERE c.tipo_talle_id = @tipoTalleId AND ct.id IS NULL;



END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerCategoriaPorId]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerCategoriaPorId]
    @id INT
AS
BEGIN
    SELECT 
        c.id AS 'id',
        c.nombre AS 'nombre',
        tt.nombre AS 'tipotalle',
        c.activo AS 'activo'
    FROM categorias c
    LEFT JOIN tipo_talle tt ON c.tipo_talle_id = tt.id
    WHERE c.id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerDetallesPedido]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ObtenerDetallesPedido]
    @pedidoId INT
AS
BEGIN
    SELECT 
        d.producto_id           AS id_producto,
        p.nombre                AS producto_nombre,
        d.precio                AS precio_unitario,
        d.cantidad,
        d.talle_id              AS id_talle,
        t.etiqueta           AS talle_etiqueta
    FROM pedido_detalle d
    JOIN productos p ON d.producto_id = p.id
    JOIN talles t    ON d.talle_id = t.id
    WHERE d.pedido_id = @pedidoId;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerFechaPedido]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerFechaPedido]
    @idPedido INT
AS
BEGIN
    SELECT fecha
    FROM pedidos
    WHERE id = @idPedido;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerIdProductoPorNombre]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerIdProductoPorNombre]
    @nombre_producto VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT id
    FROM productos
    WHERE nombre = @nombre_producto;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerItemsCarrito]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_ObtenerItemsCarrito]
  @idCarrito INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    ic.idItemCarro      AS id_item,
    ic.id_carrito,
    ic.id_producto,
    
    -- Producto
    p.nombre            AS producto_nombre,
    p.precio            AS producto_precio,
    p.activo            AS producto_activo,

    -- Marca
    m.id                AS id_marca,
    m.nombre            AS marca_nombre,
    m.activo            AS marca_activo,

    -- Categoría
    c.id                AS id_categoria,
    c.nombre            AS categoria_nombre,
    c.activo            AS categoria_activo,

    -- Talle
    ic.id_talle,
    t.etiqueta          AS talle_etiqueta,

    -- Cantidad
    ic.cantidad,

    -- Imagen (puede haber varias)
    ip.url_imagen       AS UrlImagen
  FROM ItemCarrito ic
    JOIN Productos p         ON p.id       = ic.id_producto
    JOIN Marcas m            ON m.id       = p.marca_id
    JOIN Categorias c        ON c.id       = p.categoria_id
    JOIN Talles   t          ON t.id       = ic.id_talle
    LEFT JOIN Imagenes_Productos ip ON ip.producto_id = p.id
  WHERE ic.id_carrito = @idCarrito
  ORDER BY ic.idItemCarro;
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerMarcaPorId]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ObtenerMarcaPorId]
    @id INT
AS
BEGIN
    SELECT 
        m.id AS 'id',
        m.nombre AS 'nombre',
        m.activo AS 'activo'
    FROM marcas m
    WHERE M.id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerOCrearCarrito]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_ObtenerOCrearCarrito]
    @idUsuario INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @idCarro INT;

    SELECT TOP 1 @idCarro = idCarro
    FROM Carrito
    WHERE id_usuario = @idUsuario AND activo = 1;

    IF @idCarro IS NULL
    BEGIN
        INSERT INTO Carrito(id_usuario, activo)
        VALUES(@idUsuario, 1);
        SET @idCarro = SCOPE_IDENTITY();
    END

    SELECT @idCarro AS idCarro;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPedidoExtendido]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerPedidoExtendido]
    @pedido_id INT
AS
BEGIN
    SELECT
        p.Id               AS PedidoId,
        p.NombreCliente,
        p.ModalidadEntrega,
        p.Direccion,
        p.FormaPago,
        p.Total,
        p.EstadoPedido,
        p.FechaPedido,
        d.NombreProducto,
        d.TalleEtiqueta,
        d.Cantidad,
        d.PrecioUnitario
    FROM PedidosV2 p
    INNER JOIN PedidoDetalleV2 d ON p.Id = d.PedidoId
    WHERE p.Id = @pedido_id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPedidoPorId]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ObtenerPedidoPorId]
    @idPedido INT
AS
BEGIN
    SELECT
        p.Id AS PedidoId,
        p.FechaPedido AS FechaPedido,
        p.ModalidadEntrega,
        p.Direccion,
        p.FormaPago,
        p.Total,
        p.EstadoPedido AS EstadoPedido,
        u.Nombre AS NombreCliente,
        u.Email AS EmailCliente,
        dp.Cantidad,
        dp.PrecioUnitario,
        pr.Nombre AS NombreProducto,
        t.Etiqueta AS TalleEtiqueta
    FROM PedidosV2 p
    INNER JOIN Usuarios u ON u.Id = p.ClienteId
    INNER JOIN PedidoDetalleV2 dp ON dp.PedidoId = p.Id
    INNER JOIN productos pr ON pr.Id = dp.IdProducto
    INNER JOIN Talles t ON t.Id = dp.IdTalle
    WHERE p.Id = @idPedido
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPedidosUsuario]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ObtenerPedidosUsuario]
    @clienteId INT
AS
BEGIN
    SELECT
        p.Id                   AS PedidoId,
        p.NombreCliente,
        p.ModalidadEntrega,
        p.Direccion,
        p.FormaPago,
        p.Total,
        p.EstadoPedido,
        p.FechaPedido,

        dp.NombreProducto,
        dp.TalleEtiqueta,
        dp.Cantidad,
        dp.PrecioUnitario
    FROM PedidosV2 p
    INNER JOIN PedidoDetalleV2 dp ON dp.PedidoId = p.Id
    WHERE p.ClienteId = @clienteId
    ORDER BY p.Id, dp.NombreProducto
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerProductoDetalle]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ObtenerProductoDetalle]
    @id INT
AS
BEGIN
    SELECT 
         p.id AS Id,
         p.nombre AS Nombre,
         p.descripcion AS Descripcion,
         p.precio AS Precio,
 		c.id AS IDCategoria,
        c.nombre AS Categoria,
		m.id AS IDMarca,
        m.nombre AS Marca,
		p.Activo AS Activo,
        ip.url_imagen AS UrlImagen
    FROM productos p
        LEFT JOIN imagenes_productos ip ON ip.producto_id = p.id
		LEFT JOIN categorias c ON p.categoria_id = c.id
		LEFT JOIN marcas m ON p.marca_id = m.id
    WHERE p.id = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerStock]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ObtenerStock]
    @producto_id INT,
    @talle_id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT cantidad
    FROM producto_talle
    WHERE producto_id = @producto_id AND talle_id = @talle_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerStockPorId]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ObtenerStockPorId]
    @IdProducto INT
AS
BEGIN
    SELECT 
        p.id AS Id,
        t.etiqueta AS Talle,
        pt.cantidad AS Cantidad,
        p.nombre AS Nombre,
        m.nombre AS Marca,
        c.nombre AS Categoria,
        p.precio AS Precio
    FROM producto_talle pt
    INNER JOIN productos p ON pt.producto_id = p.id
    INNER JOIN talles t ON pt.talle_id = t.id
    LEFT JOIN marcas m ON p.marca_id = m.id
    LEFT JOIN categorias c ON p.categoria_id = c.id
    WHERE p.id = @IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerTallesPorProducto]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ObtenerTallesPorProducto]
    @productoId INT
AS
BEGIN
    SELECT t.id, t.etiqueta 
     FROM dbo.producto_talle pt
    INNER JOIN talles t ON pt.talle_id = t.id
    WHERE pt.producto_id = @productoId AND pt.cantidad > 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerTodosLosPedidos]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ObtenerTodosLosPedidos]
AS
BEGIN
    SELECT
        p.Id                   AS PedidoId,
        p.NombreCliente,
        p.ModalidadEntrega,
        p.Direccion,
        p.FormaPago,
        p.Total,
        p.EstadoPedido,
        p.FechaPedido,

        dp.NombreProducto,
        dp.TalleEtiqueta,
        dp.Cantidad,
        dp.PrecioUnitario
    FROM PedidosV2 p
    INNER JOIN PedidoDetalleV2 dp ON dp.PedidoId = p.Id
    ORDER BY p.Id, dp.NombreProducto
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerTotalPedido]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ObtenerTotalPedido]
    @pedidoId INT
AS
BEGIN
    SELECT total FROM pedidos WHERE id = @pedidoId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerUsuarioPorId]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ObtenerUsuarioPorId]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        id, 
        email, 
        nombre, 
        apellido, 
        direccion_id, 
        url_imagen_perfil, 
        fecha_nacimiento
    FROM 
        usuarios
    WHERE 
        id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarDetallePedidoV2]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RegistrarDetallePedidoV2]
    @pedido_id         INT,
    @nombre_producto   VARCHAR(200),
    @talle_etiqueta    VARCHAR(50),
    @cantidad          INT,
    @precio_unitario   DECIMAL(18,2),
    @idproducto       INT,
	@idtalle          INT
AS
BEGIN
    INSERT INTO PedidoDetalleV2 (
        PedidoId, NombreProducto, TalleEtiqueta,
        Cantidad, PrecioUnitario, IdProducto, IdTalle
    )
    VALUES (
        @pedido_id, @nombre_producto, @talle_etiqueta,
        @cantidad, @precio_unitario, @idproducto, @idtalle
    );
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarPedido]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_RegistrarPedido]
  @cliente_id INT,
  @total      DECIMAL(10,2)
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO pedidos (fecha, cliente_id, total)
    VALUES (GETDATE(), @cliente_id, @total);
  SELECT SCOPE_IDENTITY() AS idPedido;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarPedidoDetalle]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[sp_RegistrarPedidoDetalle]
  @pedido_id       INT,
  @producto_id     INT,
  @talle_id        INT,
  @cantidad        INT,
  @precio_unitario DECIMAL(10,2)
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO pedido_detalle (pedido_id, producto_id, talle_id, cantidad, precio)
    VALUES (@pedido_id, @producto_id, @talle_id, @cantidad, @precio_unitario);
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarPedidoV2]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RegistrarPedidoV2]
    @cliente_id        INT,
    @nombre_cliente    VARCHAR(200),
    @email             VARCHAR(200),
    @telefono          VARCHAR(50),
    @modalidad         VARCHAR(50),
    @direccion         VARCHAR(300),
    @forma_pago        VARCHAR(50),
    @total             DECIMAL(18,2)
AS
BEGIN
    INSERT INTO PedidosV2 (
        ClienteId, NombreCliente, Email, Telefono,
        ModalidadEntrega, Direccion, FormaPago,
        Total, EstadoPedido, FechaPedido
    )
    VALUES (
        @cliente_id, @nombre_cliente, @email, @telefono,
        @modalidad, @direccion, @forma_pago,
        @total, 'Pendiente', GETDATE()
    );

    SELECT SCOPE_IDENTITY() AS idPedido;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RestarCantidadCarrito]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_RestarCantidadCarrito]
    @idCarrito  INT,
    @idProducto INT,
    @idTalle    INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 FROM ItemCarrito
        WHERE id_carrito = @idCarrito 
          AND id_producto = @idProducto 
          AND id_talle = @idTalle
          AND cantidad > 1
    )
    BEGIN
        UPDATE ItemCarrito
        SET cantidad = cantidad - 1
        WHERE id_carrito = @idCarrito 
          AND id_producto = @idProducto 
          AND id_talle = @idTalle;
    END
    ELSE
    BEGIN
        DELETE FROM ItemCarrito
        WHERE id_carrito = @idCarrito 
          AND id_producto = @idProducto 
          AND id_talle = @idTalle;
    END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_SumarCantidadCarrito]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SumarCantidadCarrito]
    @idCarrito  INT,
    @idProducto INT,
    @idTalle    INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 FROM ItemCarrito
        WHERE id_carrito = @idCarrito 
          AND id_producto = @idProducto 
          AND id_talle = @idTalle
    )
    BEGIN
        UPDATE ItemCarrito
        SET cantidad = cantidad + 1
        WHERE id_carrito = @idCarrito 
          AND id_producto = @idProducto 
          AND id_talle = @idTalle;
    END
    ELSE
    BEGIN
        INSERT INTO ItemCarrito (id_carrito, id_producto, id_talle, cantidad)
        VALUES (@idCarrito, @idProducto, @idTalle, 1);
    END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_vaciarCarrito]    Script Date: 11/7/2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_vaciarCarrito]
    @idUsuario INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @idCarro INT;

    
    SELECT TOP 1 @idCarro = idCarro
    FROM Carrito
    WHERE id_usuario = @idUsuario AND activo = 1;

    
    IF @idCarro IS NOT NULL
    BEGIN
        DELETE FROM ItemCarrito
        WHERE id_carrito = @idCarro;

        UPDATE Carrito
        SET activo = 0
        WHERE idCarro = @idCarro;
    END
END
GO
USE [master]
GO
ALTER DATABASE [ECOMMERCE_P3] SET  READ_WRITE 
GO
