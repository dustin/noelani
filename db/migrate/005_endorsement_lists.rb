class EndorsementLists < ActiveRecord::Migration
  def self.up
    EndorsementList.create :title => 'Elected Officials'
    EndorsementList.create :title => 'Community Leaders'
  end

  def self.down
  end
end
