require 'spec_helper'

describe MusicTheory::Parser::RomanNumeral do
  
  it_behaves_like :a_parser
  
  describe '#parse' do
    
    subject { described_class.new }
    
    it 'should parse a single roman numeral correctly' do
      pending
    end
    
    it 'should throw an error when nonsensical input is given' do
      pending
    end
    
  end
  
end
