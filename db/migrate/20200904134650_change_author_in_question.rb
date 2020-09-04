class ChangeAuthorInQuestion < ActiveRecord::Migration[6.0]
  def change
    change_column_null :questions, :author_id, true
    change_column_default :questions, :author_id, from: 0, to: nil
  end
end
