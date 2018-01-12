class CreateRecurringEvents < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :<%= migration_table %> do |t|
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
end
