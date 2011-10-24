class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.text :content
      t.references :provider

      t.timestamps
    end
    add_index :records, :provider_id
  end
end
