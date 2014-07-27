require 'music_theory/note'

# TODO: Subtonic is when the 7th note is a whole tone away from the tonic
#       instead of a semitone which is the Leading Tone
# TODO: MusicTheory::Scale::Degree
module MusicTheory
  
  # TODO: Should delegate all note methods to the #note
  class ScaleDegree
    
    # TODO: I18n
    
    class << self
      
      def names
        @names ||= ["Tonic", "Supertonic", "Mediant", "Subdominant", "Dominant", "Submediant", "Leading Tone"]
      end
      
      # TODO: Better descriptions
      def descriptions
        @descriptions ||= [
          "Tonal center, note of final resolution",
          "One whole step above the tonic",
          "Midway between tonic and dominant",
          "Lower dominant, same interval below tonic dominant is above tonic",
          "2nd in importance to the tonic",
          "Lower mediant, midway between tonic and subdominant",
          "Melodically strong affinity for and leads to tonic/One whole step below tonic"
        ]
      end
      
    end
    
    attr_reader :scale, :degree
    
    def initialize(scale, degree)
      @scale, @degree = scale, degree
    end
    
    alias_method :to_i, :degree # TODO: Alias as #number as well?
    
    def note
      @scale.note(degree)
    end
    
    # TODO: Return all chords of this #degree within the #scale
    def chords
      
    end
    
    def name
      self.class.names[degree - 1]
    end
    
    def description
      self.class.descriptions[degree - 1]
    end
    
  end
  
end
