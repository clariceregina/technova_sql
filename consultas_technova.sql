-- criar tabela clientes
CREATE TABLE clientes (
    id INTEGER PRIMARY KEY,
    primeiro_nome VACHAR(50),
    ultimo_nome VACHAR(50),
    email VACHAR(254)
);

INSERT INTO clientes VALUES
(1, 'Ana', 'Silva', 'ana@technova.com'),
(2, 'Carlos', 'Oliveira', 'carlos@technova.com'),
(3, 'Beatriz', 'Souza', 'bia@technova.com'),
(4, 'Daniel', 'Lima', 'daniel@technova.com'),
(5, 'Eduardo', 'Pereira', 'edu@technova.com'),
(6, 'Fernanda', 'Costa', 'fer@technova.com');

-- criar tabela produtos
CREATE TABLE produtos (
    id INTEGER PRIMARY KEY,
    nome VACHAR(50),
    descricao TEXT
);

INSERT INTO produtos VALUES
(1, 'Notebook X1', 'Alto desempenho'),
(2, 'Mouse Pro', NULL),
(3, 'Teclado Gamer', 'RGB mecânico'),
(4, 'Monitor 4K', NULL),
(5, 'Fone de Ouvido', 'Cancelamento de ruído');

-- criar tabela funcionários
CREATE TABLE funcionarios (
    id INTEGER PRIMARY KEY,
    nome VACHAR(50),
    departamento VACHAR(50),
    salario DECIMAL,
    data_nasc DATE
);

INSERT INTO funcionarios VALUES
(1, 'André Santos', 'TI', 5500, '1988-04-20'),
(2, 'Amanda Reis', 'RH', 4800, '1992-11-10'),
(3, 'Carlos Mendes', 'TI', 6000, '1985-03-03'),
(4, 'Ana Lopes', 'Marketing', 5200, '1991-09-09'),
(5, 'Lucas Matos', 'Marketing', 4900, '1993-12-12');

-- criar tabela vendas
CREATE TABLE vendas (
    id INTEGER PRIMARY KEY,
    data_venda DATE
);

INSERT INTO vendas VALUES
(1, '2024-12-01'),
(2, '2025-01-15'),
(3, '2025-04-20');

-- criar tabela pedidos
CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY,
    produto VARCHAR(50),
    preco_total DECIMAL
);

INSERT INTO pedidos VALUES
(1, 'Notebook X1', 3599.99),
(2, 'Mouse Pro', 199.49),
(3, 'Monitor 4K', 1249.95);

-- criar tabela eventos
CREATE TABLE eventos (
    id INTEGER PRIMARY KEY,
    nome_evento VARCHAR(50),
    data_string TEXT
);

INSERT INTO eventos VALUES
(1, 'Lançamento Produto', '2022-12-15'),
(2, 'Black Friday', '2023-11-24'),
(3, 'Cyber Monday', '2023-11-27');

-- criar tabela avaliações
CREATE TABLE avaliacoes (
    id INTEGER PRIMARY KEY,
    produto VARCHAR(50),
    pontuacao INTEGER
);

INSERT INTO avaliacoes VALUES
(1, 'Notebook X1', 9),
(2, 'Mouse Pro', 6),
(3, 'Monitor 4K', 2),
(4, 'Fone de Ouvido', 8);

-- Selecione os primeiros 5 registros da tabela clientes, ordenando-os pelo nome em ordem crescente.
SELECT * FROM clientes ORDER BY primeiro_nome ASC LIMIT 5;

-- Encontre todos os produtos na tabela produtos que não têm uma descrição associada (suponha que a coluna de descrição possa ser nula).
SELECT * FROM produtos WHERE descricao ISNULL;

-- Liste os funcionários cujo nome começa com 'A' e termina com 's' na tabela funcionarios.
SELECT * FROM funcionarios WHERE nome LIKE 'A%' AND nome LIKE '%s';

-- Exiba o departamento e a média salarial dos funcionários em cada departamento na tabela funcionarios, agrupando por departamento, apenas para os departamentos cuja média salarial é superior a $5000.
SELECT departamento, AVG(salario) AS media_salarial
FROM funcionarios
GROUP BY departamento
HAVING media_salarial > 5000;

-- Selecione todos os clientes da tabela clientes e concatene o primeiro e o último nome, além de calcular o comprimento total do nome completo.
SELECT (primeiro_nome || ' ' || ultimo_nome) AS nome_completo, LENGTH(primeiro_nome || ' ' || ultimo_nome) AS tamanho_nome
FROM clientes;

-- Para cada venda na tabela vendas, exiba o ID da venda, a data da venda e a diferença em dias entre a data da venda e a data atual.
SELECT id, data_venda, CEIL(JULIANDAY('now') - JULIANDAY(data_venda)) AS diferenca_dias
FROM vendas;

-- Selecione todos os itens da tabela pedidos e arredonde o preço total para o número inteiro mais próximo.
SELECT id, ROUND(preco_total) AS preco_arredondado
FROM pedidos;

-- Converta a coluna data_string da tabela eventos, que está em formato de texto (YYYY-MM-DD), para o tipo de data e selecione todos os eventos após '2023-01-01'.
SELECT * FROM eventos
WHERE CAST(data_string AS DATE) > '2023-01-01';

-- Na tabela avaliacoes, classifique cada avaliação como 'Boa', 'Média', ou 'Ruim' com base na pontuação: 1-3 para 'Ruim', 4-7 para 'Média', e 8-10 para 'Boa'.
SELECT ID, produto, pontuacao,
CASE
WHEN pontuacao BETWEEN 1 AND 3 THEN 'Ruim'
WHEN pontuacao BETWEEN 4 AND 7 THEN 'Média'
ELSE 'Boa'
END AS 'classificacao'
FROM avaliacoes;

-- Altere o nome da coluna data_nasc para data_nascimento na tabela funcionarios e selecione todos os funcionários que nasceram após '1990-01-01'.
ALTER TABLE funcionarios RENAME data_nasc TO data_nascimento;
SELECT * FROM funcionarios WHERE CAST(data_nascimento AS DATE) > '1990-01-01';
