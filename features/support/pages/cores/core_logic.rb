class Logic
  include RSpec::Matchers
  include Capybara::DSL

  def verify_checked(elm)
    find(elm).checked?
  rescue StandardError => e
    raise "ELEMENT NOT FOUND"
  end

  def verify_by_text(elm, msg)
    expect(find(elm).text).to eql (msg)
  rescue StandardError => e
    raise "ELEMENT NOT FOUND"
  end

  def verify_no_text(elm, msg)
    expect(find(elm)).to have_no_content msg
  rescue StandardError => e
    raise "ELEMENT NOT FOUND"
  end

  def verify_text(elm, msg)
    expect(find(elm)).to have_content msg
  rescue StandardError => e
    raise "ELEMENT NOT FOUND"
  end

  def verify_by_value(elm, msg)
    expect(find(elm).value).to eql msg
  rescue StandardError => e
    raise "ELEMENT NOT FOUND"
  end

  def verify_by_page(elm)
    expect(page).to have_content elm
  rescue StandardError => e
    raise "ELEMENT NOT FOUND"
  end

  def verify_by_title_page
    title_page = page.title
    title_page
  rescue StandardError => e
    raise "ELEMENT NOT FOUND"
  end

  def veriffy_not_null(elm)
    expect(find(elm).text.should_not == "")
  rescue StandardError => e
    raise "ELEMENT NOT FOUND"
  end

  def veriffy_null(elm)
    expect(find(elm).text.should == "")
  rescue StandardError => e
    raise "ELEMENT NOT FOUND"
  end

  def verify_visible(elm)
    expect(find(elm).visible?)
  rescue StandardError => e
    raise "ELEMENT NOT FOUND"
  end

  def verify_credit_card_empty(elm)
    expect(find(elm).disabled?.should_not == false)
  rescue StandardError => e
    raise "ELEMENT NOT FOUND"
  end

  def verify_loader(elm)
    assert_no_selector(elm, wait: 5)
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      begin
        retries ||= 0
        finished_all_ajax_requests
      rescue StandardError
        retry if (retries += 1) < 6
      end
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script("jQuery.active").zero?
  end

  def foco_browser
    result = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(result)
  end

  def expect_elm(elm)
    expect(page).to have_xpath(elm, visible: true)
  end

  def wait_elm(elm, time)
    page.has_no_xpath?(elm, wait: time)
  end
end
