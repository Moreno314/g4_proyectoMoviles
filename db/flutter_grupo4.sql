-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2023 a las 15:13:09
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `flutter_grupo4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `create_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`, `create_date`) VALUES
(1, 'Calculo 1', ''),
(2, 'Calculo 2', ''),
(3, 'Estadistica', ''),
(4, 'IOT', ''),
(5, 'IA', ''),
(6, 'Probabilidad', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_register`
--

CREATE TABLE `login_register` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `login_register`
--

INSERT INTO `login_register` (`id`, `name`, `username`, `password`, `status`) VALUES
(1, 'grupo4', 'grupo4@gmail.com', '123', 'Admin'),
(3, 'grupo41', 'grupo41@gmail.com', '12345', 'User'),
(4, 'Alejandro', 'alejandro.more@gmail.com', '123456', 'User'),
(5, 'samir', 'samir@gmail.com', '12345', 'User'),
(6, 'miracle', 'miracle@gmail.com', '123', 'User'),
(7, 'Jean', 'Jean@gmail.com', '123', 'User');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post_table`
--

CREATE TABLE `post_table` (
  `id` int(11) NOT NULL,
  `imagen` text NOT NULL,
  `autor` text NOT NULL,
  `post_date` text NOT NULL,
  `comentarios` text NOT NULL,
  `total_like` text NOT NULL,
  `titulo` text NOT NULL,
  `cuerpo` text NOT NULL,
  `nombre_curso` text NOT NULL,
  `create_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `post_table`
--

INSERT INTO `post_table` (`id`, `imagen`, `autor`, `post_date`, `comentarios`, `total_like`, `titulo`, `cuerpo`, `nombre_curso`, `create_date`) VALUES
(1, 'OIP.jpeg', 'Moreno', '15/10/2023', '44', '134', 'Pregunta de examen final - Calculo 1', 'Una empresa de entrega de paquetes cobra una tarifa base de $10 más $2 por cada milla de distancia recorrida. Si un paquete se entrega a una distancia de 5 millas, ¿cuál sería el costo total de entrega?', 'Calculo 1', '15/10/2023'),
(2, 'OIP.jpeg', 'Huaman ', '15/10/2023', '44', '134', 'Pregunta de PC - Calculo 2', 'Dada la función f(x) = 2x^2 + 3x - 5, calcula la derivada de f(x)', 'Calculo 2', '15/10/2023'),
(3, 'OIP.jpeg', 'Mantilla', '19/23/2023', '13', '32', 'Pregunta PC - Estadistica', 'En una encuesta realizada a un grupo de estudiantes universitarios sobre la cantidad de horas que duermen por noche, se obtuvieron los siguientes datos: 6, 7, 7, 8, 8, 8, 9, 9, 9, 10. Calcula la media, la mediana y la moda de las horas de sueño de este grupo.', 'Estadistica', '19/23/2023'),
(4, 'imagen1.jpg', 'Gómez Pérez', '2023-10-10', '12', '45', 'Calculo 1 - Pregunta de Final', '¿Cuál es el teorema fundamental del cálculo?', 'Calculo 1', '2023-10-10'),
(5, 'imagen2.jpg', 'Rodríguez Martínez', '2023-10-11', '8', '32', 'Calculo 2 - Pregunta de Final', '¿Cómo se calcula la integral definida de una función?', 'Calculo 2', '2023-10-11'),
(6, 'imagen3.jpg', 'Hernández González', '2023-10-12', '15', '60', 'Estadistica - Pregunta de Final', '¿Cuál es la diferencia entre estadística descriptiva y estadística inferencial?', 'Estadistica', '2023-10-12'),
(7, 'imagen4.jpg', 'López Rodríguez', '2023-10-13', '20', '75', 'IOT - Pregunta de Final', '¿Cómo se puede asegurar la conectividad segura en el Internet de las cosas?', 'IOT', '2023-10-13'),
(8, 'imagen5.jpg', 'González López', '2023-10-14', '18', '68', 'Probabilidad - Pregunta de Final', '¿Qué es un espacio muestral en probabilidad?', 'Probabilidad', '2023-10-14'),
(9, 'imagen6.jpg', 'Pérez Gómez', '2023-10-15', '10', '40', 'IA - Pregunta de Final', '¿En qué se diferencia la inteligencia artificial de la inteligencia humana?', 'IA', '2023-10-15'),
(10, 'imagen7.jpg', 'Martínez Rodríguez', '2023-10-16', '5', '20', 'Calculo 1 - Pregunta de Final', '¿Cuál es la derivada de la función seno?', 'Calculo 1', '2023-10-16'),
(11, 'imagen8.jpg', 'González Martínez', '2023-10-17', '14', '55', 'Calculo 2 - Pregunta de Final', '¿Cómo se resuelve una integral definida?', 'Calculo 2', '2023-10-17'),
(12, 'imagen9.jpg', 'Hernández López', '2023-10-18', '11', '44', 'Estadistica - Pregunta de Final', '¿Cuál es la diferencia entre una media aritmética y una mediana?', 'Estadistica', '2023-10-18'),
(13, 'imagen10.jpg', 'López Hernández', '2023-10-19', '7', '28', 'IOT - Pregunta de Final', '¿Cómo se pueden proteger los dispositivos IoT de los ataques cibernéticos?', 'IOT', '2023-10-19'),
(14, 'imagen11.jpg', 'Rodríguez Gómez', '2023-10-20', '13', '52', 'Probabilidad - Pregunta de Final', '¿Qué es un evento mutuamente excluyente en probabilidad?', 'Probabilidad', '2023-10-20'),
(15, 'imagen12.jpg', 'Gómez Martínez', '2023-10-21', '9', '36', 'IA - Pregunta de Final', '¿Cuál es la diferencia entre aprendizaje supervisado y no supervisado en IA?', 'IA', '2023-10-21'),
(16, 'imagen13.jpg', 'Martínez López', '2023-10-22', '16', '64', 'Calculo 1 - Pregunta de Final', '¿Cuál es el teorema del valor intermedio?', 'Calculo 1', '2023-10-22'),
(17, 'imagen14.jpg', 'López Rodríguez', '2023-10-23', '6', '24', 'Calculo 2 - Pregunta de Final', '¿Cómo se calcula la derivada de una función exponencial?', 'Calculo 2', '2023-10-23'),
(18, 'imagen15.jpg', 'Rodríguez Gómez', '2023-10-24', '19', '76', 'Estadistica - Pregunta de Final', '¿Cuál es el propósito de la distribución normal en estadística?', 'Estadistica', '2023-10-24'),
(19, 'imagen16.jpg', 'Gómez Martínez', '2023-10-25', '21', '84', 'IOT - Pregunta de Final', '¿Cuáles son los desafíos de seguridad en la implementación de dispositivos IoT?', 'IOT', '2023-10-25'),
(20, 'imagen17.jpg', 'Hernández López', '2023-10-26', '17', '68', 'Probabilidad - Pregunta de Final', '¿Cómo se calcula la probabilidad condicional?', 'Probabilidad', '2023-10-26'),
(21, 'imagen18.jpg', 'López Rodríguez', '2023-10-27', '22', '88', 'IA - Pregunta de Final', '¿Qué es la regresión lineal en aprendizaje automático?', 'IA', '2023-10-27'),
(22, 'imagen19.jpg', 'Gómez Martínez', '2023-10-28', '23', '92', 'Calculo 1 - Pregunta de Final', '¿Cuál es el límite de la función x^2 cuando x tiende a 3?', 'Calculo 1', '2023-10-28'),
(23, 'imagen20.jpg', 'Martínez López', '2023-10-29', '12', '48', 'Calculo 2 - Pregunta de Final', '¿Cómo se resuelve una integral indefinida?', 'Calculo 2', '2023-10-29'),
(24, 'imagen21.jpg', 'López Rodríguez', '2023-10-30', '25', '100', 'Estadistica - Pregunta de Final', '¿Qué es un diagrama de dispersión en estadística?', 'Estadistica', '2023-10-30'),
(25, 'imagen22.jpg', 'Rodríguez Gómez', '2023-10-31', '27', '108', 'IOT - Pregunta de Final', '¿Cuál es el papel de un broker MQTT en la comunicación IoT?', 'IOT', '2023-10-31'),
(26, 'imagen23.jpg', 'Gómez Martínez', '2023-11-01', '24', '96', 'Probabilidad - Pregunta de Final', '¿Cómo se calcula la varianza de una distribución de probabilidad?', 'Probabilidad', '2023-11-01'),
(27, 'imagen24.jpg', 'López Rodríguez', '2023-11-02', '29', '116', 'IA - Pregunta de Final', '¿Cuál es el uso de las redes neuronales artificiales en IA?', 'IA', '2023-11-02'),
(28, 'imagen25.jpg', 'Rodríguez Gómez', '2023-11-03', '31', '124', 'Calculo 1 - Pregunta de Final', '¿Cómo se calcula la integral definida de una función continua?', 'Calculo 1', '2023-11-03'),
(29, 'imagen26.jpg', 'Gómez Martínez', '2023-11-04', '28', '112', 'Calculo 2 - Pregunta de Final', '¿Cuál es el teorema del valor medio en cálculo?', 'Calculo 2', '2023-11-04'),
(30, 'imagen27.jpg', 'López Rodríguez', '2023-11-05', '33', '132', 'Estadistica - Pregunta de Final', '¿Cómo se calcula la desviación estándar de una muestra?', 'Estadistica', '2023-11-05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_register`
--
ALTER TABLE `login_register`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `post_table`
--
ALTER TABLE `post_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `login_register`
--
ALTER TABLE `login_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
