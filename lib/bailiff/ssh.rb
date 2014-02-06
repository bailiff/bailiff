require 'net/ssh'

module Bailiff
  module SSH
    # host is ip or fqdn
    def ssh_exec(host, command, options = {})
      user = options[:user] || 'root'

      Net::SSH.start(host, user, paranoid: false, forward_agent: true) do |ssh|
        execute(ssh, command)
      end
    end

  private

    def execute ssh, command
      stdout_data = ''
      stderr_data = ''
      exit_code = nil

      ssh.open_channel do |channel|
        channel.exec(command) do |ch, success|
          unless success
            abort "FAILED: couldn't execute command (ssh.channel.exec)"
          end

          channel.on_data do |ch, data|
            stdout_data += data
          end

          channel.on_extended_data do |ch, type, data|
            stderr_data += data
          end

          channel.on_request('exit-status') do |ch, data|
            exit_code = data.read_long
          end
        end
      end

      ssh.loop

      {
        stdout: stdout_data,
        stderr: stderr_data,
        exit_code: exit_code
      }
    end
  end
end
