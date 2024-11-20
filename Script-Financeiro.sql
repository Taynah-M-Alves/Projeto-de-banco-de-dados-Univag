--criação banco de dados
create  database financeiro;

--Criação tabela conta bancaria
CREATE TABLE Conta  
(
    numero_agencia INT NOT NULL PRIMARY KEY,
    nome_agencia VARCHAR(100) NOT NULL
);

ALTER TABLE Conta
ADD CONSTRAINT unique_nome_agencia UNIQUE (nome_agencia);

--Criação tabela de contas a pagar
CREATE TABLE contas_a_pagar
(
    usuario_id INT NOT NULL PRIMARY KEY,
    valor       INT NOT null,
    data_pagamento int not null,
    forma_pagamento varchar(100) not null,
);

ALTER TABLE contas_a_pagar
DROP COLUMN Conta;

ALTER TABLE contas_a_pagar
DROP FOREIGN KEY fk_Usuario_x_contas_a_pagar;


ALTER TABLE contas_a_pagar
DROP COLUMN usuario_id;


ALTER TABLE contas_a_pagar
ADD COLUMN pagador INT,
ADD COLUMN recebedor INT;

ALTER TABLE contas_a_pagar
ADD CONSTRAINT fk_pagador FOREIGN KEY (pagador) REFERENCES usuario(usuario_id),
ADD CONSTRAINT fk_recebedor FOREIGN KEY (recebedor) REFERENCES usuario(usuario_id);


ALTER TABLE contas_a_pagar
ADD CONSTRAINT fk_conta_x_contas_a_pagar FOREIGN KEY (nome_agencia)
REFERENCES Conta (nome_agencia);

ALTER TABLE contas_a_pagar
ADD CONSTRAINT fk_conta2_x_contas_a_pagar FOREIGN KEY (numero_agencia)
REFERENCES Conta (numero_agencia);

ALTER TABLE contas_a_pagar
ADD CONSTRAINT fk_conta_x_contas_a_pagar FOREIGN KEY (numero_agencia)
REFERENCES Conta (numero_agencia);

ALTER TABLE contas_a_pagar
ADD COLUMN numero_agencia INT;

ALTER TABLE contas_a_pagar
ADD CONSTRAINT fk_conta_x_contas_a_pagar FOREIGN KEY (numero_agencia)
REFERENCES Conta (numero_agencia);

alter table contas_a_pagar
add constraint fk_Usuario_x_contas_a_pagar foreign key(usuario_id)
references usuario(usuario_id);

alter table contas_a_pagar
add constraint fk_conta_x_contas_a_pagar foreign key(nome_agencia)
references Conta(nome_agencia);

alter table contas_a_pagar
add column status ENUM('Não paga', 'Paga') DEFAULT 'Não paga';

alter table contas_a_pagar
add column data_vencimento date not null ;

alter table contas_a_pagar
modify column data_pagamento date;
    
--Criação tabela usuario
CREATE TABLE usuario
(
    usuario_id INT NOT NULL PRIMARY KEY,
    nome       VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL,
    senha      VARCHAR(255) NOT NULL
);

--Criação tabela Contas a receber

create table Contas_a_receber
(
   pagador INT,
   recebedor INT,
   numero_agencia INT,
   nome_agencia VARCHAR(100),
   data_vencimento INT,
   data_pagamento INT,
   Valor Decimal not null,
   status ENUM('Não paga', 'Paga') DEFAULT 'Não paga' 
);

ALTER TABLE Contas_a_receber
ADD CONSTRAINT fk_pagador_receber FOREIGN KEY (pagador) 
REFERENCES usuario(usuario_id),
ADD CONSTRAINT fk_recebedor_receber FOREIGN KEY (recebedor) 
REFERENCES usuario(usuario_id);

alter table contas_a_receber 
add CONSTRAINT fk_pagador FOREIGN KEY (pagador) REFERENCES usuario(usuario_id),
add  CONSTRAINT fk_recebedor FOREIGN KEY (recebedor) REFERENCES usuario(usuario_id),

alter table contas_a_receber 
add CONSTRAINT fk_numero_agencia FOREIGN KEY (numero_agencia) REFERENCES Conta(numero_agencia),
add CONSTRAINT fk_nome_agencia FOREIGN KEY (nome_agencia) REFERENCES Conta(nome_agencia);

