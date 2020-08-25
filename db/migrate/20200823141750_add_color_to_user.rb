class AddColorToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :color, :string, limit: 20, default: '#005a55'
  end
end
