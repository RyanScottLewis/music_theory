shared_examples :a_parser do
  
  it { should be_kind_of(MusicTheory::Parser::Base) }
  
  describe '#parse' do
    
    subject { described_class.new }
    
    context 'Emptyness' do
      
      let :expectation do
        { letter: nil, accidental: nil, octave: nil }
      end
      
      it 'should parse correctly' do
        subject.parse("").should == expectation
        subject.parse("\n").should == expectation
        subject.parse("\r").should == expectation
        subject.parse("\t").should == expectation
        subject.parse("\n\n").should == expectation
        subject.parse("\n\r").should == expectation
        subject.parse("\n\t").should == expectation
        subject.parse("\r\n").should == expectation
        subject.parse("\r\r").should == expectation
        subject.parse("\r\t").should == expectation
        subject.parse("\t\n").should == expectation
        subject.parse("\t\r").should == expectation
        subject.parse("\t\t").should == expectation
        subject.parse("\n\n\n").should == expectation
        subject.parse("\n\n\r").should == expectation
        subject.parse("\n\n\t").should == expectation
        subject.parse("\n\r\n").should == expectation
        subject.parse("\n\r\r").should == expectation
        subject.parse("\n\r\t").should == expectation
        subject.parse("\n\t\n").should == expectation
        subject.parse("\n\t\r").should == expectation
        subject.parse("\n\t\t").should == expectation
        subject.parse("\r\n\n").should == expectation
        subject.parse("\r\n\r").should == expectation
        subject.parse("\r\n\t").should == expectation
        subject.parse("\r\r\n").should == expectation
        subject.parse("\r\r\r").should == expectation
        subject.parse("\r\r\t").should == expectation
        subject.parse("\r\t\n").should == expectation
        subject.parse("\r\t\r").should == expectation
        subject.parse("\r\t\t").should == expectation
        subject.parse("\t\n\n").should == expectation
        subject.parse("\t\n\r").should == expectation
        subject.parse("\t\n\t").should == expectation
        subject.parse("\t\r\n").should == expectation
        subject.parse("\t\r\r").should == expectation
        subject.parse("\t\r\t").should == expectation
        subject.parse("\t\t\n").should == expectation
        subject.parse("\t\t\r").should == expectation
        subject.parse("\t\t\t").should == expectation
        subject.parse(" ").should == expectation
        subject.parse("            ").should == expectation
        subject.parse("  \t   \r   \r\n    \r   \t      \n    ").should == expectation
      end
      
    end
    
  end
  
end
