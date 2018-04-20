class AddDesplayToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :desplay, :boolean
  end
end
