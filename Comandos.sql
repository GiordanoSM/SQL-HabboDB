#-----USUARIO

# Cria usuario novo com:
#	nickname = nick
#	email = email@email.email
#	senha = 1234567

insert into usuario (nickname, email, senha)
values ('nick', 'email@email.email', '1234567');

# Modifica dados do usuário "nick":
#	nickname = nick2
# 	email = email@gmail.gmail
#	senha = 7654321

update usuario
set nickname = 'nick2', email = 'email@gmail.gmail'
where nickname = 'nick';

#-----PERSONAGEM

#Criar um personagem novo com:

#Modificar personagem

#Deletar personagem

#Coloca vestimenta

#Tira vestimenta

#-----AÇÕES INDUVIDUAIS
#Contexto: você está utilizando o personagem "perso"

# Cria um quarto novo com nome "Quartinho", sem senha, privado, com dimensoes 20x20,
# capacidade para 3 jogadores, cujo o dono é "nick2":

insert into usuario (nome_quarto, dimensao_quarto, capacidade, privado, fk_pers_nome)
values ('Quartinho', 20, 3, true, "nick2");

#Modifica o quarto (capacidade, privado e nome)

#Deleta o quarto

#Compra um móvel

#Coloca o móvel em um quarto

#Modifica a localização do móvel

#Retira o móvel de um quarto

#Compra um pet

#Coloca o pet em um quarto

#Alimenta o pet

#Retira o pet de um quarto

#-----AÇÕES COLETIVAS
#Contexto: você está utilizando o personagem "perso" e existe outro personagem "perso2" de outro Usuario

#Cria amizade

#Retira amizade

#Respeita

#Troca móveis