class Event < ApplicationRecord
  validates :title, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :start_time, presence: true

  belongs_to :organizer, :class_name => "User"
  has_many :event_attendings, :foreign_key => "attended_event_id", class_name: "EventAttending"
  has_many :attendees, :through => :event_attendings, :source => :attendee

  scope :upcoming, -> { where("date >= #{Date.current}") }
  scope :past, -> { where("date < #{Date.current}")}
end
