require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: people
#
#  id                 :integer         not null, primary key
#  user_id            :integer
#  name               :string(255)
#  birth_at           :date
#  citizenship        :string(255)
#  designation        :text
#  mail_address       :text
#  business_address   :text
#  business_phone     :string(255)
#  home_phone         :string(255)
#  hand_phone         :string(255)
#  email              :string(255)
#  annual_income      :integer
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

