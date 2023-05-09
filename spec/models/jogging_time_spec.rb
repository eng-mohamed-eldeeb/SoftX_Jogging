require 'rails_helper'

RSpec.describe JoggingTime, type: :model do
  before do
    @user = User.create(email: 'user@example.com', password: 'password', role: 'user')
  end

  it 'is valid with valid attributes' do
    jogging_record = @user.jogging_times.create(
      date: Date.today,
      distance: 10,
      time: 60
    )
    expect(jogging_record).to be_valid
  end
end
