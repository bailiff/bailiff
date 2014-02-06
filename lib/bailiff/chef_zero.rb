require 'chef_zero/server'

module Bailiff
  module ChefZero
    def chef_zero_server
      ::ChefZero::Server.new(port: ENV['CHEF_ZERO_PORT'])
    end

    def start_chef_zero_server(server = chef_zero_server)
      server.start_background
    end

    def upload_repo_to_chef_zero_server
      Dir.chdir ENV['CHEF_REPO_PATH']
      %x[knife upload . -c #{knife_config_file} ]
    end

    def knife_config_file
      @file ||= File.join(File.dirname(__FILE__), '../../files/', "knife.rb")
    end
  end
end
