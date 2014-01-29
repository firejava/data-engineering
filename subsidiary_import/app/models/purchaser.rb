class Purchaser < ActiveRecord::Base

  has_many :import_line_items, inverse_of: :purchaser

end
