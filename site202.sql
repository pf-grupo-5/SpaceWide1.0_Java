-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Set-2022 às 21:40
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
  `nome_artistico` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `senha` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
  `localizacao_da_imagem` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/usuarios/foto_de_perfil_padrao/foto_de_perfil_padrao.jpg',
  `estado` enum('ativo','inativo','suspenso','banido') CHARACTER SET utf8mb4 NOT NULL DEFAULT 'ativo',
  `acesso` tinyint(1) NOT NULL,
  `codigo_validador` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `data_de_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_da_ultima_modificacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `artista`
--

INSERT INTO `artista` (`id`, `nome`, `nome_artistico`, `email`, `senha`, `localizacao_da_imagem`, `estado`, `acesso`, `codigo_validador`, `data_de_criacao`, `data_da_ultima_modificacao`) VALUES
(1, 'JACKSON', 'OTAKU', 'jackson@123', 'SENHACURTA', '/usuarios/foto_de_perfil_padrao/foto_de_perfil_padrao.jpg', 'ativo', 'comum', '11287357', '2022-08-12 12:08:47', '2022-09-05 13:44:32'),
(5, 'José', 'maquinista', 'joor@2756', 'hamood', 'usuarios/foto.jpeg', 'banido','comum', '848748956', '2022-09-04 22:29:39', '2022-09-05 17:12:11'),
(6, 'Marcos', 'cardeal', 'bruno@cassio', 'oWOMDX', 'usuarios/foto8.jpeg', 'suspenso','comum', '848277747', '2022-09-04 22:29:39', '2022-09-05 17:12:13'),
(7, 'José', 'maquinista', 'joor@2756', 'hamood', 'usuarios/foto.jpeg', 'suspenso','comum', '848748956', '2022-09-04 22:31:27', '2022-09-05 17:12:14'),
(8, 'Marcos', 'cardeal', 'bruno@cassio', 'oWOMDX', 'usuarios/foto8.jpeg', 'banido','comum', '848277747', '2022-09-04 22:31:27', '2022-09-04 23:52:28'),
(9, 'José', 'maquinista', 'joor@2756', 'hamood', 'usuarios/foto.jpeg', 'suspenso','comum', '848748956', '2022-09-04 22:31:45', '2022-09-05 17:12:19'),
(10, 'Marcos', 'cardeal', 'bruno@cassio', 'oWOMDX', 'usuarios/foto8.jpeg', 'suspenso','comum', '848277747', '2022-09-04 22:31:45', '2022-09-05 17:12:32'),
(11, 'Thanos', 'Equilibrista de Universos', 'Thanos@vingador23', 'joiadamente', 'usuarios/fot7o.jpeg', 'ativo','comum', '84778495', '2022-09-04 22:31:45', '2022-09-05 17:12:51'),
(12, 'Jascinto', 'Berranto', 'jascinto@43', 'asdddweYg', 'usuarios/fot5o.jpeg', 'inativo','comum', '8422888995', '2022-09-04 22:31:45', '2022-09-04 22:31:45'),
(13, 'Stefany', 'Silenciosa', 'stefany@queta23', 'voZQeXFd', 'usuarios/fot1o.jpeg', 'inativo','comum', '8377831', '2022-09-04 22:31:45', '2022-09-04 23:52:33'),
(14, 'Luisa', 'Gritito', 'lulu@santana', 'fPoadedwB', 'usuarios/foto9.jpeg', 'inativo','comum', '84256245', '2022-09-04 22:31:45', '2022-09-04 22:31:45'),
(15, 'Joana', 'portuguesa', 'joana@de34', 'tQPadCN', 'usuarios/foto0.jpeg', 'inativo','comum', '847772', '2022-09-04 22:31:45', '2022-09-04 22:31:45'),
(16, 'Fernando', 'LtpMaster', 'fernando@asv344', 'senha2312', 'usuarios/fot2o.jpeg', 'inativo','comum', '8483235', '2022-09-04 22:31:45', '2022-09-04 22:31:45'),
(17, 'José', 'maquinista', 'joor@2756', 'hamood', 'usuarios/foto.jpeg', 'inativo','comum', '848748956', '2022-09-04 22:32:12', '2022-09-04 22:32:12'),
(18, 'Marcos', 'cardeal', 'bruno@cassio', 'oWOMDX', 'usuarios/foto8.jpeg', 'inativo','comum', '848277747', '2022-09-04 22:32:12', '2022-09-04 22:32:12'),
(19, 'Thanos', 'Equilibrista de Universos', 'Thanos@vingador23', 'joiadamente', 'usuarios/fot7o.jpeg', 'inativo','comum', '84778495', '2022-09-04 22:32:12', '2022-09-04 22:32:12'),
(20, 'Jascinto', 'Berranto', 'jascinto@43', 'asdddweYg', 'usuarios/fot5o.jpeg', 'inativo','comum', '8422888995', '2022-09-04 22:32:12', '2022-09-04 22:32:12'),
(21, 'Stefany', 'Silenciosa', 'stefany@queta23', 'voZQeXFd', 'usuarios/fot1o.jpeg', 'inativo','comum', '8377831', '2022-09-04 22:32:12', '2022-09-04 22:32:12'),
(22, 'Luisa', 'Gritito', 'lulu@santana', 'fPoadedwB', 'usuarios/foto9.jpeg', 'inativo','comum', '84256245', '2022-09-04 22:32:12', '2022-09-04 22:32:12'),
(23, 'Joana', 'portuguesa', 'joana@de34', 'tQPadCN', 'usuarios/foto0.jpeg', 'inativo','comum', '847772', '2022-09-04 22:32:12', '2022-09-04 22:32:12'),
(24, 'Fernando', 'LtpMaster', 'fernando@asv344', 'senha2312', 'usuarios/fot2o.jpeg', 'inativo','comum', '8483235', '2022-09-04 22:32:12', '2022-09-04 22:32:12'),
(25, 'Jase', 'corona', 'jodo@dado', 'cachorro341', 'usuarios/fot4o.jpeg', 'inativo','comum', '8412332395', '2022-09-04 22:32:12', '2022-09-04 22:32:12'),
(26, 'Jacks', 'jotaro', 'jojo@valdo', 'nf2wd123', 'usuarios/foto6.jpeg', 'inativo','comum', '84844495', '2022-09-04 22:32:12', '2022-09-04 22:32:12'),
(27, 'Marcia', '', 'jmarcia@34', 'potatoAngolano', 'usuarios/foto5.jpeg', 'inativo','comum', '84232215', '2022-09-04 22:32:12', '2022-09-04 22:32:12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(75) CHARACTER SET utf8mb4 NOT NULL,
  `senha` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
  `localizacao_da_imagem` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/usuarios/foto_de_perfil_padrao/foto_de_perfil_padrao.jpg',
  `estado` enum('ativo','inativo','suspenso','banido') CHARACTER SET utf8mb4 NOT NULL DEFAULT 'ativo',
  `acesso` tinyint(4) NOT NULL,
  `codigo_validador` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `data_de_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_da_ultima_modificacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `email`, `senha`, `localizacao_da_imagem`, `estado`, `acesso`, `codigo_validador`, `data_de_criacao`, `data_da_ultima_modificacao`) VALUES
(3, 'sandro', 'sandro@maia', '$jddsnwind', '/usuarios/foto_de_perfil_padrao/foto_de_perfil_padrao.jpg', 'ativo', 1, '29568475', '2022-08-15 20:11:00', '2022-09-04 23:23:42'),
(4, 'Marcos ', 'davi@santos', '123abc', '/usuarios/foto_de_perfil_padrao/foto_de_perfil_padrao.jpg', 'ativo', 1, '36591545', '2022-08-16 15:32:39', '2022-09-03 18:49:32'),
(6, '[Josevaldo]', '[jose@valdo]', '[naoteinteressa123]', '[usuarios/foto.jpeg]', 'suspenso','comum', '[848799595]', '2022-09-04 21:20:24', '2022-09-04 23:31:52'),
(7, 'Jackson', 'adil@castro', 'senha', 'usuarios/foto2.jpeg', 'banido','comum', '847539595', '2022-09-04 21:22:02', '2022-09-04 23:31:44'),
(8, 'Josevaldo', 'jose@valdo', 'naoteinteressa123', 'usuarios/foto.jpeg', 'suspenso','comum', '848799595', '2022-09-04 21:44:09', '2022-09-04 23:28:22'),
(9, 'Brunin', 'bruno@costa', 'oCuTlFYR', 'usuarios/foto8.jpeg', 'inativo','comum', '8482323195', '2022-09-04 21:44:09', '2022-09-04 21:44:09'),
(10, 'Morbius', 'Morbius@123', 'ktqGerHJ', 'usuarios/fot7o.jpeg', 'inativo','comum', '848323295', '2022-09-04 21:44:09', '2022-09-04 21:44:09'),
(11, 'Juca', 'juca@SE23', 'wfvmpgYg', 'usuarios/fot5o.jpeg', 'inativo','comum', '842232325', '2022-09-04 21:44:09', '2022-09-04 21:44:09'),
(12, 'Janaina', 'jana@banana', 'voZQeXFd', 'usuarios/fot1o.jpeg', 'suspenso','comum', '8323231', '2022-09-04 21:44:09', '2022-09-04 23:31:59'),
(13, 'Isabela', 'isa@costa', 'fPoapkYB', 'usuarios/foto9.jpeg', 'inativo','comum', '8421315', '2022-09-04 21:44:09', '2022-09-04 21:44:09'),
(14, 'Jennifer', 'jen@nifer', 'tQPSKJCN', 'usuarios/foto0.jpeg', 'inativo','comum', '843132', '2022-09-04 21:44:09', '2022-09-04 21:44:09'),
(15, 'Jorge', 'jorge@quimica123', 'senha2312', 'usuarios/fot2o.jpeg', 'inativo','comum', '848323121235', '2022-09-04 21:44:09', '2022-09-04 21:44:09'),
(16, 'Jose', 'jose@valdo', 'cachorromutante', 'usuarios/fot4o.jpeg', 'inativo','comum', '848232395', '2022-09-04 21:44:09', '2022-09-04 21:44:09'),
(17, 'JoJo', 'jojo@valdo', 'nf2wd123', 'usuarios/foto6.jpeg', 'inativo','comum', '84844495', '2022-09-04 21:44:09', '2022-09-04 21:44:09'),
(18, 'Marilda', 'jase@valsa', 'potatoItaliano', 'usuarios/foto5.jpeg', 'inativo','comum', '84877415', '2022-09-04 21:44:09', '2022-09-04 21:44:09');

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
  `disponibilidade` tinyint(1) NOT NULL,
  `data_de_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_da_ultima_modificacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `obra_artistica`
--

INSERT INTO `obra_artistica` (`id`, `id_artista`, `titulo`, `subtitulo`, `localizacao_da_imagem`, `estado`, `disponibilidade`, `data_de_criacao`, `data_da_ultima_modificacao`) VALUES
(29, 1, 'charcoal feelings l', '', '/usuarios/artista/publicacoes/1/62f94313a321d0.23898826.jpg', 'publicada','comum', '2022-08-14 19:51:12', '2022-08-14 19:51:12'),
(30, 1, 'cafezinho da tarde', '', '/usuarios/artista/publicacoes/1/62f943524793a6.50789901.jpg', 'publicada','comum', '2022-08-14 19:52:14', '2022-08-14 19:52:14'),
(31, 1, 'mar japonÃªs', '', '/usuarios/artista/publicacoes/1/62f9437aeae974.89519490.jpg', 'publicada','comum', '2022-08-14 19:52:55', '2022-08-14 19:52:55'),
(32, 1, 'anna', '', '/usuarios/artista/publicacoes/1/62fa4a53f02d50.33381938.jpg', 'publicada','comum', '2022-08-15 14:34:22', '2022-08-15 14:34:22'),
(33, 1, 'Anya Forger', '(<> _ <>)', '/usuarios/artista/publicacoes/1/62fa4cb27d3965.98000471.jpg', 'publicada','comum', '2022-08-15 14:44:28', '2022-08-15 14:44:28'),
(35, 1, 'i\'m groot', '', '/usuarios/artista/publicacoes/1/62fa4dda945a96.33256740.jpg', 'publicada','comum', '2022-08-15 14:49:24', '2022-08-15 14:49:24'),
(36, 1, 'Machintosh', '', '/usuarios/artista/publicacoes/1/62fa4ebc376132.58163694.webp', 'publicada','comum', '2022-08-15 14:53:10', '2022-08-15 14:53:10'),
(37, 1, 'felix, the cat', '', '/usuarios/artista/publicacoes/1/62fad4610e16e7.79875381.gif', 'publicada','comum', '2022-08-16 00:23:21', '2022-08-16 00:23:21'),
(39, 1, 'Derealisation', 'rainbow', '/usuarios/artista/publicacoes/1/62fbaef5c1fc45.45708200.webp', 'publicada','comum', '2022-08-16 15:55:56', '2022-08-16 15:55:56'),
(40, 1, 'hell 16th century', '', '/usuarios/artista/publicacoes/1/62fbaf81ea6111.85102919.webp', 'publicada','comum', '2022-08-16 15:58:16', '2022-08-18 13:08:35');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `artista`
--
ALTER TABLE `artista`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `obra_artistica`
--
ALTER TABLE `obra_artistica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artista` (`id_artista`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `artista`
--
ALTER TABLE `artista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `obra_artistica`
--
ALTER TABLE `obra_artistica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `obra_artistica`
--
ALTER TABLE `obra_artistica`
  ADD CONSTRAINT `obra_artistica_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
