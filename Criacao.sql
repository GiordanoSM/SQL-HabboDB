CREATE DATABASE if not exists `bdhabbo`;

use bdhabbo;

CREATE TABLE if not exists `usuario` (
  `nickname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`nickname`)
);

CREATE TABLE if not exists `personagem` (
  `nome` varchar(255) NOT NULL,
  `genero` char(1) check(genero in ('F', 'M', 'N')),
  `dinheiro` int(11) NOT NULL DEFAULT '0',
  `respeito` int(11) NOT NULL DEFAULT '0',
  `cor_pele` int(11) NOT NULL,
  `cor_olhos` int(11) NOT NULL,
  `fk_usr_nick` varchar(255) NOT NULL,
  PRIMARY KEY (`nome`),
  FOREIGN KEY (fk_usr_nick) REFERENCES usuario(email)
)ENGINE=InnoDB;

CREATE TABLE if not exists `vestimenta` (
  `id_vest` int(11) NOT NULL auto_increment,
  `cor_prim_vest` int(11) NOT NULL,
  `cor_sec_vest` int(11) NOT NULL,
  PRIMARY KEY (`id_vest`)
)ENGINE=InnoDB;

--alter table vestimenta add column disney integer not null default 66 after id_vest;
--alter table vestimenta drop column disney;

--alter table vestimenta modify column cor_prim_vest int(16);

--alter table vestimenta change column cor_prim cor_prim_vest int(32) not null default 0;

--drop table usuario;

--insert into personagem values ('lordjordan2', 'M', 5, 5, 5, 5, 'giordano@orion.br');

--insert into usuario values ('GiordanoSM', 'giordano@orion.br', 'senha');

--describe vestimenta;

--select * from personagem;

