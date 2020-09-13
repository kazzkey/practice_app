require 'rails_helper'

RSpec.describe 'Blog作成機能', type: :system do

  before do
    Blog.create(title: 'TestTitle', content: 'TestContent')
  end

  it 'Blogが正しく投稿できる' do
    visit root_path

    expect(page).to have_content 'Blogs'
    expect(page).to have_content 'New Blog'

    click_link 'New Blog'

    fill_in 'Title', with: 'Hello World!'
    fill_in 'Content', with: 'This is my first blog.'

    click_button 'Create Blog'

    expect(page).to have_content 'Blog was successfully created.'
    expect(page).to have_content 'Hello World!'
    expect(page).to have_content 'This is my first blog.'
  end

  it 'Blogが更新できる' do

    visit root_path

    expect(page).to have_content 'TestTitle'
    expect(page).to have_content 'TestContent'

    click_link 'Edit'

    fill_in 'Title', with: 'TestTitle2'
    fill_in 'Content', with: 'TestContent2'

    click_button 'Update Blog'

    expect(page).to have_content 'Blog was successfully updated.'
    expect(page).to have_content 'TestTitle2'
    expect(page).to have_content 'TestContent2'
  end

  it 'Blogが削除できる' do

    visit root_path

    expect(page).to have_content 'TestTitle'
    expect(page).to have_content 'TestContent'

    click_link 'Destroy'

    expect(page).to have_content 'Blog was successfully destroyed.'
    expect(page).not_to have_content 'TestTitle'
    expect(page).not_to have_content 'TestContent'
  end
end
