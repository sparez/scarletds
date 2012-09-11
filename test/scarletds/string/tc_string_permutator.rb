
require 'test/unit'
require 'scarletds/string/string_permutator'

class TestStringPermutator < Test::Unit::TestCase

  STRING = "fit"
  # 3 chars: 3! = 6
  PERMUTATIONS = ["fit","fti","ift","itf","tif","tfi"]

  def test_permutations
    sp = StringPermutator.new
    permutations = sp.permutations(STRING)
    matches = 0
    permutations.each { |p| matches += PERMUTATIONS.include?(p) ? 1 : 0 }
    assert_equal PERMUTATIONS.size, permutations.size
    assert_equal PERMUTATIONS.size, matches
  end

end