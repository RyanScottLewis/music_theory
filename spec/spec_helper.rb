require 'bundler/setup'
require 'music_theory'

RSpec.configure do |config|
  
  config.order = :random
  # config.filter_run focus: true
  
end

Dir[ Pathname.new(__FILE__).join('..', 'support', '**', '*.rb').expand_path ].each { |file| require(file) }
