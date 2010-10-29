class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :name
      t.text   :content
      t.timestamps
    end
    Document.create :name => "Standard Terms & Conditions of Loan"
    Document.create :name => "Demand Letter Format"
  end

  def self.down
    drop_table :documents
  end
end
