class CreateRecurringEvents < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :recurring_events do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
