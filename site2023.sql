-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Xerado en: 20 de Set de 2022 ás 16:40
-- Versión do servidor: 10.4.24-MariaDB
-- Versión do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `site2023`
--

-- --------------------------------------------------------

--
-- Estrutura da táboa `artista`
--

CREATE TABLE `artista` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `nome_artistico` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(75) CHARACTER SET utf8mb4 NOT NULL,
  `senha` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
  `localizacao_da_imagem` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/usuarios/foto_de_perfil_padrao/foto_de_perfil_padrao.jpg',
  `estado` enum('ativo','inativo','suspenso','banido') CHARACTER SET utf8mb4 NOT NULL DEFAULT 'inativo',
  `codigo_validador` int(11) NOT NULL,
  `data_de_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_da_ultima_modificacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da táboa `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id` int(11) NOT NULL,
  `id_artista` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `id_obra_artistica` int(11) NOT NULL,
  `valor_da_avaliacao` tinyint(1) NOT NULL,
  `data_de_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_da_ultima_modificacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da táboa `comentario`
--

CREATE TABLE `comentario` (
  `id` int(11) NOT NULL,
  `id_artista` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `id_obra_artistica` int(11) NOT NULL,
  `comentario` varchar(512) NOT NULL,
  ` id_comentario_antecedente` int(11) DEFAULT NULL,
  `id_comentario_descendente` int(11) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `data_de_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_da_ultima_modificacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da táboa `inscricao`
--

CREATE TABLE `inscricao` (
  `id` int(11) NOT NULL,
  `id_artista_seguidor` int(11) NOT NULL,
  `id_utente_seguidor` int(11) NOT NULL,
  `id_artista_seguido` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `data_de_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_da_ultima_modificacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da táboa `obra_artistica`
--

CREATE TABLE `obra_artistica` (
  `id` int(11) NOT NULL,
  `id_artista` int(11) NOT NULL,
  `titulo` varchar(75) CHARACTER SET utf8mb4 NOT NULL,
  `subtitulo` varchar(90) CHARACTER SET utf8mb4 DEFAULT NULL,
  `localizacao_da_imagem` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `estado` enum('publicada','pendente','indisponivel','retirada') CHARACTER SET utf8mb4 NOT NULL DEFAULT 'publicada',
  `data_de_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_da_ultima_modificacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da táboa `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `titulo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da táboa `tagmap`
--

CREATE TABLE `tagmap` (
  `id` int(11) NOT NULL,
  `id_obra_artistica` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da táboa `utente`
--

CREATE TABLE `utente` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(75) CHARACTER SET utf8mb4 NOT NULL,
  `senha` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
  `localizacao_da_imagem` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/usuarios/foto_de_perfil_padrao/foto_de_perfil_padrao.jpg',
  `acesso` enum('comum','administrador') COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` enum('ativo','inativo','suspenso','banido') CHARACTER SET utf8mb4 NOT NULL DEFAULT 'inativo',
  `codigo_validador` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `data_de_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_da_ultima_modificacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artista`
--
ALTER TABLE `artista`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artista` (`id_artista`),
  ADD KEY `id_utente` (`id_utente`),
  ADD KEY `avaliacao_ibfk_3` (`id_obra_artistica`);

--
-- Indexes for table `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artista` (`id_artista`),
  ADD KEY `id_utente` (`id_utente`),
  ADD KEY ` id_comentario_antecedente` (` id_comentario_antecedente`),
  ADD KEY `id_comentario_descendente` (`id_comentario_descendente`),
  ADD KEY `id_obra_artistica` (`id_obra_artistica`);

--
-- Indexes for table `inscricao`
--
ALTER TABLE `inscricao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artista_seguidor` (`id_artista_seguidor`),
  ADD KEY `id_utente_seguidor` (`id_utente_seguidor`),
  ADD KEY `id_artista_seguido` (`id_artista_seguido`);

--
-- Indexes for table `obra_artistica`
--
ALTER TABLE `obra_artistica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artista` (`id_artista`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tagmap`
--
ALTER TABLE `tagmap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_obra_artistica` (`id_obra_artistica`),
  ADD KEY `id_tag` (`id_tag`);

--
-- Indexes for table `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artista`
--
ALTER TABLE `artista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inscricao`
--
ALTER TABLE `inscricao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `obra_artistica`
--
ALTER TABLE `obra_artistica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tagmap`
--
ALTER TABLE `tagmap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utente`
--
ALTER TABLE `utente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricións para os envorcados das táboas
--

--
-- Restricións para a táboa `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id`),
  ADD CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`),
  ADD CONSTRAINT `avaliacao_ibfk_3` FOREIGN KEY (`id_obra_artistica`) REFERENCES `obra_artistica` (`id`);

--
-- Restricións para a táboa `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id`),
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`),
  ADD CONSTRAINT `comentario_ibfk_3` FOREIGN KEY (` id_comentario_antecedente`) REFERENCES `comentario` (`id`),
  ADD CONSTRAINT `comentario_ibfk_4` FOREIGN KEY (`id_comentario_descendente`) REFERENCES `comentario` (`id`),
  ADD CONSTRAINT `comentario_ibfk_5` FOREIGN KEY (`id_obra_artistica`) REFERENCES `obra_artistica` (`id`);

--
-- Restricións para a táboa `inscricao`
--
ALTER TABLE `inscricao`
  ADD CONSTRAINT `inscricao_ibfk_1` FOREIGN KEY (`id_artista_seguidor`) REFERENCES `artista` (`id`),
  ADD CONSTRAINT `inscricao_ibfk_2` FOREIGN KEY (`id_utente_seguidor`) REFERENCES `utente` (`id`),
  ADD CONSTRAINT `inscricao_ibfk_3` FOREIGN KEY (`id_artista_seguido`) REFERENCES `artista` (`id`);

--
-- Restricións para a táboa `obra_artistica`
--
ALTER TABLE `obra_artistica`
  ADD CONSTRAINT `obra_artistica_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id`);

--
-- Restricións para a táboa `tagmap`
--
ALTER TABLE `tagmap`
  ADD CONSTRAINT `tagmap_ibfk_1` FOREIGN KEY (`id_obra_artistica`) REFERENCES `obra_artistica` (`id`),
  ADD CONSTRAINT `tagmap_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
