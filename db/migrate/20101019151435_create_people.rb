class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.integer         :user_id
      t.string          :name
      t.date            :birth_at
      t.string          :citizenship
      t.text            :designation
      t.text            :mail_address
      t.text            :business_address
      t.string          :business_phone
      t.string          :home_phone
      t.string          :hand_phone
      t.string          :email
      t.string          :identification_no
      t.integer         :annual_income

      # photo
      t.string          :photo_file_name
      t.string          :photo_content_type
      t.integer         :photo_file_size
      t.datetime        :photo_updated_at

      t.timestamps
    end

  end

  def self.down
    drop_table :people
  end
end
