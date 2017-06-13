# coding: utf-8
require "selenium-webdriver"

# Chrome用のドライバを指定
driver = Selenium::WebDriver.for :chrome

#wantedlyにアクセス
driver.navigate.to "https://www.wantedly.com"
#ログインボタンを探す
login_button = driver.find_element(:id, "root-login")
#ログインボタンを押す->ポップアップみたいなのが出現
login_button.click
login_pop = driver.find_element(:id, "signin-window")
#ログイン実行
login_pop.find_element(:class, "wt-ui-button").click
#facebookの画面と思われる
login_form = driver.find_element(:id, "login_form")
login_form.find_element(:name, "email").send_keys("")
login_form.find_element(:name, "pass").send_keys("")
login_form.find_element(:id, "loginbutton").click
p "----------1"
driver.get "https://www.wantedly.com/projects/35855" #スーパー遅い
p "-----------2"
driver.quit

# support = driver.find_element(:class, "project-supporters-list-wrapper")



# name属性にqが設定されている要素を取得
#inputElement = driver.find_element(:name, 'q')

# 取得した要素にパンケーキを設定
#inputElement.send_keys "パンケーキ"

# name属性にbtnGが設定されている要素を取得
#submitElement = driver.find_element(:name, 'btnG')


# テストを終了
#driver.quit
