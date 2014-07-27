module MusicTheory
  module Parser
    
    class Base < Parslet::Parser
      
      class << self
        
        # Allows the `rule` class method in Parslet::Parser subclasses to accept an options hash.
        # TODO: YARD for options
        def rule(name, options={}, &definition)
          super(name, &definition)
          
          super("#{name}?".to_sym) { send(name).maybe } if options[:query]
        end
        
      end
      
      rule(:whitespace, query: true) { match('\s').repeat(1) }
      
      rule(:letter, query: true)     { match['A-Ga-g'].as(:letter) }
      
      rule(:sharp)                   { match['#♯'].repeat(1, 2).as(:sharp) } # TODO: Should support more than 2?
      rule(:flat)                    { match['b♭'].repeat(1, 2).as(:flat) }  # TODO: Should support more than 2?
      # rule(:natural)                 { match['n♮'].as(:natural) }
      
      rule(:accidental, query: true) { (sharp | flat).as(:accidental) }
      # rule(:accidental, query: true) { (sharp | flat | natural).as(:accidental) }
      
      protected
      
      def accidental_count(accidental)
        return accidental[:sharp].to_s.length if accidental.has_key?(:sharp)
        return -accidental[:flat].to_s.length if accidental.has_key?(:flat)
        
        # raise MusicTheory::Error::ParseError # TODO
      end
      
    end
    
  end
end