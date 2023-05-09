require 'rails_helper'

RSpec.describe User, type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(email: 'user@example.com', password: 'password', role: 'user')
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(
      email: nil,
      password: 'password',
      role: 'user'
    )
    expect(user).to_not be_valid
  end

  it 'can user create a jogging record' do
    @user.save
    jogging_record = @user.jogging_times.create(
      date: Date.today,
      distance: 10,
      time: 60
    )
    expect(jogging_record).to be_valid
  end
end

RSpec.describe 'users', type: :request do
  context 'with user' do
    before do
      @user = User.create(email: 'user@example.com', password: 'password', role: 'user')
    end

    it 'can login' do
      post '/login', params: { user: { email: 'user@example.com', password: 'password' } }
      expect(response).to have_http_status(:success)
    end
  end
  it 'can create user' do
    post '/signup', params: { user: { email: 'user2@example.com', password: 'password', role: 'user' } }
    expect(response).to have_http_status(:success)
  end
end
