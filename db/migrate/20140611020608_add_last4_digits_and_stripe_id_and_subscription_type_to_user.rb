class AddLast4DigitsAndStripeIdAndSubscriptionTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_4_digits, :string
    add_column :users, :stripe_id, :string
    add_column :users, :subscription_type, :string
    add_column :users, :name, :string
  end
end
