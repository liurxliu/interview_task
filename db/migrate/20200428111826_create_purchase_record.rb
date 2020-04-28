class CreatePurchaseRecord < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_records do |t|
      t.integer :user_id
      t.integer :course_id
      t.string :payment_method, default: 'credit_card'
      t.decimal :amount
      t.boolean :paid, default: false
      t.string :currency

      t.timestamps
    end
  end
end
