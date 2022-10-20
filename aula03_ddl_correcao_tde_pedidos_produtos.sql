CREATE TABLE categorias
(
  codigo INT AUTO_INCREMENT PRIMARY KEY,
  nome CHAR(50) NOT NULL UNIQUE
);

CREATE TABLE produtos
(
  codigo INT AUTO_INCREMENT PRIMARY KEY,
  descricao varchar(100),
  data_cadastro DATE NOT NULL,
  -- character varying usado como text no postgres. ver documentação sempre.
  valor_unitario decimal(18,2) NOT NULL,
  -- 1234567890.12
  codigo_categoria INT NOT NULL,
  CONSTRAINT categorias_fk_produtos
    FOREIGN KEY(codigo_categoria) REFERENCES categorias(codigo)
    ON DELETE restrict
    ON UPDATE cascade
);

CREATE TABLE fornecedores
(
  codigo INT AUTO_INCREMENT PRIMARY KEY,
  nome CHAR(50) NOT NULL UNIQUE
);

CREATE TABLE pedidos
(
  codigo int auto_increment PRIMARY KEY,
  data_pedido DATE NOT NULL,
  codigo_fornecedor INT NOT NULL,
  CONSTRAINT pedido_por_fornecedor
    FOREIGN KEY(codigo_fornecedor) REFERENCES fornecedores(codigo)
    ON DELETE restrict
    ON UPDATE cascade
);

CREATE TABLE pedido_itens
(
  id int auto_increment primary key,
  codigo_pedido INT NOT NULL,
  codigo_produto INT NOT NULL,
  quantidade decimal(12,3) default 0,
  valor_unitario decimal(18,2) NOT NULL default 0,
  
  CONSTRAINT pedidos_itens_fk_pedidos
    FOREIGN KEY(codigo_pedido) REFERENCES pedidos(codigo)
    ON DELETE restrict
    ON UPDATE cascade,

  CONSTRAINT produtos_fk_pedidos_itens
    FOREIGN KEY(codigo_produto) REFERENCES produtos(codigo)
    ON DELETE restrict
    ON UPDATE cascade
);
-- 3 
alter table fornecedores add column data_ult_compra date;

--4 
-- FUC para alterar o nome do atributo data em PEDE para data_pedido.
alter table pedidos rename COLUMN data_pedido to data_do_pedido;

-- 5
alter table produtos drop column data_cadastro;

-- 6 - FUC para adicionar na relação categoria e produto para o
--  delete ser em cascata e o update ser restrict.
alter table produtos drop FOREIGN key categorias_fk_produtos;
ALTER TABLE produtos 
			ADD CONSTRAINT categorias_fk_produtos
				FOREIGN KEY(codigo_categoria)
					REFERENCES categorias(codigo)
					ON DELETE CASCADE
					ON UPDATE RESTRICT;

-- 7: FUC para aumentar o tamanho do domínio do campo nome do fornecedor para mais 30 caracteres.

alter table fornecedores change COLUMN nome nome varchar(200);

--8: 
drop table forncedores. 
-- porém não irá apgar pois pedidos depende da tabela fornecedoes.

-- 9 
alter table fornecedores change COLUMN nome nome varchar(200);

-- 10 

insert into fornecedores (nome) value('xyz');
insert into fornecedores (nome, data_ult_compra) value('xpto','2022-10-19');

select * from fornecedores

-- 11 
delete from produtos where id=1;

-- vai apagar somente se não ter pedidos com este produto.
alter table fornecedores change COLUMN nome nome varchar(200);


insert into fornecedores (nome) value('xyz');
insert into fornecedores (nome, data_ult_compra) value('xpto','2022-10-19');

insert into categorias(nome) values('acessorios');
delete from produtos where id=1;

select * from produtos

insert into produtos (descricao, valor_unitario, codigo_categoria)
	values('garrafa d`água', 3,1);

select * from pedidos
insert into pedidos (data_do_pedido, codigo_fornecedor) values ('2022-10-19',1)

select * from produtos

select  * from pedido_itens
insert into pedido_itens (codigo_pedido, codigo_produto, quantidade, valor_unitario)
	values(1,1,5,3.5);
   
   update produtos set codigo = 99 where codigo=1;
   delete from produtos where codigo = 99
