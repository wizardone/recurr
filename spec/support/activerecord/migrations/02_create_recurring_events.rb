class CreateRecurringEvents < ActiveRecord::Migration[5.0]
  def self.up
    create_table :recurring_events do |t|
      t.string :name
      t.text :description
      t.string :scope
      t.integer :occurence
      t.integer :at
      t.integer :on
      t.date :date
      t.boolean :reminder

      t.timestamps
    end
  end

  def self.down
    drop_table :recurring_events
  end
end
