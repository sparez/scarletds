
# format an rgb value as 6 digit hex string
class RgbConverter

  def rgb_to_hex(r, g, b)
    bc = BaseConverter.new
    bc.bytes_to_hex_string(r, g, b)
  end

end
