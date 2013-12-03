class LoremIpsumWordSource
  def initialize(args)
    @word_source = args.fetch(:word_source).split(",")
    @count = 0
    initialize_counters
  end

  def next_word
    @count += 1
    word_source[count-1]
  end

  def top_5_words
    top_five(word_counter)
  end

  def top_5_consonants
    top_five(consonant_counter)
  end

  attr_reader :count

  private

  attr_reader :word_source, :word_counter, :consonant_counter

  def initialize_counters
    @word_counter      = Hash.new(0)
    @consonant_counter = Hash.new(0)

    word_source.each do |word|
      @word_counter[word] = word_counter[word] + 1
      word.each_char do |char|
        @consonant_counter[char] = consonant_counter[char] + 1 if consonant?(char)
      end
    end
  end

  def top_five(array)
    Array.new(5) do |index|
      sort_hash_by_value(array).keys[index]
    end
  end

  def sort_hash_by_value(hash)
    Hash[hash.sort_by{|_, v| v}.reverse]
  end

  def consonant?(char)
    char =~ /[^aeiou]/
  end
end
