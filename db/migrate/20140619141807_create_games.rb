class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :date
      t.time :hour
      t.string :fuso
      t.integer :principalScore
      t.integer :visitorScore

      t.timestamps
    end
  end
end
