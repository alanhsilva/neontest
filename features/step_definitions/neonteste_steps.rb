Dado("que tenha acesso ao site {string}") do |varURL|
  @home.visit_site(varURL)
end

Quando("acesso a página de perguntas") do
  @home.visit_questions
end

Então("devo validar o texto da pergunta") do
  @question.validate_text_question
end

Quando("acesso a página de status") do
  pending # Write code here that turns the phrase above into concrete actions
end

Então("devo validar se o serviço de status está funcionando") do
  pending # Write code here that turns the phrase above into concrete actions
end
