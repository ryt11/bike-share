class CreateSubscriptionTypeTable < ActiveRecord::Migration[5.0]
  def change
    create_table :subscription_types do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
