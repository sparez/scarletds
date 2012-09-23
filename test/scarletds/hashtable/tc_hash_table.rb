require 'test/unit'
require 'scarletds/hashtable/hash_table'

class TestHashTable < Test::Unit::TestCase

  def test_hash_table
    h = HashTable.new
    h[54] = "cat"
    h[26] = "dog"
    h[93] = "lion"
    h[17] = "tiger"
    h[77] = "bird"
    h[31] = "cow"
    h[44] = "goat"
    h[55] = "pig"
    h[20] = "chicken"
    assert_equal h.slots, [77, 44, 55, 20, 26, 93, 17, nil, nil, 31, 54]
    assert_equal h.values, ['bird', 'goat', 'pig', 'chicken', 'dog', 'lion',
                            'tiger', nil, nil, 'cow', 'cat']    
  end
end