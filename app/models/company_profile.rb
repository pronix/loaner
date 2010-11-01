class CompanyProfile < ActiveRecord::Base
  has_attached_file :logo, :styles => { :icon => "32x32#", :thumb => "100x100>" }
end
