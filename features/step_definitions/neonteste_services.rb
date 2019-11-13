Dado("a API {string} seja uma API válida") do |urlAPI|
  @services.get_in_API(urlAPI)
end

Quando("o status retorna {string}") do |statuscode|
  @services.compare_statuscode(statuscode)
end

Então("devo armazenar o titulo dos filmes em uma variavel") do
  @services.get_title_API
end

Então("devo armazenar o valor de count e passar um valor maior que o armazenado") do
  @services.get_count_API
end
