class ImportLineItem < ActiveRecord::Base

  belongs_to :import, inverse_of: :line_items
  belongs_to :purchaser, inverse_of: :import_line_items

  delegate :name, to: :purchaser, prefix: true

  def item_price
    item_price_in_cents / 100.0 if item_price_in_cents
  end

end
