# Tenants are resolved from the request's subdomain.
# A request to "acme.example.com" sets the tenant context to "acme",
# connecting all ApplicationRecord queries to storage/tenants/<env>/acme/db/main.sqlite3.
#
# To use a different strategy (e.g. a path segment or a custom header), replace
# the lambda below with your own logic:
#
#   Rails.application.configure do
#     config.active_record_tenanted.tenant_resolver = ->(request) { request.path_parameters[:tenant] }
#   end
Rails.application.configure do
  config.active_record_tenanted.tenant_resolver = ->(request) { request.subdomain }
end
