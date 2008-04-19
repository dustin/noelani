# == Schema Information
# Schema version: 4
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

end
