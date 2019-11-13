class Questions
  include Capybara::DSL
  include RSpec::Matchers
  attr_reader(*EL.keys.map(&:to_sym))

  def initialize
    @core = Core.new
    @logic = Logic.new
    EL.map { |key, _value| instance_variable_set("@#{key}", EL[key]) }
  end

  def validate_text_question
    @core.click_element(questions_title_list)
    @logic.expect_elm(questions_title_content)
  end
end
