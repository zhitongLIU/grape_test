require 'test_helper'

class StockControllerTest < ActionDispatch::IntegrationTest
  setup { visit('/') }

  test 'should have title as expected' do
    assert page.has_selector?('h1')
    assert_equal 'List of Stocks', page.first('h1').text
  end

  test 'should have a table' do
    assert page.has_selector?('table tr')
    p_headers = page.find_all('th').map(&:text)
    assert_equal %w(Id Name Quantity), p_headers
  end

  test 'should have table listing all stocks' do
    assert page.has_selector?('table tr')
    assert_equal Stock.all.count + 1, page.find_all('tr').count
  end

  test 'every record should have 3 button' do
    assert page.has_selector?('table tr')
    records = page.find_all('div#records tr')
    buttons = %w(history modify delete)
    records.each do |r|
      assert_equal buttons, r.find_all('input').map(&:value)
    end
  end

  test 'should have link to create new stock' do
    assert page.has_link?('Create new one', href: '/stocks/new')
  end

  test 'should go to create page' do
    click_link 'Create new one'
    assert_equal 'New Stock', page.first('h1').text
  end

  test 'should go to history page' do
    first('div#records tr').click_button('history')
    assert page.current_path.include? '/history'
    assert page.first('h1').text.include? 'History of Stocks'
  end

  test 'should go to edit page' do
    first('div#records tr').click_button('modify')
    assert page.current_path.include? '/edit'
    assert page.first('h1').text.include? 'Edit Stock'
  end

  test 'should be able to delete a stock' do
    assert_difference "page.find_all('tr').count", -1 do
      first('div#records tr').click_button('delete')
    end
    assert_equal '/stocks', page.current_path
    assert_equal 'List of Stocks', page.first('h1').text
  end
end
