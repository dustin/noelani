class CreateOrganizationList < ActiveRecord::Migration
  def self.up
    EndorsementList.create :title => 'Organizations'
  end

  def self.down
    EndorsementList.find_by_title('Organizations').destroy
  end
end
