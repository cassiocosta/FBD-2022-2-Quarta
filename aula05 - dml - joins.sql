create database fbd;

create table salas(numero int);

select 	num_sala, count(num_sala) as quantos
from 	alunos
group by num_sala
having quantos>=5
select * from alunos

insert into alunos 
	values
		(1,317),(2,326),(3,327),
        (4,317),(10,327),
		(5,317),(11,326),
        (6,317),(12,326),
        (7,317),(13,327),
        (8,326),(14,326),
        (9,326),(15,327)

create table alunos(
id int primary key,
num_sala int
);

-- mostrar os 5 clientes que mais compraram no mes de outubro

clientes(id, nome)
vendas(id, data, id_cliente)
vendas_produtos(id, id_produto, id_venda, quant, val_unit)

select 	c.nome, sum(vp.quant * vp.valor_unit) as total
from 	clientes c, vendas v, vendas_produtos vp
where 	c.id = v.id_cliente and v.id = vp.id_venda and
		v.data>='2022-10-01' and 
		v.data<='2022-10-31'
group by c.nome
order by total desc
limit 5


/*

nome_cliente | total_compras
joao			10000
silva			7000
joana			6000
elisa			2000
fatima			1500
*/

select 	c.nome, sum(vp.quant * vp.valor_unit) as total
from 	clientes c 
			inner join vendas v 
				on v.id_cliente = c.id 
			inner join vendas_produtos vp
				on vp.id_venda = v.id
where v.data>='2022-10-01' and 
		v.data<='2022-10-31'
        group by c.nome
order by total desc
limit 5

--  Liste todos os produtos cadastrados e ordene por ordem alfabética de descrição.

select	*
from 	produtos
order by descricao asc

-- Lista os produtos que foram pedidos e o nome do fornecedor de cada pedido.
fornecedores(id, nome)
pedidos(id, id_forn, data)
pedidos_itens(id, id_pedido, id_produto, qtd, valor)
categorias(id, nome)
produtos(id, descricao, id_categoria)


select	f.nome, pd.descricao, pd.qtd, pd.valor, f.nome
from 	fornecedores f 
			inner join pedidos p 
				ON p.id_forn = f.id
			inner join pedidos_itens pi
				on pi.id_pedido = p.id
			inner join produtos pd
				on pd.id = pi.id_produto


-- Mostre os produtos que já foram pedidos 
-- e o nome da categoria a que ele pertence.
select	pd.id, pd.descricao, c.nome as categoria
from	pedidos_itens pi
			inner join
				on pi.id_pedido = p.id
			inner join produtos pd
				on pd.id = pi.id_produto
			inner joing categorias c
				on c.id = pd.id_categoria

-- Mostre o nome do fornecedor, 
-- a data do último pedido e a descrição do produto que ele pediu.
from 	fornecedores f 
			inner join pedidos p 
				ON p.id_forn = f.id
			inner join pedidos_itens pi
				on pi.id_pedido = p.id
			inner join produtos pd
				on pd.id = pi.id_produto
        
-- listar todas os produtos e o nome da categoria
select categoria.nome, produtos.id, produtos.nome
from categorias inner join produtos on categorias.id = produtos.id_categoria

select categoria.nome, produtos.id, produtos.nome
from categorias left join produtos on categorias.id = produtos.id_categoria

select categoria.nome, produtos.id, produtos.nome
from  produtos 
            right join  categorias 
                on categorias.id = produtos.id_categoria

-- listar todos os produtos que nunca foram vendidos???
select p.*
from    produtos p left join produtos_vendas pv on p.id = pv.id_produto
where pv.id is null 