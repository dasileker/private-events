class CreateEventAttendings < ActiveRecord::Migration[6.1]
  def change
    create_table :event_attendings do |t|
      t.references :attendee, foreign_key: { to_table: :users }
      t.references :attended_event, foreign_key: { to_table: :events }

      t.timestamps
    end
  end
end
