class AddTimestampsToCounts < ActiveRecord::Migration[5.2]
  def change
    add_column :counts, :created_at, :datetime
    add_column :counts, :updated_at, :datetime
  end
end
