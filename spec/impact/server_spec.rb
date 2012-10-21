require 'spec_helper'

describe 'Impact::Server' do

  context 'glob api' do
    it 'finds files' do
      response = ["lib/game/levels/*.js"]
      Dir.should_receive(:glob).with(response).and_return response
      get '/lib/weltmeister/api/glob?glob[]=lib%2Fgame%2Flevels%2F*.js'
      last_response.body.should == response.to_json
    end
  end

  context 'browse api' do
    let(:pwd) { './'}
    let(:files) { ['./lib/game/levels/player.js'] }
    let(:dirs) { ['./lib/tools', './lib/media', './lib/game'] }

    before { File.stub(:join).and_return pwd }

    it 'searches through directories' do
      response = {
        :parent => false,
        :dirs => [],
        :files => dirs
      }
      Pathname.stub_chain(:new, :parent).and_return false
      Dir.stub(:glob).and_return dirs
      get 'lib/weltmeister/api/browse?dir=&type=scripts'
      last_response.body["files"].should == response.to_json["files"]
    end
  end

  context 'save api' do

  end

end
