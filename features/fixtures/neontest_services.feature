#language:pt

@services
Funcionalidade:  Realizar consultas nas APIS

    Cenário: Realizar uma consulta na API de filmes e armazenar o titulo deles
            Dado a API "http://swapi.co/api/films/" seja uma API válida
            Quando o status retorna "200"
            Então devo armazenar o titulo dos filmes em uma variavel

    Cenário: Realizar uma consulta na API de planetas e armazenar o count deles
        Dado a API "http://swapi.co/api/planets/" seja uma API válida
        Quando o status retorna "200"
        Então devo armazenar o valor de count e passar um valor maior que o armazenado