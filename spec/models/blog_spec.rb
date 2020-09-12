require 'rails_helper'

RSpec.describe Blog, type: :model do

  it 'タイトルと内容が入力されている場合、有効である' do
    blog = Blog.new(
      title: 'Test',
      content: 'Hello World. This is my blog...',
    )
    expect(blog).to be_valid
  end

  it 'タイトルがない場合、無効である' do
    blog = Blog.new(
      title: nil,
      content: 'Hello World. This is my blog...',
    )
    expect(blog).to be_invalid
  end

  it '内容がない場合、無効である' do
    blog = Blog.new(
      title: 'Test',
      content: nil,
    )
    expect(blog).to be_invalid
  end

  it '文字数制限が守られている場合、有効である' do
    blog = Blog.new(
      title: 'a' * 25,
      content: 'a' * 100,
    )
    expect(blog).to be_valid
  end

  it 'タイトルが25字以上だった場合、無効である' do
    blog = Blog.new(
      title: 'a' * 26,
      content: 'Hello World. This is my blog...',
    )
    expect(blog).to be_invalid
  end

  it '内容が100字以上だった場合、無効である' do
    blog = Blog.new(
      title: 'Test',
      content: 'a' * 101,
    )
    expect(blog).to be_invalid
  end
end
