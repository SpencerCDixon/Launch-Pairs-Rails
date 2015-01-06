class RemoveNullFalseFromStatuses < ActiveRecord::Migration
  def change
    change_column :statuses, :description, :string, null: true
  end
end
