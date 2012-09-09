
require 'rubyds/basic/deque'

# perform different checks on a string
# - anagram
# - palyndrome
class StringChecker

  ANAGRAM_ALGORITHM_CHECKOFF      = :anagram_algorithm_checkoff
  ANAGRAM_ALGORITHM_SORTCOMPARE   = :anagram_algorithm_sortcompare
  ANAGRAM_ALGORITHM_BRUTEFORCE    = :anagram_algorithm_bruteforce
  ANAGRAM_ALGORITHM_COUNTCOMPARE  = :anagram_algorithm_countcompare

  # check if the two given strings are anagrams
  # optionally, choose the algorithm to use for checking,
  # the default being count and compare
  def anagram? (s1, s2, algorithm = :anagram_algorithm_countcompare)
    case algorithm
      when :anagram_algorithm_checkoff
        return anagram_checkoff?(s1,s2)
      when :anagram_algorithm_sortcompare
        return anagram_sortcompare?(s1,s2)
      when :anagram_algorithm_bruteforce
        return anagram_bruteforce?(s1,s2)
      when :anagram_algorithm_countcompare
        return anagram_countcompare?(s1,s2)
      else
        raise ArgumentError.new('Unknown anagram algorithm selected ' + algorithm)
    end
  end

  # true if the given string is a palyndrome, false otherwise
  def palyndrome?(str)
    (0..( (str.size - 1) / 2 )).each do |i|
      return false if str[i] != str[ str.size - 1 - i ]
    end
    true
  end

  # true if the given string is a palyndrome, false otherwise
  # this implementation uses a deque
  def palyndrome_deque?(str)
    dq = Deque.new
    str.chars do |char|
      dq.enqueue_rear char
    end
    while dq.size > 1
      return false if dq.dequeue_front != dq.dequeue_rear
    end
    true
  end

  private

  # anagram algorithm 1 - checking off
  # we scan the first string and for each character
  # we scan the second list looking for it: 
  # - if we find it we swap it with a whitespace to not compare with it anymore
  # - if we don't find it then the strings cannot be anagrams and we return false
  # complexity: this approach is order n^2 where n is the length of the strings
  # for each char in s1 we scan s2 completely
  def anagram_checkoff? (s1, s2_original)
    s2 = s2_original.dup # avoid to alter s2
    for pos1 in 0...s1.size
      # now we search for character s1[pos1] inside s2
      found = false
      for pos2 in 0...s2.size
        if s1[pos1] == s2[pos2]
          found = true
          s2[pos2] = " "
          break
        end
      end
      return false if not found
    end
    true
  end

  # anagram algorithm 2 - sort and compare
  # if the two strings are anagrams then if we sort them alphabetically they
  # will end up being identical
  # the complexity here is all on the sorting algorithm used
  # that is invoked twice
  # ruby uses quicksort by default, so the average case order is 
  # 2 * n * log(n) which is order n log n
  # however quicksort has worst case performance that is order quadratic
  # so in general this approach should be considered order quadratic 
  def anagram_sortcompare? (s1,s2)
    return true if s1.split("").sort == s2.split("").sort
    false
  end

  # anagram algorithm 3 - brute force
  # generate all possible permutations of the first string and then compare
  # the second string with them. if they are anagrams then there should be a match.
  # the runtime complexity for generating permutations of a string is order n factorial.
  def anagram_bruteforce? (s1,s2)
    sp = StringPermutator.new
    return true if sp.permutations(s1).include? s2
    false
  end


  # anagram algorithm 4 - count and compare
  # if the two strings are anagrams they contain the same characters in the same
  # respective quantities
  # so we just count the number of occurrences for each char in both strings
  # and we compare the results, if identical the strings are anagrams
  # as we scan each string once to build the charcount hashes and we then scan
  # the first hash once, we can conclude that the runtime complexity of this
  # approach is order n
  def anagram_countcompare? (s1,s2)
    s1_charcount = {}
    s1.chars do |char|
      if s1_charcount.key? char
        s1_charcount[char] += 1
      else
        s1_charcount[char] = 1
      end
    end
    
    s2_charcount = {}
    s2.chars do |char|
      if s2_charcount.key? char
        s2_charcount[char] += 1
      else
        s2_charcount[char] = 1
      end
    end

    return false if s1_charcount.keys.size != s2_charcount.keys.size
    s1_charcount.keys do |s1_char|
      return false if not s2_charcount.key? s1_char
      return false if not s2_charcount[s1_char] == s1_charcount[s1_char]
    end
    true
  end

end
