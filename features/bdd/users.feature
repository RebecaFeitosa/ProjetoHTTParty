# language: pt

Funcionalidade: Pesquisar Usuarios
    Para averiguar informacoes
    O usuario do sistema
    Deseja poder consultar informacoes dos usuario 

    @cenario_um
    Cenario: Buscar informacoes de usuarios
        Dado que o usuario consulte informacoes de usuarios
        Quando ele realizar a pesquisa
        Entao uma lista de usuarios deve retornar

    @cenario_dois
    Cenario: Cadastrar usuario
        Dado que o usuario cadastre um novo usuario
        Quando ele enviar as informacoes do usuario
        Entao esse usuario sera cadastrado

    @cenario_tres
    Cenario: Alterar informacoes cadastrais
        Dado que o usuario altere as informacoes de um usuario existente
        Quando ele enviar as novas informacoes
        Entao as informacoes serao alteradas

    @cenario_quatro
    Cenario: Deletar informacoes cadastrais
        Dado que o usuario queira deletar as informacoes de um usuario existente
        Quando ele enviar a identificacao unica
        Entao esse usuario sera deletado do sistema