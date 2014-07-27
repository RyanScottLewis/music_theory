RSpec::Matchers.define :be_chord do |expected|
  
  match do |actual|
    @passed = []
    actual.class.should == MusicTheory::Chord
    
    if expected.has_key?(:name)
      actual.name.should == expected[:name]
      @passed << :name
    end
    
    if expected.has_key?(:description)
      actual.description.should == expected[:description]
      @passed << :description
    end
    
    if expected.has_key?(:intervals)
      actual.intervals.all? { |interval| interval.class == MusicTheory::Interval }.should == true
      actual.intervals.should == [1, 3, 5, 7]
      @passed << :intervals
    end
    
    if expected.has_key?(:root)
      actual.root.class.should == MusicTheory::Note
      actual.root.should == expected[:root]
      @passed << :root
    end
    
    if expected.has_key?(:notes)
      actual.notes.all? { |note| note.class == MusicTheory::Note }.should == true
      actual.notes.should == expected[:notes]
      @passed << :notes
    end
  end
  
  failure_message_for_should do |actual|
    failed_expected = expected.dup.delete_if { |key| @passed.include?(key) }
    
    "expected #{actual} to be chord #{failed_expected}"
  end
  
  description do
    "be chord the correct chord"
  end
  
end
