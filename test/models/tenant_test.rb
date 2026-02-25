require "test_helper"

class TenantTest < ActiveSupport::TestCase
  test "fixture slugs are valid" do
    assert tenants(:acme).valid?
    assert tenants(:demo).valid?
  end

  test "slug must be present" do
    tenant = Tenant.new(slug: "")
    assert_not tenant.valid?
    assert_includes tenant.errors[:slug], "can't be blank"
  end

  test "slug must be unique" do
    tenant = Tenant.new(slug: tenants(:acme).slug)
    assert_not tenant.valid?
    assert_includes tenant.errors[:slug], "has already been taken"
  end

  test "slug allows lowercase letters, numbers, and hyphens" do
    assert Tenant.new(slug: "my-tenant-1").valid?
  end

  test "slug rejects uppercase letters" do
    tenant = Tenant.new(slug: "MyTenant")
    assert_not tenant.valid?
    assert_includes tenant.errors[:slug], "only lowercase letters, numbers, and hyphens; must start and end with a letter or number"
  end

  test "slug rejects leading hyphens" do
    tenant = Tenant.new(slug: "-bad")
    assert_not tenant.valid?
  end

  test "slug rejects trailing hyphens" do
    tenant = Tenant.new(slug: "bad-")
    assert_not tenant.valid?
  end

  test "slug rejects consecutive hyphens" do
    tenant = Tenant.new(slug: "bad--slug")
    assert_not tenant.valid?
  end
end
