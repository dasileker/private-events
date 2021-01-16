require 'rails_helper'

RSpec.describe EventAttending, type: :model do
  before(:each) do
    @user = User.create(username: 'testUser')
    @event = @user.organized_events
    @event_attendee1 = @user.event_attendings
    @event_attendee2 = @user.event_attendings
  end

  it 'Can not be created by the user' do
    expect(EventAttending.first).to_not eq(@event_attendee1)
  end

  it 'Can be created by the user' do
    expect(@event_attendee1).to eq(@event_attendee1)
  end

  it 'Can not be created by the user' do
    expect(EventAttending.second).to_not eq(@event_attendee2)
  end

  it 'Can be created by the event' do
    expect(@event_attendee2).to eq(@event_attendee2)
  end
end
