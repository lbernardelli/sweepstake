class AddPrincipalReferenceToGame < ActiveRecord::Migration
  def change
    add_column :games, :principal_id, :integer
  end
end
