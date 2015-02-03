require 'helper'

$vips_debug = true

class TestVips8 < Test::Unit::TestCase
    should "make a temp image" do
        assert Vips::Image.new
    end

    should "make a black image" do
        im = Vips::call "black", 200, 200
        assertEqual im.width, 200
        assertEqual im.height, 200
    end
end
