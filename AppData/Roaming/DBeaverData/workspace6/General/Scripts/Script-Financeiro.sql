create  database projeto;

CREATE TABLE Conta  
(
    numero_agencia INT NOT NULL PRIMARY KEY,
    nome_agencia VARCHAR(100) NOT NULL
);

CREATE TABLE despesa
(
    usuario_id INT NOT NULL PRIMARY KEY,
    valor       INT NOT null,
    data_pagamento int not null,
    forma_pagamento varchar(100) not null,
);

ALTER TABLE despesa
DROP COLUMN Conta;

ALTER TABLE despesa
DROP FOREIGN KEY fk_Usuario_x_despesa;


ALTER TABLE despesa
DROP COLUMN usuario_id;


ALTER TABLE despesa
ADD COLUMN pagador INT,
ADD COLUMN recebedor INT;

ALTER TABLE despesa
ADD CONSTRAINT fk_pagador FOREIGN KEY (pagador) REFERENCES usuario(usuario_id),
ADD CONSTRAINT fk_recebedor FOREIGN KEY (recebedor) REFERENCES usuario(usuario_id);


ALTER TABLE Conta
ADD CONSTRAINT unique_nome_agencia UNIQUE (nome_agencia);

ALTER TABLE despesa
ADD CONSTRAINT fk_conta_x_despesa FOREIGN KEY (nome_agencia)
REFERENCES Conta (nome_agencia);

ALTER TABLE despesa
ADD CONSTRAINT fk_conta2_x_despesa FOREIGN KEY (numero_agencia)
REFERENCES Conta (numero_agencia);

ALTER TABLE despesa
ADD CONSTRAINT fk_conta_x_despesa FOREIGN KEY (numero_agencia)
REFERENCES Conta (numero_agencia);

ALTER TABLE despesa
ADD COLUMN numero_agencia INT;



ALTER TABLE despesa
ADD CONSTRAINT fk_conta_x_despesa FOREIGN KEY (numero_agencia)
REFERENCES Conta (numero_agencia);

alter table despesa
add constraint fk_Usuario_x_despesa foreign key(usuario_id)
references usuario(usuario_id);

alter table despesa
add constraint fk_conta_x_despesa foreign key(nome_agencia)
references Conta(nome_agencia);

alter table despesa 
add column status ENUM('Não paga', 'Paga') DEFAULT 'Não paga';

alter table despesa 
add column data_vencimento date not null ;

alter table despesa 
modify column data_pagamento date;
    

CREATE TABLE usuario
(
    usuario_id INT NOT NULL PRIMARY KEY,
    nome       VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL,
    senha      VARCHAR(255) NOT NULL
);
