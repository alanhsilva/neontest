class Core
  include RSpec::Matchers
  include Capybara::DSL

  def initialize
    @logic = Logic.new
  end

  def scroll_down(posicao)
    page.execute_script("window.scrollTo(0,#{posicao});")
  end

  def scroll_up(posicao)
    page.execute_script("window.scrollTo(#{posicao},0);")
  end

  def find_element_selector(elm)
    assert_selector(elm)
    find(elm)
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}" if e.to_s.include?("expected to find")
  end

  def click_element(elm)
    #espera a pag carregar todos os itens, e espera achar o elemento
    @logic.expect_elm(elm)
    assert_selector(elm)
    find(elm).click
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}" if e.to_s.include?("expected to find")
  end

  def set_field(key, value)
    find(key).set value
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{key}" if e.to_s.include?("expected to find")
  end

  def access_frame(id, elm)
    within_frame(id) do
      click_element(elm)
    rescue StandardError => e
      raise "Nao foi possivel encontrar o elemento #{elm}" if e.to_s.include?("expected to find")
    end
  end

  def access_window(ptitle, text)
    within_window -> { page.title == ptitle } do
      @logic.verify_by_page(text)
    rescue StandardError => e
      raise "Nao foi possivel encontrar o elemento #{text}" if e.to_s.include?("expected to find")
    end
  end

  def accept_alert
    page.driver.browser.switch_to.alert.accept
  end

  def select_dropdown_option(elm, option)
    find(elm).all(option).sample.select_option.text # 'option[3]'
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}" if e.to_s.include?("expected to find")
  end

  def select_dropdown_random(elm)
    find(elm).all("option").sample.select_option.text
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}" if e.to_s.include?("expected to find")
  end

  def find_text_element(elm)
    find(elm).text
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}" if e.to_s.include?("expected to find")
  end

  def find_class_element(elm)
    find(elm).class
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}" if e.to_s.include?("expected to find")
  end

  def access_frame_setvalue(id, elm, msg)
    within_frame id do
      set_field(elm, msg)
    rescue StandardError => e
      raise "Nao foi possivel encontrar o elemento #{elm}" if e.to_s.include?("expected to find")
    end
  end

  def find_location(elm)
    find(elm).native.location.y
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}" if e.to_s.include?("expected to find")
  end

  #loop
  def click_until_appear(expect, click)
    var = 1
    until page.has_no_xpath?(expect, wait: 1) == false || var == 100 # try up to 100.
      click_element(click)
      var = var + 1
    end
  end
end
