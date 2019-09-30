class AddImgToCount < ActiveRecord::Migration[5.2]
  def change
    add_column :counts, :img, :string
  end
end
