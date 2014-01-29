class ImportLineItem < ActiveRecord::Base

  belongs_to :import, inverse_of: :line_items

end
