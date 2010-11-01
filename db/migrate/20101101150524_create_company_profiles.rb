class CreateCompanyProfiles < ActiveRecord::Migration
  def self.up
    create_table :company_profiles do |t|
      t.string :name
      t.string :rom_reference
      t.string :license_number
      t.text   :address
      t.string :contact_person
      t.string :contact_person_office_phone
      t.string :contact_person_mobile_phone
      t.string :contact_person_fax_number
      t.string :contact_person_email

      # logo
      t.string          :logo_file_name
      t.string          :logo_content_type
      t.integer         :logo_file_size
      t.datetime        :logo_updated_at

      t.timestamps
    end

    CompanyProfile.create :name => "Unknown"
  end

  def self.down
    drop_table :company_profiles
  end
end
