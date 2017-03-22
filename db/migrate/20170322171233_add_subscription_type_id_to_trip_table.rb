class AddSubscriptionTypeIdToTripTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :subscription_type
    add_column :trips, :subscription_type_id, :text
  end
end
