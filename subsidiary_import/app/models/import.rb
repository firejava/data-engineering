class Import < ActiveRecord::Base

  mount_uploader :data, ImportDataUploader

  has_many :line_items, class_name: 'ImportLineItem',
    inverse_of: :import, dependent: :destroy

  def gross_revenue
    gross_revenue_in_cents / 100.0 if gross_revenue_in_cents
  end

end
