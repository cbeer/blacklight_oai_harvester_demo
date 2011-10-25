class AddHarvestMetadataToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :consumed_at, :datetime
    add_column :providers, :interval, :integer
  end
end
