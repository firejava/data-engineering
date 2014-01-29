class Import < ActiveRecord::Base

  mount_uploader :data, ImportDataUploader

  has_many :line_items, class_name: 'ImportLineItem',
    inverse_of: :import, dependent: :destroy

end
