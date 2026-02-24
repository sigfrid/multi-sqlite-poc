class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  tenanted "tenant_db"
end
