# Cria usuario novo com:
#	nickname = nick
#	email = email@email.email
#	senha = 1234567

insert into usuario (nickname, email, senha)
values (`nick`, `email@email.email`, `1234567`);

# Modifica dados do usuário "nick":
#	nickname = nick2
# 	email = email@gmail.gmail
#	senha = 7654321

update usuario
set nickname = nick2, email = email@gmail.gmail
where nickname = nick;
