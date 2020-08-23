class AddColorToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :color, :string, limit: 20, default: '#0E6655'
  end
end
