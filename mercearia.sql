-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06-Jul-2017 às 01:27
-- Versão do servidor: 10.1.10-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mercearia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `IdCliente` int(11) NOT NULL,
  `NomeCliente` varchar(50) NOT NULL,
  `Cpf` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formapagamentos`
--

CREATE TABLE `formapagamentos` (
  `IdFormaPagamentos` int(11) NOT NULL,
  `IdVenda` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `QtdParcela` int(11) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `DtPagamento` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--

CREATE TABLE `itens` (
  `IdItem` int(11) NOT NULL,
  `IdVenda` int(11) NOT NULL,
  `IdProduto` int(11) NOT NULL,
  `Quantidade` float NOT NULL,
  `ValorUnitario` float NOT NULL,
  `ValorTotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `IdProduto` int(11) NOT NULL,
  `NomeProduto` varchar(50) NOT NULL,
  `CodigoProduto` varchar(50) NOT NULL,
  `ValorProduto` float NOT NULL,
  `Saldo` float NOT NULL,
  `Aliquota` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `IdUsuario` int(11) NOT NULL,
  `NomeUsuario` varchar(50) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  `Login` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `IdVenda` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `DataHora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`IdCliente`),
  ADD UNIQUE KEY `Cpf` (`Cpf`);

--
-- Indexes for table `formapagamentos`
--
ALTER TABLE `formapagamentos`
  ADD PRIMARY KEY (`IdFormaPagamentos`),
  ADD KEY `IdVenda` (`IdVenda`);

--
-- Indexes for table `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`IdItem`),
  ADD KEY `FK_Itens_Vendas` (`IdVenda`),
  ADD KEY `FK_Itens_Produtos` (`IdProduto`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`IdProduto`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- Indexes for table `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`IdVenda`),
  ADD KEY `FK_Vendas_Clientes` (`IdCliente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `formapagamentos`
--
ALTER TABLE `formapagamentos`
  MODIFY `IdFormaPagamentos` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `formapagamentos`
--
ALTER TABLE `formapagamentos`
  ADD CONSTRAINT `formapagamentos_ibfk_1` FOREIGN KEY (`IdVenda`) REFERENCES `vendas` (`IdVenda`);

--
-- Limitadores para a tabela `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `FK_Itens_Produtos` FOREIGN KEY (`IdProduto`) REFERENCES `produtos` (`IdProduto`),
  ADD CONSTRAINT `FK_Itens_Vendas` FOREIGN KEY (`IdVenda`) REFERENCES `vendas` (`IdVenda`);

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `FK_Vendas_Clientes` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
