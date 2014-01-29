class Import < ActiveRecord::Base

  mount_uploader :data, ImportDataUploader

end
