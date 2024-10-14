CREATE DATABASE RPHPG;


-- CONSTRUÇÃO DAS TABELAS PADRÕES

-- CLASSES
CREATE TABLE classe(
    classe_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    classe_nome VARCHAR(100) NOT NULL
);

-- ADICIONANDO AS CLASSES
INSERT INTO classe (classe_nome) VALUES

    ("Bruxo"),
    ("Mago"),
    ("Guerreiro"),
    ("Arqueiro")
;

-- ATRIBUTOS DA CLASSE
CREATE TABLE atr_class(
    atrclass_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    atrclass_ataque INT NOT NULL,
    atrclass_defesa INT NOT NULL,
    atrclass_força INT NOT NULL,
    atrclass_esquiva INT NOT NULL,
    atrclass_cura INT NOT NULL,
    atrclass_correr INT NOT NULL,
    atrclass_saltar INT NOT NULL,
    atrclass_escalar INT NOT NULL,
    atrclass_oratoria INT NOT NULL,
    atrclass_mana INT NOT NULL,
    fk_classe_id INT NOT NULL
);
-- BRUXO
INSERT INTO atr_class (atrclass_ataque, atrclass_defesa, atrclass_força, atrclass_esquiva, atrclass_cura, atrclass_correr, atrclass_saltar, atrclass_escalar, atrclass_oratoria, atrclass_mana, fk_classe_id)
VALUES (4, 3, 2, 4, 3, 2, 2, 1, 5, 6, 1);
-- MAGO
INSERT INTO atr_class (atrclass_ataque, atrclass_defesa, atrclass_força, atrclass_esquiva, atrclass_cura, atrclass_correr, atrclass_saltar, atrclass_escalar, atrclass_oratoria, atrclass_mana, fk_classe_id)
VALUES (1, 2, 1, 2, 2, 1, 1, 1, 3, 8, 2);

-- GUERREIRO
INSERT INTO atr_class (atrclass_ataque, atrclass_defesa, atrclass_força, atrclass_esquiva, atrclass_cura, atrclass_correr, atrclass_saltar, atrclass_escalar, atrclass_oratoria, atrclass_mana, fk_classe_id)
VALUES (5, 4, 6, 2, 1, 2, 2, 1, 1, 0,3);

-- ARQUEIRO
INSERT INTO atr_class (atrclass_ataque, atrclass_defesa, atrclass_força, atrclass_esquiva, atrclass_cura, atrclass_correr, atrclass_saltar, atrclass_escalar, atrclass_oratoria, atrclass_mana, fk_classe_id)
VALUES (3, 2, 2, 5, 1, 3, 2, 1, 2, 0, 4);


-- CRIAÇÃO DO PERSONAGEM E DO PLAYER
CREATE TABLE personagem(
    per_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    per_nome VARCHAR(100) NOT NULL,
    per_senha VARCHAR(100) NOT NULL,
    per_nivel INT NOT NULL
);

CREATE TABLE atr_personagem(
    atrjog_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    atrjog_ataque INT NOT NULL,
    atrjog_defesa INT NOT NULL,
    atrjog_força INT NOT NULL,
    atrjog_esquiva INT NOT NULL,
    atrjog_cura INT NOT NULL,
    atrjog_correr INT NOT NULL,
    atrjog_saltar INT NOT NULL,
    atrjog_escalar INT NOT NULL,
    atrjog_oratoria INT NOT NULL,
    atrjog_mana INT NOT NULL,
    fk_per_id INT NOT NULL,
    fk_classe_id INT NOT NULL
);

-- ITENS EQUIPADOS
CREATE TABLE item_per(
    item_id INT NOT NULL AUTO_INCREMENT,
    fk_per_id INT NOT NULL,
    item_ataque VARCHAR(100),
    item_def VARCHAR(100),
    item_tipo VARCHAR(100)
);

-- ITENS JOGO
CREATE TABLE item_jogo(
    itemjogo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    itemjogo_nome VARCHAR(100),
    itemjogo_atk INT NOT NULL,
    itemjogo_def INT NOT NULL,
    itemjogo_tipo VARCHAR(100)
);
-- ITEM GUERREIRO
INSERT INTO item_jogo (itemjogo_nome, itemjogo_atk, itemjogo_def, itemjogo_tipo)
VALUES
    ('Espada Longa', 5, 0, 'Ataque'),
    ('Escudo Grande', 0, 3, 'Defesa'),
    ('Armadura de Aço', 0, 5, 'Armadura');
-- ITEM ARQUEIRO
INSERT INTO item_jogo (itemjogo_nome, itemjogo_atk, itemjogo_def, itemjogo_tipo)
VALUES
    ('Arco Composto', 4, 0, 'Ataque'),
    ('Flechas de Aço', 2, 0, 'Ataque'),
    ('Carcaj', 0, 1, 'Armadura');

-- ITEM MAGO
INSERT INTO item_jogo (itemjogo_nome, itemjogo_atk, itemjogo_def, itemjogo_tipo)
VALUES
    ('Varinha de Madeira', 2, 0, 'Ataque'),
    ('Livro de Feitiços', 0, 0, 'Def'),
    ('Manto de Mago', 0, 2, 'Armadura');

-- BRUXO
INSERT INTO item_jogo (itemjogo_nome, itemjogo_atk, itemjogo_def, itemjogo_tipo)
VALUES
    ('Varinha de Madeira', 2, 0, 'Ataque'),
    ('Livro de Feitiços', 0, 0, 'Def'),
    ('Manto de Mago', 0, 2, 'Armadura');

-- TABELA DE NÍVEL
CREATE TABLE level(
    level_id INT NOT NULL PRIMARY KEY,
    level_pts INT NOT NULL
);

-- ATOS
CREATE TABLE act(
    act_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    act_nome VARCHAR(100) NOT NULL
);

CREATE TABLE local_act(
    local_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    local_nome VARCHAR(200) NOT NULL,
    local_evento VARCHAR(200) NOT NULL,
    local_encontro VARCHAR(200) NOT NULL,
    local_desafio VARCHAR(200) NOT NULL,
    fk_act_id INT NOT NULL
);

-- INIMIGOS
CREATE TABLE inimigos(
    ini_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ini_nome VARCHAR(100) NOT NULL,
    ini_hp INT NOT NULL,
    ini_atk INT NOT NULL,
    ini_def INT NOT NULL,
    fk_local_id INT NOT NULL
);

-- ADICIONANDO LOCAIS E INIMIGOS
-- Atos (já estão corretos, pois não possuem chaves estrangeiras)
INSERT INTO act (act_nome) VALUES
('O Chamado'),
('A Ascensão do Mal'),
('A Nova Era');
-- Locais (sem o valor de fk_act_id)
INSERT INTO local_act (local_nome, local_evento, local_encontro, local_desafio, fk_act_id) VALUES
('Vila de Greenhollow', 'Praga afetando os cultivos', 'Encontro dos personagens', 'Descobrir a causa da praga', 1),
('Floresta Encantada', 'Atravessar a floresta', 'Encontro com o sábio ancião', 'Enfrentar criaturas mágicas', 2),
('Caverna da Bruxa', 'Confronto com a bruxa', 'Revela os motivos da vingança', 'Decidir se aceitam o acordo', 3);

-- Inimigos (sem o valor de fk_local_id)
INSERT INTO inimigos (ini_nome, ini_hp, ini_atk, ini_def, fk_local_id) VALUES
('Goblin das Cavernas', 50, 15, 10, 2),
('Lobo Encantado', 80, 20, 15, 2),
('Gárgula das Ruínas', 100, 25, 20, 3);

INSERT INTO inimigos (ini_nome, ini_hp, ini_atk, ini_def, fk_local_id) VALUES
('Morador Corrompido', 60, 15, 10, 1),
('Rato Infectado', 30, 8, 5, 1);

INSERT INTO inimigos (ini_nome, ini_hp, ini_atk, ini_def, fk_local_id) VALUES
('Espírito da Floresta', 80, 20, 15, 2),
('Vinha Gigante', 100, 25, 20,1);

INSERT INTO inimigos (ini_nome, ini_hp, ini_atk, ini_def, fk_local_id) VALUES
('Guardião Não-Morto', 70, 18, 12,3),
('Cão do Inferno', 90, 22, 18,3);


-- AMARRANDO AS TABELAS
-- TABELA ATR_CLASS COM CLASSE
ALTER TABLE atr_class ADD CONSTRAINT atr_class_classe FOREIGN KEY (fk_classe_id) REFERENCES classe(classe_id);

-- TABELA ART_PER COM PERSONAGEM
ALTER TABLE atr_personagem ADD CONSTRAINT atr_per_personagem FOREIGN KEY (fk_per_id) REFERENCES personagem (per_id);

-- TABELA CLASSE COM ATR_PER
ALTER TABLE atr_personagem ADD CONSTRAINT atr_per_classe FOREIGN KEY (fk_classe_id) REFERENCES classe (classe_id);

-- TABELA ITEM_PER COM PERSONAGEM
ALTER TABLE item_per ADD CONSTRAINT item_per_personagem FOREIGN KEY (fk_per_id) REFERENCES personagem (per_id);

-- TABELA LOCAL COM ACT
ALTER TABLE local_act ADD CONSTRAINT local_id_act_b FOREIGN KEY (fk_act_id) REFERENCES act(act_id);

-- TABELA INIMIGOS COM LOCAL
ALTER TABLE inimigos ADD CONSTRAINT inimigos_local_a FOREIGN KEY (fk_local_id) REFERENCES local_act (local_id);
