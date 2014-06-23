class AddVistorReferenceToGame < ActiveRecord::Migration
  def change
    add_column :games, :visitor_id, :integer
  end
end
