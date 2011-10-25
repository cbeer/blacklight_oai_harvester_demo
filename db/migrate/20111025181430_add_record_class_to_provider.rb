class AddRecordClassToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :record_class, :string
  end
end
