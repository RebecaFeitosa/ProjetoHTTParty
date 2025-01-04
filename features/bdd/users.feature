# language: pt

Funcionalidade: Pesquisar Usuarios
    Para averiguar informacoes
    O usuario do sistema
    Deseja poder consultar informacoes dos usuario 

    Cenario: Buscar informacoes de usuarios
        Dado que o usuario consulte informacoes de usuarios
        Quando ele realizar a pesquisa
        Entao uma lista de usuarios deve retornar

    @cenario_dois
    Cenario: Cadastrar usuario
        Dado que o usuario cadastre um novo usuario
        Quando ele enviar as informacoes do usuario
        Entao esse usuario sera cadastrado