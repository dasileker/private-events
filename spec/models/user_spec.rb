# require 'capybara/rails'
require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(username: 'amine', email: 'dasileker@gmail.com',
                     created_at: 'Tue, 12 Jan 2021 00:00:00.000000000 UTC +00:00')
    @events = @user.organized_events
    @upcoming_events = @user.organized_events.upcoming
    @past_events = @user.organized_events.past
  end

  context 'has associations' do
    it 'should be equal to user' do
      expect(@user).to eq(@user)
    end

    it 'should User not be equal to user' do
      expect(User.create).to_not eq(@user)
    end

    it 'should user be a string' do
      expect(User.new).to_s
    end

    it 'can attend events' do
      expect(@user.organized_events).to eq(@events)
    end

    it 'can attend upcoming_events' do
      expect(@user.organized_events).to eq(@upcoming_events)
    end

    it 'can attend past_events' do
      expect(@user.organized_events).to eq(@past_events)
    end
  end

  context 'has validations' do
    it 'should be valid' do
      assert @user.valid?
    end

    it 'should be not valid when :name above max size 25 characters' do
      @user.username = 'usernames' * 25
      @user.save
      expect(@user).to_not be_valid
    end

    it 'should be not valid when :name is nil' do
      @user.username = nil
      @user.save
      expect(@user).to_not be_valid
    end
  end
end
