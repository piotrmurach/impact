# -*- encoding: utf-8 -*-

require 'impact'
require 'rspec'
require 'rack/test'

module TestHelpers
  def app
    Impact::Server.class_eval {
      set :environment, :test
    }
  end
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  config.include Rack::Test::Methods
  config.include TestHelpers
end
