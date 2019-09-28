class CreateCountUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :count_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :count, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
