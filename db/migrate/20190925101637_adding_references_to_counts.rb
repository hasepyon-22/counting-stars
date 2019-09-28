class AddingReferencesToCounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :counts, :user, index: true
  end
end
