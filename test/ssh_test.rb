require 'test_helper'

class SshTest < MiniTest::Unit::TestCase
  include Bailiff::SSH

  def test_run
    response = {
      stdout: 'foo',
      stderr: nil,
      exit_code: 0
    }

    Net::SSH.stub :start, response do
      assert_equal ssh_exec('kaka.be', 'ls -la'), response
    end
  end
end
