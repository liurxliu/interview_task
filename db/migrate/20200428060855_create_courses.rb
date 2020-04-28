class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.text :theme
      t.decimal :price
      t.string :currency
      t.string :type
      t.boolean :available
      t.text :url
      t.text :description
      t.datetime :end_at

      t.timestamps
    end
  end
end
