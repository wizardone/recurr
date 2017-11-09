class CreateRecurringEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :recurring_events do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
