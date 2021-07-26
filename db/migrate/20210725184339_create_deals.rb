class CreateDeals < ActiveRecord::Migration[6.1]
  def change
    create_table :deals do |t|

      t.string  :title
      t.string  :description
      t.integer :price
      t.integer :discounted_price
      t.integer :quantity
      t.datetime :publish_date
	
      t.timestamps
    end
  end
end
