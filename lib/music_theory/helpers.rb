require 'pathname'

module MusicTheory
  
  module Helpers
    class << self
      
      def root
        @root ||= Pathname.new(__FILE__).join('..', '..', '..').expand_path
      end
      
    end
  end
  
end
