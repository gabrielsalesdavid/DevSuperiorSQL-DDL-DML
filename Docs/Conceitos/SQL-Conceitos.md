# Conceitos Avançados de SQL

## 📚 Introdução

Este documento detalha os conceitos fundamentais e avançados de SQL, incluindo DDL (Data Definition Language) e DML (Data Manipulation Language), bem como padrões e práticas de design de bancos de dados.

---

## 🏗️ DDL - Data Definition Language

DDL refere-se às operações de definição da estrutura do banco de dados. Ela é responsável pela criação, modificação e exclusão de objetos de banco de dados.

### CREATE - Criar Tabelas

A instrução `CREATE TABLE` define uma nova tabela e suas colunas.

**Sintaxe Básica:**

```sql
CREATE TABLE nome_tabela (
    coluna1 TIPO constraint,
    coluna2 TIPO constraint,
    ...
    PRIMARY KEY (coluna1),
    FOREIGN KEY (coluna_externa) REFERENCES outra_tabela(coluna)
);
```

**Exemplo:**

```sql
CREATE TABLE tb_cargo (
    id INT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    nivel VARCHAR(10),
    salario FLOAT
);
```

**Elementos:**
- `id INT PRIMARY KEY` - Identificador único, inteiro
- `nome VARCHAR(20) NOT NULL` - Texto até 20 caracteres, obrigatório
- `nivel VARCHAR(10)` - Texto até 10 caracteres, opcional
- `salario FLOAT` - Número decimal, opcional

### ALTER - Modificar Estrutura

Alter modifica a estrutura de uma tabela existente sem perder dados.

#### Adicionar Coluna

```sql
ALTER TABLE tb_funcionario ADD data_nasc DATE;
```

**Resultado:** Uma nova coluna é adicionada à tabela.

#### Remover Coluna

```sql
ALTER TABLE tb_funcionario DROP COLUMN data_nasc;
```

**Aviso:** Isso remove a coluna e todos seus dados.

#### Renomear Coluna

```sql
ALTER TABLE tb_funcionario RENAME contact_email TO email;
```

**Uso:** Padronizar nomes de colunas.

#### Alterar Tipo de Coluna

```sql
ALTER TABLE tb_funcionario ALTER COLUMN email TYPE VARCHAR(50);
```

**Nota:** Nem todos os SGBD suportam todas as conversões de tipo.

#### Adicionar Constraint

```sql
ALTER TABLE tb_funcionario ADD CONSTRAINT fk_cargo 
    FOREIGN KEY (cod_cargo) REFERENCES tb_cargo(id);
```

### DROP - Deletar Estrutura

Remove completamente uma tabela do banco de dados.

```sql
DROP TABLE tb_funcionario;
```

⚠️ **CUIDADO:** Isso remove a tabela e TODOS os seus dados permanentemente!

---

## 📝 DML - Data Manipulation Language

DML refere-se às operações de manipulação dos dados (conteúdo) das tabelas.

### INSERT - Inserir Dados

Adiciona novos registros à tabela.

**Sintaxe:**

```sql
INSERT INTO nome_tabela (coluna1, coluna2, ...) 
VALUES (valor1, valor2, ...);
```

**Exemplo:**

```sql
INSERT INTO tb_cargo (id, nome, nivel, salario) 
VALUES (1, 'Analista de Sistemas', 'JR', 3000.0);
```

**Múltiplas Inserções:**

```sql
INSERT INTO tb_cargo (id, nome, nivel, salario) VALUES (1, 'Analista', 'JR', 3000.0);
INSERT INTO tb_cargo (id, nome, nivel, salario) VALUES (2, 'Desenvolvedor', 'JR', 2500.0);
INSERT INTO tb_cargo (id, nome, nivel, salario) VALUES (3, 'Desenvolvedor', 'PL', 5200.0);
```

**Com NULL:**

```sql
INSERT INTO tb_cargo (id, nome, salario) VALUES (4, 'Atendente', 1212.0);
-- nivel será NULL
```

### SELECT - Consultar Dados

Busca e exibe dados da tabela.

**Sintaxe Básica:**

```sql
SELECT * FROM tb_funcionario;
```

**Resultado:**
```
id │ nome              │ data_adm   │ sexo │ cod_cargo │ cod_depto
───┼───────────────────┼────────────┼──────┼───────────┼──────────
1  │ Pedro Nogueira    │ 2021-03-12 │ M    │ 1         │ 1
2  │ Maria Silva       │ 2021-04-22 │ F    │ 2         │ 1
3  │ Rafeala Silveira  │ 2020-05-07 │ F    │ 2         │ 1
```

**Selecionando Colunas Específicas:**

```sql
SELECT nome, salario FROM tb_cargo;
```

**Com Condição (WHERE):**

```sql
SELECT * FROM tb_funcionario WHERE sexo = 'F';
```

### UPDATE - Atualizar Dados

Modifica registros existentes.

**Sintaxe:**

```sql
UPDATE nome_tabela 
SET coluna1 = novo_valor1, coluna2 = novo_valor2 
WHERE condição;
```

**Exemplo - Atualizar um Registro:**

```sql
UPDATE tb_funcionario 
SET nome = 'Ricardo Fernandes Oliveira' 
WHERE id = 4;
```

**Atualizar Múltiplos Registros:**

```sql
UPDATE tb_funcionario 
SET cod_cargo = 3 
WHERE id = 3;
```

⚠️ **SEM WHERE = PERIGO:**
```sql
UPDATE tb_funcionario SET salario = 5000;
-- Isso atualizará TODOS os funcionários!
```

### DELETE - Deletar Dados

Remove registros da tabela.

**Sintaxe:**

```sql
DELETE FROM nome_tabela WHERE condição;
```

**Exemplo:**

```sql
DELETE FROM tb_funcionario WHERE id = 10;
```

**Deletar Múltiplos Registros:**

```sql
DELETE FROM tb_departamento WHERE id = 1;
```

⚠️ **SEM WHERE = CATASTRÓFÉ:**
```sql
DELETE FROM tb_cargo;
-- Isso deleta TODOS os cargos!
```

---

## 🔗 Integridade Referencial

A integridade referencial garante consistência entre tabelas relacionadas.

### Exemplo de Problema:

```
Sem FOREIGN KEY:
- Você poderia criar um funcionário com cod_cargo = 999
- Mas esse cargo não existe!
```

### Solução com FOREIGN KEY:

```sql
CREATE TABLE tb_funcionario (
    id INT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    cod_cargo INT NOT NULL,
    FOREIGN KEY(cod_cargo) REFERENCES tb_cargo(id)
);
```

**O que acontece:**
- ✅ INSERT permitido: `cod_cargo = 1` (existe em tb_cargo)
- ❌ INSERT bloqueado: `cod_cargo = 999` (não existe em tb_cargo)
- ❌ DELETE bloqueado: Não pode deletar cargo se funcionário o usa

---

## 🎯 Padrões de Design

### Normalização de Banco de Dados

Organizar dados para eliminar redundância:

#### ❌ Design Ruim (Dados Desnormalizados):

```sql
CREATE TABLE tb_funcionario (
    id INT,
    nome VARCHAR(30),
    cargo_id INT,
    cargo_nome VARCHAR(30),      -- REDUNDANTE!
    cargo_nivel VARCHAR(10),     -- REDUNDANTE!
    cargo_salario FLOAT          -- REDUNDANTE!
);
```

**Problema:** Se o salário de um cargo muda, precisa atualizar em várias linhas!

#### ✅ Design Bom (Dados Normalizados):

```sql
CREATE TABLE tb_cargo (
    id INT PRIMARY KEY,
    nome VARCHAR(30),
    nivel VARCHAR(10),
    salario FLOAT
);

CREATE TABLE tb_funcionario (
    id INT PRIMARY KEY,
    nome VARCHAR(30),
    cod_cargo INT,
    FOREIGN KEY(cod_cargo) REFERENCES tb_cargo(id)
);
```

**Vantagem:** Dados em um único lugar, mudanças simples!

### Nomeação de Tabelas e Colunas

| Padrão | Uso | Exemplo |
|--------|-----|---------|
| `tb_` | Prefixo para tabelas | `tb_funcionario` |
| `col_` | Prefixo para colunas (opcional) | `col_nome_completo` |
| `_id` | Sufixo para chaves primárias | `funcionario_id` |
| Singular | Nome da entidade | `tb_funcionario` (não `tb_funcionarios`) |
| Snake_case | Separador de palavras | `data_admissao`, `cod_cargo` |

---

## 📊 Operações Comuns

### Contar Registros

```sql
SELECT COUNT(*) FROM tb_funcionario;
```

### Encontrar Valor Máximo

```sql
SELECT MAX(salario) FROM tb_cargo;
```

### Encontrar Valor Mínimo

```sql
SELECT MIN(salario) FROM tb_cargo;
```

### Somar Valores

```sql
SELECT SUM(salario) FROM tb_cargo;
```

### Média

```sql
SELECT AVG(salario) FROM tb_cargo;
```

---

## 🔀 Relacionamentos Entre Tabelas

### Um-para-Um (1:1)

Um registro em Tabela A relaciona-se com exatamente um registro em Tabela B.

```sql
CREATE TABLE tb_funcionario (
    id INT PRIMARY KEY,
    nome VARCHAR(30)
);

CREATE TABLE tb_contato (
    funcionario_id INT PRIMARY KEY,
    email VARCHAR(50),
    telefone VARCHAR(15),
    FOREIGN KEY(funcionario_id) REFERENCES tb_funcionario(id)
);
```

### Um-para-Muitos (1:N)

Um registro em Tabela A relaciona-se com vários registros em Tabela B.

```sql
CREATE TABLE tb_cargo (
    id INT PRIMARY KEY,
    nome VARCHAR(30)
);

CREATE TABLE tb_funcionario (
    id INT PRIMARY KEY,
    nome VARCHAR(30),
    cod_cargo INT,
    FOREIGN KEY(cod_cargo) REFERENCES tb_cargo(id)
);
-- Um cargo pode ter vários funcionários
```

### Muitos-para-Muitos (N:N)

Vários registros em Tabela A relacionam-se com vários registros em Tabela B.

```sql
CREATE TABLE tb_projeto (
    id INT PRIMARY KEY,
    nome VARCHAR(30)
);

CREATE TABLE tb_funcionario (
    id INT PRIMARY KEY,
    nome VARCHAR(30)
);

CREATE TABLE tb_funcionario_projeto (
    funcionario_id INT,
    projeto_id INT,
    PRIMARY KEY (funcionario_id, projeto_id),
    FOREIGN KEY(funcionario_id) REFERENCES tb_funcionario(id),
    FOREIGN KEY(projeto_id) REFERENCES tb_projeto(id)
);
-- Um funcionário pode estar em vários projetos
-- Um projeto pode ter vários funcionários
```

---

## 🚨 Operações Perigosas

### Deletar com Chave Estrangeira

```sql
DELETE FROM tb_cargo WHERE id = 1;
-- ❌ ERRO: Há funcionários com este cargo!
```

**Solução:**

1. Deletar funcionários primeiro
2. Depois deletar o cargo
3. Ou usar `CASCADE` ao definir FK

```sql
CREATE TABLE tb_funcionario (
    id INT PRIMARY KEY,
    cod_cargo INT,
    FOREIGN KEY(cod_cargo) REFERENCES tb_cargo(id) 
        ON DELETE CASCADE  -- Deleta funcionário se cargo for deletado
);
```

---

## 📋 Checklist de Boas Práticas

- ✅ Usar `PRIMARY KEY` em todas as tabelas
- ✅ Usar `FOREIGN KEY` para estabelecer relacionamentos
- ✅ Usar `NOT NULL` em campos obrigatórios
- ✅ Nomear tabelas com prefixo `tb_`
- ✅ Usar `Snake_case` em nomes
- ✅ Sempre usar `WHERE` em UPDATE/DELETE
- ✅ Normalizar dados (evitar redundância)
- ✅ Fazer backup antes de operações destrutivas
- ✅ Validar dados antes de inserir
- ✅ Usar tipos de dados apropriados

---

## 🎓 Conclusão

Dominar estes conceitos é fundamental para:
- Criar bancos de dados eficientes
- Manter integridade dos dados
- Evitar inconsistências
- Facilitar manutenção futura
- Escrever queries otimizadas

Próximo passo: Aprender operações avançadas como `JOIN`, subconsultas e índices.
