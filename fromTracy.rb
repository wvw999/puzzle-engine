require('benchmark')
input = [['the', 'a','no'],['rain','storm', 'drizzle'],['in'],['germany','spain','italy','france','england'],['stays'],['mainly','mostly'],['in the'],['meadow','plain','forest','hills']]

def sentence_maker(input)
  input.reduce do |memo, value|
    value.reduce([]) do |m, new_word|
      memo.map do |prev_words|
        [*prev_words, new_word]
      end + m
    end
  end
end

puts Benchmark.measure {
  puts sentence_maker(input).map{|x| x.join(" ") }.sort
}
