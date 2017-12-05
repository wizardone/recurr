class CreatePaymentEvent < ActiveRecord::Migration[5.0]
  def self.up
    create_table :payments do |t|
      t.string :email
      t.decimal :amount, precision: 2
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
