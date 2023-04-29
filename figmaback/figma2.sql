-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2019 a las 19:02:59
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `skaters`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `Articulo_ID` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`Articulo_ID`, `Nombre`) VALUES
(1, 'Plushie'),
(2, 'Gunpla'),
(3, 'Figmas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `PK_historial` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `FK_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `Marca_ID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`Marca_ID`, `Nombre`) VALUES
(1, 'Apex'),
(2, 'Aniplex'),
(3, 'Bandai/Tamashii Nations'),
(4, 'Banpresto'),
(5, 'Furyu'),
(6, 'Good Smiles Company'),
(7, 'Kotobukiya'),
(8, 'Megahouse'),
(9, 'Mighty Jaxx'),
(10, 'PLUM'),
(11, 'SEGA'),
(12, 'Square Enix'),
(13, 'RIBOSE'),
(14, 'Taito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Producto_ID` int(11) NOT NULL,
  `Marca_FK` int(11) NOT NULL,
  `Articulo_FK` int(11) NOT NULL,
  `Cantidad` tinyint(4) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `Modelo` varchar(50) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Producto_ID`, `Marca_FK`, `Articulo_FK`, `Cantidad`, `Nombre`, `Foto`, `Modelo`, `Descripcion`, `Precio`) VALUES
(1, 4, 3, 11, 'Figma - DVA - Overwatch', 'figma-diva.jpg', 'Megahouse', 'Figura del mismo juego 2 de la mejor tanque Dva', 1000),
(4, 7, 3, 19, ' Figma - Deku - My Hero Academia', 'figma-deku.jpg', 'Kotobukiya', 'Figura del prota pelos verdes', 690),
(5, 7, 3, 3, 'Figma - Hatsune Miku - Vocaloid', 'figma-miku.webp', 'Banpresto', '¿Cuando sacan el anime de miku?', 570);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_usuario`
--

CREATE TABLE `t_usuario` (
  `Usuario_ID` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_usuario`
--

INSERT INTO `t_usuario` (`Usuario_ID`, `Nombre`) VALUES
(1, 'Cliente'),
(2, 'Administrador'),
(3, 'Almacenista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Usuario_ID` int(11) NOT NULL,
  `Tipo_FK` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Correo` varchar(255) NOT NULL,
  `Contrasena` varchar(128) NOT NULL,
  `Ultima_Conexion` bigint(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Usuario_ID`, `Tipo_FK`, `Nombre`, `Apellido`, `Correo`, `Contrasena`, `Ultima_Conexion`) VALUES
(1, 2, 'Krozz', 'RDGZ', 'krozzimpulse@gmail.com', 'clave', 0),
(2, 1, 'Doug Dimmadomme', 'Dueño del Domodimm', 'dougdim@gmail.com', 'clave', 0),
(3, 3, 'Jose de Jesus', 'Jimenez Jara', 'josesito@gmail.com', 'clave', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`Articulo_ID`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`PK_historial`),
  ADD KEY `FK_usuario` (`FK_usuario`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`Marca_ID`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Producto_ID`),
  ADD KEY `Marca_FK` (`Marca_FK`),
  ADD KEY `Articulo_FK` (`Articulo_FK`);

--
-- Indices de la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  ADD PRIMARY KEY (`Usuario_ID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Usuario_ID`),
  ADD KEY `Tipo_FK` (`Tipo_FK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `Articulo_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `PK_historial` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `Marca_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `Producto_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT de la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  MODIFY `Usuario_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Usuario_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`FK_usuario`) REFERENCES `usuario` (`Usuario_ID`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Marca_FK`) REFERENCES `marca` (`Marca_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`Articulo_FK`) REFERENCES `articulo` (`Articulo_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Tipo_FK`) REFERENCES `t_usuario` (`Usuario_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
