-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.21-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema acap
--

CREATE DATABASE IF NOT EXISTS acap;
USE acap;

--
-- Definition of table `academicos`
--

DROP TABLE IF EXISTS `academicos`;
CREATE TABLE `academicos` (
  `idacademico` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `fone` varchar(14) NOT NULL,
  `endereco` varchar(120) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `codcurso` int(10) unsigned NOT NULL,
  `tiposanguineo` varchar(20) NOT NULL,
  `matricula` int(10) unsigned DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `codinstituicao` int(10) unsigned NOT NULL,
  `codpontoembarque` int(10) unsigned NOT NULL,
  `codpontodesembarque` int(10) unsigned NOT NULL,
  `datacadastro` date NOT NULL,
  `celular` varchar(14) DEFAULT NULL,
  `matutinho` char(1) DEFAULT NULL,
  `vespertino` char(1) DEFAULT NULL,
  `noturno` char(1) DEFAULT NULL,
  PRIMARY KEY (`idacademico`),
  KEY `FK_academicos_instituicao` (`codinstituicao`),
  KEY `FK_academicos_curso` (`codcurso`),
  KEY `FK_academicos_embarque` (`codpontoembarque`),
  KEY `FK_academicos_desembarque` (`codpontodesembarque`),
  CONSTRAINT `FK_academicos_curso` FOREIGN KEY (`codcurso`) REFERENCES `cursos` (`idcurso`),
  CONSTRAINT `FK_academicos_desembarque` FOREIGN KEY (`codpontodesembarque`) REFERENCES `pontos` (`idponto`),
  CONSTRAINT `FK_academicos_embarque` FOREIGN KEY (`codpontoembarque`) REFERENCES `pontos` (`idponto`),
  CONSTRAINT `FK_academicos_instituicao` FOREIGN KEY (`codinstituicao`) REFERENCES `instituicoes` (`idinstituicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `academicos`
--

/*!40000 ALTER TABLE `academicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `academicos` ENABLE KEYS */;


--
-- Definition of table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos` (
  `idcurso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `codinstituicao` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idcurso`),
  KEY `FK_cursos_instituicao` (`codinstituicao`),
  CONSTRAINT `FK_cursos_instituicao` FOREIGN KEY (`codinstituicao`) REFERENCES `instituicoes` (`idinstituicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cursos`
--

/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;


--
-- Definition of table `instituicoes`
--

DROP TABLE IF EXISTS `instituicoes`;
CREATE TABLE `instituicoes` (
  `idinstituicao` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `sigla` varchar(50) DEFAULT NULL,
  `municipio` varchar(120) NOT NULL,
  PRIMARY KEY (`idinstituicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instituicoes`
--

/*!40000 ALTER TABLE `instituicoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `instituicoes` ENABLE KEYS */;


--
-- Definition of table `pontos`
--

DROP TABLE IF EXISTS `pontos`;
CREATE TABLE `pontos` (
  `idponto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(60) NOT NULL,
  `matutino` char(1) DEFAULT NULL,
  `vespertino` char(1) DEFAULT NULL,
  `noturno` char(1) DEFAULT NULL,
  PRIMARY KEY (`idponto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pontos`
--

/*!40000 ALTER TABLE `pontos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pontos` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
