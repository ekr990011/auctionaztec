class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.integer :bid
      t.references :auction
      t.references :user,  index: true

      t.timestamps
    end
  end
end
