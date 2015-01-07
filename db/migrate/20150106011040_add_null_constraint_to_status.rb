class AddNullConstraintToStatus < ActiveRecord::Migration
  def change
    change_column :statuses, :description, :string, null: false
  end
end
