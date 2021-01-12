class User < ApplicationRecord
  before_save :downcase_email

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, length: {maximum: 255},
                                    uniqueness: {case_sensitive: false}

  has_many :organized_events, :foreign_key => "organizer_id", :class_name => "Event"
  has_many :event_attendings, :foreign_key => "attendee_id", :class_name => "EventAttending"
  has_many :attended_events, :through => :event_attendings, :source => :attended_event

  private

  def downcase_email
    email.downcase!
  end

end
