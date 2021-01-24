class AddColumnIcebreaks < ActiveRecord::Migration[6.0]
  def change
    add_column :icebreaks, :user_id, :integer
  end
end
