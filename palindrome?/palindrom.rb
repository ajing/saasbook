def palindrome?(string)
  string.gsub(/[^a-zA-Z]/,'').downcase.reverse == string.gsub(/[^a-zA-Z]/,'').downcase
end

def count_words(string)
  counts = Hash.new(0)
  string.split(/\b/).select {|item| item =~ /\w/}.each do |items|
    items = items.downcase
    counts[items]  += 1
  end
  counts
end