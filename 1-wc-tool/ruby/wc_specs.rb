require 'rspec'
require_relative 'wc'

RSpec.describe 'wc' do
  describe '#count_lines' do
    it 'returns the number of lines in a text' do
      text = "Hello\nWorld\n"
      expect(count_lines(text)).to eq(2)
    end
  end

  describe '#count_bytes' do
    it 'returns the number of bytes in a text' do
      text = "Hello\nWorld\n"
      expect(count_bytes(text)).to eq(12)
    end
  end

  describe '#count_words' do
    it 'returns the number of words in a text' do
      text = "Hello\nWorld\n"
      expect(count_words(text)).to eq(2)
    end
  end

  describe '#count_chars' do
    it 'returns the number of words in a text' do
      text = "Hello\nWorld\n"
      expect(count_chars(text)).to eq(12)
    end
  end
end
