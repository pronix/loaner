# == Schema Information
#
# Table name: company_profiles
#
#  id                          :integer         not null, primary key
#  name                        :string(255)
#  rom_reference               :string(255)
#  license_number              :string(255)
#  address                     :text
#  contact_person              :string(255)
#  contact_person_office_phone :string(255)
#  contact_person_mobile_phone :string(255)
#  contact_person_fax_number   :string(255)
#  contact_person_email        :string(255)
#  logo_file_name              :string(255)
#  logo_content_type           :string(255)
#  logo_file_size              :integer
#  logo_updated_at             :datetime
#  created_at                  :datetime
#  updated_at                  :datetime
#

class CompanyProfile < ActiveRecord::Base
  has_many :users
  has_attached_file :logo, :styles => { :icon => "32x32#", :thumb => "100x100>" }

  def to_label
    name
  end
end
