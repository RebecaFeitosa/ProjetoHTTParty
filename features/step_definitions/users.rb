# Fazendo a requisição no passo "Dado"
# Realiza a requisição GET na URL da API e armazena a resposta em @get_url
  # Método GET
Dado('que o usuario consulte informacoes de usuarios') do
    @get_url = HTTParty.get('https://swapi.py4e.com/api/people/')
  end
  # Atribui a resposta da requisição (armazenada em @get_url) à variável @list_people
  Quando('ele realizar a pesquisa') do
    @list_users = @get_url
  end
  # Verifica se o código de status da resposta é 200 (sucesso) e se a mensagem de status é 'OK'
  Entao('uma lista de usuarios deve retornar') do
    expect(@list_users.code).to eql 200
    expect(@list_users.message).to eql 'OK'
  end 

  # Cenario dois, fazendo a requisição no passo "Quando"
  # Método POST
  Dado('que o usuario cadastre um novo usuario') do
      @post_url = 'https://reqres.in/api/users'
  end
    #:headers=> {'Content-Type': 'application/json'} tira os scapes (barras invertidas) do response
    Quando('ele enviar as informacoes do usuario') do
      @create_user = HTTParty.post(@post_url, :headers=> {'Content-Type': 'application/json'}, body:{
        "name": "Luke Skywalker",
        "age": 25,
        "gender": "male"
      }.to_json)
    end
    
    Entao('esse usuario sera cadastrado') do
      expect(@create_user.code).to eql (201)
      expect(@create_user.message).to eql 'Created'
      expect(@create_user["name"]).to eql 'Luke Skywalker'
      expect(@create_user["age"]).to eql (25)
    end

  # Método PUT
    Dado('que o usuario altere as informacoes de um usuario existente') do
      @put_url = 'https://reqres.in/api/users/2'
    end
    
      Quando('ele enviar as novas informacoes') do
        @update_user = HTTParty.put(@put_url, :headers => {'Content-Type': 'application/json'}, body: {
          "name": "Luciano",
          "age": 32,
          "gender": "male"
        }.to_json)

        puts(@update_user)
      end
      
      Entao('as informacoes serao alteradas') do
        expect(@update_user.code).to eql (200)
        expect(@update_user.msg).to eql 'OK'
        expect(@update_user["name"]).to eql 'Luciano'
        expect(@update_user["age"]).to eql (32)
      end