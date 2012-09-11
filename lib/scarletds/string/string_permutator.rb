
# class to generate string permutations
class StringPermutator

  # generate all permutations of the given string
  # note that the number of possible permutations is n!
  # where n is the length of the string
  # note that n! grows even faster than the exponentlial function 2^n so
  # the runtime complexity of this approach is extremely high
  def permutations (str)
    if str.size == 1 or str == nil
      return [ str ] 
    else
      perms = []
      str.chars do |char|
        permutations( str.sub(char,"") ).each do |perm|
          perms.push(char + perm)
        end
      end
      return perms
    end
  end

end
