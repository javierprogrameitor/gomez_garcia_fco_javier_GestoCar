DROP DATABASE IF EXISTS 'gestocardb';
DROP USER IF EXISTS 'gestocar'@'localhost';
 
CREATE DATABASE  IF NOT EXISTS `gestocardb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestocardb`;

-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: gestocardb
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fotos`
--

DROP TABLE IF EXISTS `fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotos` (
  `idfotos` smallint NOT NULL AUTO_INCREMENT,
  `idvehiculo` smallint NOT NULL,
  `foto` varchar(15) NOT NULL,
  PRIMARY KEY (`idfotos`),
  KEY `fk_fotos_vehiculos` (`idvehiculo`),
  CONSTRAINT `fk_fotos_vehiculos` FOREIGN KEY (`idvehiculo`) REFERENCES `vehiculos` (`idvehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos`
--
--
-- Table structure for table `gastos`
--

DROP TABLE IF EXISTS `gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gastos` (
  `idgasto` smallint NOT NULL AUTO_INCREMENT,
  `idvehiculo` smallint NOT NULL,
  `concepto` varchar(40) NOT NULL,
  `fechagasto` date NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `importe` decimal(6,2) NOT NULL,
  `establecimiento` varchar(100) DEFAULT NULL,
  `kilometros` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`idgasto`),
  KEY `fk_gastos_vehiculos` (`idvehiculo`),
  CONSTRAINT `fk_gastos_vehiculos` FOREIGN KEY (`idvehiculo`) REFERENCES `vehiculos` (`idvehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos`
--
LOCK TABLES `gastos` WRITE;
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
INSERT INTO `gastos` VALUES (9,33,'Cambio de aceite','2022-02-15','Cambio de aceite y filtro',50.00,'Taller \"Mecánica Rápida\"',25000),(10,34,'Reparación de frenos','2023-05-20','Cambio de pastillas de freno y discos',120.00,'Taller \"Frenos Seguros\"',32000),(11,35,'Limpieza y lavado','2024-01-10','Lavado completo y aspirado',20.00,'Lavadero \"Brillantez\"',20000),(12,36,'Inspección técnica (ITV)','2023-09-05','Realización de la inspección técnica anual',45.00,'Estación ITV \"Seguridad Vial\"',28000),(13,37,'Reparación de neumáticos','2024-04-28','Cambio de neumáticos delanteros',200.00,'Taller \"Neumáticos Sánchez\"',21000),(14,38,'Mantenimiento general','2023-11-12','Revisión completa y cambio de líquidos',180.00,'Concesionario \"BMW Service\"',23000),(15,39,'Reparación de avería','2022-08-22','Reparación de la bomba de agua',300.00,'Taller \"Audi Motors\"',19000),(16,40,'Cambio de batería','2024-06-01','Reemplazo de la batería por una nueva',150.00,'Taller \"AutoElectricidad Martínez\"',27000);
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusuarios` smallint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `campobaja` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`idusuarios`),
  UNIQUE KEY `EMAIL_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','gestor','admin@iesalbarregas.es','21232f297a57a5a743894a0e4a801fc3','9292029B','F'),(2,'Luis','apellidoLuis','luis1@example.com','9c4f630e11562a69b1fa24bb36583345','2345678A','F'),(3,'Pedro','apellidoPedro','pedro@example.com','ca94f64f6aaa6bb2ba26442726e5aa12','2456789B','F'),(4,'Manuel','apellidoManuel','manuel@example.com','d00854f2bba03770c76d9b30539ff067','3567890C','F'),(5,'Fernando','apellidoFernando','fernando@example.com','8e5a33973f13f7ed70c1a716e43c6d5c','4678901D','F');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `idvehiculo` smallint NOT NULL AUTO_INCREMENT,
  `idusuario` smallint NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `motor` set ('gasolina','gasoil','electrico') NOT NULL DEFAULT 'gasolina',
  `matricula` varchar(8) NOT NULL,
  `cilindrada` varchar(5)  NOT NULL,
  `caballos` varchar(4)  DEFAULT NULL,
  `color` varchar(7)  DEFAULT NULL,
  `fechacompra` date NOT NULL,
  `fechaventa` date DEFAULT NULL,
  `preciocompra` decimal(7,2) NOT NULL,
  `precioventa` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`idvehiculo`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`),
  KEY `fk_vehiculos_usuarios` (`idusuario`),
  CONSTRAINT `fk_vehiculos_usuarios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES (33,1,'Toyota','Corolla','V4','KKJ1234',19,84,1,'2020-01-15',NULL,15000.00,NULL),(34,2,'Honda','Civic','V4','DFF5678',19,82,2,'2019-03-22','2023-01-10',17000.00,14000.00),(35,3,'Ford','Fiesta','V3','GHH9101',16,86,3,'2018-06-30',NULL,14000.00,NULL),(36,4,'Chevrolet','Malibu','V6','JKL2345',22,95,4,'2021-09-10',NULL,20000.00,NULL),(37,5,'Nissan','Sentra','V4','MNP6789',18,70,5,'2022-11-25',NULL,18000.00,NULL),(38,1,'BMW','320i','V6','PQR1122',25,90,1,'2017-07-18','2020-02-20',25000.00,22000.00),(39,2,'Audi','A4','V4','HTL3344',20,100,3,'2023-03-05',NULL,30000.00,NULL),(40,3,'Mercedes','C-Class','V6','LBD5566',20,65,4,'2021-12-14',NULL,40000.00,NULL);
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;




-- Crear el usuario gestocar con la contraseña Java*2024
CREATE USER 'gestocar'@'localhost' IDENTIFIED BY 'Java*2024';
-- Otorgar todos los privilegios en la base de datos gestocardb al usuario gestocar
GRANT ALL PRIVILEGES ON gestocardb.* TO 'gestocar'@'localhost';
-- Aplicar los cambios de privilegios
FLUSH PRIVILEGES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-03  2:30:39
