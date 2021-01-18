class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.date :date
      t.time :start_time

      t.timestamps
    end
  end
end
