class Merchant < ActiveRecord::Base

  has_many :import_line_items, inverse_of: :merchant

end
