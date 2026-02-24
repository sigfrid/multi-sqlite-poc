class TenantedRecord < ActiveRecord::Base
  self.abstract_class = true
  tenanted "tenant_db"
end
