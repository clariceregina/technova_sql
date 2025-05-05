# 🚀 Banco de Dados SQL - TechNova

Este projeto contém a estrutura e algumas consultas SQL (CREATE TABLE, PRIMARY KEY, INSERT INTO, WHERE LIKE, ALTER TABLE, CAST, CASE, JULIANDAY, ORDER BY, AVG, GROUP BY, HAVING, CEIL, ROUND) desenvolvidas para a empresa **TechNova**, com o objetivo de simular operações comuns de um sistema de gestão empresarial envolvendo clientes, produtos, funcionários, vendas, pedidos, eventos e avaliações.

As consultas foram realizadas no SQLite Online.

## 🔍 Funcionalidades Implementadas

A seguir, destacam-se os principais recursos utilizados no código SQL:

### Filtros e Ordenações

- Seleção de registros com base em condições como `LIKE`, `IS NULL` e operadores lógicos.
- Ordenação de clientes pelo primeiro nome (`ORDER BY`) e uso de `LIMIT` para restringir os resultados.

### Funções de Agregação e Agrupamento

- Cálculo da **média salarial por departamento** usando `AVG()` e `GROUP BY`.
- Filtragem de médias com `HAVING` para mostrar apenas departamentos com média superior a 5000.

### Manipulação e Transformação de Dados

- Concatenação de nomes (`||`) e cálculo do comprimento com `LENGTH()`.
- Arredondamento de preços com `ROUND()`.
- Cálculo da diferença de dias entre datas com `JULIANDAY()` e `CEIL()`.

### Conversão e Comparação de Datas

- Conversão de datas armazenadas como texto (`CAST(data_string AS DATE)`).
- Comparação de datas com operadores relacionais (`> '2023-01-01'`).

### Classificação com CASE

- Uso de `CASE` para classificar avaliações como **Boa**, **Média** ou **Ruim** com base na pontuação.

### Alteração na Estrutura da Tabela

- Renomeação da coluna `data_nasc` para `data_nascimento` com `ALTER TABLE`.

---

## 📁 Exemplos de Consultas

```sql
-- Listar os 5 primeiros clientes em ordem alfabética
SELECT * FROM clientes ORDER BY primeiro_nome ASC LIMIT 5;

-- Produtos sem descrição
SELECT * FROM produtos WHERE descricao ISNULL;

-- Funcionários com nome começando com 'A' e terminando com 's'
SELECT * FROM funcionarios WHERE nome LIKE 'A%' AND nome LIKE '%s';

-- Departamentos com média salarial acima de 5000
SELECT departamento, AVG(salario) AS media_salarial
FROM funcionarios
GROUP BY departamento
HAVING media_salarial > 5000;

-- Classificação de avaliações
SELECT ID, produto, pontuacao,
CASE
  WHEN pontuacao BETWEEN 1 AND 3 THEN 'Ruim'
  WHEN pontuacao BETWEEN 4 AND 7 THEN 'Média'
  ELSE 'Boa'
END AS classificacao
FROM avaliacoes;
