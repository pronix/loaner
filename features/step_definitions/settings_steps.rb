Given /^Company Profile Settings$/ do |table|
  a = table.rows_hash
  profile = CompanyProfile.first
  profile.update_attributes :name                           => a["Company Name"],
                            :logo                           => File.new(File.join("features", "support", a["Company Logo"])),
                            :rom_reference                  => a["ROM Reference Number"],
                            :license_number                 => a["License Number"],
                            :address                        => a["Address"],
                            :contact_person                 => a["Contact Person"],
                            :contact_person_office_phone    => a["Contact Person Office Phone Number"],
                            :contact_person_mobile_phone    => a["Contact Person Mobile Number"],
                            :contact_person_fax_number      => a["Contact Person Fax Number"],
                            :contact_person_email           => a["Contact Person Email"]
end
