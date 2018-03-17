class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :title
      t.text :segment
      t.text :problem
      t.text :valu
      t.text :solution
      t.text :chanel
      t.text :profit
      t.text :cost
      t.text :parameter
      t.text :superiority
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
