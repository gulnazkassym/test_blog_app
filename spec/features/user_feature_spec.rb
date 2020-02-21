require 'spec_helper'
require 'rails_helper'

RSpec.feature 'Вход в систему' do
  let!(:user) { create :user }

  def login
    visit login_path
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_on 'Войти'
  end

  context 'пользователь ввел неверные данные' do
    scenario 'показываем ошибку' do
      visit login_path
      fill_in 'username', with: user.username
      fill_in 'password', with: 'notpassword'
      click_on 'Войти'
      expect(page).to have_content('Данные введены неверно')
    end
  end

  context 'пользователь ввел верные данные' do
    scenario 'вход воспроизведен' do
      visit login_path
      fill_in 'username', with: user.username
      fill_in 'password', with: 'password'
      click_on 'Войти'
      expect(page).to have_content('Вы вошли в систему')
    end
  end

  context 'пользователь нажимает на кнопку выхода' do
    scenario 'успешно вышли из системы' do
      login
      click_on 'Выйти'
      expect(page).to have_content('Войти')
      expect(page).not_to have_content('Выйти')
    end
  end
end
