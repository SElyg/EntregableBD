DROP DATABASE IF EXISTS Notas_db;
CREATE DATABASE Notas_db;
USE Notas_db;

DROP TABLE IF EXISTS `Usuario`;
CREATE TABLE `Usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`));

DROP TABLE IF EXISTS `Notas`;  
CREATE TABLE `Notas_db`.`Notas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL DEFAULT `Sin título`,
  `creacion` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificacion` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcion` TEXT NULL,
  `usuario` INT NOT NULL,
  `puedeEliminarse` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `usuario_id_foreign` (`usuario`),
  CONSTRAINT `usuario_id_foreign` FOREIGN KEY (`usuario`) REFERENCES `Usuario` (`id`));

DROP TABLE IF EXISTS `Categorias`;  
CREATE TABLE `Categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`));

DROP TABLE IF EXISTS `categorias_notas`;  
CREATE TABLE `categorias_notas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nota` INT NOT NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_nota_foreign` (`id_nota`),
  KEY `id_categoria_foreign` (`id_categoria`),
  CONSTRAINT `id_nota_foreign` FOREIGN KEY (`id_nota`) REFERENCES `Notas` (`id`),
  CONSTRAINT `id_categoria_foreign` FOREIGN KEY (`id_categoria`) REFERENCES `Categorias` (`id`));


INSERT INTO Usuario (id,nombre,email)
VALUES
  (1,'Lionel Moses','a.nunc@icloud.ca'),
  (2,'Francis Reese','lectus.nullam.suscipit@google.com'),
  (3,'Athena Cook','placerat.augue@yahoo.org'),
  (4,'Buffy Arnold','sit.amet.nulla@yahoo.net'),
  (5,'Bethany Lester','malesuada.integer@outlook.couk'),
  (6,'Chiquita Smith','nisi.magna@aol.edu'),
  (7,'Helen Montgomery','adipiscing.enim.mi@outlook.ca'),
  (8,'Ulysses Summers','tellus.sem@hotmail.org'),
  (9,'Nash Watson','et@google.couk'),
  (10,'Byron Kramer','magna.praesent@hotmail.ca');

INSERT INTO Notas (id, titulo, creacion, modificacion, descripcion, Usuario) 
VALUES
  (1,'sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales.','10-11-20','01-23-21','Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec',5),
  (2,'amet ante. Vivamus non lorem vitae odio sagittis semper. Nam','11-03-20','03-31-21','mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.',2),
  (3,'et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus','10-03-20','03-25-21','aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat',9),
  (4,'pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod','10-13-20','05-24-22','penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare',7),
  (5,'metus. Aenean sed pede nec ante blandit viverra. Donec tempus,','11-17-20','12-28-22','Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium',4),
  (6,'inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In','11-30-20','12-05-21','dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet',4),
  (7,'iaculis odio. Nam interdum enim non nisi. Aenean eget metus.','10-13-20','03-08-21','auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula.',2),
  (8,'Praesent eu dui. Cum sociis natoque penatibus et magnis dis','11-24-20','06-21-22','ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer',8),
  (9,'ornare, elit elit fermentum risus, at fringilla purus mauris a','11-21-20','05-23-21','lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes,',9),
  (10,'est, mollis non, cursus non, egestas a, dui. Cras pellentesque.','10-14-20','05-18-21','primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum',6);

INSERT INTO Categorias (id, nombre) VALUES 
(1,'Actualidad'),(2,'Trabajo'),(3,'Economía'),
(4,'Deportes'),(5,'Música'), (6,'Política'),
(7,'Programación'),(8,'Idiomas'),(9,'Tecnología'), 
(10,'Novedades');

INSERT INTO categorias_notas (id, id_nota, id_categoria) VALUES
(1,4,2),
(2,2,3),
(3,2,2),
(4,7,2),
(5,5,3),
(6,5,8),
(7,3,7),
(8,9,7),
(9,4,9),
(10,7,5);
