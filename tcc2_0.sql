-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Out-2022 às 02:17
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
-- Banco de dados: `tcc2_0`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `anuncios`
--

CREATE TABLE `anuncios` (
  `IdAnuncios` int(11) NOT NULL,
  `FkIdClienteCriadorInAnuncios` int(11) DEFAULT NULL,
  `FkIdFormaDePagamentoInAnuncios` int(11) DEFAULT NULL,
  `DataDeCriacao` date DEFAULT NULL,
  `DataServico` date DEFAULT NULL,
  `Aberto` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `IdAtendimento` int(11) NOT NULL,
  `FkIdAnuncioInAtendimento` int(11) DEFAULT NULL,
  `FkIdClienteInAtendimento` int(11) DEFAULT NULL,
  `DataAtendimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `IdAvaliacao` int(11) NOT NULL,
  `FkIdClienteInAvaliacao` int(11) DEFAULT NULL,
  `FkIdAnuncioInAvaliacao` int(11) DEFAULT NULL,
  `Avaliacao` float DEFAULT NULL,
  `Observacao` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidato`
--

CREATE TABLE `candidato` (
  `IdCandidato` int(11) NOT NULL,
  `FkIdClienteInCandidato` int(11) DEFAULT NULL,
  `FkIdAnuncioInCandidato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `FkFormaDePagamentoPrincipalInCliente` int(11) DEFAULT NULL,
  `DataDeNascimentoUsuario` date DEFAULT NULL,
  `Cpf` varchar(14) DEFAULT NULL,
  `Rg` varchar(14) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `LoginUsuario` varchar(30) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`Id`, `Nome`, `FkFormaDePagamentoPrincipalInCliente`, `DataDeNascimentoUsuario`, `Cpf`, `Rg`, `email`, `LoginUsuario`, `senha`) VALUES
(10, 'Paulo', NULL, '1995-03-22', '123', '123', '123', '123', '123'),
(11, 'usuario2', NULL, '2022-10-04', '321', '321', '321', '', '123'),
(12, 'usuario3', NULL, '2022-09-26', 'usuario3', 'usuario3', 'usuario3', 'usuario3', '123'),
(13, 'usuario5', NULL, '2022-10-04', '1234', '4321', '4321', 'usuario5', '123'),
(14, 'usuario5', NULL, '2022-10-02', 'usuario5', 'usuario5', 'usuario5', 'usuario5', 'usuario5'),
(15, 'evilanio', NULL, '2022-10-23', '43262990884', '492875388', 'evilaniosouza823@gmail.com', 'evilanio', '23041995');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `IdContato` int(11) NOT NULL,
  `FkIdClienteInContato` int(11) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `NomeContato` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `experiencia`
--

CREATE TABLE `experiencia` (
  `IdExperiencia` int(11) NOT NULL,
  `FkIdClienteInExperiencia` int(11) DEFAULT NULL,
  `Experiencia` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formacao`
--

CREATE TABLE `formacao` (
  `Idformacao` int(11) NOT NULL,
  `FkIdClienteInFormacao` int(11) DEFAULT NULL,
  `Formacao` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formasdepagamento`
--

CREATE TABLE `formasdepagamento` (
  `IdFormaDePagamento` int(11) NOT NULL,
  `FkIdClienteInFormaDePagamento` int(11) DEFAULT NULL,
  `TipoDePagamento` enum('pix','Dinheiro') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fotos`
--

CREATE TABLE `fotos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(60) NOT NULL,
  `conteudo` mediumblob NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `tamanho` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE `paciente` (
  `IdPaciente` int(11) NOT NULL,
  `FkIdClienteInPaciente` int(11) DEFAULT NULL,
  `NomePaciente` varchar(50) DEFAULT NULL,
  `DataDeNascimentoPasciente` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`IdAnuncios`),
  ADD KEY `FkIdClienteCriadorInAnuncios` (`FkIdClienteCriadorInAnuncios`) USING BTREE,
  ADD KEY `FkIdFormaDePagamentoInAnuncios` (`FkIdFormaDePagamentoInAnuncios`) USING BTREE;

--
-- Índices para tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`IdAtendimento`),
  ADD KEY `FkIdAnuncioInAtendimento` (`FkIdAnuncioInAtendimento`) USING BTREE,
  ADD KEY `FkIdClienteInAtendimento` (`FkIdClienteInAtendimento`) USING BTREE;

--
-- Índices para tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`IdAvaliacao`),
  ADD KEY `FkIdClienteInAvaliacao` (`FkIdClienteInAvaliacao`);

--
-- Índices para tabela `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`IdCandidato`),
  ADD KEY `FkIdAnuncioInCandidato` (`FkIdAnuncioInCandidato`),
  ADD KEY `FkIdClienteInCandidato` (`FkIdClienteInCandidato`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FkFormaDePagamentoPrincipalInCliente` (`FkFormaDePagamentoPrincipalInCliente`);

--
-- Índices para tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`IdContato`),
  ADD KEY `FkIdClienteInContato` (`FkIdClienteInContato`);

--
-- Índices para tabela `experiencia`
--
ALTER TABLE `experiencia`
  ADD PRIMARY KEY (`IdExperiencia`),
  ADD KEY `FkIdClienteInExperiencia` (`FkIdClienteInExperiencia`);

--
-- Índices para tabela `formacao`
--
ALTER TABLE `formacao`
  ADD PRIMARY KEY (`Idformacao`),
  ADD KEY `FkIdClienteInFormacao` (`FkIdClienteInFormacao`);

--
-- Índices para tabela `formasdepagamento`
--
ALTER TABLE `formasdepagamento`
  ADD PRIMARY KEY (`IdFormaDePagamento`),
  ADD KEY `FkIdClienteInFormaDePagamento` (`FkIdClienteInFormaDePagamento`);

--
-- Índices para tabela `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`IdPaciente`),
  ADD KEY `FkIdClienteInPaciente` (`FkIdClienteInPaciente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `IdAnuncios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `IdAtendimento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `IdAvaliacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `candidato`
--
ALTER TABLE `candidato`
  MODIFY `IdCandidato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `contato`
--
ALTER TABLE `contato`
  MODIFY `IdContato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `experiencia`
--
ALTER TABLE `experiencia`
  MODIFY `IdExperiencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `formacao`
--
ALTER TABLE `formacao`
  MODIFY `Idformacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `formasdepagamento`
--
ALTER TABLE `formasdepagamento`
  MODIFY `IdFormaDePagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fotos`
--
ALTER TABLE `fotos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `IdPaciente` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `anuncios`
--
ALTER TABLE `anuncios`
  ADD CONSTRAINT `FkIdClienteCriador` FOREIGN KEY (`FkIdClienteCriadorInAnuncios`) REFERENCES `cliente` (`Id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FkIdFormaDePagamento` FOREIGN KEY (`FkIdFormaDePagamentoInAnuncios`) REFERENCES `formasdepagamento` (`IdFormaDePagamento`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `FkIdAnuncio` FOREIGN KEY (`FkIdAnuncioInAtendimento`) REFERENCES `anuncios` (`IdAnuncios`),
  ADD CONSTRAINT `FkIdCliente` FOREIGN KEY (`FkIdClienteInAtendimento`) REFERENCES `cliente` (`Id`);

--
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `FkIdClienteInAvaliacao` FOREIGN KEY (`FkIdClienteInAvaliacao`) REFERENCES `cliente` (`Id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `candidato`
--
ALTER TABLE `candidato`
  ADD CONSTRAINT `FkIdAnuncioInCandidato` FOREIGN KEY (`FkIdAnuncioInCandidato`) REFERENCES `anuncios` (`IdAnuncios`) ON DELETE SET NULL,
  ADD CONSTRAINT `FkIdClienteInCandidato` FOREIGN KEY (`FkIdClienteInCandidato`) REFERENCES `cliente` (`Id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FkFormaDePagamentoPrincipalInCliente` FOREIGN KEY (`FkFormaDePagamentoPrincipalInCliente`) REFERENCES `formasdepagamento` (`IdFormaDePagamento`);

--
-- Limitadores para a tabela `contato`
--
ALTER TABLE `contato`
  ADD CONSTRAINT `FkIdClienteInContato` FOREIGN KEY (`FkIdClienteInContato`) REFERENCES `cliente` (`Id`);

--
-- Limitadores para a tabela `experiencia`
--
ALTER TABLE `experiencia`
  ADD CONSTRAINT `FkIdClienteInExperiencia` FOREIGN KEY (`FkIdClienteInExperiencia`) REFERENCES `cliente` (`Id`);

--
-- Limitadores para a tabela `formacao`
--
ALTER TABLE `formacao`
  ADD CONSTRAINT `FkIdClienteInFormacao` FOREIGN KEY (`FkIdClienteInFormacao`) REFERENCES `cliente` (`Id`);

--
-- Limitadores para a tabela `formasdepagamento`
--
ALTER TABLE `formasdepagamento`
  ADD CONSTRAINT `FkIdClienteInFormaDePagamento` FOREIGN KEY (`FkIdClienteInFormaDePagamento`) REFERENCES `cliente` (`Id`);

--
-- Limitadores para a tabela `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `FkIdClienteInPaciente` FOREIGN KEY (`FkIdClienteInPaciente`) REFERENCES `cliente` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
