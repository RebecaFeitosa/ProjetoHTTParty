# Fazendo a requisição no passo "Dado"
# Realiza a requisição GET na URL da API e armazena a resposta em @get_url
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
Dado('que o usuario cadastre um novo usuario') do
    @post_url = 'https://reqres.in/api/users'
end
  
  Quando('ele enviar as informacoes do usuario') do
    @create_user = HTTParty.post(@post_url, body:{
      "name": "Luke Skywalker",
      "age": "25",
      "gender": "male"
  }.to_json)

    puts @create_user
  end
  
  Entao('esse usuario sera cadastrado') do
    
  end