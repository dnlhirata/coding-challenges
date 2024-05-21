require 'rspec'
require_relative 'parser'

RSpec.describe JSONParser do
  describe '#parse' do
    context 'when the input is a valid and empty JSON' do
      it 'returns the parsed JSON' do
        parser = JSONParser.new
        json = '{}'
        expect(parser.parse(json)).to eq({})
      end
    end

    context 'when the input is an invalid JSON' do
      it 'raises an error' do
        parser = JSONParser.new
        json = ''
        expect { parser.parse(json) }.to raise_error(JSONParser::InvalidJsonError)
      end
    end
  end
end
