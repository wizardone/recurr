class CreateRecurringEvents < ActiveRecord::Migration[5.0]
  def self.up
    create_table :recurring_events do |t|
      t.string :name
      t.text :description
      t.integer :day
      t.integer :week
      t.integer :month
      t.boolean :reminder

      t.timestamps
    end
  end
end
