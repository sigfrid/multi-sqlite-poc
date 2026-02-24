class TenantedRecord < ActiveRecord::Base
  self.abstract_class = true
  tenanted "tenanted_db"
end
