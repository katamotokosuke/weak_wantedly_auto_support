# coding: utf-8
require "selenium-webdriver"

# Chrome用のドライバを指定
p "Facebookログインする"
p "電話番号orメールアドレス"
fb_key = gets.chomp
p "パスワード"
fb_pass = gets.chomp
p fb_pass

url_ary = [82977, 105867, 105873, 4579, 82984, 82976]
#url_ary = [36446, 96762]
url_ary.each do |url| 
  driver = Selenium::WebDriver.for :chrome
  driver.manage.timeouts.implicit_wait = 60
  #wantedlyにアクセス
  driver.get "https://www.wantedly.com"
  #ログインボタンを探す
  login_button = driver.find_element(:id, "root-login")
  #ログインボタンを押す->ポップアップみたいなのが出現
  login_button.click
  login_pop = driver.find_element(:id, "signin-window")
  #ログイン実行
  login_pop.find_element(:class, "wt-ui-button").click
  #facebookの画面と思われる
  login_form = driver.find_element(:id, "login_form")
  login_form.find_element(:name, "email").send_keys(fb_key)
  login_form.find_element(:name, "pass").send_keys(fb_pass)
  login_form.find_element(:id, "loginbutton").click
  driver.get "https://www.wantedly.com/projects/#{url}"
  support_form = driver.find_element(:class, "project-supporters-list-wrapper")
  support_form.find_element(:class, "project-support-link").click
  support_pop = driver.find_element(:class, "dialog-actions-wrapper")
  support_pop.find_element(:class, "right").find_element(:class, "wt-ui-button").click
  driver.quit
end

