-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-04-2026 a las 23:39:50
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `catalogo_musical`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album`
--

CREATE TABLE `album` (
  `id_album` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `fecha_lanzamiento` date NOT NULL,
  `cantidad_canciones` int(11) NOT NULL,
  `imagen` varchar(300) NOT NULL,
  `id_artista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artista`
--

CREATE TABLE `artista` (
  `id_artista` int(11) NOT NULL,
  `nombre_artistico` varchar(200) NOT NULL,
  `nombre_completo` varchar(300) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` varchar(300) NOT NULL,
  `imagen` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `comentario_album`
--
CREATE TABLE `comentario_album` (
  `id_comentario` int(11) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `comentario` text NOT NULL,
  `fecha` date NOT NULL,
  `id_album` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`);

--
-- Indices de la tabla `artista`
--
ALTER TABLE `artista`
  ADD PRIMARY KEY (`id_artista`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `comentario_album`
  ADD PRIMARY KEY (`id_comentario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `artista`
--
ALTER TABLE `artista`
  MODIFY `id_artista` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
--
-- AUTO_INCREMENT de la tabla `comentario_album`
--
ALTER TABLE `comentario_album`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;


ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id_artista`);
COMMIT;

ALTER TABLE `comentario_album`
  ADD CONSTRAINT `comentario_album_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`);
COMMIT;



INSERT INTO users(email, password)
VALUES(
  'webadmin', 
  '$2y$10$gFP0pJcX6PBNNEPdnjjzUuWASqaUFsuDlYM7j8QdIF8nTtQWnyRMy'
);

INSERT INTO artista (id_artista, nombre_artistico, nombre_completo, fecha_nacimiento, genero, imagen) VALUES
(1, 'Taylor Swift', 'Taylor Alison Swift', '1990-12-13', 'Pop', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGwTmPWFWURSSjnaZS5rv5a0ApTeptej4sAQ&s'),
(2, 'Olivia Rodrigo', 'Olivia Isabel Rodrigo', '2003-02-20', 'Pop Rock', 'https://www.musicmundial.com/en/wp-content/uploads/2023/09/Olivia-Rodrigo-replicates-the-success-of-her-debut-album-with-Guts-find-out-what-the-numbers-are-here.jpg'),
(3, 'Gracie Abrams', 'Gracie Madigan Abrams', '1999-09-07', 'Indie Pop', 'https://images.wsj.net/im-31376774/?width=1280&height=1280'),
(4, 'Sabrina Carpenter', 'Sabrina Annlyn Carpenter ', '1999-05-11', 'Pop', 'https://media.glamourmagazine.co.uk/photos/6411fca91827564a0f927e21/16:9/w_2560%2Cc_limit/SABRINA%2520CARPENTER%252015032023.jpg');


INSERT INTO album (`id_album`, `nombre`, `fecha_lanzamiento`, `cantidad_canciones`, `imagen`, `id_artista`) VALUES
(1, 'The Life of a Showgirl', '2025-10-03', 12, 'https://static.wikia.nocookie.net/taylorswift/images/a/a0/The_Life_of_a_Showgirl.jpg/revision/latest?cb=20250907114417&path-prefix=es', 1),
(2, 'The Tortured Poets Departaments', '2024-04-19', 31, 'https://i.scdn.co/image/ab67616d0000b2738ecc33f195df6aa257c39eaa', 1),
(3, 'SOUR', '2021-05-21', 11, 'https://westwoodcardinalchronicle.com/wp-content/uploads/2021/11/sour-cover.jpg', 2),
(4, 'GUTS', '2023-09-08', 12, 'https://resizer.glanacion.com/resizer/v2/la-tapa-de-guts-el-segundo-disco-de-olivia-QUTOKTSSMJFHDANJAJXP2NZV3A.jpg?auth=b7f8c2e0927e50435333973b0200c85de741f55d5af504406ee2c92e45bfc23e&width=420&height=420&quality=70&smart=true', 2),
(5, 'Good Riddance', '2023-02-24', 12, 'https://www.normanrecords.com/artwork/large/80/195830-gracie-abrams-good-riddance.jpg', 3),
(6, 'Short n Sweet', '2024-08-23', 12, 'https://i.scdn.co/image/ab67616d0000b273fd8d7a8d96871e791cb1f626', 4),
(7, 'Midnights', '2022-10-21', 13, 'https://static.wikia.nocookie.net/taylorswift/images/6/66/Midnights_-_Portada.jpg/revision/latest/scale-to-width-down/268?cb=20230126063036&path-prefix=es', 1),
(8, 'Evermore', '2021-01-07', 17, 'https://static.wikia.nocookie.net/taylorswift/images/f/f4/Evermore_-_Album_Cover.jpg/revision/latest?cb=20231115072204&path-prefix=es', 1),
(9, 'Folklore', '2020-08-18', 17, 'https://static.wikia.nocookie.net/taylorswift/images/2/20/Folklore_Album_Portada.jpg/revision/latest/scale-to-width-down/268?cb=20200724001812&path-prefix=es', 1),
(10, 'Lover', '2019-08-23', 18, 'https://static.wikia.nocookie.net/taylorswift/images/4/42/Lover_-_portada_oficial.jpg/revision/latest/scale-to-width-down/268?cb=20190614235159&path-prefix=es', 1),
(11, 'Reputation', '2017-11-10', 15, 'https://static.wikia.nocookie.net/taylorswift/images/d/d0/Reputation_-_Portada_oficial.jpg/revision/latest?cb=20231115071905&path-prefix=es', 1),
(12, '1989', '2014-10-27', 13, 'https://static.wikia.nocookie.net/taylorswift/images/8/83/1989_-_Portada_oficial.jpg/revision/latest?cb=20181124102448&path-prefix=es', 1),
(13, 'Red', '2012-10-22', 16, 'https://static.wikia.nocookie.net/taylorswift/images/7/70/Red_-_Portada_oficial.jpg/revision/latest?cb=20181127032635&path-prefix=es', 1),
(14, 'Speak Now', '2010-10-25', 14, 'https://static.wikia.nocookie.net/taylorswift/images/4/47/Speak_Now_Portada_oficial.jpg/revision/latest?cb=20181127050404&path-prefix=es', 1),
(15, 'Fearless', '2008-11-11', 16, 'https://static.wikia.nocookie.net/taylorswift/images/b/bd/Fearless_-_Official.jpg/revision/latest?cb=20190205235908&path-prefix=es', 1),
(16, 'Taylor Swift', '2006-10-24', 15, 'https://static.wikia.nocookie.net/taylorswift/images/f/f3/Taylor_Swift_Album_Portada.jpg/revision/latest?cb=20181127050532&path-prefix=es', 1),
(17, 'The Secret of Us', '2024-06-21', 13, 'https://upload.wikimedia.org/wikipedia/en/thumb/1/18/Gracie_Abrams_-_The_Secret_of_Us.png/250px-Gracie_Abrams_-_The_Secret_of_Us.png', 3),
(18, 'Mans Best Friend', '2025-08-29', 12, 'https://media.glamour.mx/photos/6849cfbc97b076116a417e2d/master/w_1600%2Cc_limit/mans-best-friend-sabrina-carpenter.jpg', 4),
(19, 'emails i cant send', '2022-07-15', 13, 'https://i.scdn.co/image/ab67616d0000b273700f7bf79c9f063ad0362bdf', 4),
(20, 'Singular Act II', '2019-07-19', 9, 'https://upload.wikimedia.org/wikipedia/en/b/bc/Sabrina_Carpenter_-_Singular_Act_II.png', 4),
(21, 'Singular Act I', '2018-11-09', 8, 'https://upload.wikimedia.org/wikipedia/en/f/f5/Sabrina_Carpenter_-_Singular_Act_I.png', 4),
(22, 'EVOLution', '2016-10-14', 10, 'https://upload.wikimedia.org/wikipedia/en/5/59/EVOLution_Sabrina_Carpenter.jpg', 4),
(23, 'Eyes Wide Open', '2015-04-14', 12, 'https://upload.wikimedia.org/wikipedia/en/7/74/Eyes_Wide_Open_by_Sabrina_Carpenter.jpg', 4);

INSERT INTO comentario_album
(autor, comentario, fecha, id_album)
VALUES
('Feli', 'Me encantó este álbum', '2026-06-01', 4),
('Mateo', 'Las canciones son muy pegadizas', '2026-06-02', 4),
('Sofi', 'Mi álbum favorito de Olivia', '2026-06-05', 4),
('Juan', 'Excelente producción', '2026-06-08', 2);