require 'spec_helper'
require 'rails_helper'

RSpec.feature 'Новость' do
  let!(:owner) { create :user }
  let!(:new_user) { create :user }
  let!(:post) { create :post, user: owner }

  def login(user)
    visit login_path
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_on 'Войти'
  end

  scenario 'Скрываем кнопку "создать новость", если пользователь не вошел в систему' do
    visit posts_path
    expect(page).not_to have_link('Создать новость')
    expect(page).to have_link('Войти')
  end

  scenario 'опубликованная новость видна на главной' do
    login(owner)

    visit new_post_path
    fill_in 'post[title]', with: 'Концерт'
    fill_in 'post[subtitle]', with: 'Концерт группы Бла-бла-бла'
    fill_in 'post[text]', with: '18 июля состоится концерт группы Бла-бла-бла'
    check 'post[is_published]'
    click_on 'Отправить'
    visit posts_path
    expect(page).to have_content('Концерт')
    expect(page).to have_content('Концерт группы Бла-бла-бла')
  end

  scenario 'Не аутентифицированный польз-ль не может редактировать, удалять, сохранить новость' do
    visit posts_path
    expect(page).not_to have_link('Редактировать')
    expect(page).not_to have_link('Удалить')
    expect(page).not_to have_link('Добавить в избранные')
  end

  scenario 'Пользователь не может редактировать, удалять чужие новости' do
    login(new_user)
    visit posts_path
    expect(page).not_to have_link('Редактировать')
    expect(page).not_to have_link('Удалить')
    expect(page).to have_link('Добавить в избранные')
  end

  scenario 'Только автор новости может редактировать, удалять ее' do
    login(owner)
    visit posts_path
    expect(page).to have_link('Редактировать')
    expect(page).to have_link('Удалить')
    expect(page).not_to have_link('Добавить в избранные')
  end
end
