class Home
  include Capybara::DSL
  include RSpec::Matchers
  attr_reader(*EL.keys.map(&:to_sym))

  def initialize
    @core = Core.new
    @logic = Logic.new
    EL.map { |key, _value| instance_variable_set("@#{key}", EL[key]) }
  end

  def visit_site(url)
    visit(DATA["neon"])
    @logic.expect_elm(home_cadastro_button)
  end

  def visit_questions
    @core.click_element(home_perguntas_link)
    @logic.expect_elm(questions_title)
  end
end
