# Realiza a requisição GET na URL da API e armazena a resposta em @get_url
Dado('que o usuario consulte informacoes de funcionario') do
    @get_url = HTTParty.get('https://swapi.py4e.com/api/people/')
  end
  # Atribui a resposta da requisição (armazenada em @get_url) à variável @list_people
  Quando('ele realizar a pesquisa') do
    @list_people = @get_url
  end
  # Verifica se o código de status da resposta é 200 (sucesso) e se a mensagem de status é 'OK'
  Entao('uma lista de funcionarios deve retornar') do
    expect(@list_people.code).to eql 200
    expect(@list_people.message).to eql 'OK'
  end