module MusicTheory
  
  class Interval
    
    attr_reader :quality
    
    # TODO: Possible inputs:
    #       number: 1
    #       number: '5b'
    #       number: '#5'
    #       number: 'flat 5'
    #       number: '5 sharped'
    #       number:  'fifth'            # Based on I18n (perfects are assumed)
    #       number:  'third'            # Based on I18n (majors are assumed)
    #       number:  'minor sixth'      # Based on I18n
    #       number: 3, quality: 'major' # Number & quality
    #       number: 4, root: ?C         # Number & root
    #       distance: 7                 # In semitones (P5)
    #       distance: 7, root: ?C       # In semitones (P5, end is G)
    #       root: ?C                    # Just the root (anything Note.new can parse)
    #       end: ?C                     # Just the end
    #       start: ?C, end: ?G          # find the interval name (P5) or distance (7) or ratio (3:2)
    def initialize(options={})
      # TODO: Complain if options isnt a Hash
      # options = {
      #   start: 1
      # }.merge(options)
      # 
      # @start = options.start
    end
    
    def name(options={})
      # options = { short: false }.merge(options)
      
      # return short_name_from_quality if !!options[:short] # TODO I18n... I dunno about this
      
      # TODO: Get name from I18n
    end
    
    def number
      
    end
    
    def number=(value)
      
    end
    
    def quality=(value)
      
    end
    
    # TODO: Depends on tuning
    def ratio
      
    end
    
    # In semitones
    def distance
      
    end
    
    def sharp?
      
    end
    
    def flat?
      
    end
    
    def minor?
      
    end
    
    def major?
      
    end
    
    def augmented?
      
    end
    
    def diminished?
      
    end
    
  end
  
end
