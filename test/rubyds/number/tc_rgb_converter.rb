
require 'test/unit'
require 'rubyds/number/rgb_converter'

class TestRgbConverter < Test::Unit::TestCase

  def test_rgb_to_hex
    rgbconv = RgbConverter.new
    assert_equal "FF7F00", rgbconv.rgb_to_hex( 255,127,0 )
  end
end