require 'spec_helper'

describe MusicTheory::Parser::Note do
  
  it_behaves_like :a_parser
  
  describe '#parse' do
    
    subject { described_class.new }
    
    it 'should parse a letter correctly' do
      subject.parse("A").should == { letter: ?A, accidental: nil, octave: nil }
      subject.parse("  b  ").should == { letter: ?B, accidental: nil, octave: nil }
      subject.parse("\r\n  \n   \t C").should == { letter: ?C, accidental: nil, octave: nil }
      subject.parse("\t\t\td   \r \r\n ").should == { letter: ?D, accidental: nil, octave: nil }
      subject.parse("  E").should == { letter: ?E, accidental: nil, octave: nil }
      subject.parse("F  ").should == { letter: ?F, accidental: nil, octave: nil }
      subject.parse("\nG\n").should == { letter: ?G, accidental: nil, octave: nil }
    end
    
    it 'should parse a letter with a non-UTF accidental correctly' do
      subject.parse("A#").should == { letter: ?A, accidental: 1, octave: nil }
      subject.parse("  bbb  ").should == { letter: ?B, accidental: -2, octave: nil }
      subject.parse("\r\n  \n   \t C##").should == { letter: ?C, accidental: 2, octave: nil }
      subject.parse("\t\t\tdb   \r \r\n ").should == { letter: ?D, accidental: -1, octave: nil }
      subject.parse("  E").should == { letter: ?E, accidental: nil, octave: nil }
      subject.parse("F  #  ").should == { letter: ?F, accidental: 1, octave: nil }
      subject.parse("\nG\r\n  \t \n b \t\n").should == { letter: ?G, accidental: -1, octave: nil }
    end
    
    it 'should parse a letter with a UTF accidental correctly' do
      subject.parse("A♯").should == { letter: ?A, accidental: 1, octave: nil }
      subject.parse("  b♭♭  ").should == { letter: ?B, accidental: -2, octave: nil }
      subject.parse("\r\n  \n   \t C♯♯").should == { letter: ?C, accidental: 2, octave: nil }
      subject.parse("\t\t\td♭   \r \r\n ").should == { letter: ?D, accidental: -1, octave: nil }
      subject.parse("  E").should == { letter: ?E, accidental: nil, octave: nil }
      subject.parse("F  ♯  ").should == { letter: ?F, accidental: 1, octave: nil }
      subject.parse("\nG\r\n  \t \n ♭ \t\n").should == { letter: ?G, accidental: -1, octave: nil }
    end
    
    it 'should parse a letter with a mixed UTF & non-UTF accidentals correctly' do
      subject.parse("C♭b").should == { letter: ?C, accidental: -2, octave: nil }
      subject.parse("Cb♭").should == { letter: ?C, accidental: -2, octave: nil }
      subject.parse("C♯#").should == { letter: ?C, accidental: 2, octave: nil }
      subject.parse("C#♯").should == { letter: ?C, accidental: 2, octave: nil }
    end
    
    it 'should parse a letter with an octave correctly' do
      subject.parse("A0").should == { letter: ?A, accidental: nil, octave: 0 }
      subject.parse("  b1  ").should == { letter: ?B, accidental: nil, octave: 1 }
      subject.parse("\r\n  \n   \t C4").should == { letter: ?C, accidental: nil, octave: 4 }
      subject.parse("\t\t\td6   \r \r\n ").should == { letter: ?D, accidental: nil, octave: 6 }
      subject.parse("  E7").should == { letter: ?E, accidental: nil, octave: 7 }
      subject.parse("F  8  ").should == { letter: ?F, accidental: nil, octave: 8 }
      subject.parse("\nG\r\n  \t \n 9 \t\n").should == { letter: ?G, accidental: nil, octave: 9 }
    end
    
    it 'should parse a letter with a non-UTF accidental and an octave correctly' do
      subject.parse("A#0").should == { letter: ?A, accidental: 1, octave: 0 }
      subject.parse("  bbb1  ").should == { letter: ?B, accidental: -2, octave: 1 }
      subject.parse("\r\n  \n   \t C##4").should == { letter: ?C, accidental: 2, octave: 4 }
      subject.parse("\t\t\tdb6   \r \r\n ").should == { letter: ?D, accidental: -1, octave: 6 }
      subject.parse("  E7").should == { letter: ?E, accidental: nil, octave: 7 }
      subject.parse("F  8  #  ").should == { letter: ?F, accidental: 1, octave: 8 }
      subject.parse("\nG\r\n  \t \n 9 \r\n  \tbb \t\n").should == { letter: ?G, accidental: -2, octave: 9 }
    end
    
    it 'should parse a letter with a UTF accidental and an octave correctly' do
      subject.parse("A♯0").should == { letter: ?A, accidental: 1, octave: 0 }
      subject.parse("  b♭♭1  ").should == { letter: ?B, accidental: -2, octave: 1 }
      subject.parse("\r\n  \n   \t C♯♯4").should == { letter: ?C, accidental: 2, octave: 4 }
      subject.parse("\t\t\td♭6   \r \r\n ").should == { letter: ?D, accidental: -1, octave: 6 }
      subject.parse("  E7").should == { letter: ?E, accidental: nil, octave: 7 }
      subject.parse("F  8  ♯  ").should == { letter: ?F, accidental: 1, octave: 8 }
      subject.parse("\nG\r\n  \t \n 9 \r\n  \t♭♭ \t\n").should == { letter: ?G, accidental: -2, octave: 9 }
    end
    
    it 'should throw an error when nonsensical input is given' do
      expect { subject.parse("Q") }.to raise_error(MusicTheory::Parser::Note::ParseError)
      expect { subject.parse("C#b7") }.to raise_error(MusicTheory::Parser::Note::ParseError)
      expect { subject.parse("C#b7") }.to raise_error(MusicTheory::Parser::Note::ParseError)
      expect { subject.parse("Bbbb") }.to raise_error(MusicTheory::Parser::Note::ParseError)
      expect { subject.parse("G###") }.to raise_error(MusicTheory::Parser::Note::ParseError)
      expect { subject.parse("B10") }.to raise_error(MusicTheory::Parser::Note::ParseError)
      expect { subject.parse("1B") }.to raise_error(MusicTheory::Parser::Note::ParseError)
      expect { subject.parse("#C") }.to raise_error(MusicTheory::Parser::Note::ParseError)
      expect { subject.parse("bC") }.to raise_error(MusicTheory::Parser::Note::ParseError)
      expect { subject.parse("  # C 8  ") }.to raise_error(MusicTheory::Parser::Note::ParseError)
      expect { subject.parse("Cmaj7  ") }.to raise_error(MusicTheory::Parser::Note::ParseError)
      expect { subject.parse("ABC") }.to raise_error(MusicTheory::Parser::Note::ParseError)
      expect { subject.parse("C-1") }.to raise_error(MusicTheory::Parser::Note::ParseError)
    end
    
  end
  
end
