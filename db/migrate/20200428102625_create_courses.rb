class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.text :theme
      t.decimal :price
      t.string :currency
      t.string :course_type
      t.boolean :available
      t.text :url
      t.text :description
      t.datetime :start_at
      t.integer :expire_days

      t.timestamps
    end
  end
end
