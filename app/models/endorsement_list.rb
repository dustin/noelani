# == Schema Information
# Schema version: 20080924031342
#
# Table name: endorsement_lists
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#

class EndorsementList < ActiveRecord::Base

  has_many :endorsements, :order => 'position'

  def self.electeds
    find_by_title 'Elected Officials'
  end

  def self.leaders
    find_by_title 'Community Leaders'
  end

  def self.organizations
    find_by_title 'Organizations'
  end

end
