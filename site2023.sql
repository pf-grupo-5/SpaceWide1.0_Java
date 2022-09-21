-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Set-2022 às 15:23
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `site2023`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `artista`
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
-- Estrutura da tabela `avaliacao`
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
-- Estrutura da tabela `comentario`
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
-- Estrutura da tabela `inscricao`
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
-- Estrutura da tabela `obra_artistica`
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
-- Estrutura da tabela `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `titulo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tagmap`
--

CREATE TABLE `tagmap` (
  `id` int(11) NOT NULL,
  `id_obra_artistica` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `utente`
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
-- Extraindo dados da tabela `utente`
--

INSERT INTO `utente` (`id`, `nome`, `email`, `senha`, `localizacao_da_imagem`, `acesso`, `estado`, `codigo_validador`, `data_de_criacao`, `data_da_ultima_modificacao`) VALUES
(1, 'JACKSON', 'jackson@123', 'SENHACURTA', '/usuarios/foto_de_perfil_padrao/foto_de_perfil_padrao.jpg', '', '', '11287357', '2022-08-12 15:08:47', '2022-09-05 16:44:32'),
(5, 'José', 'joor@2756', 'hamood', 'usuarios/foto.jpeg', '', '', '848748956', '2022-09-05 01:29:39', '2022-09-05 20:12:11'),
(6, 'Marcos', 'bruno@cassio', 'oWOMDX', 'usuarios/foto8.jpeg', '', '', '848277747', '2022-09-05 01:29:39', '2022-09-05 20:12:13'),
(7, 'José', 'joor@2756', 'hamood', 'usuarios/foto.jpeg', '', '', '848748956', '2022-09-05 01:31:27', '2022-09-05 20:12:14'),
(8, 'Marcos', 'bruno@cassio', 'oWOMDX', 'usuarios/foto8.jpeg', '', '', '848277747', '2022-09-05 01:31:27', '2022-09-05 02:52:28'),
(9, 'José', 'joor@2756', 'hamood', 'usuarios/foto.jpeg', '', '', '848748956', '2022-09-05 01:31:45', '2022-09-05 20:12:19'),
(10, 'Marcos', 'bruno@cassio', 'oWOMDX', 'usuarios/foto8.jpeg', '', '', '848277747', '2022-09-05 01:31:45', '2022-09-05 20:12:32'),
(11, 'Thanos', 'Thanos@vingador23', 'joiadamente', 'usuarios/fot7o.jpeg', '', '', '84778495', '2022-09-05 01:31:45', '2022-09-05 20:12:51'),
(12, 'Jascinto', 'jascinto@43', 'asdddweYg', 'usuarios/fot5o.jpeg', '', '', '8422888995', '2022-09-05 01:31:45', '2022-09-05 01:31:45'),
(13, 'Stefany', 'stefany@queta23', 'voZQeXFd', 'usuarios/fot1o.jpeg', '', '', '8377831', '2022-09-05 01:31:45', '2022-09-05 02:52:33'),
(14, 'Luisa', 'lulu@santana', 'fPoadedwB', 'usuarios/foto9.jpeg', '', '', '84256245', '2022-09-05 01:31:45', '2022-09-05 01:31:45'),
(15, 'Joana', 'joana@de34', 'tQPadCN', 'usuarios/foto0.jpeg', '', '', '847772', '2022-09-05 01:31:45', '2022-09-05 01:31:45'),
(16, 'Fernando', 'fernando@asv344', 'senha2312', 'usuarios/fot2o.jpeg', '', '', '8483235', '2022-09-05 01:31:45', '2022-09-05 01:31:45'),
(17, 'José', 'joor@2756', 'hamood', 'usuarios/foto.jpeg', '', '', '848748956', '2022-09-05 01:32:12', '2022-09-05 01:32:12'),
(18, 'Marcos', 'bruno@cassio', 'oWOMDX', 'usuarios/foto8.jpeg', '', '', '848277747', '2022-09-05 01:32:12', '2022-09-05 01:32:12'),
(19, 'Thanos', 'Thanos@vingador23', 'joiadamente', 'usuarios/fot7o.jpeg', '', '', '84778495', '2022-09-05 01:32:12', '2022-09-05 01:32:12'),
(20, 'Jascinto', 'jascinto@43', 'asdddweYg', 'usuarios/fot5o.jpeg', '', '', '8422888995', '2022-09-05 01:32:12', '2022-09-05 01:32:12'),
(21, 'Stefany', 'stefany@queta23', 'voZQeXFd', 'usuarios/fot1o.jpeg', '', '', '8377831', '2022-09-05 01:32:12', '2022-09-05 01:32:12'),
(22, 'Luisa', 'lulu@santana', 'fPoadedwB', 'usuarios/foto9.jpeg', '', '', '84256245', '2022-09-05 01:32:12', '2022-09-05 01:32:12'),
(23, 'Joana', 'joana@de34', 'tQPadCN', 'usuarios/foto0.jpeg', '', '', '847772', '2022-09-05 01:32:12', '2022-09-05 01:32:12'),
(24, 'Fernando', 'fernando@asv344', 'senha2312', 'usuarios/fot2o.jpeg', '', '', '8483235', '2022-09-05 01:32:12', '2022-09-05 01:32:12'),
(25, 'Jase', 'jodo@dado', 'cachorro341', 'usuarios/fot4o.jpeg', '', '', '8412332395', '2022-09-05 01:32:12', '2022-09-05 01:32:12'),
(26, 'Jacks', 'jojo@valdo', 'nf2wd123', 'usuarios/foto6.jpeg', '', '', '84844495', '2022-09-05 01:32:12', '2022-09-05 01:32:12'),
(27, 'Marcia', 'jmarcia@34', 'potatoAngolano', 'usuarios/foto5.jpeg', '', '', '84232215', '2022-09-05 01:32:12', '2022-09-05 01:32:12');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `artista`
--
ALTER TABLE `artista`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artista` (`id_artista`),
  ADD KEY `id_utente` (`id_utente`),
  ADD KEY `avaliacao_ibfk_3` (`id_obra_artistica`);

--
-- Índices para tabela `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artista` (`id_artista`),
  ADD KEY `id_utente` (`id_utente`),
  ADD KEY ` id_comentario_antecedente` (` id_comentario_antecedente`),
  ADD KEY `id_comentario_descendente` (`id_comentario_descendente`),
  ADD KEY `id_obra_artistica` (`id_obra_artistica`);

--
-- Índices para tabela `inscricao`
--
ALTER TABLE `inscricao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artista_seguidor` (`id_artista_seguidor`),
  ADD KEY `id_utente_seguidor` (`id_utente_seguidor`),
  ADD KEY `id_artista_seguido` (`id_artista_seguido`);

--
-- Índices para tabela `obra_artistica`
--
ALTER TABLE `obra_artistica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artista` (`id_artista`);

--
-- Índices para tabela `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tagmap`
--
ALTER TABLE `tagmap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_obra_artistica` (`id_obra_artistica`),
  ADD KEY `id_tag` (`id_tag`);

--
-- Índices para tabela `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `artista`
--
ALTER TABLE `artista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `inscricao`
--
ALTER TABLE `inscricao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `obra_artistica`
--
ALTER TABLE `obra_artistica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tagmap`
--
ALTER TABLE `tagmap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `utente`
--
ALTER TABLE `utente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id`),
  ADD CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`),
  ADD CONSTRAINT `avaliacao_ibfk_3` FOREIGN KEY (`id_obra_artistica`) REFERENCES `obra_artistica` (`id`);

--
-- Limitadores para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id`),
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`),
  ADD CONSTRAINT `comentario_ibfk_3` FOREIGN KEY (` id_comentario_antecedente`) REFERENCES `comentario` (`id`),
  ADD CONSTRAINT `comentario_ibfk_4` FOREIGN KEY (`id_comentario_descendente`) REFERENCES `comentario` (`id`),
  ADD CONSTRAINT `comentario_ibfk_5` FOREIGN KEY (`id_obra_artistica`) REFERENCES `obra_artistica` (`id`);

--
-- Limitadores para a tabela `inscricao`
--
ALTER TABLE `inscricao`
  ADD CONSTRAINT `inscricao_ibfk_1` FOREIGN KEY (`id_artista_seguidor`) REFERENCES `artista` (`id`),
  ADD CONSTRAINT `inscricao_ibfk_2` FOREIGN KEY (`id_utente_seguidor`) REFERENCES `utente` (`id`),
  ADD CONSTRAINT `inscricao_ibfk_3` FOREIGN KEY (`id_artista_seguido`) REFERENCES `artista` (`id`);

--
-- Limitadores para a tabela `obra_artistica`
--
ALTER TABLE `obra_artistica`
  ADD CONSTRAINT `obra_artistica_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id`);

--
-- Limitadores para a tabela `tagmap`
--
ALTER TABLE `tagmap`
  ADD CONSTRAINT `tagmap_ibfk_1` FOREIGN KEY (`id_obra_artistica`) REFERENCES `obra_artistica` (`id`),
  ADD CONSTRAINT `tagmap_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
