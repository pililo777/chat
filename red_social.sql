-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-06-2015 a las 17:30:06
-- Versión del servidor: 5.6.11
-- Versión de PHP: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `red_social`
--
CREATE DATABASE IF NOT EXISTS `red_social` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `red_social`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(1) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `texto` text COLLATE utf8_spanish_ci NOT NULL,
  `usuario_envia` int(11) NOT NULL,
  `usuario_recibe` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_men_env` (`usuario_envia`),
  KEY `fk_men_rec` (`usuario_recibe`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=154 ;

--
-- Volcado de datos para la tabla `chat`
--

INSERT INTO `chat` (`id`, `estado`, `fecha`, `texto`, `usuario_envia`, `usuario_recibe`) VALUES
(2, 0, '2015-06-07 07:38:19', 'hola\r\n', 15, 16),
(3, 0, '2015-06-07 08:14:12', 'hi\r\n', 15, 16),
(4, 0, '2015-06-07 08:15:43', 'hola\r\n', 15, 16),
(5, 0, '2015-06-07 08:19:09', 'hola 16\r\n', 15, 16),
(6, 0, '2015-06-07 08:21:05', 'hi 16\r\n', 15, 16),
(7, 0, '2015-06-07 08:23:17', 'prueba antes\r\n', 15, 16),
(8, 0, '2015-06-07 08:32:53', 'hola 16\r\n', 15, 16),
(9, 0, '2015-06-07 08:34:43', 'hola 16\r\n', 15, 16),
(10, 1, '2015-06-07 08:35:03', 'si, hola\r\n', 16, 15),
(11, 1, '2015-06-07 08:35:09', 'parece que todo va bien\r\n', 16, 15),
(12, 0, '2015-06-07 08:36:12', 'ok\r\n', 15, 16),
(13, 0, '2015-06-07 09:28:29', 'hola\r\n', 15, 16),
(14, 1, '2015-06-07 09:28:57', 'hola\r\n', 16, 15),
(15, 0, '2015-06-07 09:29:07', 'holaa\r\n', 15, 16),
(16, 1, '2015-06-07 09:29:15', 'cambia juan por evelyn\r\n', 16, 15),
(17, 1, '2015-06-07 09:29:25', 'en la bbdd\r\n', 16, 15),
(18, 0, '2015-06-07 09:30:06', 'hola ana\r\n', 15, 16),
(19, 1, '2015-06-07 09:30:20', 'hola juan\r\n', 16, 15),
(20, 0, '2015-06-07 09:30:34', 'que tal nuestros nuevos nombres?\r\n', 15, 16),
(21, 1, '2015-06-07 09:30:41', 'bien jaja\r\n', 16, 15),
(22, 0, '2015-06-07 09:30:45', 'ok\r\n', 15, 16),
(23, 0, '2015-06-07 09:30:52', 'perfecto!\r\n', 15, 16),
(24, 1, '2015-06-07 09:31:33', 'hola juan\r\n', 16, 15),
(25, 0, '2015-06-07 09:36:38', 'hola\r\n', 15, 16),
(26, 0, '2015-06-07 09:36:44', 'me tienen que salir los conectados\r\n', 15, 16),
(27, 0, '2015-06-07 09:37:39', 'array\r\n', 15, 16),
(28, 0, '2015-06-07 10:07:00', 'hola\r\n', 15, 16),
(29, 1, '2015-06-07 10:07:01', 'hola juan\r\n', 16, 15),
(30, 0, '2015-06-07 10:07:06', 'jola ana\r\n', 15, 16),
(31, 0, '2015-06-07 10:19:00', 'mensaje a\r\n', 15, 16),
(32, 0, '2015-06-07 10:19:03', 'mensaje b\r\n', 15, 16),
(33, 0, '2015-06-07 10:19:05', 'mensaje c\r\n', 15, 16),
(34, 0, '2015-06-07 10:23:54', 'uno\r\n', 15, 16),
(35, 0, '2015-06-07 10:23:54', 'sadf\r\n', 15, 16),
(36, 0, '2015-06-07 10:23:55', 'sadf\r\n', 15, 16),
(37, 0, '2015-06-07 10:23:56', 'asdf\r\n', 15, 16),
(38, 0, '2015-06-07 10:26:58', 'a\r\n', 15, 16),
(39, 0, '2015-06-07 10:26:58', 'b\r\n', 15, 16),
(40, 0, '2015-06-07 10:26:59', 'd\r\n', 15, 16),
(41, 0, '2015-06-07 10:27:00', 'e\r\n', 15, 16),
(42, 0, '2015-06-07 10:27:01', 'f\r\n', 15, 16),
(43, 0, '2015-06-07 10:41:08', 'g\r\n', 15, 16),
(44, 0, '2015-06-07 10:41:10', 'h\r\n', 15, 16),
(45, 0, '2015-06-07 10:41:11', 'i\r\n', 15, 16),
(46, 0, '2015-06-07 10:41:11', 'j\r\n', 15, 16),
(47, 0, '2015-06-07 10:41:12', 'k\r\n', 15, 16),
(48, 0, '2015-06-07 10:41:13', 'l\r\n', 15, 16),
(49, 0, '2015-06-07 10:43:34', 'm\r\n', 15, 16),
(50, 0, '2015-06-07 10:43:35', 'n\r\n', 15, 16),
(51, 0, '2015-06-07 10:43:36', 'o\r\n', 15, 16),
(52, 0, '2015-06-07 10:43:37', 'p\r\n', 15, 16),
(53, 0, '2015-06-07 10:43:38', 'q\r\n', 15, 16),
(54, 0, '2015-06-07 10:44:45', 'r\r\n', 15, 16),
(55, 0, '2015-06-07 10:44:46', 's\r\n', 15, 16),
(56, 0, '2015-06-07 10:44:47', 't\r\n', 15, 16),
(57, 0, '2015-06-07 10:44:48', 'u\r\n', 15, 16),
(58, 0, '2015-06-07 10:48:46', 'v\r\n', 15, 16),
(59, 0, '2015-06-07 10:48:47', 'w\r\n', 15, 16),
(60, 0, '2015-06-07 10:48:47', 'x\r\n', 15, 16),
(61, 0, '2015-06-07 10:48:48', 'y\r\n', 15, 16),
(62, 0, '2015-06-07 10:48:49', 'z\r\n', 15, 16),
(63, 0, '2015-06-07 10:51:45', 'a\r\n', 15, 16),
(64, 0, '2015-06-07 10:51:46', 'b\r\n', 15, 16),
(65, 0, '2015-06-07 10:51:47', 'c\r\n', 15, 16),
(66, 0, '2015-06-07 10:51:48', 'd\r\n', 15, 16),
(67, 0, '2015-06-07 10:51:49', 'e\r\n', 15, 16),
(68, 0, '2015-06-07 10:54:04', 'f\r\n', 15, 16),
(69, 0, '2015-06-07 10:54:05', 'g\r\n', 15, 16),
(70, 0, '2015-06-07 10:54:06', 'h\r\n', 15, 16),
(71, 0, '2015-06-07 10:54:07', 'i\r\n', 15, 16),
(72, 0, '2015-06-07 11:05:32', 'j\r\n', 15, 16),
(73, 0, '2015-06-07 11:05:33', 'k\r\n', 15, 16),
(74, 0, '2015-06-07 11:05:34', 'l\r\n', 15, 16),
(75, 0, '2015-06-07 11:05:35', 'm\r\n', 15, 16),
(76, 0, '2015-06-07 11:05:35', 'n\r\n', 15, 16),
(77, 0, '2015-06-07 11:08:52', 'k\r\n', 15, 16),
(78, 0, '2015-06-07 11:08:53', 'l\r\n', 15, 16),
(79, 0, '2015-06-07 11:08:54', 'm\r\n', 15, 16),
(80, 0, '2015-06-07 11:08:54', 'n\r\n', 15, 16),
(81, 0, '2015-06-07 11:08:55', 'o\r\n', 15, 16),
(82, 0, '2015-06-07 11:08:56', 'p\r\n', 15, 16),
(83, 0, '2015-06-07 11:11:43', 'q\r\n', 15, 16),
(84, 0, '2015-06-07 11:11:44', 'r\r\n', 15, 16),
(85, 0, '2015-06-07 11:11:46', 's\r\n', 15, 16),
(86, 0, '2015-06-07 11:11:47', 't\r\n', 15, 16),
(87, 0, '2015-06-07 11:11:49', 't\r\n', 15, 16),
(88, 0, '2015-06-07 11:11:50', 'w\r\n', 15, 16),
(89, 1, '2015-06-07 11:56:47', 'hola\r\n', 16, 15),
(90, 0, '2015-06-07 11:57:01', 'hola\r\n', 15, 16),
(91, 0, '2015-06-07 11:57:34', 'hola\r\n', 15, 16),
(92, 0, '2015-06-07 11:57:38', 'q ue tal\r\n', 15, 16),
(93, 0, '2015-06-07 11:57:40', 'hola\r\n', 15, 16),
(94, 0, '2015-06-07 11:57:45', 'que pasa\r\n', 15, 16),
(95, 1, '2015-06-07 11:58:02', 'ola\r\n', 16, 15),
(96, 1, '2015-06-07 11:59:33', 'hola juan\r\n', 16, 15),
(97, 0, '2015-06-07 11:59:37', 'ahora si\r\n', 15, 16),
(98, 0, '2015-06-07 11:59:40', 'te llega?\r\n', 15, 16),
(99, 1, '2015-06-07 11:59:42', 'perfect\r\n', 16, 15),
(100, 1, '2015-06-07 12:27:59', 'hi\r\n', 16, 15),
(101, 1, '2015-06-07 12:55:41', 'hola\r\n', 16, 15),
(102, 1, '2015-06-07 13:03:45', 'que tal, soy pepe\r\n', 16, 17),
(103, 0, '2015-06-07 13:24:41', 'hola\r\n', 16, 21),
(104, 1, '2015-06-07 13:29:18', 'hola\r\n', 16, 16),
(105, 1, '2015-06-07 13:29:25', 'que tal\r\n', 16, 16),
(106, 0, '2015-06-07 13:30:21', 'hola Fran, soy Ana\r\n', 16, 21),
(107, 0, '2015-06-07 13:30:33', 'que tal Ana\r\n', 21, 16),
(108, 0, '2015-06-07 13:30:42', 'Como estas?\r\n', 21, 16),
(109, 0, '2015-06-07 13:31:04', 'Porque no llegan?\r\n', 21, 16),
(110, 0, '2015-06-07 13:32:04', 'hola Fran\r\n', 16, 21),
(111, 0, '2015-06-07 13:32:17', 'que tal\r\n', 21, 16),
(112, 0, '2015-06-07 13:36:24', 'hola Fran\r\n', 16, 21),
(113, 0, '2015-06-07 13:36:33', 'que tal Ana\r\n', 21, 16),
(114, 1, '2015-06-07 13:36:50', 'Hola Juan\r\n', 16, 15),
(115, 0, '2015-06-07 13:37:18', 'que tal Fran\r\n', 16, 21),
(116, 0, '2015-06-07 13:37:41', 'si pero el problema es si entras con otro id de amigo\r\n', 21, 16),
(117, 1, '2015-06-07 13:38:00', 'hola Juan', 16, 15),
(118, 0, '2015-06-07 13:38:16', 'sdfadffasdf\r\n', 16, 21),
(119, 0, '2015-06-07 13:38:29', 'hola, soy Fran\r\n', 21, 16),
(120, 1, '2015-06-07 13:41:11', 'dfasdf\r\n', 16, 15),
(121, 0, '2015-06-07 13:41:18', 'asdfasdf\r\n', 16, 21),
(122, 0, '2015-06-07 13:41:28', 'fffffff\r\n', 21, 16),
(123, 1, '2015-06-07 13:46:26', 'hola juan\r\n', 16, 15),
(124, 0, '2015-06-07 13:46:41', 'hola fran\r\n', 16, 21),
(125, 0, '2015-06-07 13:46:51', 'que tal anita\r\n', 21, 16),
(126, 1, '2015-06-07 13:56:00', 'sdfsdf\r\n', 16, 15),
(127, 0, '2015-06-07 13:56:12', 'hola fran\r\n', 16, 21),
(128, 0, '2015-06-07 13:56:31', 'holaaaaa\r\n', 21, 16),
(129, 1, '2015-06-07 14:18:15', 'sdfasdf\r\n', 16, 15),
(130, 1, '2015-06-07 14:18:17', 'asdfasdf\r\n', 16, 15),
(131, 1, '2015-06-07 14:18:19', 'sdfasdf\r\n', 16, 15),
(132, 1, '2015-06-07 14:18:51', 'asdfasdf\r\n', 16, 15),
(133, 1, '2015-06-07 14:18:52', 'asdfasdf\r\n', 16, 15),
(134, 1, '2015-06-07 14:19:26', 'sdfasf\r\n', 16, 15),
(135, 1, '2015-06-07 14:19:28', 'asdfasdf\r\n', 16, 15),
(136, 1, '2015-06-07 14:19:30', 'asdf\r\n', 16, 15),
(137, 1, '2015-06-07 14:20:45', 'sdfasdf\r\n', 16, 15),
(138, 1, '2015-06-07 14:20:47', 'asdfadf\r\n', 16, 15),
(139, 0, '2015-06-07 14:50:49', 'hola SOY ANA\r\n', 16, 21),
(140, 0, '2015-06-07 15:05:39', 'hola fran\r\n', 16, 21),
(141, 0, '2015-06-07 15:08:51', 'hola que tal ANA\r\n', 21, 16),
(142, 0, '2015-06-07 15:08:59', 'bien fran\r\n', 16, 21),
(143, 0, '2015-06-07 15:09:10', 'dsdasdasdasdsad\r\n', 21, 16),
(144, 1, '2015-06-07 15:09:28', 'aaaaaa\r\n', 21, 16),
(145, 1, '2015-06-07 15:11:36', 'hola nenaaa\r\n', 21, 16),
(146, 0, '2015-06-07 15:11:47', 'hi\r\n', 16, 21),
(147, 1, '2015-06-07 15:12:46', 'hola nena\r\n', 21, 16),
(148, 0, '2015-06-07 15:12:56', 'hola neno\r\n', 16, 21),
(149, 0, '2015-06-07 15:14:35', 'hola\r\n', 16, 21),
(150, 1, '2015-06-07 15:14:42', 'hola ana\r\n', 21, 16),
(151, 0, '2015-06-07 15:14:46', 'hola f\r\n', 16, 21),
(152, 1, '2015-06-07 15:18:00', 'yo te mando muchos mensajes no?\r\n', 21, 16),
(153, 0, '2015-06-07 15:18:08', 'sip, muchos\r\n', 16, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `texto` text COLLATE utf8_spanish_ci NOT NULL,
  `valoracion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_com_usu` (`usuario`),
  KEY `fk_com_pro` (`producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_producto`
--

CREATE TABLE IF NOT EXISTS `imagenes_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto` int(11) NOT NULL,
  `ruta` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_img_pro` (`producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `fecha_subida` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `precio` double(9,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pro_usu` (`usuario`),
  KEY `fk_pro_tip` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_producto`
--

CREATE TABLE IF NOT EXISTS `tipos_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipos_producto`
--

INSERT INTO `tipos_producto` (`id`, `nombre`) VALUES
(1, 'Agricultura'),
(2, 'Ganadería'),
(3, 'Artesanía'),
(4, 'Otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `pais` char(2) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'ES',
  `provincia` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `localidad` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(200) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'avatar.jpg',
  `coordenadas` point DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `pais`, `provincia`, `localidad`, `telefono`, `email`, `password`, `imagen`, `coordenadas`, `fecha_registro`) VALUES
(15, 'juan', 'ES', 'bcn', 'bcn', '8338383', 'juan@gmail.com', 'a93f50a22a03493b39055f41da3463b3057e286c65771f632aaef18084e588197fce60fa4301dfb85f27f7362c84fb79fd32510cdc8c22095fcfdd0c9f739727', 'avatar.jpg', NULL, '2015-06-03 13:56:23'),
(16, 'ana', 'ES', 'bcn', 'bcn', '123', 'ana@gmail.com', '95b1db09a6c17b4b88059a393195f8fa184711ee37b914ba38597ec3e4b70178be9dad9d2966111d7635a811968102e4b4462a29c1ad4911961c5dfb6ecba6aa', 'avatar.jpg', NULL, '2015-06-03 14:25:17'),
(17, 'pepe', 'ES', 'bcn', 'bcn', '122333444', 'pepe@gmail.com', 'd60e074538b75e1b64f551541d80a3567e07a753e8c80808563534aa0632ce80d2cb499748bb6b853d02d163521434f99fa05fe527dc18a9ecee1dec0838b300', 'avatar.jpg', NULL, '2015-06-03 18:46:44'),
(18, 'pep', 'ES', 'bcn', 'bcn', '123456789', 'pep@gmail.com', 'bc31d240282f751d4e2bb570d2451617a008e863a66aaf637299c0fd476cbff020f664f597f111f56f207f4d725ad6423c5cb9056db901b27d3fd242352864ee', 'avatar.jpg', NULL, '2015-06-06 17:05:32'),
(19, 'carla', 'ES', 'barcelona', 'barcelona', '123123123', 'carla@gmail.com', 'a5c4bed3b867703b1587131d0055d89337d4f23fe98767ff02a19dde77f8c87fb562c3cccfc9d9d81432f6b250ee239db78be1a8fc08df4fc13cf0b7ac6a4d66', 'avatar.jpg', NULL, '2015-06-06 17:06:24'),
(20, 'maria', 'ES', 'barcelona', 'barcelona', '123123123', 'maria@gmail.com', '1dfc0291c769673b6c9efc7531caa32d62d27c4c773e697ba121f8e9b50e4102e2762731fd1b965c7199964c059ae3cc691f660d382cd30cb26f705381808166', 'avatar.jpg', NULL, '2015-06-07 06:13:02'),
(21, 'Fran', 'ES', 'Sevilla', 'Sevilla', '12345', 'fran@asd.com', 'e57d40551bfd30f94064bd828738d9a18fc370b8d67d5bfffc0366e30d7ab22a98eab67b42032d7c8b83fc1d01071378b44c147c29261f2518f3334a755191df', 'avatar.jpg', NULL, '2015-06-07 12:04:56');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `fk_men_env` FOREIGN KEY (`usuario_envia`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_men_rec` FOREIGN KEY (`usuario_recibe`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_com_pro` FOREIGN KEY (`producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_com_usu` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagenes_producto`
--
ALTER TABLE `imagenes_producto`
  ADD CONSTRAINT `fk_img_pro` FOREIGN KEY (`producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_pro_tip` FOREIGN KEY (`tipo`) REFERENCES `tipos_producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pro_usu` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
