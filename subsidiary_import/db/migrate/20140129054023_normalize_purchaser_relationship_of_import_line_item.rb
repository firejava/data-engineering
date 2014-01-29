class NormalizePurchaserRelationshipOfImportLineItem < ActiveRecord::Migration

  def change
    add_reference :import_line_items, :purchaser
    remove_column :import_line_items, :purchaser_name
  end

end
