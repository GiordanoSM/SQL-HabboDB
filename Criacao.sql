CREATE DATABASE if not exists `bdhabbo`;

use bdhabbo;

CREATE TABLE if not exists `usuario` (
  `nickname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL UNIQUE,
  `senha` varchar(50) NOT NULL,
  PRIMARY KEY (`nickname`)
)ENGINE=InnoDB;

CREATE TABLE if not exists `personagem` (
  `nome` varchar(50) NOT NULL,
  `genero` char(1) check(genero in ('F', 'M', 'N')),
  `dinheiro` int NOT NULL DEFAULT '0',
  `respeito` int NOT NULL DEFAULT '0',
  `cor_pele` int NOT NULL,
  `cor_olhos` int NOT NULL,
  `fk_usr_nick` varchar(50) NOT NULL,
  PRIMARY KEY (`nome`),
  FOREIGN KEY (fk_usr_nick) REFERENCES usuario(nickname) on delete cascade on update cascade
)ENGINE=InnoDB;

CREATE TABLE if not exists `vestimenta` (
  `id_vest` int NOT NULL auto_increment,
  `cor_prim_vest` int NOT NULL,
  `cor_sec_vest` int NOT NULL,
  PRIMARY KEY (`id_vest`)
)ENGINE=InnoDB;

CREATE TABLE if not exists `especie` (
  `nome_esp` varchar(50) NOT NULL,
  `cor_prim_esp` int NOT NULL,
  `cor_sec_esp` int NOT NULL,
  dimensao_esp int NOT NULL,
  PRIMARY KEY (`nome_esp`)
)ENGINE=InnoDB;


CREATE TABLE if not exists `quarto` (
  `nome_quarto` varchar(50) NOT NULL,
  `dimensao_quarto` int NOT NULL DEFAULT '1',
  `capacidade` int NOT NULL DEFAULT '1',
  `privacidade` bool NOT NULL DEFAULT true,
  `senha_quarto` varchar(50),
  `fk_pers_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`nome_quarto`, fk_pers_nome),
  FOREIGN KEY (fk_pers_nome) REFERENCES personagem(nome) on delete cascade on update cascade
)ENGINE=InnoDB;

CREATE TABLE if not exists `pet` (
  `nome_pet` varchar(50) NOT NULL,
  `fome` int NOT NULL default 0,
  `fk_pers_nome` varchar(50) NOT NULL,
  fk_quarto_nome varchar(50),
  pet_coord_x int,
  pet_coord_y int, 
  fk_esp_nome varchar(50) NOT NULL,
  PRIMARY KEY (`nome_pet`, `fk_pers_nome`),
  FOREIGN KEY (fk_pers_nome) REFERENCES personagem(nome) on delete cascade on update cascade,
  FOREIGN KEY (fk_esp_nome) REFERENCES especie(nome_esp) on delete cascade on update cascade,
  FOREIGN KEY (fk_quarto_nome) REFERENCES quarto(nome_quarto) on update cascade
)ENGINE=InnoDB;

CREATE TABLE if not exists `veste` (
  `fk_pers_nome` varchar(50) NOT NULL,
  `fk_id_vest` int NOT NULL,
  PRIMARY KEY (`fk_id_vest`, `fk_pers_nome`),
  FOREIGN KEY (fk_pers_nome) REFERENCES personagem(nome) on delete cascade on update cascade,
  FOREIGN KEY (fk_id_vest) REFERENCES vestimenta(id_vest) on delete cascade on update cascade
)ENGINE=InnoDB;

CREATE TABLE if not exists `movel` (
  id_movel int NOT NULL auto_increment,
  `nome_movel` varchar(50) NOT NULL,
  `cor_movel` int NOT NULL,
  `preco` int NOT NULL DEFAULT '0',
  `dimensao_movel` int NOT NULL,
  fk_quarto_nome varchar(50),
  movel_coord_x int,
  movel_coord_y int,
  PRIMARY KEY (`id_movel`),
  FOREIGN KEY (fk_quarto_nome) REFERENCES quarto(nome_quarto) on update cascade
)ENGINE=InnoDB;

CREATE TABLE if not exists `possui` (
  `fk_pers_nome` varchar(50) NOT NULL,
  `fk_id_movel` int NOT NULL,
  PRIMARY KEY (`fk_id_movel`, `fk_pers_nome`),
  FOREIGN KEY (fk_pers_nome) REFERENCES personagem(nome) on delete cascade on update cascade,
  FOREIGN KEY (fk_id_movel) REFERENCES movel(id_movel) on delete cascade on update cascade
)ENGINE=InnoDB;

CREATE TABLE if not exists `amigo_de` (
  `fk_pers_nome_1` varchar(50) NOT NULL,
  `fk_pers_nome_2` varchar(50) NOT NULL,
  PRIMARY KEY (`fk_pers_nome_1`, `fk_pers_nome_2`),
  FOREIGN KEY (fk_pers_nome_1) REFERENCES personagem(nome) on delete cascade on update cascade,
  FOREIGN KEY (fk_pers_nome_2) REFERENCES personagem(nome) on delete cascade on update cascade
)ENGINE=InnoDB;


#alter table vestimenta add column disney integer not null default 66 after id_vest;
#alter table vestimenta drop column disney;
#alter table pet add column fk_quarto_nome varchar(50) after fk_pers_nome;
#alter table vestimenta modify column cor_prim_vest int(16);
#alter table pet add foreign key (fk_quarto_nome) references quarto(nome_quarto);
#alter table vestimenta change column cor_prim cor_prim_vest int(32) not null default 0;

#drop table usuario;

#insert into personagem values ('lordjordan2', 'M', 5, 5, 5, 5, 'giordano@orion.br');

#insert into usuario values ('GiordanoSM', 'giordano@orion.br', 'senha');

#describe vestimenta;

#select * from personagem;

