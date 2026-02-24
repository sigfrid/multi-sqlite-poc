# Base class for all per-tenant models.
#
# Inherits directly from ActiveRecord::Base as primary_abstract_class so that
# `tenanted` (no argument) uses the "primary" database config — which in this
# app is the per-tenant database (storage/tenants/<env>/<slug>.sqlite3), one
# file per tenant named after that tenant's slug.
#
# Non-tenanted, shared models (e.g. Tenant) inherit from ApplicationRecord,
# which connects to the "main" database.
class TenantedRecord < ActiveRecord::Base
  primary_abstract_class
  tenanted
end
