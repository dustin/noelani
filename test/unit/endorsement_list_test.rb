require File.dirname(__FILE__) + '/../test_helper'

class EndorsementListTest < ActiveSupport::TestCase

  def test_elected_list
    assert_equal endorsements(:cheney, :bush), endorsement_lists(:electeds).endorsements
  end

  def test_individuals_list
    assert_equal endorsements(:mom, :dad), endorsement_lists(:individuals).endorsements
  end

  def test_mom_getting_tired
    endorsements(:dad).move_to_top
    assert_equal endorsements(:dad, :mom), endorsement_lists(:individuals).endorsements
  end

  def test_creation
    endorsement_lists(:individuals).endorsements.create(:name => 'Hank', :title => 'Cousin Hank')
    assert_equal %w(Mom Dad Hank), endorsement_lists(:individuals).reload.endorsements.map(&:name)
  end

  def test_daddy_doesnt_love_me_anymore
    endorsements(:dad).destroy
    assert_equal [endorsements(:mom)], endorsement_lists(:individuals).endorsements
  end

end
