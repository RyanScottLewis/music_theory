require 'spec_helper'

describe MusicTheory::Chord do
  
  describe '#initialize' do
    
    context 'when a Hash is given' do
      
      [:name, :intervals].each do |assertion_key|
        context "when the #{assertion_key} key is passed" do
          describe_chord( assertion_key, name: 'Cmaj', description: 'C Major', intervals: [1, 3, 5], root: ?C, notes: [?C, ?E, ?G], semitones: [0, 4, 7] )
          describe_chord( assertion_key, name: 'Bmaj7', description: 'B Major Seventh', intervals: [1, 3, 5, 7], root: ?B, notes: [?B, 'D#', 'F#', 'A#'], semitones: [0, 4, 7, 11] )
          describe_chord( assertion_key, name: 'Dmin', description: 'D Minor', intervals: [1, 'm3', 5], root: ?D, notes: [?D, ?F, ?A], semitones: [0, 3, 7] )
          describe_chord( assertion_key, name: 'E7b9', description: 'E Dominant Seventh, Flat Nineth', intervals: [1, 3, 5, 'm7', 'm9'], root: ?E, notes: [?D, ?F, ?A], semitones: [0, 4, 7, 10, 14] ) # dunno about 14 lol
        end
      end
      
      context 'when :semitones are given' do
        
      end
      
      # TODO: Wait.. scale?
      context 'when a :scale is given' do
        
        context 'when a :degree is given' do
          
        end
        
      end
      
    end # when a Hash is given
    
  end # initialize
  
end
