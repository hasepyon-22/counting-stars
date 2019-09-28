class CreateCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :counts do |t|
      t.string :title
      t.integer :number
    end
  end
end
