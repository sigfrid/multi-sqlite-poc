class Tenant < ApplicationRecord
  validates :slug, presence: true, uniqueness: true,
                   format: { with: /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/, message: "only lowercase letters, numbers, and hyphens; must start and end with a letter or number" }
end
