# Tenants are resolved from the first path segment of the URL.
# A request to "example.com/acme/..." sets the tenant context to "acme",
# connecting all ApplicationRecord queries to storage/tenants/<env>/acme/db/main.sqlite3.
#
# The /:tenant scope in config/routes.rb populates request.path_parameters[:tenant].
#
# To use a different strategy (e.g. a subdomain), replace the lambda below:
#
#   Rails.application.configure do
#     config.active_record_tenanted.tenant_resolver = ->(request) { request.subdomain }
#   end
Rails.application.configure do
  config.active_record_tenanted.tenant_resolver = ->(request) { request.path_parameters[:tenant] }
end
