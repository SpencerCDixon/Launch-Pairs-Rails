class RemoveDefaultFromStatus < ActiveRecord::Migration
  def change
    change_column_default :statuses, :description, nil
  end
end
