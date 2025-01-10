# Método GET
Dado('que o usuario consulte informacoes de usuarios') do
    @getlist = User_Requests.new
    @assert = Assertions.new
  end
  
  Quando('ele realizar a pesquisa') do
    @list_users = @getlist.find_user
  end
  
  Entao('uma lista de usuarios deve retornar') do
    @assert.request_success_default(@list_users.code, @list_users.message)
    puts @list_users
  end 



  # Método POST
  Dado('que o usuario cadastre um novo usuario') do
      @create = User_Requests.new
      @assert = Assertions.new
  end
    
  Quando('ele enviar as informacoes do usuario') do
    @create_user = @create.create_user(DATABASE[:name][:name5],DATABASE[:age][:age5], DATABASE[:salary][:salary5])
    puts @create_user
  end
    
  Entao('esse usuario sera cadastrado') do
    @assert.request_success_post(@create_user.code, @create_user.message)
    expect(@create_user["name"]).to eql (DATABASE[:name][:name5])
    expect(@create_user["age"]).to eql (DATABASE[:age][:age5])
    expect(@create_user["salary"]).to eql (DATABASE[:salary][:salary5])
  end



  # Método PUT
  Dado('que o usuario altere as informacoes de um usuario existente') do
    @request = User_Requests.new
    @assert = Assertions.new
  end
    
  Quando('ele enviar as novas informacoes') do
    @update_user = @request.update_user(@request.find_user['data'][0]['id'], 'Luciano', 32, 'masculino')
    puts @update_user
  end
      
  Entao('as informacoes serao alteradas') do
    @assert.request_success_default(@update_user.code, @update_user.message)
    expect(@update_user["name"]).to eql 'Luciano'
    expect(@update_user["age"]).to eql (32)
  end



    # Método delete
    Dado('que o usuario queira deletar as informacoes de um usuario existente') do
      @request = User_Requests.new
      @assert = Assertions.new
    end
    
      Quando('ele enviar a identificacao unica') do
        @delete_user = @request.delete_user(@request.find_user['data'][0]['id'])
        puts "Status Code: #{@delete_user.code}" # Exibe apenas o código de status, para não exibir todas as linhas teste apenas puts @delete_user
      end
      
      Entao('esse usuario sera deletado do sistema') do
        @assert.request_sucess_delete(@delete_user.code, @delete_user.message)
        puts "Usuário deletado com sucesso!" if @delete_user.code == 204
      end