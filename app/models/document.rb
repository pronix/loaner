# == Schema Information
#
# Table name: documents
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Document < ActiveRecord::Base
  validates_presence_of :name
end
