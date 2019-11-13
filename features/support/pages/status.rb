class Status
  include Capybara::DSL
  include RSpec::Matchers
  attr_reader(*EL.keys.map(&:to_sym))

  def initialize
    @core = Core.new
    @logic = Logic.new
    EL.map { |key, _value| instance_variable_set("@#{key}", EL[key]) }
  end

  def validate_service_online
    @logic.expect_elm(status_credit_card)
  end
end
