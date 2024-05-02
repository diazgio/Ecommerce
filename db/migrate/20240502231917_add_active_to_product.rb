class AddActiveToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :active, :boolean, default: false
  end
end
