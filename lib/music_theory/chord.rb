require 'music_theory/interval'
require 'music_theory/parser/chord'

module MusicTheory
  
  class Chord
    
    class << self
      
      def dictionary
        @dictionary ||= YAML.load_file( Helpers.root.join('data', 'chords.yml') )
      end
      
      def lookup(*intervals_to_find)
        name, intervals = dictionary.find { |name, intervals| intervals == intervals_to_find }
        
        { name: name, intervals: intervals }
      end
    
    end
    
    # TODO: Possible inputs:
    #       name: 'C#6/9'                               # name                  # based on notation
    #       notes: ?C, 'Eb', ?G                         # notes                 # based on anything Note.new can parse (C minor)
    #       intervals: 1, 3, 5                          # intervals             # based on integers (major)
    #       intervals: 1, '3b', 'b5'                    # intervals             # based on accidentals (diminished)
    #       intervals: 1, 3, '5#'                       # intervals             # based on accidentals (augmented)
    #       intervals: 1, 3, 5, 7, '#11'                # intervals             # based on accidentals (augmented)
    #       intervals: 1, 'P4', 'P5'                    # intervals             # based on quality (sus4) - Short notation - perfect (P), major (M), minor (m), augmented (A), and diminished (d)
    #       intervals: 1, 'flat third', 5               # intervals             # based on I18n quality (minor)
    #       semitones: 0, 4, 7                          # semitones             # based on semitones (major)
    
    #       root: ?C, type: 'Major'                     # root & type           # based on anything Note.new can parse (C major)
    #       name: 'Cmin7', type: 'Major'                # name & type           # Overwrite the type from the name => Cmaj
    #       scale: 'C major'                            # scale                 # based on anything Scale.new can parse
    #       scale: 'C major', type: 'major seventh'     # scale & type          # based on ... TODO: Does this make sense..?.
    #       scale: 'C major', degree: 3                 # scale & degree        # based on ...
    #       'C7'                                        # smart                 # tries in this order: name, notes, intervals, semitones
    # TODO: It all gets converted to intervals, then applied to scales.
    def initialize(options={})
      # TODO: raise error if has_key? :name && intervals, semitones && notes... etc
      #       root && intervals, root && semitones, root && type should all work
      #       I.E. Raise error on all incompatible option keys =)
      # If no root is given, it remains "lazy" or not placed on the musical keyboard yet
      if options.is_a?(String)
      elsif options.has_key?(:name)
      elsif options.has_key?(:notes)
      elsif options.has_key?(:intervals)
        # TODO: Complain if options[:intervals] is not an Array
        self.intervals = options[:intervals].collect { |interval| Interval.new(interval) }
      elsif options.has_key?(:semitones)
      elsif options.has_key?(:scale)
      end
    end
    
    # =-=-=- Type Attribute
    
    def type
      
    end
    
    def type=(value)
      
    end
    
    def type?
      
    end
    
    # =-=-=- Intervals Attribute
    
    def intervals
      
    end
    
    def intervals=(value)
      
    end
    
    def intervals?
      !@intervals.nil? && !@intervals.empty?
    end
    
    # =-=-=- Notes Attribute
    
    def notes
      
    end
    
    def notes=(value)
      
    end
    
    def notes?
      
    end
    
    # =-=-=- Name Attribute
    
    def name
      result = ''
      
      result << root.name if root?
      result << name_from_intervals if intervals?
    end
    
    def name?
      !@name.nil?
    end
    
    # =-=-=- Name Attribute
    
    attr_reader :description
    
    def descripton?
      !@descripton.nil?
    end
    
    # =-=-=- Root Attribute
    
    attr_reader :root
    
    def root=(value)
      
    end
    
    def root?
      !@root.nil?
    end
    
    # =-=-=- Helpers
    
    # TODO: Reverse inversion?
    #       C3 second reverse inversion  = E2 G2 C3 = C3 first inversion minus 1 octave
    #       C3 first reverse inversion   = G2 C3 E3 = C3 second inversion minus 1 octave
    #       C3                           = C3 E3 G3
    #       C3 first inversion           = E3 G3 C4
    #       C3 second inversion          = G3 C4 E4
    def inversion(number)
      
    end
    
    # TODO: Return all enharmonic chords
    def enharmonics
      
    end
    
  end
  
end

__END__

chord = Chord.new(intervals: 1, 3, 5)
chord.name # => 'Cmaj'
chord.intervals.length # => 2
chord.intervals.first.start # => #<0x001 MusicTheory::Note name='C'>
chord.intervals.first.end # => #<0x002 MusicTheory::Note name='E'>
chord.intervals.last.start # => #<0x001 MusicTheory::Note name='C'>
chord.intervals.last.end # => #<0x003 MusicTheory::Note name='G'>
chord.notes # => [ #<0x001 MusicTheory::Note name='C'>, #<0x002 MusicTheory::Note name='E'>, #<0x003 MusicTheory::Note name='G'> ]
chord.intervals.first.name # => 'Major Third'
chord.intervals.first.name(:short) # => 'M3'
chord.intervals.last.name # => 'Perfect Fifth'
chord.intervals.first.name = 'm3'
chord.name # => 'Cmin'
chord.name = 'Cmaj7'
chord.intervals.collect { |interval| interval.name(:short) } # => [ 'P1', 'M3', 'P5', 'M7' ]
chord.root = 'G'
chord.name = 'Gmaj7'

scale = Scale.new('G minor')
chord.root = scale.degrees[4].note # => The same
chord.root = scale.degree(5).note  # => The same
chord.root = scale.dominant.note   # => The same

simple_progression = []
simple_progression << scale.degree(1)
simple_progression << scale.degree(5)
simple_progression << scale.degree(4)
simple_progression << scale.degree(6)

progression = ChordProgression.new(scale: 'C major', degrees: [ 1, 5, 4, 6 ] )
