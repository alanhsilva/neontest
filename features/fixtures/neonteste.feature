#language:pt

@web
Funcionalidade:  Validações no website do banco Neon
                Realizar alguns testes de navegação e login

    Cenário: Navegar pelo site e validar textos
        Dado que tenha acesso ao site "neon" 
        Quando acesso a página de perguntas
        Então devo validar o texto da pergunta

    @segundo
    Cenário: Validar se o serviço de ativação de cartão
        Dado que tenha acesso ao site "neon" 
        Quando acesso a página de status
        Então devo validar se o serviço de status está funcionando
    
