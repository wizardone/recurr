class CreateRecurringEvents < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :<%= migration_table %> do |t|
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
