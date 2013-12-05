require "spec_helper"
require "lorem_ipsum_word_source"

describe LoremIpsumWordSource do
  subject(:src) {
    LoremIpsumWordSource.new(
      :word_source_path => File.expand_path("../../support/lorem_ipsum.txt", __FILE__)
    )
  }

  it "returns the next word from the source" do
    expect(src.next_word).to eq "lorem"
    expect(src.next_word).to eq "ipsum"
    expect(src.next_word).to eq "ipsum"
  end

  describe "counter statics" do
    before do
      src.next_word
      src.next_word
      src.next_word
    end

    it "returns the top five words" do
      expect(src.top_5_words).to eq ["ipsum","lorem",nil,nil,nil]
    end

    it "returns the top five words" do
      expect(src.top_5_consonants).to eq ["m","s","p","r","l"]
    end

    it "retuns total words seen" do
      expect(src.count).to eq 3
    end
  end
end
