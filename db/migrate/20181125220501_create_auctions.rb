class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.string :name
      t.string :currency
      t.integer :days
      t.integer :hours
      t.integer :minutes
      t.datetime :time
      t.references :user,  index: true

      t.timestamps
    end
  end
end
