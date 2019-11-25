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

# Deleta o usuário 'nick2':

delete from usuario where nickname = 'nick2';

#-----PERSONAGEM

#Cria um personagem novo com nome 'perso' para o usuario 'nick2':

insert into personagem values ('perso', 'M', 0, 0, 0, 0, 'nick2');

#Modifica dados do personagem com nome 'perso'

update personagem
set genero = 'N', cor_pele = 0xFF, cor_olhos = 0xFF
where nome = 'perso';

#Deleta personagem 'perso'

delete from personagem where nome = 'perso';

#Coloca vestimenta 1 em 'perso'

insert into veste values ('perso', 1);

#Tira vestimenta 1 de 'perso'

DELETE FROM veste 
WHERE
    fk_pers_nome = 'perso'
    AND fk_id_vest = 1;

#-----AÇÕES INDUVIDUAIS
#Contexto: você está utilizando o personagem "perso"

# Cria um quarto novo com nome "Quartinho", sem senha, privado, com dimensoes 20x20,
# capacidade para 3 jogadores, cujo o dono é "nick2":

insert into quarto (nome_quarto, dimensao_quarto, capacidade, privado, fk_pers_nome)
values ('Quartinho', 20, 3, true, "perso");

#Modifica o quarto 'Quartinho' (capacidade, privado e nome)

update quarto
set nome_quarto = 'Quartão', capacidade = 20, privado = false, senha_quarto = '123456'
where nome_quarto = 'Quartinho' and fk_pers_nome = 'perso';

#Deleta o quarto 'Quartão'

delete from quarto
where nome_quarto = 'Quartão' and fk_pers_nome = 'perso';

#Personagem 'perso' compra móvel 'Sofa Toperson'

insert into possui values ('perso', 1);

update personagem
set dinheiro = dinheiro - (select preco from movel where id_movel = 1)
where nome = 'perso';

#Coloca o móvel 'Sofa Toperson' na posicao 5,5 do quarto 'Quartão' de 'perso'

update movel
set fk_quarto_nome = 'Quartão', movel_coord_x = 5, movel_coord_y = 5
where id_movel = 1;

#Modifica a localização do móvel 'Sofa Toperson' para 10,9

update movel
set movel_coord_x = 10, movel_coord_y = 9
where id_movel = 1;

#Retira o móvel 'Sofa Toperson' de um quarto

update movel
set fk_quarto_nome = null, movel_coord_x = null, movel_coord_y = null
where id_movel = 1;

# Adota pet 'Top'

insert into pet (nome_pet, fk_pers_nome, fk_esp_nome)
values ('Top', 'perso', 'Topersonifero');

#Coloca o pet 'Top' na posicao 1,1 do quarto 'Quartão' de 'perso'
update pet
set fk_quarto_nome = 'Quartão', pet_coord_x = 1, pet_coord_y = 1
where nome_pet = 'Top' and fk_pers_nome = 'perso';

#Aumenta fome do pet, apenas para exemplificar o comando de alimentar
update pet
set fome = 2
where nome_pet = 'Top' and fk_pers_nome = 'perso';

#Alimenta o pet 1 vez
update pet
set fome = fome -1
where nome_pet = 'Top' and fk_pers_nome = 'perso';

#Retira o pet 'Top do quarto 'Quartão'
update pet
set fk_quarto_nome = null, pet_coord_x = null, pet_coord_y = null
where nome_pet = 'Top' and fk_pers_nome = 'perso';


#-----AÇÕES COLETIVAS
#Contexto: você está utilizando o personagem "perso" e existe outro personagem "perso2" de outro Usuario

#Cria amizade entre 'perso' e 'perso2'
insert into amigo_de (fk_pers_nome_1, fk_pers_nome_2)
values ('perso', 'perso2');

#Retira amizade entre 'perso' e 'perso2'
delete from amigo_de
where fk_pers_nome_1 = 'perso' and fk_pers_nome_2 = 'perso2';

#Respeita, 'perso' ganha +1 de respeito
update personagem
set respeito = respeito+1
where nome = 'perso';

#Troca móveis, 'perso2' passa a ser dono do móvel 'Sofa Toperson'
update possui
set fk_pers_nome = 'perso2'
where fk_pers_nome = 'perso' and fk_id_movel = 1;