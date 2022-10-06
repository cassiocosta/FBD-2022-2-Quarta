create table colaboradores
(
    id int auto_increment primary key,
    matricula varchar(20) not null unique, 
    nome varchar(100) not null,
    email varchar(50) not null,
    senha varchar(30) not null,
    id_coordenador int, 
    constraint coordenadores_fk_colaboradores
    foreign key(id_coordenador) references colaboradores(id)
    on delete set null
);

create table projetos
(
    id int auto_increment primary key,
    nome varchar(100) not null,
    descricao varchar(200),
    duracao int not null
);

create table projetos_colaboradores
(
    id int auto_increment primary key, 
    id_projeto int not null, 
    id_colaborador int not null,
    constraint projetos_fk_projetos_tem_colaboradores
        foreign key(id_projeto) references projetos(id)
        on delete cascade
        on update cascade,
    constraint colaboradores_fk_projetos_tem_colaboradores
        foreign key(id_colaborador) references colaboradores(id)
        on delete restrict
        on update cascade
);


create table projetos_comentarios
(
    id int not null auto_increment primary key,
    id_colaborador int not null,
    id_projeto int not null, 
    data_hora datetime not null,
    constraint colaboradores_fk_projetos_comentarios
        foreign key(id_colaborador) references colaboradores(id)
        on delete cascade,
    constraint projetos_fk_projetos_comentarios
        foreign key(id_projeto) references projetos(id)
            on delete cascade
            on update cascade
);

create table departamentos
(
    id int auto_increment primary key,
    nome varchar(50) not null
);

create table projetos_melhoria_processos
(
    id int auto_increment primary key,
    resultados_esperados varchar(500) not null,
    id_projeto int not null,
    id_departamento int not null,
    constraint projetos_fk_projetos_melhoria_processos
        foreign key(id_projeto) references projetos(id)
        on delete restrict
        on update cascade,
    constraint departamentos_fk_projetos_melhoria_processos
        foreign key(id_departamento) references departamentos(id)
        on delete restrict 
        on update cascade
);

create table projetos_sociais
(
    id int auto_increment primary key,
    id_projeto int not null,
    publico_beneficiario varchar(200) not null,
    constraint projetos_fk_projetos_sociais
        foreign key(id_projeto) references projetos(id)
        on delete restrict
        on update cascade
);


alter table tabela add column coluna tipo;
alter table tabela drop column coluna;

-- alterar nome da coluna 
ALTER TABLE table_name
  CHANGE COLUMN old_name new_name 
    column_definition
    [ FIRST | AFTER column_name ]

    ALTER TABLE websites
  CHANGE COLUMN host_name hname
    varchar(25);

-- excluir uma contraint
alter table colaboradores drop 
	constraint coordenadores_fk_colaboradores

 -- criar nova contraint   
    ALTER TABLE colaboradores 
			ADD CONSTRAINT coordenadores_fk_colaboradores 
			FOREIGN KEY(id_coordenador)
			REFERENCES colaboradores(id)
				ON DELETE set null
				ON UPDATE CASCADE; 



-- um pouco de comandos DML

-- inserir uma tupla numam tabela


insert into projetos(nome, descricao, duracao)
     values('fundamentos de banco', 'projetos sql ddl e dml', 1000);

select id, nome, descricao, duracao
from projetos 

delete from projetos
where id = 100;

delete from projetos 
where duracao = 1000;

update projetos set duracao=2000
where id=100;