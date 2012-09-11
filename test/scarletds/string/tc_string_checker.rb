
require 'test/unit'
require 'scarletds/string/string_checker'

class TestStringChecker < Test::Unit::TestCase

  OTTO  = "otto"
  TOTO  = "toto"
  HARRY = "harry"
  LARRY = "larry"
  ANNA  = "anna"
  RADAR = "radar"
  HEART = "heart"
  EARTH = "earth"
  HEAT  = "heat"

  def setup
    @sc = StringChecker.new
  end

  def test_palyndrome
    assert_equal  true,   @sc.palyndrome?( OTTO )
    assert_equal  false,  @sc.palyndrome?( HARRY )
    assert_equal  true,   @sc.palyndrome?( ANNA )
    assert_equal  true,   @sc.palyndrome?( RADAR )
  end

  def test_palyndrome_deque
    assert_equal  true,   @sc.palyndrome_deque?( OTTO )
    assert_equal  false,  @sc.palyndrome_deque?( HARRY )
    assert_equal  true,   @sc.palyndrome_deque?( ANNA )
    assert_equal  true,   @sc.palyndrome_deque?( RADAR )    
  end

  # test anagram? method with default algorithm
  def test_anagram_default
    assert_equal  true,   @sc.anagram?( EARTH, HEART )
    assert_equal  false,  @sc.anagram?( HEART, HEAT )
  end

  # test anagram? method with checkoff algorithm
   def test_anagram_checkoff
    assert_equal  true,   @sc.anagram?( EARTH, HEART, StringChecker::ANAGRAM_ALGORITHM_CHECKOFF )
    assert_equal  false,  @sc.anagram?( HEART, HEAT,  StringChecker::ANAGRAM_ALGORITHM_CHECKOFF )
  end

  # test anagram? method with sort compare algorithm 
  def test_anagram_sortcompare
    assert_equal  true,   @sc.anagram?( EARTH, HEART, StringChecker::ANAGRAM_ALGORITHM_SORTCOMPARE )
    assert_equal  false,  @sc.anagram?( HEART, HEAT,  StringChecker::ANAGRAM_ALGORITHM_SORTCOMPARE )
  end

  # test anagram? method with brute force algorithm
  def test_anagram_bruteforce
    assert_equal  true,   @sc.anagram?( EARTH, HEART, StringChecker::ANAGRAM_ALGORITHM_BRUTEFORCE )
    assert_equal  false,  @sc.anagram?( HEART, HEAT,  StringChecker::ANAGRAM_ALGORITHM_BRUTEFORCE )    
  end

  # test anagram? method with count compare algorithm
  def test_anagram_countcompare
    assert_equal  true,   @sc.anagram?( EARTH, HEART, StringChecker::ANAGRAM_ALGORITHM_COUNTCOMPARE )
    assert_equal  false,  @sc.anagram?( HEART, HEAT,  StringChecker::ANAGRAM_ALGORITHM_COUNTCOMPARE )
  end

  # test that anagram? raises exception when passing an invalid algorithm param
  def test_invalid_algorithm
    assert_raise ArgumentError do 
      @sc.anagram?( EARTH, HEART, 'invalid_algorithm' )
    end
    assert_raise ArgumentError do 
      @sc.anagram?( HEART, HEAT,  'invalid_algorithm' )
    end
  end

end