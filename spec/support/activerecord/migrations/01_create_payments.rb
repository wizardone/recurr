class CreatePaymentEvent < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.string :email
      t.decimal :amount, precision: 2
      t.timestamps
    end
  end
end
