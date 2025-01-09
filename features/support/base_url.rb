# Melhorando a qualidade do código, módulo com a url base da aplicação e os headers que serão usados em cada chamada
module User
    include HTTParty
    base_uri 'https://reqres.in/api'
    format :json
    headers 'Content-Type': 'application/json'
end