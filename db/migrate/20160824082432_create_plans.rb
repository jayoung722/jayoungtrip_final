class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|

      t.string  :title
      t.integer :day
      t.integer :user_id


      t.timestamps null: false
    end
  end
end
