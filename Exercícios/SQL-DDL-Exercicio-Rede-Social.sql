CREATE TABLE tb_usuario(
    id INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    email VARCHAR(30) NOT NULL,
    nascimento DATE,
    website VARCHAR(30),
    genero CHAR(1) NOT NULL,
    telefone VARCHAR(20),
    foto_perfil_id VARCHAR(30)
);

CREATE TABLE tb_seguidores(
    seguidor_id INT,
    seguido_id INT,
    PRIMARY KEY(seguidor_id, seguido_id),
    FOREIGN KEY(seguidor_id) REFERENCES tb_usuario(id),
    FOREIGN KEY(seguido_id) REFERENCES tb_usuario(id)
);

CREATE TABLE tb_postagem(
    id INT PRIMARY KEY,
    texto VARCHAR(20) NOT NULL,
    instante TIMESTAMP NOT NULL,
    autor_id INT NOT NULL,
    FOREIGN KEY(autor_id) REFERENCES tb_usuario(id)
);

CREATE TABLE tb_album(
    id INT PRIMARY KEY,
    titulo VARCHAR(30),
    instante_postagem TIMESTAMP NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY(usuario_id) REFERENCES tb_usuario(id)
);

CREATE TABLE tb_foto(
    uri VARCHAR(30) PRIMARY KEY,
    instante_postagem TIMESTAMP NOT NULL,
    postagem_id INT,
    usuario_id INT NOT NULL,
    album_id INT,
    FOREIGN KEY(postagem_id) REFERENCES tb_postagem(id),
    FOREIGN KEY(usuario_id) REFERENCES tb_usuario(id),
    FOREIGN KEY(album_id) REFERENCES tb_album(id)
);

ALTER TABLE tb_usuario ADD FOREIGN KEY(foto_perfil_id) REFERENCES tb_foto(uri);

ALTER TABLE tb_usuario ALTER COLUMN id TYPE INT;

ALTER TABLE tb_postagem RENAME istante TO instante;

ALTER TABLE tb_album RENAME isntante_postagem TO instante_postagem;

ALTER TABLE tb_postagem ALTER COLUMN id TYPE INT;

ALTER TABLE tb_album ALTER COLUMN id TYPE INT;