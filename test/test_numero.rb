require 'rubygems'
require 'test/unit'
require 'lib/numero'

class TestNumero < Test::Unit::TestCase
  include Numero
  def test_numero_compiles
    compile(File.join(File.dirname(__FILE__), "input.rb"))
    assert_equal File.readlines(File.join(File.dirname(__FILE__), "input.numero")).first, "112.117.116.115.32.34.104.101.108.108.111.32.119.111.114.108.100.34"
  end
end