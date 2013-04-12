def combine_anagrams(words)
  wordlist = words.map{|word| word.downcase.chars.sort.join}.uniq
  n = 0
  anagram = []
  wordlist.each do |model|
    words.each do |word|
      if word.downcase.chars.sort.join == model
        if anagram.length <= n
          anagram[n] = [word]
        else
          anagram[n] += [word]
        end
      end
    end
    n += 1
  end
  return anagram
end

#input = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
#input = ['cars', 'for', 'potatoes']
#puts combine_anagrams(input).inspect
