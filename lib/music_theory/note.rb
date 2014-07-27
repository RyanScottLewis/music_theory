require 'music_theory/parser/note'

module MusicTheory
  
  class Note
    
    class << self
      
      # TODO: Should depend on pitch notation
      def names
        [
          ['C'],
          ['C#', 'Db'],
          ['D'],
          ['D#', 'Eb'],
          ['E'],
          ['F'],
          ['F#', 'Gb'],
          ['G'],
          ['G#', 'Ab'],
          ['A'],
          ['A#', 'Bb'],
          ['B']
        ]
      end
      
      def chromatic_index_of(name)
        names.index { |note_names| note_names.include?(name) }
      end
      
      # TODO: Should return Note instances
      # TODO: Return all notes (have option to show all octaves, single octave, range of octaves, range of notes)
      def all
        
      end
      
    end
    
    # The chromatic index of this note. C0 = 0, C8 = 88.
    attr_reader :index 
    
    # The letter for this note.
    # TODO: Depends on letter notation
    attr_reader :letter
    
    # The number of sharps or flats for this note.
    # Will either be an empty Hash (meaning this note is natural) or a Hash
    # containing :flat or :sharp the keys, the values of which indicate the
    # count of the accidental type.
    attr_reader :accidental
    
    # The frequency of this note.
    attr_reader :frequency
    
    # The name of this note.
    # TODO: Depends on pitch notation, letter notation, i18n
    attr_reader :name
    
    # TODO: Possible inputs:
    #       letter: ?D, accidental: { sharp: 1 }, octave: 2 # #to_hash/#to_h - :accidental must either have :sharp or :flat keys containing an object responding to #to_i if given.
    #       name: 'C#4'             # name            # #to_s - based on notation
    #       name: 'C sharp 4'       # name            # #to_s - based on I18n & notation
    #       frequency: 440          # frequency       # #to_f/to_i - based on tuning
    #       index: 49               # chromatic index # #to_i - Max is 88 # TODO: Why have a max? Fuuuuck it
    #       midi: 69                # MIDI number     # #to_i - Min is 0 and max is 127
    #       scale: '...', degree: 2 # scale & degree  # value of :scale can be anything Scale.new can parse
    #       'C#4'                   # smart           # Tries in this order: name, frequency, index, midi
    def initialize(input)
      @chromatic_note_index = input if input.is_a?(Integer)
      @chromatic_note_index = self.class.chromatic_index_of(input) if input.is_a?(String)
      
      @name = self.class.names[@chromatic_note_index].first
    end
    
    def natural?
      
    end
    
    def accidental?
      
    end
    
    def flat?
      
    end
    
    def sharp?
      
    end
    
    # TODO: Make this... depends on tuning
    def frequency
      
    end
    
    # TODO: return all scales for this note
    def scales
      
    end
    
    # TODO: return a specific scale for this note
    def scale(name)
      
    end
    
    # TODO: Return all ScaleDegree instances for this note
    def scale_degrees
      
    end
    
    # TODO: Return all ScaleDegree instances where this note is the given degree
    def scale_degree(degree)
      
    end
    
  end
  
end
