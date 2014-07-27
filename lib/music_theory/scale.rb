require 'music_theory/note'
require 'music_theory/scale_degree'

module MusicTheory
  
  # class ScaleType
  
  class Scale
    
    class << self
      
      def formula(*values)
        @formula = values unless values.empty?
        
        @formula
      end
      
      # TODO: I18n
      def name(value=nil)
        @name = value unless value.nil?
        
        @name ||= to_s.split('::').last.gsub(/([A-Z])/, ' \1').strip # TODO: Global helper
      end
      
      # TODO: Example output for major:
      #       [:major, :minor, :minor, :major, :major, :minor, :minor, :diminished]
      def chords
        
      end
      
      # TODO: return all scales... if argument is given, make Note class parse it
      #       and only show scales for that note. if :major, :minor, 'Harmonic Minor' is passed,
      #       then use that
      def all
        
      end
      
    end
    
    include Enumerable
    
    # TODO: Should parse stuff like "E natural minor" and stuff
    def initialize(tonic)
      @tonic = tonic.is_a?(Note) ? tonic : Note.new(tonic)
    end
    
    # TODO: Use SimpleDelegator or something
    def each(&block)
      notes.each(&block)
    end
    
    def degrees
      notes.collect.with_index { |note, index| ScaleDegree.new(self, index + 1) }
    end
    
    # Define all the scale degrees
    # TODO: YARD for all degrees
    # TODO: Leading tone is only that if it is a half step to the 8th
    #       If it is a whole step, then it is the Subtonic
    ScaleDegree.names.each.with_index do |method_name, index|
      method_name = method_name.gsub(/\s+/, ?_).downcase.to_sym # TODO: Global helper
      define_method(method_name) { notes[index] }
    end
    
    alias_method :root, :tonic
    
    def notes
      raise Exception if self.class.formula.nil? # TODO: Specific MusicTheory:: error
      
      result = []
      current_chromatic_note_index = @tonic.chromatic_note_index
      
      result << @tonic
      self.class.formula[0...-1].each do |semitones|
        current_chromatic_note_index += semitones
        result << Note.new(current_chromatic_note_index % 12)
      end
      
      result
    end
    
    def note(degree)
      notes[degree - 1]
    end
    
    def name
      "#{tonic.name} #{self.class.name}"
    end
    
    def naturals
      notes.find_all(&:natural?)
    end
    
    def accidentals
      notes.find_all(&:accidental?)
    end
    
  end
  
end
