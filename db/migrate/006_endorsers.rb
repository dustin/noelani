class Endorsers < ActiveRecord::Migration
  def self.up
    electeds = [
      ['Elaine Alquist', 'California State Senator, District 13'],
      ['Paul Perotti', 'Former Superintendent, Santa Clara Unified School District'],
      ['Stephen D. Kay Ed.D.', "Former Franklin Mc Kinely Board of Education Trustee\n" \
        "Former Peterson Middle School and Scott Lane Principal\n" \
        "San Jose State University Professor"
        ],
      ['Jim Canova', 'Santa Clara Unified School District, Trustee'],
      ['Jamie McLeod', 'Santa Clara City Councilwoman'],
      ['Paul Fong', 'Foothill/De Anza Community College Board of Trustee'],
      ['Otto Lee', 'Sunnyvale City Councilmember and former Mayor'],
      ['Kansen Chu', 'San Jose City Councilmember'],
      ['Madison Nguyen', 'San Jose City Councilwoman'],
      ['Evan Low', 'Campbell City Councilmember'],
      ['Ashu Kalra', 'San Jose Planning Commission Chair, Public Defender & Law Professor']
      ]

    l = EndorsementList.electeds
    electeds.each do |n,t|
      l.endorsements.create :name => n, :title => t
    end

    leaders = [ 'Katie Ferrick', 'Linda Seifert' ]
    l = EndorsementList.leaders
    leaders.each do |n|
      l.endorsements.create :name => n, :title => ''
    end
  end

  def self.down
    execute "delete from endorsements"
  end
end
