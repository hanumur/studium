class LoremIpsumWordSource
  def initialize(args)
    @word_source = read_file(args.fetch(:word_source_path))
    @callback    = args.fetch(:callback) { Object.new }
    initialize_counters
  end

  def next_word
    take_next_word { |word|
      update_counters(word)
      callback.run if special_word(word)
    }
  end

  def top_5_words
    top_five(word_counter)
  end

  def top_5_consonants
    top_five(consonant_counter)
  end

  def run
    word_source.each { |word| update_counters(word) }
    true
  end

  attr_reader :count

  private

  attr_reader :word_source, :word_counter, :consonant_counter, :callback

  def read_file(path)
    File.read(path).strip.split(",")
  end

  def initialize_counters
    @count = 0
    @word_counter      = Hash.new(0)
    @consonant_counter = Hash.new(0)
  end

  def take_next_word(&block)
    word = word_source[count]
    block.call(word)
    word
  end

  def special_word(word)
    word == "semper"
  end

  def update_counters(word)
    update_count
    update_word(word)
    word.each_char do |char|
      update_consonant(char) if consonant?(char)
    end
  end

  def update_count
    @count += 1
  end

  def update_word(word)
    @word_counter[word] = word_counter[word] + 1
  end

  def update_consonant(char)
    @consonant_counter[char] = consonant_counter[char] + 1
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
