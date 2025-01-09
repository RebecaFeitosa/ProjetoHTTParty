# Passar os paths (Caminhos) da automação, para não precisar passar em cada cenario, melhorando a qualidade do codigo

class User_Requests

    # Path do get
    def find_user
        User.get('/users')
    end

    # Path do post, onde ele aceita valores ao ser acessado, para não deixar valores fixos
    def create_user(name, age, gender)
        User.post('/users', body:{
            "name": name,
            "age": age,
            "gender": gender
          }.to_json)
    end

    # Path do put (estava dando erro, a unica coisa que resolveu foi por a / depois de users)
    def update_user(id, name, age, gender)
        User.put('/users/' + id.to_s, body:{
            "name": name,
            "age": age,
            "gender": gender
          }.to_json)
    end

end
