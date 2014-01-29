class NormalizeMerchantRelationshipOfImportLineItem < ActiveRecord::Migration

  def change
    add_reference :import_line_items, :merchant
    remove_column :import_line_items, :merchant_name
    remove_column :import_line_items, :merchant_address
  end

end
