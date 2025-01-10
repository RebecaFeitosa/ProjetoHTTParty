# Passar os paths (Caminhos) da automação, para não precisar passar em cada cenario, melhorando a qualidade do codigo

class User_Requests

    # Path do get
    def find_user
        User.get('/users')
    end

    # Path do post, onde ele aceita valores ao ser acessado, para não deixar valores fixos
    def create_user(name, age, salary)
        User.post('/users', body:{
            "name": name,
            "age": age,
            "salary": salary
          }.to_json)
    end

    # Path do put (estava dando erro, a unica coisa que resolveu foi por a / depois de users)
    def update_user(id, name, age, salary)
        User.put('/users/' + id.to_s, body:{
            "name": name,
            "age": age,
            "gender": salary
          }.to_json)
    end

    # Path do delete
    def delete_user(id)
        User.delete('/users/' + id.to_s)
    end

end
