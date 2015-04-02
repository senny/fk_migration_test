require 'test_helper'

class ForeignKeyTest < ActiveSupport::TestCase
  test "foreign key" do
    p ActiveRecord::Base.connection.foreign_keys("articles")
  end
end
