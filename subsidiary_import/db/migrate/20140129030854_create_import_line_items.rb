class CreateImportLineItems < ActiveRecord::Migration

  def change
    create_table :import_line_items do |t|
      t.references :import
      t.string :purchaser_name
      t.string :item_description
      t.integer :item_price_in_cents
      t.integer :purchase_count
      t.string :merchant_address
      t.string :merchant_name

      t.timestamps
    end

    add_index :import_line_items, :import_id
  end

end
