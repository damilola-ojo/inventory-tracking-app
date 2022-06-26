class AddBaseToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :base, :boolean
  end
end
