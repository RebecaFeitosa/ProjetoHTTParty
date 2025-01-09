# Fazendo a requisição no passo "Dado"
# Realiza a requisição GET na URL da API e armazena a resposta em @get_url
  # Método GET
Dado('que o usuario consulte informacoes de usuarios') do
    @getlist = User_Requests.new
  end
  # Atribui a resposta da requisição (armazenada em @get_url) à variável @list_users
  Quando('ele realizar a pesquisa') do
    @list_users = @getlist.find_user
  end
  # Verifica se o código de status da resposta é 200 (sucesso) e se a mensagem de status é 'OK'
  Entao('uma lista de usuarios deve retornar') do
    expect(@list_users.code).to eql 200
    expect(@list_users.message).to eql 'OK'
  end 

  # Cenario dois, fazendo a requisição no passo "Quando"
  # Método POST
  Dado('que o usuario cadastre um novo usuario') do
      @create = User_Requests.new
  end
    #:headers=> {'Content-Type': 'application/json'} tira os scapes (barras invertidas) do response
    Quando('ele enviar as informacoes do usuario') do
      @create_user = @create.create_user('Luke', 28, 'masculino')
      puts @create_user
    end
    
    Entao('esse usuario sera cadastrado') do
      expect(@create_user.code).to eql (201)
      expect(@create_user.message).to eql 'Created'
      expect(@create_user["name"]).to eql 'Luke'
      expect(@create_user["age"]).to eql (28)
    end

  # Método PUT
  # O ideal seria que o id nao fosse fixo, fazer um get primeiro e depois o put em cima do retorno do response do get
  # Fiz algo parecido porque essa api nao permite isso
    Dado('que o usuario altere as informacoes de um usuario existente') do
      @request = User_Requests.new
    end
    
      Quando('ele enviar as novas informacoes') do
        @update_user = @request.update_user(@request.find_user['data'][0]['id'], 'Luciano', 32, 'masculino')
        puts @update_user
      end
      
      Entao('as informacoes serao alteradas') do
        expect(@update_user.code).to eql (200)
        expect(@update_user.msg).to eql 'OK'
        expect(@update_user["name"]).to eql 'Luciano'
        expect(@update_user["age"]).to eql (32)
      end

    # Método delete
    Dado('que o usuario queira deletar as informacoes de um usuario existente') do
      @request = User_Requests.new
    end
    
      Quando('ele enviar a identificacao unica') do
        @delete_user = @request.delete_user(@request.find_user['data'][0]['id'])
        puts "Status Code: #{@delete_user.code}" # Exibe apenas o código de status, para não exibir todas as linhas teste apenas puts @delete_user
      end
      
      Entao('esse usuario sera deletado do sistema') do
        expect(@delete_user.code).to eql (204)
        expect(@delete_user.msg).to eql 'No Content'
        puts "Usuário deletado com sucesso!" if @delete_user.code == 204
      end