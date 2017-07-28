/*
Navicat MySQL Data Transfer

Source Server         : conexSP
Source Server Version : 50549
Source Host           : 192.168.5.42:3306
Source Database       : db_spie

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2017-05-26 18:59:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accion
-- ----------------------------
DROP TABLE IF EXISTS `accion`;
CREATE TABLE `accion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `inicio` int(11) DEFAULT NULL,
  `fin` int(11) DEFAULT NULL,
  `presupuesto` decimal(22,2) DEFAULT NULL,
  `indicador_proceso` int(11) DEFAULT NULL,
  `linea_base` text,
  `indicador_impacto` int(11) DEFAULT NULL,
  `slug` varchar(100) NOT NULL,
  `resultado` int(11) DEFAULT NULL,
  `entidad` int(11) DEFAULT NULL,
  `entidad_responsable` int(11) DEFAULT NULL,
  `codigo` varchar(200) DEFAULT NULL,
  `unidad` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `fecha_update` datetime DEFAULT NULL,
  `fecha_insert` datetime DEFAULT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `accion` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `padre` int(11) DEFAULT NULL,
  `observacion` longtext,
  `user_id_val` int(11) DEFAULT NULL,
  `desc_indicador_proceso` longtext,
  `tipo_proceso` varchar(100) DEFAULT NULL,
  `proyecto` int(11) DEFAULT NULL,
  `impacto_ine` int(11) DEFAULT NULL,
  `proceso_ine` int(11) DEFAULT NULL,
  `numero_proceso` decimal(22,2) DEFAULT NULL,
  `unidad_proceso` int(11) DEFAULT NULL,
  `sisin` varchar(100) DEFAULT NULL,
  `sub_accion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_accion_resultado` (`resultado`),
  KEY `fk_accion_entidad` (`entidad`),
  KEY `fk_entres` (`entidad_responsable`),
  KEY `fk_accion_ind_impacto` (`indicador_impacto`),
  KEY `fk_accion_indi_proceso` (`indicador_proceso`),
  KEY `fk_accion_accion` (`accion`),
  CONSTRAINT `FK_8A02E3B44587B0CB` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`id`),
  CONSTRAINT `FK_8A02E3B484291D2B` FOREIGN KEY (`resultado`) REFERENCES `resultado` (`id`),
  CONSTRAINT `FK_8A02E3B48A02E3B4` FOREIGN KEY (`accion`) REFERENCES `acciones` (`id`),
  CONSTRAINT `FK_8A02E3B4B5BAB485` FOREIGN KEY (`indicador_proceso`) REFERENCES `indicadores` (`id`),
  CONSTRAINT `FK_8A02E3B4B609FF7B` FOREIGN KEY (`indicador_impacto`) REFERENCES `indicadores` (`id`),
  CONSTRAINT `FK_8A02E3B4E28EE954` FOREIGN KEY (`entidad_responsable`) REFERENCES `sub_entidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3240 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for acciones
-- ----------------------------
DROP TABLE IF EXISTS `acciones`;
CREATE TABLE `acciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resultado` int(11) DEFAULT NULL,
  `cod_a` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correlativo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_B2ED91CD7F214777` (`resultado`),
  CONSTRAINT `FK_29F5FFE7B2ED91C` FOREIGN KEY (`resultado`) REFERENCES `resultado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1033 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for actor
-- ----------------------------
DROP TABLE IF EXISTS `actor`;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for articulacion
-- ----------------------------
DROP TABLE IF EXISTS `articulacion`;
CREATE TABLE `articulacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entidad_territorial` int(11) DEFAULT NULL,
  `competencia` int(11) DEFAULT NULL,
  `accion` int(11) DEFAULT NULL,
  `norma` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ac_entterr` (`entidad_territorial`),
  KEY `fk_ac_comp` (`competencia`),
  KEY `fk_ac_accion` (`accion`),
  CONSTRAINT `FK_7CA4455A842C498A` FOREIGN KEY (`competencia`) REFERENCES `competencia` (`id`),
  CONSTRAINT `FK_7CA4455A8A02E3B4` FOREIGN KEY (`accion`) REFERENCES `accion` (`id`),
  CONSTRAINT `FK_7CA4455AB9638F14` FOREIGN KEY (`entidad_territorial`) REFERENCES `entidad_territorial` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3493 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for competencia
-- ----------------------------
DROP TABLE IF EXISTS `competencia`;
CREATE TABLE `competencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for comunidades
-- ----------------------------
DROP TABLE IF EXISTS `comunidades`;
CREATE TABLE `comunidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comunidad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unico_r` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poblacion` int(11) DEFAULT NULL,
  `viviendas` int(11) DEFAULT NULL,
  `latitud` longtext COLLATE utf8_unicode_ci,
  `longitud` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19414 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for contraparte
-- ----------------------------
DROP TABLE IF EXISTS `contraparte`;
CREATE TABLE `contraparte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entidad_territorial` int(11) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `monto_inv_publica` decimal(22,2) NOT NULL,
  `monto_gasto_corriente` decimal(22,2) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `inversion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contraparte_territorial` (`entidad_territorial`),
  KEY `fk_contraparte_tipo` (`tipo`),
  KEY `fk_contraparte_inv` (`inversion`),
  CONSTRAINT `FK_DD0F233B702D1D47` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`id`),
  CONSTRAINT `FK_DD0F233BB9638F14` FOREIGN KEY (`entidad_territorial`) REFERENCES `entidad_territorial` (`id`),
  CONSTRAINT `FK_DD0F233BF1D89D65` FOREIGN KEY (`inversion`) REFERENCES `inversion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for correlativos
-- ----------------------------
DROP TABLE IF EXISTS `correlativos`;
CREATE TABLE `correlativos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `correlativo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for departamentos
-- ----------------------------
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `codigo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `latitud` longtext COLLATE utf8_unicode_ci,
  `longitud` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for diagnostico
-- ----------------------------
DROP TABLE IF EXISTS `diagnostico`;
CREATE TABLE `diagnostico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entidad` int(11) DEFAULT NULL,
  `indicador` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fuente_verificacion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `variable` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unidad` int(11) DEFAULT NULL,
  `grafica` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `fecha_update` datetime DEFAULT NULL,
  `fecha_insert` datetime DEFAULT NULL,
  `tipo_variable` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_diagnostico_entidad` (`entidad`),
  CONSTRAINT `FK_9B91D4484587B0CB` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for diagnostico_comparativo
-- ----------------------------
DROP TABLE IF EXISTS `diagnostico_comparativo`;
CREATE TABLE `diagnostico_comparativo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gestion` int(11) NOT NULL,
  `dato` decimal(22,2) NOT NULL,
  `diagnostico_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comparativo_diagnostico` (`diagnostico_id`),
  CONSTRAINT `FK_FA96EE0D7A94BA1A` FOREIGN KEY (`diagnostico_id`) REFERENCES `diagnostico` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1553 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for enfoque_politico
-- ----------------------------
DROP TABLE IF EXISTS `enfoque_politico`;
CREATE TABLE `enfoque_politico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia_clave` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `atrib_compe_consti` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `politicas_estrategias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pilar` int(11) DEFAULT NULL,
  `meta` int(11) DEFAULT NULL,
  `resultado` int(11) DEFAULT NULL,
  `entidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_enfoque_entidad` (`entidad`),
  CONSTRAINT `FK_FDF10B574587B0CB` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for entidad
-- ----------------------------
DROP TABLE IF EXISTS `entidad`;
CREATE TABLE `entidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) NOT NULL,
  `sigla` varchar(100) NOT NULL,
  `user` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `enfoque_politico` mediumtext NOT NULL,
  `sistemas_vida` mediumtext NOT NULL,
  `analisis_riesgos` mediumtext NOT NULL,
  `tipo` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `fecha_update` datetime DEFAULT NULL,
  `fecha_insert` datetime DEFAULT NULL,
  `codigo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for entidad_responsable
-- ----------------------------
DROP TABLE IF EXISTS `entidad_responsable`;
CREATE TABLE `entidad_responsable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accion` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `fecha_insert` datetime NOT NULL,
  `entidad_responsable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entresp_entidad` (`entidad_responsable`),
  KEY `fk_entresp_accion` (`accion`),
  CONSTRAINT `FK_E28EE9548A02E3B4` FOREIGN KEY (`accion`) REFERENCES `accion` (`id`),
  CONSTRAINT `FK_E28EE954E28EE954` FOREIGN KEY (`entidad_responsable`) REFERENCES `sub_entidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6502 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for entidad_territorial
-- ----------------------------
DROP TABLE IF EXISTS `entidad_territorial`;
CREATE TABLE `entidad_territorial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for escalas
-- ----------------------------
DROP TABLE IF EXISTS `escalas`;
CREATE TABLE `escalas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for geo_ubicacion
-- ----------------------------
DROP TABLE IF EXISTS `geo_ubicacion`;
CREATE TABLE `geo_ubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accion` int(11) DEFAULT NULL,
  `latitud` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longitud` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lat_lng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_geou_accion` (`accion`),
  CONSTRAINT `FK_7D2AA6B18A02E3B4` FOREIGN KEY (`accion`) REFERENCES `accion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for gestiones
-- ----------------------------
DROP TABLE IF EXISTS `gestiones`;
CREATE TABLE `gestiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gestion` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for identificacion
-- ----------------------------
DROP TABLE IF EXISTS `identificacion`;
CREATE TABLE `identificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resultado` int(11) DEFAULT NULL,
  `linea_base` varchar(1000) NOT NULL,
  `indicador` varchar(1000) NOT NULL,
  `cod` varchar(100) NOT NULL,
  `entidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_xxx_yyy` (`resultado`),
  KEY `fk_xxx_entidad` (`entidad`),
  CONSTRAINT `FK_84291D2B4587B0CB` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`id`),
  CONSTRAINT `FK_84291D2BB2ED91C` FOREIGN KEY (`resultado`) REFERENCES `resultado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for indicadores
-- ----------------------------
DROP TABLE IF EXISTS `indicadores`;
CREATE TABLE `indicadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accion` int(11) DEFAULT NULL,
  `resultado` int(11) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `indicador` text COLLATE utf8_unicode_ci,
  `id_indicadores_ext` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `ods_indicador` int(11) DEFAULT NULL,
  `ods_descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `definicion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unidad_medida` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periodicidad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cobertura_geografica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cobertura_poblacional` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disponibilidad` int(11) DEFAULT NULL,
  `limitaciones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formula` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parametros_formula` text COLLATE utf8_unicode_ci,
  `nombre_fuente` text COLLATE utf8_unicode_ci,
  `tipo_fuente` text COLLATE utf8_unicode_ci,
  `institucion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_numerador_institucion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_numerador_direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_denominador_institucion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_denominador_direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_otro_institucion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_otro_direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fecha_update` datetime DEFAULT NULL,
  `fecha_insert` datetime DEFAULT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `pdes_descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ambito_geo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_indicadores_accion` (`accion`),
  CONSTRAINT `FK_B1E9F9AF8A02E3B4` FOREIGN KEY (`accion`) REFERENCES `accion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for indicadores_ine
-- ----------------------------
DROP TABLE IF EXISTS `indicadores_ine`;
CREATE TABLE `indicadores_ine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_pdes_id` int(11) NOT NULL,
  `usuario` text COLLATE utf8_unicode_ci,
  `entidad` longtext COLLATE utf8_unicode_ci,
  `entidad_id` int(11) DEFAULT NULL,
  `indicador` text COLLATE utf8_unicode_ci,
  `indicador_tipo` text COLLATE utf8_unicode_ci,
  `pilar` text COLLATE utf8_unicode_ci,
  `meta` text COLLATE utf8_unicode_ci,
  `resultado` text COLLATE utf8_unicode_ci,
  `pdes_descripcion` text COLLATE utf8_unicode_ci,
  `ods_objeto` text COLLATE utf8_unicode_ci,
  `ods_meta` text COLLATE utf8_unicode_ci,
  `ods_indicador` text COLLATE utf8_unicode_ci,
  `ods_descripcion` text COLLATE utf8_unicode_ci,
  `definicion` text COLLATE utf8_unicode_ci,
  `unidad_medida` text COLLATE utf8_unicode_ci,
  `periodicidad` text COLLATE utf8_unicode_ci,
  `ambito_geo` text COLLATE utf8_unicode_ci,
  `cobertura_geo` text COLLATE utf8_unicode_ci,
  `cobertura_pob` text COLLATE utf8_unicode_ci,
  `disponibilidad` text COLLATE utf8_unicode_ci,
  `limitaciones` text COLLATE utf8_unicode_ci,
  `formula` text COLLATE utf8_unicode_ci,
  `parametros_formula` text COLLATE utf8_unicode_ci,
  `nombre_fuente` text COLLATE utf8_unicode_ci,
  `tipo_fuente` text COLLATE utf8_unicode_ci,
  `fuente` text COLLATE utf8_unicode_ci,
  `institucion` text COLLATE utf8_unicode_ci,
  `ref_numerador_ins` text COLLATE utf8_unicode_ci,
  `ref_numerador_dirt` text COLLATE utf8_unicode_ci,
  `ref_denominador_inst` text COLLATE utf8_unicode_ci,
  `ref_denominador_dirt` text COLLATE utf8_unicode_ci,
  `ref_otro_ins` text COLLATE utf8_unicode_ci,
  `ref_otro_dir` text COLLATE utf8_unicode_ci,
  `observaciones` text COLLATE utf8_unicode_ci,
  `fecha_reg` date DEFAULT NULL,
  `resultado_id_mpd` int(11) DEFAULT NULL,
  `id_indicador_mpd` int(11) DEFAULT NULL,
  `supraentidad` longtext COLLATE utf8_unicode_ci,
  `supraentidad_id` int(11) DEFAULT NULL,
  `validacion` int(11) DEFAULT NULL,
  `descripcion_validacion` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1068 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for inversion
-- ----------------------------
DROP TABLE IF EXISTS `inversion`;
CREATE TABLE `inversion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gestion` int(11) NOT NULL,
  `aporte_propio` double DEFAULT NULL,
  `inversion_publica` decimal(22,2) NOT NULL,
  `gasto_corriente` decimal(22,2) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `accion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inv_tipo` (`tipo`),
  KEY `fk_inv_accion` (`accion`),
  CONSTRAINT `FK_F1D89D65702D1D47` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`id`),
  CONSTRAINT `FK_F1D89D658A02E3B4` FOREIGN KEY (`accion`) REFERENCES `accion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7750 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for linea_base
-- ----------------------------
DROP TABLE IF EXISTS `linea_base`;
CREATE TABLE `linea_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accion` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `unidad` int(11) DEFAULT NULL,
  `descripcion` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_lineabase_accion` (`accion`),
  CONSTRAINT `FK_5C65CF248A02E3B4` FOREIGN KEY (`accion`) REFERENCES `accion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `controlador` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icono` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_html` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for meta
-- ----------------------------
DROP TABLE IF EXISTS `meta`;
CREATE TABLE `meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_m` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `pilar` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_D7F21435FAFED7E9` (`pilar`),
  CONSTRAINT `FK_D7F21435FAFED7E9` FOREIGN KEY (`pilar`) REFERENCES `pilar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for metricas
-- ----------------------------
DROP TABLE IF EXISTS `metricas`;
CREATE TABLE `metricas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metrica` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `simbolo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `orden` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for municipios
-- ----------------------------
DROP TABLE IF EXISTS `municipios`;
CREATE TABLE `municipios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `municipio` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitud` longtext COLLATE utf8_unicode_ci,
  `longitud` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for nivel_menu
-- ----------------------------
DROP TABLE IF EXISTS `nivel_menu`;
CREATE TABLE `nivel_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nivelmenu_nivel_id` (`nivel_id`),
  KEY `fk_nivelmenu_menu_id` (`menu_id`),
  CONSTRAINT `FK_F6E1E2ABCCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  CONSTRAINT `FK_F6E1E2ABDA3426AE` FOREIGN KEY (`nivel_id`) REFERENCES `niveles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for niveles
-- ----------------------------
DROP TABLE IF EXISTS `niveles`;
CREATE TABLE `niveles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for ods_indicador
-- ----------------------------
DROP TABLE IF EXISTS `ods_indicador`;
CREATE TABLE `ods_indicador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ods_meta_id` int(11) DEFAULT NULL,
  `ods_indicador` longtext,
  `ods_indicador_estado` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271903 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ods_meta
-- ----------------------------
DROP TABLE IF EXISTS `ods_meta`;
CREATE TABLE `ods_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ods_objeto_id` int(11) DEFAULT NULL,
  `ods_meta` longtext,
  `ods_meta_estado` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2720 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ods_objeto
-- ----------------------------
DROP TABLE IF EXISTS `ods_objeto`;
CREATE TABLE `ods_objeto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ods_objeto` longtext,
  `ods_objeto_estado` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for periodo
-- ----------------------------
DROP TABLE IF EXISTS `periodo`;
CREATE TABLE `periodo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `orden` int(2) DEFAULT NULL,
  `activo` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pilar
-- ----------------------------
DROP TABLE IF EXISTS `pilar`;
CREATE TABLE `pilar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_p` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `titulo` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) NOT NULL,
  `resultado` int(11) DEFAULT NULL,
  `slug` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DD5A5B7DB2ED91C` (`resultado`),
  CONSTRAINT `FK_DD5A5B7DB2ED91C` FOREIGN KEY (`resultado`) REFERENCES `resultado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for programa
-- ----------------------------
DROP TABLE IF EXISTS `programa`;
CREATE TABLE `programa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `monto_aporte_propio` double NOT NULL,
  `gestion` int(11) NOT NULL,
  `indicador` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_programa_proyecto` (`proyecto`),
  KEY `fk_programa_tipo` (`tipo`),
  CONSTRAINT `FK_2F0140D6FD202B9` FOREIGN KEY (`proyecto`) REFERENCES `proyecto` (`id`),
  CONSTRAINT `FK_2F0140D702D1D47` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for programacion
-- ----------------------------
DROP TABLE IF EXISTS `programacion`;
CREATE TABLE `programacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gestion` int(11) NOT NULL,
  `avance` longtext NOT NULL,
  `indicador` decimal(22,2) NOT NULL,
  `accion` int(11) DEFAULT NULL,
  `unidad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_programacion_accion` (`accion`),
  CONSTRAINT `FK_14491F898A02E3B4` FOREIGN KEY (`accion`) REFERENCES `accion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8624 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for provincias
-- ----------------------------
DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitud` longtext COLLATE utf8_unicode_ci,
  `longitud` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for proyecto
-- ----------------------------
DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE `proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan` int(11) DEFAULT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `categoria` int(11) NOT NULL,
  `entidad` int(11) NOT NULL,
  `presupuesto` text COLLATE utf8_unicode_ci,
  `indicador` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proyecto_plan` (`plan`),
  CONSTRAINT `FK_6FD202B9DD5A5B7D` FOREIGN KEY (`plan`) REFERENCES `plan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for proyectos
-- ----------------------------
DROP TABLE IF EXISTS `proyectos`;
CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sector` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pilar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_proyecto` longtext COLLATE utf8_unicode_ci,
  `total_costo` decimal(22,2) DEFAULT NULL,
  `total_quinquenio` decimal(22,2) DEFAULT NULL,
  `gestion_2016` decimal(22,2) DEFAULT NULL,
  `gestion_2017` decimal(22,2) DEFAULT NULL,
  `gestion_2018` decimal(22,2) DEFAULT NULL,
  `gestion_2019` decimal(22,2) DEFAULT NULL,
  `gestion_2020` decimal(22,2) DEFAULT NULL,
  `fecha_insert` datetime DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for registro_historico
-- ----------------------------
DROP TABLE IF EXISTS `registro_historico`;
CREATE TABLE `registro_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resultado` int(11) DEFAULT NULL,
  `accion` int(11) DEFAULT NULL,
  `descripcion` longtext COLLATE utf8_unicode_ci NOT NULL,
  `fecha_insert` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `accion_id` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_historico_resultado` (`resultado`),
  CONSTRAINT `FK_18BAAD62B2ED91C` FOREIGN KEY (`resultado`) REFERENCES `resultado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for resultado
-- ----------------------------
DROP TABLE IF EXISTS `resultado`;
CREATE TABLE `resultado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_r` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` longtext NOT NULL,
  `meta` int(11) DEFAULT NULL,
  `clasificacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_B2ED91CD7F21435` (`meta`),
  CONSTRAINT `FK_B2ED91CD7F21435` FOREIGN KEY (`meta`) REFERENCES `meta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for riesgos
-- ----------------------------
DROP TABLE IF EXISTS `riesgos`;
CREATE TABLE `riesgos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sector` int(11) NOT NULL,
  `sensibilidad` decimal(5,2) NOT NULL,
  `amenaza` decimal(5,2) NOT NULL,
  `adaptacion` decimal(5,2) NOT NULL,
  `vulnerabilidad` decimal(5,2) NOT NULL,
  `entidad` int(11) DEFAULT NULL,
  `vulnerabilidad_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vida` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `fecha_update` datetime DEFAULT NULL,
  `fecha_insert` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_riesgos_entidad` (`entidad`),
  KEY `fk_riegos_vida` (`vida`),
  CONSTRAINT `FK_87C93DEA13322F9E` FOREIGN KEY (`vida`) REFERENCES `sistemas_vida` (`id`),
  CONSTRAINT `FK_87C93DEA4587B0CB` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor` int(11) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `accion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_roles_actor` (`actor`),
  KEY `fk_roles_accion` (`accion`),
  CONSTRAINT `FK_B63E2EC7447556F9` FOREIGN KEY (`actor`) REFERENCES `actor` (`id`),
  CONSTRAINT `FK_B63E2EC78A02E3B4` FOREIGN KEY (`accion`) REFERENCES `accion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2677 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sectores
-- ----------------------------
DROP TABLE IF EXISTS `sectores`;
CREATE TABLE `sectores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sector` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `orden` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for sisin_web
-- ----------------------------
DROP TABLE IF EXISTS `sisin_web`;
CREATE TABLE `sisin_web` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_entidad` text,
  `entidad` text,
  `codigo_sisin` text,
  `cantidad_proyecto` int(4) DEFAULT NULL,
  `nombre_proyecto` text,
  `fecha_inicio_proyecto` date DEFAULT NULL,
  `fecha_fin_proyecto` date DEFAULT NULL,
  `cod_sector` int(4) DEFAULT NULL,
  `sector` text,
  `n_pilar` int(4) DEFAULT NULL,
  `n_meta` int(4) DEFAULT NULL,
  `n_resultado` int(4) DEFAULT NULL,
  `n_accion` int(4) DEFAULT NULL,
  `codigo_plan` text,
  `codigo_proyecto` text,
  `depto_presup` text,
  `depto` text,
  `prov_presup` text,
  `prov` text,
  `mun_presup` text,
  `mun` text,
  `fte_presup` text,
  `fte_sigla` text,
  `org_presup` text,
  `org_sigla` text,
  `monto_presupuestado` decimal(22,5) DEFAULT NULL,
  `des_pilar` text,
  `clasificacion_entidad` text,
  `latitud` text,
  `longitud` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11195 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sistemas_vida
-- ----------------------------
DROP TABLE IF EXISTS `sistemas_vida`;
CREATE TABLE `sistemas_vida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jurisdiccion_territorial` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unidades_socioculturales` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `funciones_ambientales` decimal(5,2) NOT NULL,
  `sis_produc_sustentables` decimal(5,2) NOT NULL,
  `pobreza` decimal(5,2) NOT NULL,
  `funciones_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sistemas_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pobreza_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entidad` int(11) DEFAULT NULL,
  `funciones_analisis` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sistemas_analisis` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pobreza_analisis` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `fecha_update` datetime DEFAULT NULL,
  `fecha_insert` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sistemas_entidad` (`entidad`),
  CONSTRAINT `FK_508BF0664587B0CB` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for sub_entidad
-- ----------------------------
DROP TABLE IF EXISTS `sub_entidad`;
CREATE TABLE `sub_entidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) NOT NULL,
  `sigla` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `entidad` int(11) DEFAULT NULL,
  `padre` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3A5FEC3F4587B0CB` (`entidad`),
  CONSTRAINT `FK_3A5FEC3F4587B0CB` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=810 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sub_menus
-- ----------------------------
DROP TABLE IF EXISTS `sub_menus`;
CREATE TABLE `sub_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `submenu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `controlador` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_sub_html` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_submenu_menu_id` (`menu_id`),
  CONSTRAINT `FK_9E316C76CCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for territorializacion
-- ----------------------------
DROP TABLE IF EXISTS `territorializacion`;
CREATE TABLE `territorializacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` int(11) NOT NULL,
  `provincia` int(11) DEFAULT NULL,
  `municipio` int(11) DEFAULT NULL,
  `comunidad` int(11) DEFAULT NULL,
  `otra_ubicacion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accion` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2553 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tester
-- ----------------------------
DROP TABLE IF EXISTS `tester`;
CREATE TABLE `tester` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entidad` int(11) NOT NULL,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tipo
-- ----------------------------
DROP TABLE IF EXISTS `tipo`;
CREATE TABLE `tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tipocategoria
-- ----------------------------
DROP TABLE IF EXISTS `tipocategoria`;
CREATE TABLE `tipocategoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tipoentidad
-- ----------------------------
DROP TABLE IF EXISTS `tipoentidad`;
CREATE TABLE `tipoentidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entidad_id` int(11) NOT NULL,
  `usuario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cargo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numero_documento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nivel` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for vista_3_presupuesto_programacion_contraparte
-- ----------------------------
DROP TABLE IF EXISTS `vista_3_presupuesto_programacion_contraparte`;
CREATE TABLE `vista_3_presupuesto_programacion_contraparte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pilar` varchar(255) DEFAULT NULL,
  `cod_p` varchar(255) DEFAULT NULL,
  `desc_p` varchar(255) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `cod_m` varchar(255) DEFAULT NULL,
  `desc_m` varchar(255) DEFAULT NULL,
  `resultado` varchar(255) DEFAULT NULL,
  `cod_r` varchar(255) DEFAULT NULL,
  `desc_r` varchar(255) DEFAULT NULL,
  `linea_base` varchar(255) DEFAULT NULL,
  `indicador_impacto` varchar(255) DEFAULT NULL,
  `accion` varchar(255) DEFAULT NULL,
  `cod_a` varchar(255) DEFAULT NULL,
  `desc_a` varchar(255) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `producto_proyecto` varchar(255) DEFAULT NULL,
  `cantidad_proyecto` varchar(255) DEFAULT NULL,
  `indicador_proceso` varchar(255) DEFAULT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `sisin` varchar(255) DEFAULT NULL,
  `cod_demanda` varchar(255) DEFAULT NULL,
  `ejecutor` varchar(255) DEFAULT NULL,
  `anio_quinquenal` varchar(255) DEFAULT NULL,
  `gestion_programacion` varchar(255) DEFAULT NULL,
  `valor_programacion` varchar(255) DEFAULT NULL,
  `descripcion_programacion` varchar(255) DEFAULT NULL,
  `gestion_presupuesto` varchar(255) DEFAULT NULL,
  `valor_inversion_publica_presupuesto` varchar(255) DEFAULT NULL,
  `valor_gasto_corriente_presupuesto` varchar(255) DEFAULT NULL,
  `gestion_contraparte` varchar(255) DEFAULT NULL,
  `valor_inversion_publica_contraparte` varchar(255) DEFAULT NULL,
  `valor_gasto_corriente_contraparte` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7646 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vitacora
-- ----------------------------
DROP TABLE IF EXISTS `vitacora`;
CREATE TABLE `vitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entidad_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `accion_realizada` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ip_user` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4047 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- View structure for view_articulacion
-- ----------------------------
DROP VIEW IF EXISTS `view_articulacion`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_articulacion` AS select `ap`.`id` AS `codigo`,concat('- ','',`ap`.`nombre`) AS `nombre`,concat('pa',`ap`.`padre`) AS `padre`,`ap`.`entidad` AS `entidad` from (((`accion` `ap` join `resultado` `r` on((`ap`.`resultado` = `r`.`id`))) join `meta` `m` on((`r`.`meta` = `m`.`id`))) join `pilar` `p` on((`m`.`pilar` = `p`.`id`))) where ((`ap`.`estado` = 1) and (`ap`.`tipo` = 2)) group by `ap`.`id` union all select concat('pa',`a`.`id`) AS `codigo`,concat('','',`a`.`nombre`) AS `nombre`,concat('ar',`a`.`resultado`) AS `padre`,`a`.`entidad` AS `entidad` from (((`accion` `a` join `resultado` `r` on((`a`.`resultado` = `r`.`id`))) join `meta` `m` on((`r`.`meta` = `m`.`id`))) join `pilar` `p` on((`m`.`pilar` = `p`.`id`))) where ((`a`.`estado` = 1) and (`a`.`tipo` = 1)) group by `a`.`id` union all select concat('ar',`r`.`id`) AS `codigo`,concat(`r`.`nombre`,': ',`r`.`descripcion`) AS `nombre`,concat('rm',`r`.`meta`) AS `padre`,`a`.`entidad` AS `entidad` from (((`accion` `a` join `resultado` `r` on((`a`.`resultado` = `r`.`id`))) join `meta` `m` on((`r`.`meta` = `m`.`id`))) join `pilar` `p` on((`m`.`pilar` = `p`.`id`))) where ((`a`.`estado` = 1) and (`a`.`tipo` = 1)) group by `a`.`entidad`,`r`.`id` union all select concat('rm',`m`.`id`) AS `codigo`,concat(`m`.`nombre`,': ',`m`.`descripcion`) AS `nombre`,concat('mp',`m`.`pilar`) AS `padre`,`a`.`entidad` AS `entidad` from (((`accion` `a` join `resultado` `r` on((`a`.`resultado` = `r`.`id`))) join `meta` `m` on((`r`.`meta` = `m`.`id`))) join `pilar` `p` on((`m`.`pilar` = `p`.`id`))) where ((`a`.`estado` = 1) and (`a`.`tipo` = 1)) group by `a`.`entidad`,`m`.`id` union all select concat('mp',`p`.`id`) AS `codigo`,concat(`p`.`nombre`,': ',`p`.`titulo`) AS `nombre`,'' AS `Name_exp_19`,`a`.`entidad` AS `entidad` from (((`accion` `a` join `resultado` `r` on((`a`.`resultado` = `r`.`id`))) join `meta` `m` on((`r`.`meta` = `m`.`id`))) join `pilar` `p` on((`m`.`pilar` = `p`.`id`))) where ((`a`.`estado` = 1) and (`a`.`tipo` = 1)) group by `a`.`entidad`,`p`.`id` ;

-- ----------------------------
-- View structure for vista_1_general
-- ----------------------------
DROP VIEW IF EXISTS `vista_1_general`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_1_general` AS (select `p`.`nombre` AS `pilar`,`p`.`cod_p` AS `cod_p`,`p`.`titulo` AS `desc_p`,`m`.`nombre` AS `meta`,`m`.`cod_m` AS `cod_m`,`m`.`descripcion` AS `desc_m`,`r`.`nombre` AS `resultado`,`r`.`cod_r` AS `cod_r`,`r`.`descripcion` AS `desc_r`,`a`.`nombre` AS `accion`,`a`.`cod_a` AS `cod_a`,`a`.`descripcion` AS `desc_a`,concat(`p`.`cod_p`,'.',`m`.`cod_m`,'.',`r`.`cod_r`,'.',`a`.`cod_a`) AS `codigo`,`ai`.`nombre` AS `producto_proyecto`,1 AS `cantidad_proyecto`,if((`tc`.`id` = 4),'Accion',`tc`.`tipo`) AS `categoria`,`ai`.`sisin` AS `sisin`,`pr`.`codigo` AS `cod_demanda`,`e`.`nombre` AS `ejecutor` from (((((((`pilar` `p` join `meta` `m` on((`p`.`id` = `m`.`pilar`))) join `resultado` `r` on((`m`.`id` = `r`.`meta`))) join `acciones` `a` on((`r`.`id` = `a`.`resultado`))) left join `accion` `ai` on(((`a`.`id` = `ai`.`accion`) and (`ai`.`estado` = 1) and (`ai`.`tipo` <> 1)))) left join `tipocategoria` `tc` on((`ai`.`tipo` = `tc`.`id`))) left join `entidad` `e` on((`ai`.`entidad` = `e`.`id`))) left join `proyectos` `pr` on((`ai`.`proyecto` = `pr`.`id`))) where (1 = 1) group by `ai`.`nombre`,`ai`.`tipo`,`ai`.`entidad`,`a`.`id` order by `p`.`cod_p`,`m`.`cod_m`,`r`.`cod_r`,`a`.`cod_a`,`ai`.`nombre`) ;

-- ----------------------------
-- View structure for vista_2_indicadores
-- ----------------------------
DROP VIEW IF EXISTS `vista_2_indicadores`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_2_indicadores` AS (select `p`.`nombre` AS `pilar`,`p`.`cod_p` AS `cod_p`,`p`.`titulo` AS `desc_p`,`m`.`nombre` AS `meta`,`m`.`cod_m` AS `cod_m`,`m`.`descripcion` AS `desc_m`,`r`.`nombre` AS `resultado`,`r`.`cod_r` AS `cod_r`,`r`.`descripcion` AS `desc_r`,concat(convert(`ai`.`linea_base` using utf8),' ',`mt`.`simbolo`) AS `linea_base`,`ii`.`indicador` AS `indicador_impacto`,`a`.`nombre` AS `accion`,`a`.`cod_a` AS `cod_a`,`a`.`descripcion` AS `desc_a`,concat(`p`.`cod_p`,'.',`m`.`cod_m`,'.',`r`.`cod_r`,'.',`a`.`cod_a`) AS `codigo`,`ai`.`nombre` AS `producto_proyecto`,1 AS `cantidad_proyecto`,`ai`.`desc_indicador_proceso` AS `indicador_proceso`,if((`tc`.`id` = 4),'Accion',`tc`.`tipo`) AS `categoria`,`ai`.`sisin` AS `sisin`,`pr`.`codigo` AS `cod_demanda`,`e`.`nombre` AS `ejecutor` from (((((((((`pilar` `p` join `meta` `m` on((`p`.`id` = `m`.`pilar`))) join `resultado` `r` on((`m`.`id` = `r`.`meta`))) join `acciones` `a` on((`r`.`id` = `a`.`resultado`))) left join `accion` `ai` on(((`a`.`id` = `ai`.`accion`) and (`ai`.`estado` = 1) and (`ai`.`tipo` <> 1)))) left join `tipocategoria` `tc` on((`ai`.`tipo` = `tc`.`id`))) left join `entidad` `e` on((`ai`.`entidad` = `e`.`id`))) left join `indicadores_ine` `ii` on((`ai`.`impacto_ine` = `ii`.`form_pdes_id`))) left join `metricas` `mt` on((`ai`.`unidad` = `mt`.`id`))) left join `proyectos` `pr` on((`ai`.`proyecto` = `pr`.`id`))) where (1 = 1) order by `p`.`cod_p`,`m`.`cod_m`,`r`.`cod_r`,`a`.`cod_a`,`ai`.`nombre`) ;

-- ----------------------------
-- View structure for vista_4_territorializacion
-- ----------------------------
DROP VIEW IF EXISTS `vista_4_territorializacion`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_4_territorializacion` AS (select `p`.`nombre` AS `pilar`,`p`.`cod_p` AS `cod_p`,`p`.`titulo` AS `desc_p`,`m`.`nombre` AS `meta`,`m`.`cod_m` AS `cod_m`,`m`.`descripcion` AS `desc_m`,`r`.`nombre` AS `resultado`,`r`.`cod_r` AS `cod_r`,`r`.`descripcion` AS `desc_r`,concat(convert(`ai`.`linea_base` using utf8),' ',`mt`.`simbolo`) AS `linea_base`,`ii`.`indicador` AS `indicador_impacto`,`a`.`nombre` AS `accion`,`a`.`cod_a` AS `cod_a`,`a`.`descripcion` AS `desc_a`,concat(`p`.`cod_p`,'.',`m`.`cod_m`,'.',`r`.`cod_r`,'.',`a`.`cod_a`) AS `codigo`,`ai`.`nombre` AS `producto_proyecto`,1 AS `cantidad_proyecto`,`ai`.`desc_indicador_proceso` AS `indicador_proceso`,if((`tc`.`id` = 4),'Accion',`tc`.`tipo`) AS `categoria`,`ai`.`sisin` AS `sisin`,`pr`.`codigo` AS `cod_demanda`,`e`.`nombre` AS `ejecutor`,`dep`.`departamento` AS `departamento`,`prov`.`provincia` AS `provincia`,`mun`.`municipio` AS `municipio`,`com`.`comunidad` AS `comunidad` from ((((((((((((((`pilar` `p` join `meta` `m` on((`p`.`id` = `m`.`pilar`))) join `resultado` `r` on((`m`.`id` = `r`.`meta`))) join `acciones` `a` on((`r`.`id` = `a`.`resultado`))) left join `accion` `ai` on(((`a`.`id` = `ai`.`accion`) and (`ai`.`estado` = 1) and (`ai`.`tipo` <> 1)))) left join `tipocategoria` `tc` on((`ai`.`tipo` = `tc`.`id`))) left join `entidad` `e` on((`ai`.`entidad` = `e`.`id`))) left join `indicadores_ine` `ii` on((`ai`.`impacto_ine` = `ii`.`form_pdes_id`))) left join `metricas` `mt` on((`ai`.`unidad` = `mt`.`id`))) left join `proyectos` `pr` on((`ai`.`proyecto` = `pr`.`id`))) left join `territorializacion` `tr` on((`ai`.`id` = `tr`.`accion`))) left join `departamentos` `dep` on((`tr`.`departamento` = `dep`.`id`))) left join `provincias` `prov` on((`tr`.`provincia` = `prov`.`id`))) left join `municipios` `mun` on((`tr`.`municipio` = `mun`.`id`))) left join `comunidades` `com` on((`tr`.`comunidad` = `com`.`id`))) where (1 = 1) order by `p`.`cod_p`,`m`.`cod_m`,`r`.`cod_r`,`a`.`cod_a`,`ai`.`nombre`) ;

-- ----------------------------
-- View structure for vista_5_general_entidad_responsable
-- ----------------------------
DROP VIEW IF EXISTS `vista_5_general_entidad_responsable`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_5_general_entidad_responsable` AS (select `p`.`nombre` AS `pilar`,`p`.`cod_p` AS `cod_p`,`p`.`titulo` AS `desc_p`,`m`.`nombre` AS `meta`,`m`.`cod_m` AS `cod_m`,`m`.`descripcion` AS `desc_m`,`r`.`nombre` AS `resultado`,`r`.`cod_r` AS `cod_r`,`r`.`descripcion` AS `desc_r`,`a`.`nombre` AS `accion`,`a`.`cod_a` AS `cod_a`,`a`.`descripcion` AS `desc_a`,concat(`p`.`cod_p`,'.',`m`.`cod_m`,'.',`r`.`cod_r`,'.',`a`.`cod_a`) AS `codigo`,`ai`.`nombre` AS `producto_proyecto`,1 AS `cantidad_proyecto`,if((`tc`.`id` = 4),'Accion',`tc`.`tipo`) AS `categoria`,`ai`.`sisin` AS `sisin`,`pr`.`codigo` AS `cod_demanda`,`e`.`nombre` AS `ejecutor`,`sb`.`nombre` AS `responsable` from (((((((((`pilar` `p` join `meta` `m` on((`p`.`id` = `m`.`pilar`))) join `resultado` `r` on((`m`.`id` = `r`.`meta`))) join `acciones` `a` on((`r`.`id` = `a`.`resultado`))) left join `accion` `ai` on(((`a`.`id` = `ai`.`accion`) and (`ai`.`estado` = 1) and (`ai`.`tipo` <> 1)))) left join `tipocategoria` `tc` on((`ai`.`tipo` = `tc`.`id`))) left join `entidad` `e` on((`ai`.`entidad` = `e`.`id`))) left join `proyectos` `pr` on((`ai`.`proyecto` = `pr`.`id`))) left join `entidad_responsable` `er` on((`ai`.`id` = `er`.`accion`))) left join `sub_entidad` `sb` on((`er`.`entidad_responsable` = `sb`.`id`))) where (1 = 1) group by `ai`.`nombre`,`ai`.`tipo`,`ai`.`entidad`,`a`.`id`,`er`.`id` order by `p`.`cod_p`,`m`.`cod_m`,`r`.`cod_r`,`a`.`cod_a`,`ai`.`nombre`) ;

-- ----------------------------
-- Procedure structure for pros_3_programacion_presupuesto_contraparte
-- ----------------------------
DROP PROCEDURE IF EXISTS `pros_3_programacion_presupuesto_contraparte`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pros_3_programacion_presupuesto_contraparte`()
BEGIN

SELECT * 
FROM (
			SELECT p.nombre as pilar,p.cod_p, p.titulo as desc_p,
			m.nombre as meta,m.cod_m, m.descripcion as desc_m,
			r.nombre as resultado,r.cod_r,r.descripcion as desc_r,	

			CONCAT(linea_base," ",mt.simbolo) as linea_base,
			ii.indicador as indicador_impacto,

			a.nombre as accion,a.cod_a,a.descripcion as desc_a,
			CONCAT(p.cod_p,'.',m.cod_m,'.',r.cod_r,'.',a.cod_a) as codigo,

			ai.nombre as producto_proyecto,
			1 as cantidad_proyecto,
			ai.desc_indicador_proceso as indicador_proceso,
			IF (tc.id = 4, 'Accion',tc.tipo) as categoria,
			ai.sisin,
			pr.codigo as cod_demanda,
			e.nombre as ejecutor,

			g.gestion as anio_quinquenal,
			(
         SELECT gestion
         FROM programacion pr
         WHERE pr.accion = ai.id
				 AND pr.gestion = g.gestion	
      ) as gestion_programacion,
			(
         SELECT CONCAT(pr.indicador,' ',mt.simbolo) 
         FROM programacion pr
				 INNER JOIN metricas mt ON pr.unidad = mt.id
         WHERE pr.accion = ai.id
				 AND pr.gestion = g.gestion	
      ) as valor_programacion,
		  (
         SELECT pr.avance
         FROM programacion pr
         WHERE pr.accion = ai.id
				 AND pr.gestion = g.gestion	
      ) as descripcion_programacion,
		  (
         SELECT iv.gestion 
				 FROM inversion iv
				 WHERE iv.accion = ai.id
				 AND iv.gestion = g.gestion	
      ) as gestion_presupuesto,
			(
         SELECT iv.inversion_publica 
				 FROM inversion iv
				 WHERE iv.accion = ai.id
				 AND iv.gestion = g.gestion	
      ) as valor_inversion_publica_presupuesto,
			(
         SELECT iv.gasto_corriente 
				 FROM inversion iv
				 WHERE iv.accion = ai.id
				 AND iv.gestion = g.gestion	
      ) as valor_gasto_corriente_presupuesto,
			(
         SELECT iv.gestion
				 FROM inversion iv
				 INNER JOIN contraparte cn ON iv.id = cn.inversion
				 WHERE iv.accion = ai.id
				 AND iv.gestion = g.gestion	
				 LIMIT 1	
      ) as gestion_contraparte,
			(
         SELECT SUM(cn.monto_inv_publica)
				 FROM inversion iv
				 INNER JOIN contraparte cn ON iv.id = cn.inversion
				 WHERE iv.accion = ai.id
				 AND iv.gestion = g.gestion	
      ) as valor_inversion_publica_contraparte,
			(
         SELECT SUM(cn.monto_gasto_corriente)
				 FROM inversion iv
				 INNER JOIN contraparte cn ON iv.id = cn.inversion
				 WHERE iv.accion = ai.id
				 AND iv.gestion = g.gestion	
      ) as valor_gasto_corriente_contraparte


			FROM pilar p
			INNER JOIN meta m ON p.id = m.pilar
			INNER JOIN resultado r on m.id = r.meta
			INNER JOIN acciones a ON r.id = a.resultado
			LEFT JOIN accion ai ON (a.id = ai.accion AND ai.estado = 1 AND ai.tipo <> 1)
			LEFT JOIN tipocategoria tc ON ai.tipo = tc.id
			LEFT JOIN entidad e ON ai.entidad = e.id
			LEFT JOIN indicadores_ine ii ON ai.impacto_ine = ii.form_pdes_id
			LEFT JOIN metricas mt ON ai.unidad = mt.id
			LEFT JOIN proyectos pr ON ai.proyecto = pr.id
			JOIN gestiones g ON g.gestion BETWEEN 2016 and 2020
) as tabla
WHERE 
1=1
ORDER BY 
tabla.cod_p,tabla.cod_m,tabla.cod_r,tabla.cod_a,tabla.producto_proyecto,tabla.indicador_proceso,tabla.anio_quinquenal
ASC;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pros_pilar_ubicacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `pros_pilar_ubicacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pros_pilar_ubicacion`()
BEGIN
SELECT * 
FROM (

SELECT d.departamento,p.cod_p,m.cod_m,r.cod_r,a.cod_a,CONCAT(p.cod_p,".",m.cod_m,".",r.cod_r,".",a.cod_a) as codigo_pdes,
ai.id,UPPER(ai.nombre) as nombre_d,ai.tipo_proceso,ai.tipo,IF(ai.tipo = 4,"Accion",tc.tipo) as categoria,e.nombre as entidad,
(
	SELECT (SUM(iv.inversion_publica)+SUM(iv.gasto_corriente)) as total
	FROM inversion iv
	WHERE iv.accion = ai.id
) as valor_presupuesto
FROM departamentos d
INNER JOIN territorializacion t ON d.id = t.departamento
INNER JOIN accion ai ON t.accion = ai.id
INNER JOIN acciones a ON ai.accion = a.id
INNER JOIN resultado r ON a.resultado = r.id
INNER JOIN meta m ON r.meta = m.id
INNER JOIN pilar p ON m.pilar = p.id
INNER JOIN tipocategoria tc ON ai.tipo = tc.id
INNER JOIN entidad e ON ai.entidad = e.id
WHERE ai.estado = 1
AND ai.tipo <> 1
GROUP BY d.departamento,codigo_pdes,nombre_d
ORDER BY d.codigo,p.cod_p,m.cod_m,r.cod_r,a.cod_a,ai.nombre ASC
) AS tabla;



END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pros_reporte_entidad_pilar_accion_presupuesto
-- ----------------------------
DROP PROCEDURE IF EXISTS `pros_reporte_entidad_pilar_accion_presupuesto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pros_reporte_entidad_pilar_accion_presupuesto`()
BEGIN

SELECT * 
FROM (
	SELECT e.nombre as entidad,
	pg.nombre as pilar, 
	IF(pg.nombre is not null,COUNT(*),null) as total_acciones,
	(
     SELECT SUM(iv.inversion_publica) as inversion_publica
		 FROM accion ai
		 INNER JOIN acciones a ON ai.accion = a.id
		 INNER JOIN resultado r ON a.resultado = r.id
		 INNER JOIN meta m ON r.meta = m.id
		 INNER JOIN pilar p ON m.pilar = p.id
		 INNER JOIN inversion iv ON ai.id = iv.accion
		 WHERE ai.estado = 1
		 AND ai.entidad = e.id
		 AND p.id = pg.id
  ) as valor_inversion_publica_presupuesto,
	(
     SELECT SUM(iv.gasto_corriente) as gasto_corriente
		 FROM accion ai
		 INNER JOIN acciones a ON ai.accion = a.id
		 INNER JOIN resultado r ON a.resultado = r.id
		 INNER JOIN meta m ON r.meta = m.id
		 INNER JOIN pilar p ON m.pilar = p.id
		 INNER JOIN inversion iv ON ai.id = iv.accion
		 WHERE ai.estado = 1
		 AND ai.entidad = e.id
		 AND p.id = pg.id
   ) as valor_gasto_corriente_presupuesto,
	 (
		SELECT (SUM(cn.monto_inv_publica) + SUM(cn.monto_gasto_corriente)) as presupesto_contraparte
		FROM accion ai
		INNER JOIN acciones a ON ai.accion = a.id
		INNER JOIN resultado r ON a.resultado = r.id
		INNER JOIN meta m ON r.meta = m.id
		INNER JOIN pilar p ON m.pilar = p.id
		INNER JOIN inversion iv ON ai.id = iv.accion
		INNER JOIN contraparte cn ON iv.id = cn.inversion
		WHERE ai.estado = 1
		AND ai.entidad = e.id
		AND p.id = pg.id
	)	as total_presupuesto_contraparte
	FROM entidad e
	LEFT JOIN accion ai ON (ai.estado = 1 AND ai.tipo = 1 AND ai.entidad = e.id)
	LEFT JOIN acciones a ON ai.accion = a.id
	LEFT JOIN resultado r ON a.resultado = r.id
	LEFT JOIN meta m ON r.meta = m.id
	LEFT JOIN pilar pg ON m.pilar = pg.id
	WHERE e.tipo IN (1,2)
	GROUP BY e.id, pg.id
	ORDER BY e.nombre, pg.id ASC
) as tabla;


END
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
