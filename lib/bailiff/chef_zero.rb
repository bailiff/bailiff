require 'knife/dsl'
require 'chef_zero/server'

module Bailiff
  module ChefZero
    def chef_server_start
      server = ::ChefZero::Server.new(port: ENV['CHEF_ZERO_PORT'])
      server.start_background
    end

    def chef_server_upload
      Dir.chdir ENV['CHEF_REPO_PATH']
      %x[knife upload . -c #{ENV['KNIFE_CONFIG_PATH']}]
    end
  end
end
