# == Schema Information
# Schema version: 20080924020354
#
# Table name: endorsements
#
#  id                  :integer         not null, primary key
#  endorsement_list_id :integer         not null
#  name                :string(255)     not null
#  title               :string(255)     not null
#  position            :integer         
#  created_at          :datetime        
#  updated_at          :datetime        
#

class Endorsement < ActiveRecord::Base

  belongs_to :endorsement_list
  acts_as_list :scope => :endorsement_list

end
