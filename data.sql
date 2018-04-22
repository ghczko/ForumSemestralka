-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 22, 2018 at 08:59 PM
-- Server version: 5.6.38
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(8) UNSIGNED NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `cat_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `cat_description`) VALUES
(1, 'Počítače', 'zde najdete všechny témata o počítačíchzde najdete všechny témata o počítačíchzde najdete všechny témata o počítačíchzde najdete všechny témata o počítačíchzde najdete všechny témata o počítačích'),
(2, 'Domácnost', 'Tahle kategorie je pro všechny, kteří nedokáží zatlouci hřebík.'),
(3, 'Sport', 'Zde najdete všechny otázky o sportu'),
(4, 'Filmy', 'Zde najdete všechny témata týkající se filmů'),
(5, 'Focení', 'Zde najdete všechny možné témata o focení');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(8) UNSIGNED NOT NULL,
  `post_text` text NOT NULL,
  `post_date` datetime NOT NULL,
  `post_topic` int(11) UNSIGNED NOT NULL,
  `post_by` int(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_text`, `post_date`, `post_topic`, `post_by`) VALUES
(1, 'Hele to je úplně easy ', '2018-04-18 00:00:00', 1, 1),
(2, 'musíš to dát do elektriky', '2018-04-18 00:00:00', 1, 2),
(3, 'tak já to zkusím', '2018-04-19 10:06:53', 1, 1),
(4, 'test', '2018-04-19 10:08:27', 1, 1),
(5, 'test2', '2018-04-19 10:13:52', 1, 1),
(6, 'zkus koupit novou', '2018-04-19 10:15:27', 3, 1),
(9, 'xx', '2018-04-19 11:58:09', 1, 1),
(10, 'xx', '2018-04-19 11:59:05', 1, 1),
(11, 'dvacitka panel', '2018-04-19 19:28:47', 3, 5),
(13, 'hmm', '2018-04-19 22:27:11', 1, 4),
(14, 'test', '2018-04-19 22:33:47', 1, 4),
(15, 'jsem první!!', '2018-04-19 23:04:46', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) UNSIGNED NOT NULL,
  `tags_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tags_name`) VALUES
(1, 'Začátečník'),
(2, 'Pokročilý'),
(3, 'Expert'),
(5, 'Pomoc zadarmo'),
(6, 'Odměna za pomoc');

-- --------------------------------------------------------

--
-- Table structure for table `tag_topic`
--

CREATE TABLE `tag_topic` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` int(11) UNSIGNED NOT NULL,
  `topic` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag_topic`
--

INSERT INTO `tag_topic` (`id`, `tag`, `topic`) VALUES
(1, 1, 1),
(2, 2, 8),
(3, 2, 3),
(4, 3, 2),
(5, 5, 4),
(6, 5, 1),
(7, 1, 5),
(13, 1, 33),
(14, 3, 33),
(15, 1, 34),
(16, 2, 34),
(17, 3, 34),
(18, 1, 35),
(19, 3, 35),
(20, 5, 35),
(21, 1, 39),
(22, 2, 39),
(23, 3, 39),
(24, 1, 40);

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `topic_id` int(11) UNSIGNED NOT NULL,
  `topic_name` varchar(255) NOT NULL,
  `topic_description` text NOT NULL,
  `topic_date` datetime NOT NULL,
  `topic_cat` int(8) UNSIGNED NOT NULL,
  `topic_by` int(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topic_id`, `topic_name`, `topic_description`, `topic_date`, `topic_cat`, `topic_by`) VALUES
(1, 'zapnuti pocitace', '', '2018-04-18 00:00:00', 1, 1),
(2, 'Jak se zbavit krtka?', '', '2018-04-02 00:00:00', 2, 3),
(3, 'jak opravit strechu', '', '2018-02-01 00:00:00', 2, 2),
(4, 'notebook', '', '2018-04-18 23:52:30', 1, 4),
(5, 'stepan', '', '2018-04-18 23:52:46', 1, 4),
(7, 'jj', '', '2018-04-19 19:30:16', 1, 5),
(8, 'Jak vyfotit západ slunce?', 'Poraďte mi jaký je nejlepší setup foťáku pro západ', '2018-04-19 22:01:41', 5, 4),
(18, 'Sportoví odpoledne', 'Ahoj, chci na brusle, kdo půjde se mnou? ', '2018-04-20 09:03:36', 3, 4),
(19, 'aplikace php', 'fjsalkdfjasd', '2018-04-20 11:00:08', 1, 1),
(21, 'fdsaf', '', '2018-04-20 11:19:56', 2, 1),
(22, 'auto', 'jaky mam koupit', '2018-04-20 11:23:32', 1, 1),
(23, 'Test1', 'jfaklsdfjhai sdjf asijfd asd', '2018-04-20 14:32:37', 2, 1),
(24, 'dsdsdssdds', 'dsdsswewedswe', '2018-04-20 14:48:19', 1, 1),
(28, 'ahoj tady et', 'dsdsswewedswe', '2018-04-20 14:56:25', 1, 1),
(29, 'ahoj tady et2', 'dsdsswewedswe', '2018-04-20 14:57:23', 1, 1),
(30, 'ahoj tady et3', 'dsdsswewedswe', '2018-04-20 14:58:17', 1, 1),
(31, 'ahoj tady et4', 'dsdsswewedswe', '2018-04-20 14:58:46', 1, 1),
(32, 'ahoj tady et5', 'dsdsswewedswe', '2018-04-20 14:59:33', 1, 1),
(33, 'ahoj tady et6', 'dsdsswewedswe', '2018-04-20 15:00:03', 1, 1),
(34, 'první dobrý', 'dobrý zápis', '2018-04-20 15:01:46', 1, 1),
(35, 'nové téma xy', 'ahojc karle', '2018-04-20 15:02:58', 2, 1),
(39, 'počítače', 'ahoj tady etete', '2018-04-20 15:11:35', 5, 1),
(40, 'Běhání', 'Potřebuju poradit, kde se nejlíp dá běhat', '2018-04-22 17:05:45', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(8) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`) VALUES
(1, 'ahoj', '$2y$10$XrM0oqMJzNlI/BxBCpLjzeX0DemUtOEI/EgvYXF4WEuBTIaF8N97q'),
(2, 'vole', '$2y$10$qLiOGr.k56xl5FbR4Z/.BeNJYT1Z12OhuZz.5lmVoFGm4BvKn9tI.'),
(3, 'kun', '$2y$10$e6TbRzJ88gCg5dSeN0X/geBfOdtLjOPZVm/LbsoVo.xEcZ12x/iy2'),
(4, 'macbook', '$2y$10$7yQ1Lly1sSu7WVg26ajSROTk1KbL1km4e6pSXfX/poFLObl6eHJlO'),
(5, 'tomasJeKurburt', '$2y$10$pn/eqISxwXYcFiOF6oeR6Oodnst5LtW4Abcqo.smeb5anJEcNO20i');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `cat_id` (`cat_id`),
  ADD UNIQUE KEY `cat_name_uniq` (`cat_name`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD UNIQUE KEY `post_id` (`post_id`),
  ADD KEY `post_topic` (`post_topic`),
  ADD KEY `post_by` (`post_by`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tag_topic`
--
ALTER TABLE `tag_topic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `topic` (`topic`),
  ADD KEY `tag` (`tag`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD UNIQUE KEY `topic_id` (`topic_id`),
  ADD UNIQUE KEY `topic_name` (`topic_name`),
  ADD KEY `topic_cat` (`topic_cat`),
  ADD KEY `topic_by` (`topic_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tag_topic`
--
ALTER TABLE `tag_topic`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `topic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`post_topic`) REFERENCES `topics` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`post_by`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE;

--
-- Constraints for table `tag_topic`
--
ALTER TABLE `tag_topic`
  ADD CONSTRAINT `tag_topic_ibfk_1` FOREIGN KEY (`topic`) REFERENCES `topics` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tag_topic_ibfk_2` FOREIGN KEY (`tag`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`topic_cat`) REFERENCES `categories` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `topics_ibfk_2` FOREIGN KEY (`topic_by`) REFERENCES `users` (`id_user`);
