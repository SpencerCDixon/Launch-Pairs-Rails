class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :description, null: false, default: "Sleeping"

      t.timestamps null: false
    end
  end
end
