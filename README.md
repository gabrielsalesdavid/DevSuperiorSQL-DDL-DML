# DevSuperior SQL - DDL & DML

Uma documentação completa sobre **SQL (Structured Query Language)**, com foco em **DDL (Data Definition Language)** e **DML (Data Manipulation Language)**, desenvolvida como material educacional pelo curso DevSuperior.

## 📚 Conteúdo do Repositório

Este repositório está organizado em três seções principais:

### 📂 Estrutura de Diretórios

```
DevSuperiorSQL-DDL-DML/
├── Docs/
│   ├── Conceitos/
│   │   └── SQL-Conceitos.md          # Conceitos avançados de SQL
│   └── Fundamentos/
│       └── SQL-Fundamentos.md        # Fundamentos de SQL
│
└── Exercícios/
    ├── SQL-DDL.sql                   # Exemplos de DDL básicos
    ├── SQL-DML.sql                   # Exemplos de DML básicos
    ├── SQL-DDL-Exercicio-*.sql       # Exercícios de DDL (5 temas)
    └── SQL-DML-Exercicio-*.sql       # Exercícios de DML (7 temas)
```

---

## 📖 Documentações

### 🎓 Fundamentos de SQL
**Arquivo:** `Docs/Fundamentos/SQL-Fundamentos.md`

Aborda os conceitos essenciais para iniciantes:
- Introdução a SQL e bancos de dados relacionais
- Tipos de dados (INT, VARCHAR, DATE, FLOAT, etc.)
- Restrições e constraints (PRIMARY KEY, FOREIGN KEY, NOT NULL)
- Estrutura relacional entre tabelas
- Ciclo de vida dos dados (CREATE, INSERT, SELECT, UPDATE, DELETE)
- Boas práticas de nomenclatura
- Exemplo prático: Sistema de Funcionários

**Ideal para:** Iniciantes que desejam entender os conceitos básicos de SQL.

### 🚀 Conceitos Avançados de SQL
**Arquivo:** `Docs/Conceitos/SQL-Conceitos.md`

Detalha conceitos profundos e padrões de design:
- **DDL Detalhado:** CREATE TABLE, ALTER TABLE, DROP TABLE
- **DML Detalhado:** INSERT, SELECT, UPDATE, DELETE com múltiplos exemplos
- Integridade referencial e relacionamentos
- Normalização de banco de dados (evitar redundância)
- Padrões de nomeação padronizados
- Operações comuns (COUNT, MAX, MIN, AVG, SUM)
- Tipos de relacionamentos (1:1, 1:N, N:N)
- Operações perigosas e como evitá-las
- Checklist de boas práticas

**Ideal para:** Desenvolvedores que desejam aprofundar conhecimento em SQL e design de banco de dados.

---

## 💻 Exercícios Práticos

O repositório contém diversos exercícios organizados por tema:

### Exercícios de DDL (Data Definition Language)

**Básico:**
- `SQL-DDL.sql` - Operações básicas de criação e alteração de tabelas

**Temáticos:**
1. `SQL-DDL-Exercicio-Carros.sql` - Tabelas para gerenciar carros
2. `SQL-DDL-Exercicio-ESCOLA.sql` - Banco de dados escolar
3. `SQL-DDL-Exercicio-Evento.sql` - Sistema de eventos
4. `SQL-DDL-Exercicio-Evento-Academico.sql` - Eventos acadêmicos
5. `SQL-DDL-Exercicio-Rede-Social.sql` - Banco de rede social

### Exercícios de DML (Data Manipulation Language)

**Básico:**
- `SQL-DML.sql` - Operações básicas de insert, select, update, delete

**Temáticos:**
1. `SQL-DML-Exercicio-Carros.sql` - Manipular dados de carros
2. `SQL-DML-Exercicio-ESCOLA.sql` - Dados escolares
3. `SQL-DML-Exercicio-Evento.sql` - Dados de eventos
4. `SQL-DML-Exercicio-Evento-Academico.sql` - Dados de eventos acadêmicos
5. `SQL-DML-Exercicio-Evento-PostGre.sql` - Variação PostgreSQL
6. `SQL-DML-Exercicio-Rede-Social.sql` - Dados de rede social

> **Nota:** Alguns arquivos têm variações com `PostGre`, indicando compatibilidade específica com PostgreSQL.

---

## 🎯 Como Usar Este Repositório

### Para Iniciantes

1. **Comece aqui:** Leia [Docs/Fundamentos/SQL-Fundamentos.md](Docs/Fundamentos/SQL-Fundamentos.md)
2. **Execute:** Rode os scripts em `SQL-DDL.sql` e `SQL-DML.sql`
3. **Pratique:** Faça os exercícios temáticos começando com Carros

### Para Desenvolvedores Experientes

1. **Aprofunde:** Estude [Docs/Conceitos/SQL-Conceitos.md](Docs/Conceitos/SQL-Conceitos.md)
2. **Revise padrões:** Consulte o checklist de boas práticas
3. **Explore:** Examine os exercícios mais complexos (Evento-Academico, Rede-Social)

### Executando os Scripts

#### No MySQL:
```bash
mysql -u usuario -p nome_banco < SQL-DDL.sql
mysql -u usuario -p nome_banco < SQL-DML.sql
```

#### No PostgreSQL:
```bash
psql -U usuario -d banco -f SQL-DML-Exercicio-Evento-PostGre.sql
```

#### No SQL Server:
```bash
sqlcmd -S servidor -U usuario -P senha -d banco -i SQL-DDL.sql
```

---

## 📋 Tópicos Cobertos

### DDL (Data Definition Language)
- ✅ CREATE TABLE (criação de tabelas)
- ✅ ALTER TABLE (modificação de estrutura)
- ✅ DROP TABLE (exclusão de tabelas)
- ✅ PRIMARY KEY e FOREIGN KEY
- ✅ Constraints e validações

### DML (Data Manipulation Language)
- ✅ INSERT (inserção de dados)
- ✅ SELECT (consulta de dados)
- ✅ UPDATE (atualização de dados)
- ✅ DELETE (exclusão de dados)
- ✅ Operações com múltiplos registros

### Conceitos Avançados
- ✅ Integridade referencial
- ✅ Normalização de dados
- ✅ Relacionamentos (1:1, 1:N, N:N)
- ✅ Boas práticas de design
- ✅ Operações seguras vs perigosas

---

## 🛠️ Requisitos

Para executar os scripts, você precisará de:
- Um SGBD (Sistema de Gerenciamento de Banco de Dados) instalado
  - MySQL/MariaDB
  - PostgreSQL
  - SQL Server
  - SQLite
  - Qualquer outro que suporte SQL padrão

- Um cliente SQL ou IDE:
  - DBeaver
  - MySQL Workbench
  - pgAdmin
  - SSMS (SQL Server Management Studio)
  - VS Code com extensão SQL

---

## 📚 Recursos Adicionais

### Documentações Incluídas
- `Docs/Fundamentos/SQL-Fundamentos.md` - Conceitos básicos com exemplos
- `Docs/Conceitos/SQL-Conceitos.md` - Conceitos avançados e padrões

### Exemplos de Cenários
- **Sistema de Funcionários** - Tabelas de Cargo, Departamento, Funcionário
- **Gerenciamento de Carros** - Veículos com histórico
- **Escola** - Alunos, Turmas, Disciplinas
- **Eventos** - Eventos públicos e acadêmicos
- **Rede Social** - Usuários, Posts, Comentários

---

## 💡 Dicas para Aproveitar Melhor

### 1. Siga uma Progressão
```
Fundamentos → Conceitos → Exercícios Simples → Exercícios Complexos
```

### 2. Pratique Constantemente
- Execute cada comando do script
- Modifique os exemplos
- Crie suas próprias tabelas

### 3. Mantenha Checklists
Use o checklist de boas práticas ao criar novos bancos de dados:
- ✅ Todas as tabelas têm PRIMARY KEY?
- ✅ Relacionamentos usam FOREIGN KEY?
- ✅ Campos obrigatórios têm NOT NULL?

### 4. Estude os Padrões
- Observe como as tabelas se relacionam
- Entenda por que os dados são normalizados
- Identifique relações 1:1, 1:N e N:N

---

## 🚀 Próximos Passos

Após dominar este conteúdo, explore:
- Índices e otimização de queries
- Procedures e Functions
- Transactions (COMMIT, ROLLBACK)
- Triggers
- Operações JOIN avançadas
- Subconsultas complexas
- Views

---

## 📞 Informações do Curso

- **Instituição:** DevSuperior
- **Disciplina:** Fundação de Programação
- **Tema:** SQL - DDL & DML
- **Nível:** Iniciante a Intermediário

---

## 📝 Licença

Este material educacional foi desenvolvido como parte do curso DevSuperior. Use livremente para fins educacionais.

---

## ✨ Contribuições

Para sugerir melhorias ou reportar erros:
1. Verifique a documentação existente
2. Teste os scripts antes de reportar problemas
3. Documente o erro com contexto

---

**Última atualização:** 17 de janeiro de 2026

Bom estudo! 🎓
