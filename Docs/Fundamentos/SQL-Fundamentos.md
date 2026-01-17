# Fundamentos de SQL

## 📚 Introdução

SQL (Structured Query Language) é uma linguagem padronizada usada para gerenciar e manipular dados em bancos de dados relacionais. Ela permite criar, consultar, atualizar e deletar dados de forma estruturada e eficiente.

---

## 🔧 Estrutura Básica

### O que é um Banco de Dados?

Um banco de dados é um conjunto organizado de dados armazenados e acessados eletronicamente. Em SQL, os dados são organizados em **tabelas**, que são compostas por **linhas** (registros) e **colunas** (campos).

### Exemplo de Tabela:

```
tb_cargo
│ id │       nome               │ nivel │ salario │
├────┼─────────────────────────┼───────┼─────────┤
│ 1  │ Analista de Sistemas    │  JR   │ 3000.0  │
│ 2  │ Desenvolvedor           │  JR   │ 2500.0  │
│ 3  │ Desenvolvedor           │  PL   │ 5200.0  │
```

---

## 🗂️ Tipos de Dados em SQL

Ao criar tabelas, você deve especificar o tipo de dados para cada coluna:

| Tipo | Descrição | Exemplo |
|------|-----------|---------|
| `INT` | Número inteiro | `42`, `-10`, `0` |
| `FLOAT` | Número decimal | `3.14`, `2500.50` |
| `VARCHAR(n)` | Texto variável (máx n caracteres) | `'João Silva'` |
| `CHAR(n)` | Texto fixo (n caracteres) | `'M'`, `'F'` |
| `DATE` | Data (YYYY-MM-DD) | `'2021-03-12'` |
| `BOOLEAN` | Verdadeiro ou Falso | `TRUE`, `FALSE` |

---

## 🔑 Restrições (Constraints)

Restrições são regras que garantem a integridade dos dados:

### PRIMARY KEY (Chave Primária)

Define uma coluna como identificador único de cada registro.

```sql
CREATE TABLE tb_cargo (
    id INT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL
);
```

**Características:**
- Cada tabela tem apenas uma chave primária
- Valores não podem ser `NULL`
- Valores não podem ser duplicados

### NOT NULL

Garante que a coluna sempre terá um valor.

```sql
CREATE TABLE tb_departamento (
    id INT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL
);
```

### FOREIGN KEY (Chave Estrangeira)

Estabelece uma relação entre duas tabelas.

```sql
CREATE TABLE tb_funcionario (
    id INT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    cod_cargo INT NOT NULL,
    FOREIGN KEY(cod_cargo) REFERENCES tb_cargo(id)
);
```

**O que significa?**
- `cod_cargo` em `tb_funcionario` referencia `id` em `tb_cargo`
- Um funcionário só pode ter um cargo que existe na tabela `tb_cargo`
- Previne dados inválidos ou órfãos

---

## 📊 Estrutura Relacional

### Exemplo de Relação Entre Tabelas:

```
tb_cargo                          tb_funcionario
│ id │ nome                  │    │ id │ nome             │ cod_cargo │
├────┼──────────────────────┤    ├────┼──────────────────┼───────────┤
│ 1  │ Analista Sistemas    │◄───│ 1  │ Pedro Nogueira   │     1     │
│ 2  │ Desenvolvedor        │◄───│ 2  │ Maria Silva      │     2     │
│ 3  │ Desenvolvedor        │◄───│ 5  │ Tamara Junqueira │     3     │
```

---

## 💾 Ciclo de Vida dos Dados

### 1. Criar (CREATE)
Estruturar as tabelas e definir sua organização.

### 2. Inserir (INSERT)
Adicionar novos registros à tabela.

### 3. Consultar (SELECT)
Buscar e visualizar dados.

### 4. Atualizar (UPDATE)
Modificar dados existentes.

### 5. Deletar (DELETE)
Remover registros.

---

## 🎯 Boas Práticas

### Nomes de Tabelas e Colunas

✅ **Bom:**
```sql
CREATE TABLE tb_funcionario (
    id INT,
    nome VARCHAR(30),
    data_admissao DATE
);
```

❌ **Evitar:**
```sql
CREATE TABLE t1 (
    x INT,
    y VARCHAR(30),
    z DATE
);
```

### Organização de Dados

✅ Usar prefixos significativos: `tb_` para tabelas, `col_` para colunas
✅ Nomes descritivos e em português ou inglês (consistente)
✅ Usar `NOT NULL` para campos obrigatórios
✅ Definir chaves primárias

### Integridade Referencial

✅ Usar `FOREIGN KEY` para manter relacionamentos
✅ Sempre validar dados antes de inserir
✅ Pensar nas relações antes de criar as tabelas

---

## 📝 Exemplo Prático Completo

### Cenário: Sistema de Funcionários

**Tabelas necessárias:**
1. Cargos
2. Departamentos
3. Funcionários

**Código:**

```sql
-- Criar tabela de Cargos
CREATE TABLE tb_cargo (
    id INT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    nivel VARCHAR(10),
    salario FLOAT
);

-- Criar tabela de Departamentos
CREATE TABLE tb_departamento (
    id INT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sigla VARCHAR(10) NOT NULL
);

-- Criar tabela de Funcionários
CREATE TABLE tb_funcionario (
    id INT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    data_adm DATE,
    sexo CHAR(1),
    cod_cargo INT NOT NULL,
    cod_depto INT NOT NULL,
    FOREIGN KEY(cod_cargo) REFERENCES tb_cargo(id),
    FOREIGN KEY(cod_depto) REFERENCES tb_departamento(id)
);
```

---

## 🔍 Conceitos-Chave Resumidos

| Conceito | O que é | Exemplo |
|----------|---------|---------|
| **Tabela** | Estrutura com linhas e colunas | `tb_funcionario` |
| **Coluna** | Campo de dados | `nome`, `salario` |
| **Linha/Registro** | Um conjunto de dados | Uma pessoa com seus dados |
| **Chave Primária** | Identificador único | `id` |
| **Chave Estrangeira** | Referência a outra tabela | `cod_cargo` |
| **NULL** | Valor ausente/desconhecido | Vazio |
| **Constraint** | Regra de validação | `NOT NULL`, `PRIMARY KEY` |

---

## 🎓 Próximos Passos

Após dominar os fundamentos, você estará pronto para aprender:
- DDL (Data Definition Language) - criação de estruturas
- DML (Data Manipulation Language) - manipulação de dados
- Consultas avançadas com `SELECT`
- Operações complexas com `JOIN`
