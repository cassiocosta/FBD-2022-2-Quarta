-- comentário
/*
bloco de comentários
aqui usa-se bastante pra enunciados... 

*/

-- padroes de nomes??? no SQL é como?

-- snake_case mais utiliza para SQL
-- camelCase utiliza em JS = TS
-- PascalCase outras lps

/*
SQL não é uma LP.

MASSSSS

PL/SQL

*/


-- temos um modelo lógico

-- 1 cliente tem enderecos e um endereço pertence a um cliente




-- OBS: mome de tabelas sempre no plural.
-- nome de atributos sempre no singular.

-- CREATE TABLE
/*
create table <nome_da_tabela>
(
    atributo | dominio | restrição de  vazio | chave
);
*/

-- modelo lógico
clientes(id int primary key, nome char(100));
enderecos(id, logradouro, numero, bairro, cidade, estado, id_cliente FK)

-- SQL DDL
create table clientes
(
    id int not null primary,
    nome varchar(100) not null,
    CPF char(14) unique, 
    limite_credito float default 0
    
);

create table enderecos
(
    id int not null primary key, 
    logradouro varchar(100) not null,
    numero int default 0,
    bairro varchar(100),
    cidade varchar(100),
    estado char(2),
    id_cliente int not null, 
        constraint clientes_tem_enderecos
            foreign key(id_cliente) 
                references clientes(id)
);


/*
qual a dif do char(tm) varchar(tm)

nome char(10)
nome varchar(10)

nome
##########
Lisa######
nome
####
lisa

*/


professores
disciplinas
softwares 
????

create table professores
(
    id int not null auto_increment primary key,
    nome varchar(100) not null
);
drop table diciplinas;
create table disciplinas
(
    id int not null auto_increment primary key,
    nome varchar(50) not null, 
    id_professor int not null, 
    constraint professores_ensinam_disciplinas
    foreign key(id_professor) references professores(id)
);

create table softwares
(
    id int not null auto_increment primary key, 
    nome varchar(100) not null, 
    fabricante varchar(50)
);

create table disciplinas_tem_softwares
(
    id_disciplina int not null, 
    id_software int not null,
    constraint fk_disciplinas_disciplinas_tem_softwares
    foreign key(id_disciplina) references disciplinas(id), 
    constraint fk_softwares_disciplinas_tem_softwares
    foreign key(id_software) references softwares(id)
);


-- professores e disciplinas e matriculas 
/*

aluno(id, nome)
departamento (id, nome)
curso(id, nome, id_depto)
  id_depto referencia departamento (id)
professor(id, nome)
disciplina(id, nome, id_prof)
   id_prof referencia professor(id)
matricula(id_disciplina, id_aluno, data_matr)
    id_disciplina referencia disciplina(id) 
   id_aluno referencia aluno(id);
*/

CREATE TABLE alunos
(
    id INT auto_increment PRIMARY KEY,
    nome VARCHAR(80) not null
);

CREATE TABLE departamentos
(
    id INT auto_increment PRIMARY KEY,
    nome VARCHAR(30) not null
);

CREATE TABLE cursos
(
    id INT auto_increment PRIMARY KEY,
    nome VARCHAR(50) not null,
    id_departamento int not null,
    CONSTRAINT pertence_ao_depto 
        FOREIGN KEY (id_departamento)
            REFERENCES departamentos(id)
);

CREATE TABLE professores
(
    id INT auto_increment PRIMARY KEY,
    nome VARCHAR(80) not null
);

CREATE TABLE disciplinas
(    
    id INT auto_increment PRIMARY KEY,
    nome VARCHAR(30) not null,
    id_professor int not null,
    CONSTRAINT eh_dada_por_professor
        FOREIGN KEY (id_professor)
            REFERENCES professores(id)
);

CREATE TABLE matricula
(
    id_professor INT not null,
    id_disciplina INT not null,
    data_matricula DATE,
    CONSTRAINT matricula_tem_professor
        FOREIGN KEY (id_professor)
            REFERENCES professores(id),
    CONSTRAINT matricula_tem_disciplina
        FOREIGN KEY (id_disciplina)
            REFERENCES disciplinas(id)
);