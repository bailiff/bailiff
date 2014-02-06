require 'test_helper'

class ChefZeroTest < MiniTest::Unit::TestCase
  include Bailiff::ChefZero

  def server
    @server ||= ::ChefZero::Server.new port: @@port
  end

  def test_start_chef_server
    server.stub :start_background, true do
      assert start_chef_server server
    end
  end

  def test_refute_start_chef_server
    server.stub :start_background, false do
      refute start_chef_server server
    end
  end

  def test_upload_to_chef_server
    skip 'This should be tested when this method is actually called.'
  end
end
