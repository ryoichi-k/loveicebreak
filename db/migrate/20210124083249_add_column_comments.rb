class AddColumnComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :star, :integer
  end
end
