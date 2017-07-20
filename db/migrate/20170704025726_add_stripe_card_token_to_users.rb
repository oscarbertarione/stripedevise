class AddStripeCardTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :stripe_card_token, :string
  end
end
