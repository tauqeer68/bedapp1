class AddMattressNameToMattress < ActiveRecord::Migration[7.0]
  def change
    add_column :mattresses, :mattress_name, :string
  end
end
