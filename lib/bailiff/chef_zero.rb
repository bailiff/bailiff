require 'knife/dsl'
require 'chef_zero/server'

module Bailiff
  module ChefZero
    def start_chef_server
      server = ::ChefZero::Server.new(port: ENV['CHEF_ZERO_PORT'])
      server.start_background
    end

    def upload_to_chef_server
      Dir.chdir ENV['CHEF_REPO_PATH']
      %x[knife upload . -c #{ENV['KNIFE_CONFIG_PATH']}]
    end
  end
end
