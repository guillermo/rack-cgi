
require 'minitest/unit'
require 'minitest/autorun'
require 'rack/test'
require 'rack/cgi'

class Rack::CGITest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    # Ok, I know I should be mocking popen... but too lazy tonight.
    Rack::CGI.new(["bash","-c","echo 'VAR3: VAL3\r\n\r\n' ; env ; cat | tr = :"], {"VAR1" => "VAL1"})
  end


  def test_true
    post "/",  "hello world!", {"VAR2" => "VAL2"}
    assert last_response.ok?

    input = {}
    last_response.body.split.each{|lines| k,v = lines.split("="); input[k] = v }

    last_line = last_response.body.split("\n").last.strip

    assert_equal "VAL1", input["VAR1"], "should use the env variables provides to the initializer"
    assert_equal "VAL2", input["VAR2"], "should transmit the headers provider by the user"
    assert_equal "VAL3", last_response.header["VAR3"], "should return the headers of the cgi script"
    assert_equal last_line , "hello world!", "should return the body of the script"
  end
end
