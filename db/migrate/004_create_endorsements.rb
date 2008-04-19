class CreateEndorsements < ActiveRecord::Migration
  def self.up
    create_table :endorsements do |t|
      t.integer :endorsement_list_id, :null => false      
      t.string :name, :null => false
      t.string :title, :null => false
      t.integer :position      
      t.timestamps
    end
  end

  def self.down
    drop_table :endorsements
  end
end
