-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bocaditos_bd
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `catId` int(11) NOT NULL AUTO_INCREMENT,
  `catDescripcion` varchar(45) NOT NULL,
  `catEstado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`catId`),
  UNIQUE KEY `catDescripcion_UNIQUE` (`catDescripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Cupcake','Activo'),(2,'Torta','Activo');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER inactivar_producto
AFTER UPDATE ON categoria
FOR EACH ROW
BEGIN
  IF NEW.catEstado = 'Inactivo' THEN
    UPDATE producto SET proEstado = 'Inactivo' WHERE catId_fk = NEW.catId;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER activar_producto
AFTER UPDATE ON categoria
FOR EACH ROW
BEGIN
  IF NEW.catEstado = 'Activo' THEN
    UPDATE producto SET proEstado = 'Activo' WHERE catId_fk = NEW.catId;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cliId` int(11) NOT NULL AUTO_INCREMENT,
  `cliDocumento` varchar(20) DEFAULT NULL,
  `cliTipoDocumento` enum('','CC','TI','CE') DEFAULT NULL,
  `cliNombre` varchar(45) NOT NULL,
  `cliApellido` varchar(45) NOT NULL,
  `cliCorreo` varchar(45) DEFAULT NULL,
  `cliDireccion` varchar(70) DEFAULT NULL,
  `cliTelefono` varchar(20) DEFAULT NULL,
  `cliEstado` enum('Activo','Inactivo') DEFAULT NULL,
  PRIMARY KEY (`cliId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'1140657822','CC','Paula','Isaza','Paula@gmail.com','Calle 62 #50A','3216754434','Activo'),(2,'1054675104','TI','David','Perez','David_22@hotmail.com','Calle 45 #12','3147998875','Activo');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `clientes_activos`
--

DROP TABLE IF EXISTS `clientes_activos`;
/*!50001 DROP VIEW IF EXISTS `clientes_activos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `clientes_activos` AS SELECT
 1 AS `cantidad_clientes_activos` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `consulta_cantidad_ordenes_mes`
--

DROP TABLE IF EXISTS `consulta_cantidad_ordenes_mes`;
/*!50001 DROP VIEW IF EXISTS `consulta_cantidad_ordenes_mes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `consulta_cantidad_ordenes_mes` AS SELECT
 1 AS `cantidad_ordenes` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `consulta_detalles_orden`
--

DROP TABLE IF EXISTS `consulta_detalles_orden`;
/*!50001 DROP VIEW IF EXISTS `consulta_detalles_orden`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `consulta_detalles_orden` AS SELECT
 1 AS `detoId`,
  1 AS `ordId_fk`,
  1 AS `prodId_fk`,
  1 AS `proNombre`,
  1 AS `detoSabor`,
  1 AS `detoRelleno`,
  1 AS `detoPorciones`,
  1 AS `detoCantidad`,
  1 AS `detoPrecio`,
  1 AS `detoSubTotal` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `consulta_detalles_pedido`
--

DROP TABLE IF EXISTS `consulta_detalles_pedido`;
/*!50001 DROP VIEW IF EXISTS `consulta_detalles_pedido`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `consulta_detalles_pedido` AS SELECT
 1 AS `detpId`,
  1 AS `pedId_fk`,
  1 AS `matNombre`,
  1 AS `detpCantidad`,
  1 AS `detpSubTotal` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `consulta_ganancias`
--

DROP TABLE IF EXISTS `consulta_ganancias`;
/*!50001 DROP VIEW IF EXISTS `consulta_ganancias`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `consulta_ganancias` AS SELECT
 1 AS `ganancias` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `consulta_materia_prima`
--

DROP TABLE IF EXISTS `consulta_materia_prima`;
/*!50001 DROP VIEW IF EXISTS `consulta_materia_prima`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `consulta_materia_prima` AS SELECT
 1 AS `matId`,
  1 AS `matNombre`,
  1 AS `matEstado`,
  1 AS `detmCantidad`,
  1 AS `detmUnidadDeMedida` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `consulta_orden_totales_mensuales`
--

DROP TABLE IF EXISTS `consulta_orden_totales_mensuales`;
/*!50001 DROP VIEW IF EXISTS `consulta_orden_totales_mensuales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `consulta_orden_totales_mensuales` AS SELECT
 1 AS `total_mensual` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `consulta_pedido`
--

DROP TABLE IF EXISTS `consulta_pedido`;
/*!50001 DROP VIEW IF EXISTS `consulta_pedido`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `consulta_pedido` AS SELECT
 1 AS `pedId`,
  1 AS `pedFechaPedido`,
  1 AS `pedFechaEntrega`,
  1 AS `pedEstado`,
  1 AS `prvId_fk`,
  1 AS `pedTotal`,
  1 AS `prvNombre` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `consulta_pedido_total_mes`
--

DROP TABLE IF EXISTS `consulta_pedido_total_mes`;
/*!50001 DROP VIEW IF EXISTS `consulta_pedido_total_mes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `consulta_pedido_total_mes` AS SELECT
 1 AS `total_pedidos_mes` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `consulta_producto`
--

DROP TABLE IF EXISTS `consulta_producto`;
/*!50001 DROP VIEW IF EXISTS `consulta_producto`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `consulta_producto` AS SELECT
 1 AS `proId`,
  1 AS `proNombre`,
  1 AS `proEstado`,
  1 AS `catId_fk`,
  1 AS `catDescripcion` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `consulta_usuario`
--

DROP TABLE IF EXISTS `consulta_usuario`;
/*!50001 DROP VIEW IF EXISTS `consulta_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `consulta_usuario` AS SELECT
 1 AS `usuId`,
  1 AS `usuCorreo`,
  1 AS `usuContrasena`,
  1 AS `usuApellido`,
  1 AS `usuNombre`,
  1 AS `usuTipoDocumento`,
  1 AS `usuDocumento`,
  1 AS `usuTelefono`,
  1 AS `usuDireccion`,
  1 AS `usuEstado`,
  1 AS `rolId_fk`,
  1 AS `rolDescripcion` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `consultar_orden`
--

DROP TABLE IF EXISTS `consultar_orden`;
/*!50001 DROP VIEW IF EXISTS `consultar_orden`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `consultar_orden` AS SELECT
 1 AS `ordId`,
  1 AS `ordFechaPedido`,
  1 AS `ordFechaEntrega`,
  1 AS `ordIdRepostero_fk`,
  1 AS `repostero`,
  1 AS `CliId_fk`,
  1 AS `cliente`,
  1 AS `documento`,
  1 AS `ordDireccion`,
  1 AS `ordDetalles`,
  1 AS `ordPrecioDomicilio`,
  1 AS `ordTotal`,
  1 AS `ordAbono`,
  1 AS `ordSaldo`,
  1 AS `ordEstado` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `consultar_repostero_cliente`
--

DROP TABLE IF EXISTS `consultar_repostero_cliente`;
/*!50001 DROP VIEW IF EXISTS `consultar_repostero_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `consultar_repostero_cliente` AS SELECT
 1 AS `ordId`,
  1 AS `ordEstado`,
  1 AS `ordFechaPedido`,
  1 AS `ordFechaEntrega`,
  1 AS `ordTotal`,
  1 AS `ordIdRepostero_fk`,
  1 AS `cliId_fk`,
  1 AS `usuDocumento`,
  1 AS `cliDocumento` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `detallesmateriaprima`
--

DROP TABLE IF EXISTS `detallesmateriaprima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallesmateriaprima` (
  `detmId` int(11) NOT NULL AUTO_INCREMENT,
  `matId_fk` int(11) NOT NULL,
  `detmCantidad` float DEFAULT 0,
  `detmUnidadDeMedida` enum('Kg','L','Unidad','N/A') DEFAULT 'N/A',
  PRIMARY KEY (`detmId`),
  KEY `matId_fk_idx` (`matId_fk`),
  CONSTRAINT `matId_fk` FOREIGN KEY (`matId_fk`) REFERENCES `materiaprima` (`matId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesmateriaprima`
--

LOCK TABLES `detallesmateriaprima` WRITE;
/*!40000 ALTER TABLE `detallesmateriaprima` DISABLE KEYS */;
INSERT INTO `detallesmateriaprima` VALUES (1,1,15,'Kg'),(2,2,25,'L'),(3,3,9,'Kg');
/*!40000 ALTER TABLE `detallesmateriaprima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallesorden`
--

DROP TABLE IF EXISTS `detallesorden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallesorden` (
  `detoId` int(11) NOT NULL AUTO_INCREMENT,
  `ordId_fk` int(11) NOT NULL,
  `prodId_fk` int(11) NOT NULL,
  `detoSabor` varchar(45) DEFAULT NULL,
  `detoRelleno` varchar(45) DEFAULT NULL,
  `detoPorciones` int(11) DEFAULT NULL,
  `detoCantidad` int(11) NOT NULL,
  `detoPrecio` double NOT NULL,
  `detoSubTotal` double DEFAULT NULL,
  PRIMARY KEY (`detoId`),
  KEY `ordId_fk_idx` (`ordId_fk`),
  KEY `prodId_fk_idx` (`prodId_fk`),
  CONSTRAINT `ordId_fk` FOREIGN KEY (`ordId_fk`) REFERENCES `orden` (`ordId`),
  CONSTRAINT `prodId_fk` FOREIGN KEY (`prodId_fk`) REFERENCES `producto` (`proId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesorden`
--

LOCK TABLES `detallesorden` WRITE;
/*!40000 ALTER TABLE `detallesorden` DISABLE KEYS */;
INSERT INTO `detallesorden` VALUES (1,1,2,'Chocolate','Arequipe',30,1,140000,140000),(2,2,1,'Oreo','Chocolate Blanco',1,6,5000,30000),(3,2,1,'Vainilla','Frambuesa',1,6,5000,30000);
/*!40000 ALTER TABLE `detallesorden` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_subtotal_orden_insert
BEFORE INSERT ON detallesorden
FOR EACH ROW
BEGIN
  SET NEW.detosubtotal = NEW.detocantidad * NEW.detoprecio;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_total_orden_insert
AFTER INSERT ON detallesorden
FOR EACH ROW
BEGIN
  UPDATE orden SET ordtotal = (
    SELECT SUM(detosubtotal) + ordPrecioDomicilio
    FROM detallesorden
    WHERE ordId_fk = NEW.ordId_fk
  ) WHERE ordid = NEW.ordId_fk;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_subtotal_orden_update
BEFORE UPDATE ON detallesorden
FOR EACH ROW
BEGIN
  SET NEW.detosubtotal = NEW.detocantidad * NEW.detoprecio;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_total_orden_update
AFTER UPDATE ON detallesorden
FOR EACH ROW
BEGIN
  UPDATE orden SET ordtotal = (
    SELECT SUM(detosubtotal) + orden.ordPrecioDomicilio
    FROM detallesorden
    INNER JOIN orden ON detallesorden.ordId_fk = orden.ordid
    WHERE detallesorden.ordId_fk = NEW.ordId_fk
  ) WHERE ordid = NEW.ordId_fk;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_total_orden_delete
AFTER DELETE ON detallesorden
FOR EACH ROW
BEGIN
  UPDATE orden SET ordtotal = (
    SELECT SUM(detosubtotal) + ordPrecioDomicilio
    FROM detallesorden
    WHERE ordId_fk = OLD.ordId_fk
  ) WHERE ordid = OLD.ordId_fk;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detallespedido`
--

DROP TABLE IF EXISTS `detallespedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallespedido` (
  `detpId` int(11) NOT NULL AUTO_INCREMENT,
  `pedId_fk` int(11) NOT NULL,
  `matId_fk` int(11) NOT NULL,
  `detpPrecioUnidad` double DEFAULT NULL,
  `detpCantidad` float DEFAULT NULL,
  `detpSubTotal` double DEFAULT NULL,
  PRIMARY KEY (`detpId`),
  KEY `fk_detallespedido_pedido1_idx` (`pedId_fk`),
  KEY `matpId_fk_idx` (`matId_fk`),
  CONSTRAINT `fk_detallespedido_pedido1` FOREIGN KEY (`pedId_fk`) REFERENCES `pedido` (`pedId`),
  CONSTRAINT `matpId_fk` FOREIGN KEY (`matId_fk`) REFERENCES `materiaprima` (`matId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallespedido`
--

LOCK TABLES `detallespedido` WRITE;
/*!40000 ALTER TABLE `detallespedido` DISABLE KEYS */;
INSERT INTO `detallespedido` VALUES (1,1,2,4000,20,80000),(2,2,3,20000,3,60000);
/*!40000 ALTER TABLE `detallespedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_subtotal_insert
BEFORE INSERT ON detallespedido
FOR EACH ROW
BEGIN
  SET NEW.detpsubtotal = NEW.detpcantidad * NEW.detpprecioUnidad;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_total_insert
AFTER INSERT ON detallespedido
FOR EACH ROW
BEGIN
  UPDATE pedido SET pedtotal = (
    SELECT SUM(detpSubTotal)
    FROM detallespedido
    WHERE pedId_fk = NEW.pedId_fk
  ) WHERE pedid = NEW.pedId_fk;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_detallesmateriaprima
AFTER INSERT ON detallespedido
FOR EACH ROW
BEGIN
    UPDATE detallesmateriaprima
    SET detmCantidad = detmCantidad + NEW.detpCantidad
    WHERE matId_fk = NEW.matId_fk;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_subtotal_update
BEFORE UPDATE ON detallespedido
FOR EACH ROW
BEGIN
  SET NEW.detpsubtotal = NEW.detpcantidad * NEW.detppreciounidad;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_total_update
AFTER UPDATE ON detallespedido
FOR EACH ROW
BEGIN
  UPDATE pedido SET pedtotal = (
    SELECT SUM(detpsubtotal)
    FROM detallespedido
    WHERE pedId_fk = NEW.pedId_fk
  ) WHERE pedid = NEW.pedId_fk;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_total_delete
AFTER DELETE ON detallespedido
FOR EACH ROW
BEGIN
  UPDATE pedido SET pedtotal = (
    SELECT SUM(detpSubTotal)
    FROM detallespedido
    WHERE pedId_fk = OLD.pedId_fk
  ) WHERE pedid = OLD.pedId_fk;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `materia_activa`
--

DROP TABLE IF EXISTS `materia_activa`;
/*!50001 DROP VIEW IF EXISTS `materia_activa`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `materia_activa` AS SELECT
 1 AS `cantidad_materia_activa` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `materiaprima`
--

DROP TABLE IF EXISTS `materiaprima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materiaprima` (
  `matId` int(11) NOT NULL AUTO_INCREMENT,
  `matNombre` varchar(50) NOT NULL,
  `matEstado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`matId`),
  UNIQUE KEY `matNombre_UNIQUE` (`matNombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiaprima`
--

LOCK TABLES `materiaprima` WRITE;
/*!40000 ALTER TABLE `materiaprima` DISABLE KEYS */;
INSERT INTO `materiaprima` VALUES (1,'Harina','Activo'),(2,'Leche','Activo'),(3,'Mantequilla','Activo');
/*!40000 ALTER TABLE `materiaprima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden` (
  `ordId` int(11) NOT NULL AUTO_INCREMENT,
  `ordIdRepostero_fk` int(11) NOT NULL,
  `cliId_fk` int(11) NOT NULL,
  `ordFechaPedido` date NOT NULL,
  `ordFechaEntrega` datetime DEFAULT NULL,
  `ordDireccion` varchar(70) DEFAULT NULL,
  `ordDetalles` varchar(300) DEFAULT NULL,
  `ordPrecioDomicilio` double DEFAULT NULL,
  `ordTotal` double DEFAULT NULL,
  `ordAbono` double DEFAULT NULL,
  `ordSaldo` double DEFAULT NULL,
  `ordEstado` enum('Realizada','Pagada','En camino','Entregada','Cancelada') NOT NULL,
  PRIMARY KEY (`ordId`),
  KEY `cliId_fk_idx` (`cliId_fk`),
  KEY `ordIdRepostero_fk_idx` (`ordIdRepostero_fk`),
  CONSTRAINT `cliId_fk` FOREIGN KEY (`cliId_fk`) REFERENCES `cliente` (`cliId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ordIdRepostero_fk` FOREIGN KEY (`ordIdRepostero_fk`) REFERENCES `usuario` (`usuId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,1,1,'2023-06-12','2023-06-16 21:28:00','Calle 62 #50A','Diseño alusivo a Bob Esponja, que diga feliz cumpleaños 12 Carlos.',15000,155000,40000,115000,'Realizada'),(2,2,2,'2023-06-04','2023-06-08 13:35:00','Calle 45 #12','Decorado romantico',12000,72000,30000,42000,'Realizada');
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_saldo_insert
BEFORE INSERT ON orden
FOR EACH ROW
BEGIN
  SET NEW.ordsaldo = NEW.ordtotal - NEW.ordabono;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_ordtotal_domicilio BEFORE UPDATE ON orden
FOR EACH ROW
BEGIN
    IF NEW.ordpreciodomicilio <> OLD.ordpreciodomicilio THEN
        SET NEW.ordtotal = NEW.ordtotal - OLD.ordpreciodomicilio + NEW.ordpreciodomicilio;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_saldo_update
 BEFORE UPDATE ON orden
 FOR EACH ROW
 BEGIN
   SET NEW.ordsaldo = NEW.ordtotal - NEW.ordabono;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `ordenes_semanales_usuario`
--

DROP TABLE IF EXISTS `ordenes_semanales_usuario`;
/*!50001 DROP VIEW IF EXISTS `ordenes_semanales_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ordenes_semanales_usuario` AS SELECT
 1 AS `usuId`,
  1 AS `usuCorreo`,
  1 AS `usuContrasena`,
  1 AS `usuApellido`,
  1 AS `usuNombre`,
  1 AS `usuTipoDocumento`,
  1 AS `usuDocumento`,
  1 AS `usuTelefono`,
  1 AS `usuDireccion`,
  1 AS `usuEstado`,
  1 AS `rolId_fk`,
  1 AS `rolDescripcion`,
  1 AS `cantidad_ordenes` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `pedId` int(11) NOT NULL AUTO_INCREMENT,
  `pedFechaPedido` date NOT NULL,
  `pedFechaEntrega` datetime DEFAULT NULL,
  `pedEstado` enum('Realizado','En camino','Pagado','Recibido','Cancelado') NOT NULL,
  `prvId_fk` int(11) NOT NULL,
  `pedTotal` double DEFAULT NULL,
  PRIMARY KEY (`pedId`),
  KEY `fk_pedido_proveedor1_idx` (`prvId_fk`),
  CONSTRAINT `fk_pedido_proveedor1` FOREIGN KEY (`prvId_fk`) REFERENCES `proveedor` (`prvId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2023-06-06','2023-06-18 22:39:00','Realizado',1,80000),(2,'2023-06-13','2023-06-16 00:30:00','Realizado',2,60000);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_detallesmateriaprima_estado
AFTER UPDATE ON pedido
FOR EACH ROW
BEGIN
    IF OLD.pedEstado = 'Cancelado' AND NEW.pedEstado <> 'Cancelado' THEN
        -- Sumar la cantidad de materia prima en detallesmateriaprima
        UPDATE detallesmateriaprima
        SET detmCantidad = detmCantidad + (
            SELECT SUM(detpCantidad)
            FROM detallespedido
            WHERE pedId_fk = NEW.pedId
            AND matId_fk = detallesmateriaprima.matId_fk
        )
        WHERE matId_fk IN (
            SELECT matId_fk
            FROM detallespedido
            WHERE pedId_fk = NEW.pedId
        );
    ELSEIF OLD.pedEstado <> 'Cancelado' AND NEW.pedEstado = 'Cancelado' THEN
        -- Restar la cantidad de materia prima en detallesmateriaprima
        UPDATE detallesmateriaprima
        SET detmCantidad = detmCantidad - (
            SELECT SUM(detpCantidad)
            FROM detallespedido
            WHERE pedId_fk = NEW.pedId
            AND matId_fk = detallesmateriaprima.matId_fk
        )
        WHERE matId_fk IN (
            SELECT matId_fk
            FROM detallespedido
            WHERE pedId_fk = NEW.pedId
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `proId` int(11) NOT NULL AUTO_INCREMENT,
  `proNombre` varchar(50) NOT NULL,
  `proEstado` enum('Activo','Inactivo') NOT NULL,
  `catId_fk` int(11) NOT NULL,
  PRIMARY KEY (`proId`),
  UNIQUE KEY `proNombre_UNIQUE` (`proNombre`),
  KEY `catId_fk_idx` (`catId_fk`),
  CONSTRAINT `catId_fk` FOREIGN KEY (`catId_fk`) REFERENCES `categoria` (`catId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Cupcake fondant','Activo',1),(2,'Torta fondant','Activo',2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `productos_activos`
--

DROP TABLE IF EXISTS `productos_activos`;
/*!50001 DROP VIEW IF EXISTS `productos_activos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `productos_activos` AS SELECT
 1 AS `cantidad_productos_activos` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `prvId` int(11) NOT NULL AUTO_INCREMENT,
  `prvNit` varchar(45) NOT NULL,
  `prvNombre` varchar(50) NOT NULL,
  `prvDireccion` varchar(100) DEFAULT NULL,
  `prvTelefono` bigint(20) DEFAULT NULL,
  `prvCorreo` varchar(100) DEFAULT NULL,
  `prvEstado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`prvId`),
  UNIQUE KEY `prvNombre_UNIQUE` (`prvNombre`),
  UNIQUE KEY `prvNit_UNIQUE` (`prvNit`),
  UNIQUE KEY `prvCorreo_UNIQUE` (`prvCorreo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'860.025.900-2','Alpina','Carrera 68J #12',3156784476,'Alpinacontacto@gmail.com','Activo'),(2,'890.904.478-6','Colanta','Avenida 12 #23',3153384479,'Saborcolanta@gmail.com','Activo');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `rolId` int(11) NOT NULL AUTO_INCREMENT,
  `rolDescripcion` varchar(25) NOT NULL,
  `rolEstado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`rolId`),
  UNIQUE KEY `rolDescripcion_UNIQUE` (`rolDescripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Propietario','Activo'),(2,'Supervisor','Activo'),(3,'Repostero','Activo'),(4,'Indefinido','Activo');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER inactivar_usuario
AFTER UPDATE ON rol
FOR EACH ROW
BEGIN
  IF NEW.rolEstado = 'Inactivo' THEN
    UPDATE usuario SET usuEstado = 'Inactivo' WHERE rolId_fk = NEW.rolId;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER activar_usuario
AFTER UPDATE ON rol
FOR EACH ROW
BEGIN
  IF NEW.rolEstado = 'Activo' THEN
    UPDATE usuario SET usuEstado = 'Activo' WHERE rolId_fk = NEW.rolId;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `usuId` int(11) NOT NULL AUTO_INCREMENT,
  `usuCorreo` varchar(50) NOT NULL,
  `usuContrasena` varchar(80) NOT NULL,
  `usuApellido` varchar(45) NOT NULL,
  `usuNombre` varchar(45) NOT NULL,
  `usuTipoDocumento` enum('CC','CE') NOT NULL,
  `usuDocumento` int(11) NOT NULL,
  `usuTelefono` bigint(20) NOT NULL,
  `usuDireccion` varchar(70) NOT NULL,
  `usuEstado` enum('Activo','Inactivo') NOT NULL,
  `rolId_fk` int(11) NOT NULL,
  PRIMARY KEY (`usuId`),
  UNIQUE KEY `usuCorreo_UNIQUE` (`usuCorreo`),
  UNIQUE KEY `usuDocumento_UNIQUE` (`usuDocumento`),
  KEY `rolId_idx` (`rolId_fk`),
  CONSTRAINT `rolId_fk` FOREIGN KEY (`rolId_fk`) REFERENCES `rol` (`rolId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'bocaditos@gmail.com','cc62228b6660bae813d0781251bc0276f947ecf8280038d07cd70abce1f3e98e','Vezga','Camila','CC',1034585676,3147894456,'carrera 45W #21','Activo',1),(2,'danslpez@misena.edu.co','7711b79cb070bb86286a5c51b38c23d9e95ea1bf7593b80de507b448f8450a76','Lopez','Santiago','CC',1030525061,3142573307,'Carrera 87J','Activo',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bocaditos_bd'
--

--
-- Dumping routines for database 'bocaditos_bd'
--

--
-- Final view structure for view `clientes_activos`
--

/*!50001 DROP VIEW IF EXISTS `clientes_activos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clientes_activos` AS select count(0) AS `cantidad_clientes_activos` from `cliente` where `cliente`.`cliEstado` = 'Activo' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consulta_cantidad_ordenes_mes`
--

/*!50001 DROP VIEW IF EXISTS `consulta_cantidad_ordenes_mes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consulta_cantidad_ordenes_mes` AS select count(0) AS `cantidad_ordenes` from `orden` where `orden`.`ordEstado` <> 'Cancelada' and month(`orden`.`ordFechaPedido`) = month(curdate()) and year(`orden`.`ordFechaPedido`) = year(curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consulta_detalles_orden`
--

/*!50001 DROP VIEW IF EXISTS `consulta_detalles_orden`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consulta_detalles_orden` AS select `detallesorden`.`detoId` AS `detoId`,`detallesorden`.`ordId_fk` AS `ordId_fk`,`detallesorden`.`prodId_fk` AS `prodId_fk`,`producto`.`proNombre` AS `proNombre`,`detallesorden`.`detoSabor` AS `detoSabor`,`detallesorden`.`detoRelleno` AS `detoRelleno`,`detallesorden`.`detoPorciones` AS `detoPorciones`,`detallesorden`.`detoCantidad` AS `detoCantidad`,`detallesorden`.`detoPrecio` AS `detoPrecio`,`detallesorden`.`detoSubTotal` AS `detoSubTotal` from (`detallesorden` join `producto`) where `detallesorden`.`prodId_fk` = `producto`.`proId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consulta_detalles_pedido`
--

/*!50001 DROP VIEW IF EXISTS `consulta_detalles_pedido`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consulta_detalles_pedido` AS select `detallespedido`.`detpId` AS `detpId`,`detallespedido`.`pedId_fk` AS `pedId_fk`,`materiaprima`.`matNombre` AS `matNombre`,`detallespedido`.`detpCantidad` AS `detpCantidad`,`detallespedido`.`detpSubTotal` AS `detpSubTotal` from (`detallespedido` join `materiaprima`) where `detallespedido`.`matId_fk` = `materiaprima`.`matId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consulta_ganancias`
--

/*!50001 DROP VIEW IF EXISTS `consulta_ganancias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consulta_ganancias` AS select `t1`.`total_mensual` - `t2`.`total_pedidos_mes` AS `ganancias` from (`consulta_orden_totales_mensuales` `t1` join `consulta_pedido_total_mes` `t2`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consulta_materia_prima`
--

/*!50001 DROP VIEW IF EXISTS `consulta_materia_prima`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consulta_materia_prima` AS select `materiaprima`.`matId` AS `matId`,`materiaprima`.`matNombre` AS `matNombre`,`materiaprima`.`matEstado` AS `matEstado`,`detallesmateriaprima`.`detmCantidad` AS `detmCantidad`,`detallesmateriaprima`.`detmUnidadDeMedida` AS `detmUnidadDeMedida` from (`materiaprima` join `detallesmateriaprima`) where `materiaprima`.`matId` = `detallesmateriaprima`.`matId_fk` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consulta_orden_totales_mensuales`
--

/*!50001 DROP VIEW IF EXISTS `consulta_orden_totales_mensuales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consulta_orden_totales_mensuales` AS select sum(`orden`.`ordTotal`) AS `total_mensual` from `orden` where `orden`.`ordEstado` <> 'cancelada' and month(`orden`.`ordFechaPedido`) = month(curdate()) and year(`orden`.`ordFechaPedido`) = year(curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consulta_pedido`
--

/*!50001 DROP VIEW IF EXISTS `consulta_pedido`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consulta_pedido` AS select `pedido`.`pedId` AS `pedId`,`pedido`.`pedFechaPedido` AS `pedFechaPedido`,`pedido`.`pedFechaEntrega` AS `pedFechaEntrega`,`pedido`.`pedEstado` AS `pedEstado`,`pedido`.`prvId_fk` AS `prvId_fk`,`pedido`.`pedTotal` AS `pedTotal`,`proveedor`.`prvNombre` AS `prvNombre` from (`pedido` join `proveedor`) where `pedido`.`prvId_fk` = `proveedor`.`prvId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consulta_pedido_total_mes`
--

/*!50001 DROP VIEW IF EXISTS `consulta_pedido_total_mes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consulta_pedido_total_mes` AS select sum(`pedido`.`pedTotal`) AS `total_pedidos_mes` from `pedido` where `pedido`.`pedEstado` <> 'Cancelado' and month(`pedido`.`pedFechaPedido`) = month(curdate()) and year(`pedido`.`pedFechaPedido`) = year(curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consulta_producto`
--

/*!50001 DROP VIEW IF EXISTS `consulta_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consulta_producto` AS select `producto`.`proId` AS `proId`,`producto`.`proNombre` AS `proNombre`,`producto`.`proEstado` AS `proEstado`,`producto`.`catId_fk` AS `catId_fk`,`categoria`.`catDescripcion` AS `catDescripcion` from (`producto` join `categoria`) where `producto`.`catId_fk` = `categoria`.`catId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consulta_usuario`
--

/*!50001 DROP VIEW IF EXISTS `consulta_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consulta_usuario` AS select `usuario`.`usuId` AS `usuId`,`usuario`.`usuCorreo` AS `usuCorreo`,`usuario`.`usuContrasena` AS `usuContrasena`,`usuario`.`usuApellido` AS `usuApellido`,`usuario`.`usuNombre` AS `usuNombre`,`usuario`.`usuTipoDocumento` AS `usuTipoDocumento`,`usuario`.`usuDocumento` AS `usuDocumento`,`usuario`.`usuTelefono` AS `usuTelefono`,`usuario`.`usuDireccion` AS `usuDireccion`,`usuario`.`usuEstado` AS `usuEstado`,`usuario`.`rolId_fk` AS `rolId_fk`,`rol`.`rolDescripcion` AS `rolDescripcion` from (`usuario` join `rol`) where `usuario`.`rolId_fk` = `rol`.`rolId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consultar_orden`
--

/*!50001 DROP VIEW IF EXISTS `consultar_orden`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consultar_orden` AS select `orden`.`ordId` AS `ordId`,`orden`.`ordFechaPedido` AS `ordFechaPedido`,date_format(`orden`.`ordFechaEntrega`,'%Y-%m-%d %H:%i') AS `ordFechaEntrega`,`orden`.`ordIdRepostero_fk` AS `ordIdRepostero_fk`,concat(`usuario`.`usuNombre`,' ',`usuario`.`usuApellido`) AS `repostero`,`orden`.`cliId_fk` AS `CliId_fk`,concat(`cliente`.`cliNombre`,' ',`cliente`.`cliApellido`) AS `cliente`,concat(`cliente`.`cliTipoDocumento`,' ',`cliente`.`cliDocumento`) AS `documento`,`orden`.`ordDireccion` AS `ordDireccion`,`orden`.`ordDetalles` AS `ordDetalles`,`orden`.`ordPrecioDomicilio` AS `ordPrecioDomicilio`,`orden`.`ordTotal` AS `ordTotal`,`orden`.`ordAbono` AS `ordAbono`,`orden`.`ordSaldo` AS `ordSaldo`,`orden`.`ordEstado` AS `ordEstado` from ((`orden` join `usuario` on(`orden`.`ordIdRepostero_fk` = `usuario`.`usuId`)) join `cliente` on(`orden`.`cliId_fk` = `cliente`.`cliId`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consultar_repostero_cliente`
--

/*!50001 DROP VIEW IF EXISTS `consultar_repostero_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consultar_repostero_cliente` AS select `orden`.`ordId` AS `ordId`,`orden`.`ordEstado` AS `ordEstado`,`orden`.`ordFechaPedido` AS `ordFechaPedido`,`orden`.`ordFechaEntrega` AS `ordFechaEntrega`,`orden`.`ordTotal` AS `ordTotal`,`orden`.`ordIdRepostero_fk` AS `ordIdRepostero_fk`,`orden`.`cliId_fk` AS `cliId_fk`,`usuario`.`usuDocumento` AS `usuDocumento`,`cliente`.`cliDocumento` AS `cliDocumento` from ((`orden` join `usuario`) join `cliente`) where `orden`.`ordIdRepostero_fk` = `usuario`.`usuId` = `cliente`.`cliId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `materia_activa`
--

/*!50001 DROP VIEW IF EXISTS `materia_activa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `materia_activa` AS select count(0) AS `cantidad_materia_activa` from `materiaprima` where `materiaprima`.`matEstado` = 'Activo' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordenes_semanales_usuario`
--

/*!50001 DROP VIEW IF EXISTS `ordenes_semanales_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordenes_semanales_usuario` AS select `usuario`.`usuId` AS `usuId`,`usuario`.`usuCorreo` AS `usuCorreo`,`usuario`.`usuContrasena` AS `usuContrasena`,`usuario`.`usuApellido` AS `usuApellido`,`usuario`.`usuNombre` AS `usuNombre`,`usuario`.`usuTipoDocumento` AS `usuTipoDocumento`,`usuario`.`usuDocumento` AS `usuDocumento`,`usuario`.`usuTelefono` AS `usuTelefono`,`usuario`.`usuDireccion` AS `usuDireccion`,`usuario`.`usuEstado` AS `usuEstado`,`usuario`.`rolId_fk` AS `rolId_fk`,`rol`.`rolDescripcion` AS `rolDescripcion`,count(case when week(`orden`.`ordFechaPedido`) = week(current_timestamp()) then `orden`.`ordId` end) AS `cantidad_ordenes` from ((`usuario` join `rol`) left join `orden` on(`usuario`.`usuId` = `orden`.`ordIdRepostero_fk`)) where `usuario`.`rolId_fk` = `rol`.`rolId` and week(`orden`.`ordFechaPedido`) = week(current_timestamp()) group by `usuario`.`usuId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productos_activos`
--

/*!50001 DROP VIEW IF EXISTS `productos_activos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productos_activos` AS select count(0) AS `cantidad_productos_activos` from `producto` where `producto`.`proEstado` = 'Activo' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-15 21:47:14
