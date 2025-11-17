-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2025 a las 22:02:57
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `perfumeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `proveedor` varchar(100) DEFAULT NULL,
  `id_perfume` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo_unitario` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `id_usuario`, `fecha`, `proveedor`, `id_perfume`, `cantidad`, `costo_unitario`, `total`) VALUES
(5646, 2, '2025-10-08', 'h', 2, 2, '1111.00', '1111.00'),
(222213, 2, '2025-10-08', 'h', 2, 2, '1111.00', '1111.00'),
(222215, 5, '2025-10-07', 'e', 2, 22, '31.00', '31.00'),
(222216, 5, '2025-10-08', 'eee', 2, 32, '23.00', '2323.00'),
(222217, 5, '2025-10-18', 'r', 2, 2, '2.00', '2.00'),
(222218, 5, '2025-10-18', 'r', 2, 2, '2.00', '2.00'),
(222219, 2, '2025-10-30', 'ee', 2, 3, '0.09', '333.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `id_devolucion` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_perfume` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `motivo` text DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `devoluciones`
--

INSERT INTO `devoluciones` (`id_devolucion`, `id_venta`, `id_perfume`, `fecha`, `motivo`, `cantidad`) VALUES
(1, 1, 1, '2025-08-09', 'Perfume dañadoo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_movimiento` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `id_perfume` int(11) DEFAULT NULL,
  `tipo` enum('entrada','salida') NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL COMMENT 'Precio unitario del perfume en este movimiento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_movimiento`, `nombre`, `fecha`, `id_perfume`, `tipo`, `cantidad`, `descripcion`, `precio`) VALUES
(2, 'Sauvage - Dior', '2025-08-02', 2, 'entrada', 20, 'Compra inicial CK One', '1000000.00'),
(3, 'Invictus - Paco Rabanne', '2025-08-05', 1, 'salida', 2, 'Venta a cliente', '2500000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nombre`) VALUES
(1, 'Dior'),
(2, 'Boss'),
(3, 'Chanel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icono` varchar(100) DEFAULT NULL,
  `orden` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `nombre`, `url`, `icono`, `orden`) VALUES
(1, 'Marcas', 'marcas/marcas', 'fa-tags', 1),
(2, 'Reseñas', 'resenas/resenas', 'fa-star', 2),
(3, 'Inventario', 'inventario/inventario', 'fa-box', 3),
(4, 'Perfumes', 'perfumes/perfumes', 'fa-spray-can', 4),
(5, 'Devoluciones', 'devoluciones/devoluciones', 'fa-undo', 5),
(6, 'Ventas', 'ventas/ventas', 'fa-shopping-cart', 6),
(7, 'Compras', 'compras/compras', 'fa-truck', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfumes`
--

CREATE TABLE `perfumes` (
  `id_perfume` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfumes`
--

INSERT INTO `perfumes` (`id_perfume`, `nombre`, `marca_id`, `precio`, `stock`) VALUES
(1, 'Dior Sauvage', 1, '320000.00', 100),
(2, 'CK One', 2, '250000.00', 20),
(3, 'Chanel Nº5', 3, '450000.00', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resenas`
--

CREATE TABLE `resenas` (
  `id_resena` int(11) NOT NULL,
  `id_perfume` int(11) DEFAULT NULL,
  `cliente` varchar(100) DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL CHECK (`calificacion` between 1 and 5),
  `comentario` text DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `resenas`
--

INSERT INTO `resenas` (`id_resena`, `id_perfume`, `cliente`, `calificacion`, `comentario`, `fecha`) VALUES
(2, 2, 'Laura Gómez', 3, 'Aroma suave, me gusta.', '2025-08-07'),
(100, 1, 'Juan Pérez', 5, 'Excelente aroma, muy duradero.', '2025-01-05'),
(101, 2, 'María López', 4, 'Buen perfume, aunque un poco fuerte.', '2025-01-06'),
(102, 1, 'Carlos Díaz', 3, 'Regular, esperaba algo más.', '2025-01-07'),
(103, 2, 'Ana Torres', 5, 'Mi favorito, lo uso todos los días.', '2025-01-08'),
(104, 1, 'Luis Fernández', 2, 'No me agradó el aroma.', '2025-01-09'),
(105, 2, 'Sofía Martínez', 4, 'Fresco y elegante.', '2025-01-10'),
(106, 1, 'Pedro Gómez', 5, 'Increíble fijación, muy recomendado.', '2025-01-11'),
(107, 2, 'Laura Sánchez', 3, 'Está bien, pero se desvanece rápido.', '2025-01-12'),
(108, 1, 'Andrés Ramírez', 5, 'Aroma suave y duradero.', '2025-01-13'),
(109, 2, 'Paula Rivera', 4, 'Me gusta, aunque prefiero otros tonos.', '2025-01-14'),
(110, 1, 'Jorge Herrera', 5, 'Ideal para ocasiones especiales.', '2025-01-15'),
(111, 2, 'Claudia Vega', 3, 'No es lo que esperaba.', '2025-01-16'),
(112, 1, 'Marta Ruiz', 4, 'Huele muy bien, buena duración.', '2025-01-17'),
(113, 2, 'David Castillo', 5, 'Excelente para el día a día.', '2025-01-18'),
(114, 1, 'Isabel Ortiz', 2, 'Demasiado fuerte para mí.', '2025-01-19'),
(115, 2, 'Ricardo Méndez', 4, 'Aroma clásico y elegante.', '2025-01-20'),
(116, 1, 'Carmen Navarro', 5, 'Me encanta, siempre recibo cumplidos.', '2025-01-21'),
(117, 2, 'Héctor Molina', 3, 'No dura tanto como esperaba.', '2025-01-22'),
(118, 1, 'Patricia León', 4, 'Perfume agradable y fresco.', '2025-01-23'),
(119, 2, 'Felipe Soto', 5, 'Muy sofisticado, aroma único.', '2025-01-24'),
(120, 1, 'Lorena Gil', 3, 'Está bien, pero no destaca.', '2025-01-25'),
(121, 2, 'Daniel Pardo', 4, 'Lo volvería a comprar.', '2025-01-26'),
(122, 1, 'Gabriela Ramos', 5, 'Simplemente perfecto.', '2025-01-27'),
(123, 2, 'Manuel Arias', 2, 'No me gustó su aroma final.', '2025-01-28'),
(124, 1, 'Sara Acosta', 5, 'Aroma encantador, de mis favoritos.', '2025-01-29'),
(125, 2, 'Iván Rojas', 3, 'Pasable, pero poco duradero.', '2025-01-30'),
(126, 1, 'Adriana Pineda', 4, 'Tiene un toque dulce agradable.', '2025-01-31'),
(127, 2, 'Miguel Vargas', 5, 'Excelente relación calidad-precio.', '2025-02-01'),
(128, 1, 'Rosa Morales', 4, 'Muy bueno, aunque algo caro.', '2025-02-02'),
(129, 2, 'Samuel Campos', 5, 'Perfecto para regalar.', '2025-02-03'),
(130, 1, 'Daniela Lozano', 3, 'Regular, aroma artificial.', '2025-02-04'),
(131, 2, 'Oscar Peña', 4, 'Fresco, me gusta para el trabajo.', '2025-02-05'),
(132, 1, 'Valeria Cruz', 5, 'Muy femenino y elegante.', '2025-02-06'),
(133, 2, 'Hugo Gutiérrez', 2, 'No combina con mi estilo.', '2025-02-07'),
(134, 1, 'Beatriz Silva', 5, 'Me encanta cómo huele todo el día.', '2025-02-08'),
(135, 2, 'Alejandro Reyes', 4, 'Buen perfume, aroma sutil.', '2025-02-09'),
(136, 1, 'Camila Duarte', 5, 'Increíble fragancia floral.', '2025-02-10'),
(137, 2, 'Rodrigo Nieto', 3, 'Demasiado ligero para mi gusto.', '2025-02-11'),
(138, 1, 'Pilar Mendoza', 4, 'Me gustó, lo recomiendo.', '2025-02-12'),
(139, 2, 'Tomás Fuentes', 5, 'Un clásico que nunca falla.', '2025-02-13'),
(140, 1, 'Elena Romero', 4, 'Delicado y agradable.', '2025-02-14'),
(141, 2, 'Fernando Paz', 3, 'Aroma interesante pero fugaz.', '2025-02-15'),
(142, 1, 'Nadia Escobar', 5, 'Mi perfume favorito.', '2025-02-16'),
(143, 2, 'Cristina Peña', 4, 'Muy buena fijación.', '2025-02-17'),
(144, 1, 'Emilio Bravo', 5, 'Excelente opción para todos los días.', '2025-02-18'),
(145, 2, 'Rafael Lozano', 3, 'Cumple, pero nada especial.', '2025-02-19'),
(146, 1, 'Natalia Castro', 5, 'Encantador aroma floral.', '2025-02-20'),
(147, 2, 'Lucía Delgado', 4, 'Me agrada su suavidad.', '2025-02-21'),
(148, 1, 'Arturo Prieto', 5, 'Muy elegante y duradero.', '2025-02-22'),
(149, 2, 'Andrea Marín', 4, 'Bonito aroma, buena duración.', '2025-02-23'),
(150, 1, 'Pablo Serrano', 3, 'No me convence el olor.', '2025-02-24'),
(151, 2, 'Julia Morales', 5, 'Perfecto para eventos.', '2025-02-25'),
(152, 1, 'Ernesto Ríos', 4, 'Agradable y equilibrado.', '2025-02-26'),
(153, 2, 'Mónica Herrera', 5, 'Maravilloso, me encanta.', '2025-02-27'),
(154, 1, 'Carlos Méndez', 2, 'Demasiado dulce.', '2025-02-28'),
(155, 2, 'Silvia Torres', 4, 'Perfume fino y discreto.', '2025-03-01'),
(156, 1, 'Diego Morales', 5, 'Muy sofisticado.', '2025-03-02'),
(157, 2, 'Marina Soto', 4, 'Buen aroma, ideal para verano.', '2025-03-03'),
(158, 1, 'Ignacio Ortega', 3, 'Esperaba más duración.', '2025-03-04'),
(159, 2, 'Cecilia Vega', 5, 'Aroma delicioso, lo amo.', '2025-03-05'),
(160, 1, 'Matías Suárez', 4, 'Fresco y moderno.', '2025-03-06'),
(161, 2, 'Rebeca Flores', 3, 'Está bien, pero caro.', '2025-03-07'),
(162, 1, 'Julián Peña', 5, 'Mi favorito por mucho.', '2025-03-08'),
(163, 2, 'Estela Ramos', 4, 'Me encanta su fijación.', '2025-03-09'),
(164, 1, 'Antonio Lara', 3, 'Nada fuera de lo común.', '2025-03-10'),
(165, 2, 'Verónica Ruiz', 5, 'Simplemente espectacular.', '2025-03-11'),
(166, 1, 'Clara Mejía', 4, 'Suave, ideal para diario.', '2025-03-12'),
(167, 2, 'Nicolás Ramírez', 5, 'Excelente aroma amaderado.', '2025-03-13'),
(168, 1, 'Marisol Peña', 4, 'Buen perfume, recomendable.', '2025-03-14'),
(169, 2, 'Andrés Gálvez', 5, 'Inigualable aroma, de lujo.', '2025-03-15'),
(170, 1, 'Jimena Cabrera', 3, 'Pasable, pero no lo volvería a comprar.', '2025-03-16'),
(171, 2, 'Esteban Cruz', 4, 'Buen perfume, duración media.', '2025-03-17'),
(172, 1, 'Carolina Vega', 5, 'Perfecto en todo sentido.', '2025-03-18'),
(173, 2, 'Sebastián León', 4, 'Huele muy bien, recomendado.', '2025-03-19'),
(174, 1, 'Elisa Márquez', 5, 'Encantador aroma floral.', '2025-03-20'),
(175, 2, 'Rodrigo López', 4, 'Elegante y discreto.', '2025-03-21'),
(176, 1, 'Natalia Flores', 5, 'De los mejores que he probado.', '2025-03-22'),
(177, 2, 'Emilia Santos', 3, 'No me duró tanto como esperaba.', '2025-03-23'),
(178, 1, 'Ángel Molina', 4, 'Me gusta su toque amaderado.', '2025-03-24'),
(179, 2, 'Luz Ramírez', 5, 'Increíble fragancia, mi favorita.', '2025-03-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_admin`
--

CREATE TABLE `solicitudes_admin` (
  `id_solicitud` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estado` enum('pendiente','aprobado','rechazado') DEFAULT 'pendiente',
  `aprobado_por` int(11) DEFAULT NULL,
  `fecha_solicitud` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_respuesta` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `nombre`, `password`) VALUES
(1, 'usuario@ejemplo.com', '', '$2y$10$e0NRzQ6v1Q6v1Q6v1Q6vOe1Q6v1Q6v1Q6v1Q6v1Q6v1Q6v1Q6v1Q6'),
(2, 'jorgegarcia31415@gmail.com', 'Jorge', '$2y$10$gKU27.aY9QH.TS26LiPLt.VkZbnuIcYliQ5sQz/mj6D/YQWpwlFKe'),
(3, 'jorge31415@gmail.com', 'Jorge', '$2y$10$bj1WoabD8x1eNapy0kf1ZuNmwjsXX3kKSVfd7Udw55KWHrtGG6GdG'),
(4, 'jorge1@gmail.com', '', '$2y$10$uLVY3pJII.hJl6gzBt3lgOZbfChBP/qShTIWsAA2/0VM3EdhREysS'),
(5, 'hola@gmail.com', '', '$2y$10$PyFkmYOtqUpjUHiFPzcld.ShUHeeZZm97g6YaIqZgjciNTHhzFhsy'),
(6, 'expocicion@gmail.com', '', '$2y$10$FqjoR7W329fOxiOQOyuN9.jpSvuwSuT2WL8edndEFHiBb0mHgbJlO'),
(7, 'soyjorge@gmail.com', '', '$2y$10$5daCFQiU/g0x93NoQDxum.FO4EX.qVJiv9l0vjm9MVkmKOTzeKpaS'),
(8, 'william@gmail.com', '', '$2y$10$b0Oo0mcOhFg164rMiK2ZMO.vEzLBFDeTySrkWFJwgULTUWBPw5lUm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosss`
--

CREATE TABLE `usuariosss` (
  `u` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_perfume` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo_unitario` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `fecha`, `id_perfume`, `cantidad`, `costo_unitario`, `total`) VALUES
(1, '2025-08-05', 1, 2, NULL, '650000.00'),
(2, '2025-08-06', 2, 1, NULL, '250000.00'),
(111, '2025-07-30', 1, 3, NULL, '960000.00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_perfume` (`id_perfume`),
  ADD KEY `fk_compras_usuario` (`id_usuario`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`id_devolucion`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_perfume` (`id_perfume`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `id_perfume` (`id_perfume`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfumes`
--
ALTER TABLE `perfumes`
  ADD PRIMARY KEY (`id_perfume`),
  ADD KEY `marca_id` (`marca_id`);

--
-- Indices de la tabla `resenas`
--
ALTER TABLE `resenas`
  ADD PRIMARY KEY (`id_resena`),
  ADD KEY `id_perfume` (`id_perfume`);

--
-- Indices de la tabla `solicitudes_admin`
--
ALTER TABLE `solicitudes_admin`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `aprobado_por` (`aprobado_por`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `usuariosss`
--
ALTER TABLE `usuariosss`
  ADD PRIMARY KEY (`u`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_perfume` (`id_perfume`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222220;

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `id_devolucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22223;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `perfumes`
--
ALTER TABLE `perfumes`
  MODIFY `id_perfume` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT de la tabla `resenas`
--
ALTER TABLE `resenas`
  MODIFY `id_resena` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT de la tabla `solicitudes_admin`
--
ALTER TABLE `solicitudes_admin`
  MODIFY `id_solicitud` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_perfume`) REFERENCES `perfumes` (`id_perfume`),
  ADD CONSTRAINT `fk_compras_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `devoluciones_ibfk_2` FOREIGN KEY (`id_perfume`) REFERENCES `perfumes` (`id_perfume`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_perfume`) REFERENCES `perfumes` (`id_perfume`);

--
-- Filtros para la tabla `perfumes`
--
ALTER TABLE `perfumes`
  ADD CONSTRAINT `perfumes_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id_marca`);

--
-- Filtros para la tabla `resenas`
--
ALTER TABLE `resenas`
  ADD CONSTRAINT `resenas_ibfk_1` FOREIGN KEY (`id_perfume`) REFERENCES `perfumes` (`id_perfume`);

--
-- Filtros para la tabla `solicitudes_admin`
--
ALTER TABLE `solicitudes_admin`
  ADD CONSTRAINT `solicitudes_admin_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuariosss` (`u`) ON DELETE CASCADE,
  ADD CONSTRAINT `solicitudes_admin_ibfk_2` FOREIGN KEY (`aprobado_por`) REFERENCES `usuariosss` (`u`) ON DELETE SET NULL;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_perfume`) REFERENCES `perfumes` (`id_perfume`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
