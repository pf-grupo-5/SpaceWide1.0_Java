-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 20, 2022 at 11:15 PM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id18944596_spacewide_bd`
--

-- --------------------------------------------------------

--
-- Table structure for table `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id` int(11) NOT NULL,
  `id_obra_artistica` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `avaliacao` tinyint(1) NOT NULL,
  `data_de_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_da_ultima_modificacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `avaliacao`
--

INSERT INTO `avaliacao` (`id`, `id_obra_artistica`, `id_usuario`, `avaliacao`, `data_de_criacao`, `data_da_ultima_modificacao`) VALUES
(18, 44, 1, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(21, 37, 12, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(22, 41, 12, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(23, 43, 12, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(24, 42, 12, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(26, 44, 12, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(27, 39, 12, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(29, 35, 12, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(30, 36, 12, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(31, 38, 12, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(38, 38, 1, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(39, 38, 1, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(40, 38, 1, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(57, 38, 1, -1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(60, 36, 1, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(61, 36, 1, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(62, 21, 1, -1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(63, 21, 1, -1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(64, 21, 1, -1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(65, 21, 1, -1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(66, 21, 1, -1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(67, 21, 1, -1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(68, 38, 1, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(69, 39, 1, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(71, 42, 1, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(72, 42, 1, 1, '2022-10-10 01:30:00', '2022-10-10 01:30:00'),
(73, 44, 1, 1, '2022-10-10 01:30:13', '2022-10-10 01:30:13'),
(75, 42, 1, 1, '2022-10-10 02:13:12', '2022-10-10 02:13:12'),
(77, 37, 15, 1, '2022-10-12 22:34:02', '2022-10-12 22:34:02'),
(78, 31, 15, 1, '2022-10-12 22:34:04', '2022-10-12 22:34:04'),
(79, 15, 15, 1, '2022-10-12 22:34:05', '2022-10-12 22:34:05'),
(81, 25, 15, 1, '2022-10-12 22:34:08', '2022-10-12 22:34:08'),
(82, 12, 15, -1, '2022-10-12 22:34:09', '2022-10-12 22:34:09'),
(85, 40, 12, 1, '2022-10-19 00:56:07', '2022-10-19 00:56:07'),
(88, 34, 1, -1, '2022-10-19 12:20:26', '2022-10-19 12:20:26'),
(95, 25, 1, 1, '2022-10-19 12:52:06', '2022-10-19 12:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `comentario`
--

CREATE TABLE `comentario` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_obra_artistica` int(11) NOT NULL,
  `comentario` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `data_de_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_da_ultima_modificacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inscricao`
--

CREATE TABLE `inscricao` (
  `id` int(11) NOT NULL,
  `id_usuario_seguidor` int(11) NOT NULL,
  `id_usuario_seguido` int(11) NOT NULL,
  `data_de_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_da_ultima_modificacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `inscricao`
--

INSERT INTO `inscricao` (`id`, `id_usuario_seguidor`, `id_usuario_seguido`, `data_de_criacao`, `data_da_ultima_modificacao`) VALUES
(28, 14, 12, '2022-10-18 16:49:19', '2022-10-18 16:49:19'),
(32, 14, 11, '2022-10-18 18:00:36', '2022-10-18 18:00:36'),
(234, 1, 11, '2022-10-19 14:01:54', '2022-10-19 14:01:54'),
(237, 12, 10, '2022-10-19 23:04:44', '2022-10-19 23:04:44'),
(238, 12, 11, '2022-10-19 23:29:47', '2022-10-19 23:29:47'),
(256, 12, 23, '2022-10-20 23:13:36', '2022-10-20 23:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `obra_artistica`
--

CREATE TABLE `obra_artistica` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `titulo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subtitulo` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `localizacao_da_imagem` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `estado` enum('publicada','pendente','indisponivel','') COLLATE utf8_unicode_ci NOT NULL,
  `data_de_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_da_ultima_modificacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `obra_artistica`
--

INSERT INTO `obra_artistica` (`id`, `id_usuario`, `titulo`, `subtitulo`, `localizacao_da_imagem`, `estado`, `data_de_criacao`, `data_da_ultima_modificacao`) VALUES
(12, 1, 'fotos', '', '/usuarios/1/publicacoes/633b0164787b74.07558835.jpg', 'pendente', '2022-10-03 15:36:04', '2022-10-19 23:27:37'),
(14, 1, 'issoae', '', '/usuarios/1/publicacoes/633d75c03e4f14.94784418.jpeg', 'pendente', '2022-10-05 12:17:04', '2022-10-19 23:27:46'),
(15, 10, 'L', '', '/usuarios/10/publicacoes/633e2c2a693a48.90462818.jpg', 'publicada', '2022-10-06 01:15:22', '2022-10-06 01:15:22'),
(16, 10, 'Mav', '', '/usuarios/10/publicacoes/633e2c400ac2f2.39587885.jpg', 'publicada', '2022-10-06 01:15:44', '2022-10-06 01:15:44'),
(17, 10, 'Bosque', '', '/usuarios/10/publicacoes/633e2c5b1e92e5.85689971.jpg', 'publicada', '2022-10-06 01:16:11', '2022-10-06 01:16:11'),
(18, 10, 'Casa', '', '/usuarios/10/publicacoes/633e2c739552c3.10192418.jpg', 'publicada', '2022-10-06 01:16:35', '2022-10-06 01:16:35'),
(19, 10, 'Chuva', '', '/usuarios/10/publicacoes/633e2c82d15031.52600916.jpg', 'publicada', '2022-10-06 01:16:50', '2022-10-06 01:16:50'),
(20, 10, 'Karvaak', '', '/usuarios/10/publicacoes/633e2cb825e6f7.61521527.jpg', 'publicada', '2022-10-06 01:17:44', '2022-10-06 01:17:44'),
(21, 10, 'Hall', '', '/usuarios/10/publicacoes/633e2cf65dd0b8.41816725.jpg', 'publicada', '2022-10-06 01:18:46', '2022-10-06 01:18:46'),
(22, 10, 'fotos', '', '/usuarios/10/publicacoes/633e367522c7f6.93956742.jpg', 'publicada', '2022-10-06 01:59:17', '2022-10-06 01:59:17'),
(23, 10, 'Primeira a óleo', '', '/usuarios/10/publicacoes/633e36b5073245.65496296.jpg', 'publicada', '2022-10-06 02:00:21', '2022-10-06 02:00:21'),
(24, 10, 'Lua cheia', '', '/usuarios/10/publicacoes/633e36f8b0a9b8.87411864.jpg', 'publicada', '2022-10-06 02:01:28', '2022-10-06 02:01:28'),
(25, 11, 'rascunho', '', '/usuarios/11/publicacoes/633e380f9a05b9.86129958.jpg', 'publicada', '2022-10-06 02:06:07', '2022-10-06 02:06:07'),
(26, 11, 'Flower', '', '/usuarios/11/publicacoes/633e3826b92244.87825194.jpg', 'publicada', '2022-10-06 02:06:30', '2022-10-06 02:06:30'),
(27, 11, 'Yellow Garden', '', '/usuarios/11/publicacoes/633e38b3d14989.95684280.jpg', 'publicada', '2022-10-06 02:08:51', '2022-10-06 02:08:51'),
(28, 11, 'Ball Girl', '', '/usuarios/11/publicacoes/633e38d90d8188.05459098.jpg', 'publicada', '2022-10-06 02:09:29', '2022-10-06 02:09:29'),
(29, 11, 'Noble', '', '/usuarios/11/publicacoes/633e38f2e83620.19988082.jpg', 'publicada', '2022-10-06 02:09:54', '2022-10-06 02:09:54'),
(30, 11, 'Violet', '', '/usuarios/11/publicacoes/633e39147e1239.49974314.jpg', 'publicada', '2022-10-06 02:10:28', '2022-10-06 02:10:28'),
(31, 11, 'Bambi group', '', '/usuarios/11/publicacoes/633e3939af7ce9.49546600.jpg', 'publicada', '2022-10-06 02:11:05', '2022-10-06 02:11:05'),
(32, 11, 'My friends', '', '/usuarios/11/publicacoes/633e39574ad3e5.99401870.jpg', 'publicada', '2022-10-06 02:11:35', '2022-10-06 02:11:35'),
(33, 11, 'Samanta', '', '/usuarios/11/publicacoes/633e397b5ce564.50319939.jpg', 'publicada', '2022-10-06 02:12:11', '2022-10-06 02:12:11'),
(34, 11, 'Paint-Paint', '', '/usuarios/11/publicacoes/633e39a2cdfab7.20535962.jpg', 'publicada', '2022-10-06 02:12:50', '2022-10-06 02:12:50'),
(35, 12, 'Maga', 'flor', '/usuarios/12/publicacoes/633e3b6c0e4c02.73168084.jpg', 'publicada', '2022-10-06 02:20:28', '2022-10-20 11:59:53'),
(36, 12, 'Kami', 'flor', '/usuarios/12/publicacoes/633e3ba03062c4.47238110.jpg', 'publicada', '2022-10-06 02:21:20', '2022-10-20 12:01:17'),
(37, 12, 'Layla', 'flor', '/usuarios/12/publicacoes/633e3bc3f1ce24.32776382.jpg', 'publicada', '2022-10-06 02:21:55', '2022-10-20 12:01:17'),
(38, 12, 'Mika', 'flor', '/usuarios/12/publicacoes/633e3c149f1796.88825220.jpg', 'publicada', '2022-10-06 02:23:16', '2022-10-20 12:01:41'),
(39, 12, 'Jane', 'flor', '/usuarios/12/publicacoes/633e3c46663942.00333815.webp', 'publicada', '2022-10-06 02:24:06', '2022-10-20 12:01:41'),
(40, 12, 'Camille', 'flor', '/usuarios/12/publicacoes/633e3c96d3dcd8.58171777.jpg', 'publicada', '2022-10-06 02:25:26', '2022-10-20 12:01:41'),
(41, 12, 'Luana', 'flor', '/usuarios/12/publicacoes/633e3d3a5c3410.98323955.png', 'publicada', '2022-10-06 02:28:10', '2022-10-20 12:01:41'),
(42, 12, 'Escliff', 'flor', '/usuarios/12/publicacoes/633e3d63699438.56627604.jpg', 'publicada', '2022-10-06 02:28:51', '2022-10-20 12:01:41'),
(43, 12, 'Amelia', 'flor', '/usuarios/12/publicacoes/633e3dc3820ff3.56604498.jpg', 'publicada', '2022-10-06 02:30:27', '2022-10-20 12:01:50'),
(44, 12, 'Isla', 'flor', '/usuarios/12/publicacoes/633e3dff8cde47.85622304.jpg', 'publicada', '2022-10-06 02:31:27', '2022-10-20 12:01:50'),
(48, 1, 'as', 'hudhr', '/usuarios/1/publicacoes/6350e9059e0822.60237388.webp', 'publicada', '2022-10-20 06:21:57', '2022-10-20 06:21:57'),
(49, 23, '1', 'Paisagem', '/usuarios/23/publicacoes/63513aa3662a08.72955720.jpg', 'publicada', '2022-10-20 12:10:11', '2022-10-20 12:11:30'),
(50, 23, '2', 'Paisagem', '/usuarios/23/publicacoes/63513abcb768e4.20930366.jpg', 'publicada', '2022-10-20 12:10:36', '2022-10-20 12:10:36'),
(51, 23, '3', 'Paisagem', '/usuarios/23/publicacoes/63513aca4510a6.35045954.jpg', 'publicada', '2022-10-20 12:10:50', '2022-10-20 12:10:50'),
(52, 23, '4', 'Paisagem', '/usuarios/23/publicacoes/63513ad284bb97.87760804.jpg', 'publicada', '2022-10-20 12:10:58', '2022-10-20 12:10:58'),
(53, 23, '5', 'Paisagem', '/usuarios/23/publicacoes/63513ade496029.12051792.jpg', 'publicada', '2022-10-20 12:11:10', '2022-10-20 12:11:10'),
(54, 23, '7', 'Paisagem', '/usuarios/23/publicacoes/63513ae9e9e6f0.22454072.jpg', 'publicada', '2022-10-20 12:11:21', '2022-10-20 12:11:21');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `nome_artistico` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `localizacao_da_imagem_de_perfil` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '/usuarios/imagem_de_peril_padrao/imagem_de_peril_padrao.png',
  `acesso` enum('administrador','artista','utente','') COLLATE utf8_unicode_ci NOT NULL,
  `codigo_validador` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `estado` enum('ativo','inativo','suspenso','banido') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inativo',
  `data_de_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_da_ultima_modificacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `nome_artistico`, `email`, `senha`, `localizacao_da_imagem_de_perfil`, `acesso`, `codigo_validador`, `estado`, `data_de_criacao`, `data_da_ultima_modificacao`) VALUES
(1, 'sandro', 'dreco', 'sandro@maia', '$2y$13$DOjdzIU6sIafloKQxwFWeedvjHflxw7CqhrGYLmdNSmrMgmyi5vGe', '/usuarios/1/foto_de_perfil/633d828eb05eb4.89790444.jpeg', 'artista', '63338ad18a2257.75858136', 'ativo', '2022-09-27 23:44:18', '2022-10-15 21:05:03'),
(2, 'gureal', NULL, 'gureal@gmail.com', '$2y$13$/wLc2O3mDBv.Eeey7wU/1eYTE9j1UhIb9.ST6EFYSWkQdPLlK4JVW', '/usuarios/2/foto_de_perfil/6334bd84d638d0.61596159.Array', 'utente', '6334b65f28f577.97185950', 'ativo', '2022-09-28 21:02:23', '2022-09-28 21:57:22'),
(3, 'Jogaejoga', NULL, 'contaprajogo190@gmail.com', '$2y$13$t1sCvxG.TFYuO3kl5ycfSOcblelKcb6I4cvi4xbMWrdiBaFYEIBPi', '/usuarios/imagem_de_perfil_padrao/imagem_de_perfil_padrao.png', 'administrador', '63358c7a153502.81953854', 'ativo', '2022-09-29 12:15:54', '2022-09-29 12:48:53'),
(4, 'spacewide', NULL, 'projetinhofellas2@gmail.com', '$2y$13$2cAJkn1wrcaqP2CCtbGQQeyrGcL7JZUE3Abl56Iz3ZrqZ71PDP5zW', '/usuarios/imagem_de_perfil_padrao/imagem_de_perfil_padrao.png', 'administrador', '633590cec4b000.72937779', 'ativo', '2022-09-29 12:34:23', '2022-10-20 12:38:54'),
(9, 'sandros', NULL, 'sandromaia980000@gmail.com', '$2y$13$u5l13ScBx09AWCbCGMHame.kIQhREEpSqmWUHsO7xGlb1FKsp3/VS', '/usuarios/9/foto_de_perfil/633cc87ad99331.48001343.png', 'utente', '10014210351664578518', 'ativo', '2022-09-30 22:55:18', '2022-10-12 21:43:42'),
(10, 'Raimundo', 'Jack', 'raimundo@gmail', '$2y$13$7zV5dj20YsjmAQGgnFodMOcIgdPsPbl3mJPNl81kFCvbEX8W9h3XK', '/usuarios/10/foto_de_perfil/633e2bd7700303.04638899.jpg', 'artista', '18524800871665018571', 'ativo', '2022-10-06 01:09:32', '2022-10-06 01:14:56'),
(11, 'Ana Clara', '', 'Anaclara@gmail', '$2y$13$jN1kAJBnVS6IJwqKGO6JZe8V7IDF9OG.G1y6Tujyte6vdW.0mIAGm', '/usuarios/11/foto_de_perfil/633e37f06918f3.39452225.jpg', 'artista', '18382139981665021813', 'ativo', '2022-10-06 02:03:34', '2022-10-06 02:05:36'),
(12, 'Romão', 'Roma', 'RomaRomao@gmail', '$2y$13$JQis8DFmt5KTasbVPWgxfepECDNtZMSBeRmOTydcgAvBxV6mhjVxO', '/usuarios/12/foto_de_perfil/633e3b4301b600.40472043.jpg', 'artista', '65125716241665022568', 'ativo', '2022-10-06 02:16:09', '2022-10-06 12:49:35'),
(13, 'dada', NULL, 'dada@dada', '$2y$13$gusI6QYqzt/dAUzU0mHHbuEXmGem7Wq4/Awcqz6jb9vA6gDY9hIgi', '/usuarios/imagem_de_peril_padrao/imagem_de_peril_padrao.png', 'administrador', '24752990581665372508', 'ativo', '2022-10-10 03:28:29', '2022-10-12 20:29:00'),
(14, 'mario', NULL, 'mario@ma', '$2y$13$SP7LB5dlAKenqiyam6ACo.BE.m8zXhqK614MME1oN4C3UNIPQ6Dcm', '/usuarios/imagem_de_peril_padrao/imagem_de_peril_padrao.png', 'utente', '43181117551665610040', 'ativo', '2022-10-12 21:27:20', '2022-10-12 21:28:47'),
(15, 'sandro', 'The Maia', 'sandromaia9800@gmail.com', '$2y$13$SfJjHowEk3XTEOy4F2OaTOunrPI/a.eKVp.v0p4PqkzA4U.fRrqPO', '/usuarios/imagem_de_peril_padrao/imagem_de_peril_padrao.png', 'administrador', '46034020321665611193', 'ativo', '2022-10-12 21:46:34', '2022-10-20 02:29:25'),
(20, 'sandros', NULL, 'raphael@renoir', '1234', '/usuarios/imagem_de_peril_padrao/imagem_de_peril_padrao.png', 'administrador', '26050747601666145348', 'ativo', '2022-10-19 02:09:08', '2022-10-19 23:11:12'),
(22, 'sandros', NULL, 'xxx@xxx', '$2y$13$80gdJDJ6/mVW5l/UVKTy6uIH8BxM3a1PJKtnEPzfuDyXFge5m160W', '/usuarios/imagem_de_peril_padrao/imagem_de_peril_padrao.png', 'administrador', '78052294061666145422', 'inativo', '2022-10-19 02:10:23', '2022-10-19 02:10:23'),
(23, 'Paisagem', 'Landscape', 'paisagem@gmail', '$2y$13$mOCZkiS2rN61IgXL.LMBJ.Ej9I1bahEkJjaaBCvObmPlXGmudyqqy', '/usuarios/23/foto_de_perfil/63513b207cb0d8.27391003.jpg', 'artista', '33192625941666267436', 'ativo', '2022-10-20 12:03:57', '2022-10-20 12:12:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_avaliacao_obra_artistica` (`id_obra_artistica`),
  ADD KEY `fk_avaliacao_usuario` (`id_usuario`);

--
-- Indexes for table `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comentario_obra_artistica` (`id_obra_artistica`),
  ADD KEY `fk_comentario_usuario` (`id_usuario`);

--
-- Indexes for table `inscricao`
--
ALTER TABLE `inscricao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_inscricao_usuario_seguidor` (`id_usuario_seguidor`),
  ADD KEY `fk_inscricao_usuario_seguido` (`id_usuario_seguido`);

--
-- Indexes for table `obra_artistica`
--
ALTER TABLE `obra_artistica`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inscricao`
--
ALTER TABLE `inscricao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT for table `obra_artistica`
--
ALTER TABLE `obra_artistica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `fk_avaliacao_obra_artistica` FOREIGN KEY (`id_obra_artistica`) REFERENCES `obra_artistica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_avaliacao_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comentario_obra_artistica` FOREIGN KEY (`id_obra_artistica`) REFERENCES `obra_artistica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comentario_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inscricao`
--
ALTER TABLE `inscricao`
  ADD CONSTRAINT `fk_inscricao_usuario_seguido` FOREIGN KEY (`id_usuario_seguido`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inscricao_usuario_seguidor` FOREIGN KEY (`id_usuario_seguidor`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
