require 'rails_helper'
# require_relative '../app/models/event'

RSpec.describe Event, type: :model do
  before(:each) do
    @user = User.new(username: 'amine', email: 'dasileker@gmail.com',
                     created_at: 'Tue, 12 Jan 2021 00:00:00.000000000 UTC +00:00')
    @events = @user.organized_events
    @upcoming_events = @user.organized_events.upcoming
    @past_events = @user.organized_events.past
  end

  context 'has associations' do
    it 'can not be created' do
      expect(Event.first).to_not eq(@events)
    end

    it 'can be created' do
      expect(@event).to eq(@event)
    end

    it 'should not get his name' do
      expect(@upcoming_events).to_not eq(@user)
    end

    it 'should get his name' do
      expect(@upcoming_events).to eq(@upcoming_events)
    end

    it 'should not get his name' do
      expect(@organized_events).to_not eq(@user)
    end

    it 'should get his name' do
      expect(@organized_events).to eq(@organized_events)
    end

    it 'should get his name' do
      expect(@past_events).to eq(@past_events)
    end
  end

  context 'has validations' do
    it 'should be valid if the complete Event setup is valid' do
      assert @user.valid?
    end

    it 'should not be valid if event:location is nil' do
      expect(@events).to_not eq([date: 'nil'])
    end

    it 'should not be valid if event:location is below min length of 5' do
      expect(@events).to_not eq([location: 'fes'])
    end

    it 'should not be valid if event:description is nil' do
      expect(@events).to_not eq([title: 'nil'])
    end
  end
end
