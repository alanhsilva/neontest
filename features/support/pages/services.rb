class Services
  include Capybara::DSL
  include RSpec::Matchers
  attr_reader(*EL.keys.map(&:to_sym))

  def initialize
    @core = Core.new
    @logic = Logic.new
    EL.map { |key, _value| instance_variable_set("@#{key}", EL[key]) }
  end

  def get_in_API(api)
    @varAPI = api
    @request = HTTParty.get(
      api,
      headers: { "Content-Type" => "application/json" },
    )

    expect(@request.code).to eq 200
  end

  def compare_statuscode(status)
    if @request.code != status.to_i
      raise "O status não condiz com o status especificado, oque veio #{@request.code}, oque era para vir #{status}"
    else
      puts "O status atual é #{status} como esperado."
    end
  end

  def get_title_API
    count = @request["count"]
    varTitle = Array.new(count.to_i)

    for i in 1..count.to_i
      @request = HTTParty.get(
        @varAPI + i.to_s,
        headers: { "Content-Type" => "application/json" },
      )

      varTitle[i - 1] = @request["title"].to_s
      puts varTitle[i - 1].to_s
    end
  end

  def get_count_API
    count = @request["count"]

    randomnumber = rand(count.to_i..count.to_i + 10)

    @request = HTTParty.get(
      @varAPI + randomnumber.to_s,
      headers: { "Content-Type" => "application/json" },
    )

    expect(@request.code).to eq 404
    expect(@request.body).to eq '{"detail":"Not found"}'
  end
end
