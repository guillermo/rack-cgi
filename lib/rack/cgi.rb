
class Rack::CGI

  def initialize(script, shell_env = {})
    @script = script
    @shell_env = shell_env
  end

  def call(env)
    options = {
      :err=>[:child, :out],
      :unsetenv_others => true,
      :chdir => (@shell_env["PWD"] || Dir.pwd)
      }
    cmd = [ process_env_from_request_env(env), *@script, options ]

    io = File.popen(cmd, "rb+")
    io.write env["rack.input"].read
    io.close_write
    headers = {}
    while(!["\r\n", nil].include? (header = io.gets))
      header = header.match(/([\w\d\-\_]+)\s?:\s?(.*)/)
      next unless header
      key, value = header.to_a[1,2]
      headers[key.upcase] = value.strip
    end
    data = io.read
    io.close
    return [200, headers, [data]]
  end


  protected

  def process_env_from_request_env(env)

    env.to_hash.reject{|k,v| !v.is_a?(String) || k =~ /^rack/}.merge(@shell_env)
  end
end
