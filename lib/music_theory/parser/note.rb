require 'parslet'
require 'music_theory/parser/base'

module MusicTheory
  module Parser
    
    # For parsing (scientific pitch notation)[http://en.wikipedia.org/wiki/Scientific_pitch_notation].
    # Note that this is for parsing a single, solitary note.
    # TODO: This should support other pitch notations which has nothing to do with using scientific pitch/concert pitch tunings.
    class Note < Base
      
      class ParseError < StandardError
        
        def to_s
          "Could not parse the note. Note must be given as:\n  WHITESPACE? + LETTER? + WHITESPACE? + \n  (\n    ( ACCIDENTAL + WHITESPACE? + OCTAVE? )\n    OR\n    ( OCTAVE + WHITESPACE? + ACCIDENTAL? )\n  ) +\n  WHITESPACE?\n"
        end
        
      end
      
      rule(:octave, query: true)                { match['0-9'].as(:octave) }
      
      rule(:accidental_following_octave)        { octave >> whitespace? >> accidental? }
      rule(:octave_following_accidental)        { accidental >> whitespace? >> octave? }
      rule(:accidental_and_octave, query: true) { octave_following_accidental | accidental_following_octave }
      
      rule(:note)                               { letter? >> whitespace? >> accidental_and_octave? }
      
      rule(:expression)                         { whitespace? >> note >> whitespace? }
      
      root(:expression)
      
      def parse(input)
        result = super
        result = {} unless result.is_a?(Hash)
        result = { letter: nil, accidental: nil, octave: nil }.merge(result)
        
        result[:letter] = result[:letter].to_s.upcase unless result[:letter].nil?
        result[:accidental] = accidental_count( result[:accidental] ) unless result[:accidental].nil?
        result[:octave] = result[:octave].to_i unless result[:octave].nil?
        
        result
      rescue Parslet::ParseFailed => exception
        raise ParseError
      end
      
    end
    
  end
end
