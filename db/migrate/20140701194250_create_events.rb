class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :game_title
      t.string :session_title
      t.datetime :date_time
      t.string :address
      t.string :instructions
      t.text :description

      t.timestamps
    end
  end
end
