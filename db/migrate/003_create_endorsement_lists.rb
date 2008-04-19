class CreateEndorsementLists < ActiveRecord::Migration
  def self.up
    create_table :endorsement_lists do |t|
      t.string :title, :null => false      
      t.timestamps
    end
  end

  def self.down
    drop_table :endorsement_lists
  end
end
