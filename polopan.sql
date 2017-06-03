-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:8889
-- Généré le :  Dim 04 Juin 2017 à 00:31
-- Version du serveur :  5.6.35
-- Version de PHP :  7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `polopan`
--

-- --------------------------------------------------------

--
-- Structure de la table `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `albums`
--

INSERT INTO `albums` (`id`, `title`, `slug`, `description`, `date`, `img`) VALUES
(1, 'Caravelle', 'caravelle', 'Sorti en mai 2017, l\'album Caravelle est le premier de Polo & Pan. \r\nAvec 52 minutes d\'écoute, Caravelle est un album acidulé qui sent bon l\'été, signé par deux musiciens électroniques qui mélangent les influences, les styles et les époques.', '2017-05-19', '/album/1'),
(2, 'Canopée - EP', 'canopee', 'Impossible de ne pas penser aux vacances à la plage en écoutant leur deep-house paradisiaque et ensoleillée ! \r\nL\'album sorti en juin 2016 est composé de trois titres. Avec ce nouvel EP Canopée, inutile de vous préciser que leur électro vous fera voyager très très loin !', '2016-06-10', '/album/2'),
(3, 'Dorothy - EP', 'dorothy', 'Leur projet se concrétise en Septembre 2014 avec la sortie de leur excellent premier EP «  Dorothy  » porté par une collaboration des labels Hamburger Records et Ekler\'o\'shock. ', '2014-09-21', '/album/3'),
(4, 'Plage isolée - EP', 'plageisolee', 'Le deuxième EP sorti en juin 2015 est composé de deux morceaux originaux Plage isolée (soleil levant) et Plage isolée (soleil couchant) ainsi que de deux remix de Tim Paris et Claap! \r\nL’ensemble est un très joli mélange ensoleillé de House et de Pop psychédélique avec des voix et des sonorités qui rappellent un peu la musique françaises des années 60/70.', '2015-06-15', '/album/4'),
(5, 'Rivolta - EP', 'rivolta', 'La vraie rencontre entre Polo et Pan qui a donné naissance à l\'EP Rivolta, sorti en décembre 2013. \r\nDe la couleur, de la fraîcheur, de la joie, de l’exotisme, du féerique. Voilà ce qui ressort de cet EP du brillant duo Polo & Pan.', '2013-12-16', '/album/5');

-- --------------------------------------------------------

--
-- Structure de la table `albums_songs`
--

CREATE TABLE `albums_songs` (
  `id` int(11) NOT NULL,
  `id_albums` int(11) NOT NULL,
  `id_songs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `albums_songs`
--

INSERT INTO `albums_songs` (`id`, `id_albums`, `id_songs`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 2, 14),
(15, 2, 15),
(16, 3, 16),
(17, 3, 17),
(18, 3, 18),
(19, 3, 19),
(20, 3, 20),
(21, 4, 21),
(22, 4, 22),
(23, 4, 23),
(24, 5, 24);

-- --------------------------------------------------------

--
-- Structure de la table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `nb` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `songs`
--

INSERT INTO `songs` (`id`, `nb`, `title`, `time`) VALUES
(1, 1, 'Canopée', '04:36'),
(2, 2, 'Coeur croisé', '03:22'),
(3, 1, 'Canopée', '04:36'),
(4, 3, 'Aqualand', '04:17'),
(5, 4, 'Zoom Zoom', '03:29'),
(6, 5, 'Abysse', '02:41'),
(7, 6, 'Kirghiz', '05:06'),
(8, 7, 'Plage isolée (soleil levant)', '03:51'),
(9, 8, 'Nanã', '03:10'),
(10, 9, 'Dorothy', '05:16'),
(11, 10, 'Mexicali', '06:13'),
(12, 11, 'Chasseur d\'Ivoire', '05:10'),
(13, 12, 'Pays imaginaire', '04:49'),
(14, 2, 'Nanã', '03:10'),
(15, 3, 'Bakara', '07:00'),
(16, 1, 'Rivolta', '05:12'),
(17, 2, 'Coeur d\'artichaut', '03:30'),
(18, 3, 'Dragon Pom Z', '05:17'),
(19, 4, 'Rivolta (Get A Room! Remix)', '06:01'),
(20, 5, 'Dorothy (In Flagranti Remix)', '06:02'),
(21, 1, 'Plage Isolée (Soleil couchant)', '05:59'),
(22, 2, 'Plage isolée (Tim Paris Remix)', '05:58'),
(23, 3, 'Plage isolée (Claap! Remix)', '06:34'),
(24, 1, 'Rivolta (Gramme Remix)', '07:42');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `albums_songs`
--
ALTER TABLE `albums_songs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `albums_songs`
--
ALTER TABLE `albums_songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT pour la table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
