chef_repo =     ENV['CHEF_REPO_PATH']
chef_server_url "http://127.0.0.1:#{ENV['CHEF_ZERO_PORT']}"
node_name       "bailiff"
client_key      File.join(File.dirname(__FILE__), "private.key")
cookbook_path   "#{chef_repo}/cookbooks"
cache_type      "BasicFile"
cache_options   :path => "#{chef_repo}/checksums"
