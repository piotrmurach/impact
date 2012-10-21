# -*- encoding: utf-8 -*-

require 'sinatra/base'
require 'pathname'
require 'json'

module Impact
  class Server < Sinatra::Base

    set :public_folder, File.dirname(__FILE__) + '/'

    set :root, File.join(File.dirname(__FILE__), '/')

    get '/' do
      File.read('index.html')
    end

    get '/weltmeister' do
      File.read('weltmeister.html')
    end

    get '/lib/weltmeister/api/glob' do
      response = Dir.glob(params[:glob])

      content_type :json
      response.to_json
    end

    get '/lib/weltmeister/api/browse' do
      response = { :dirs => [], :files => [], :parent => false }
      dir = File.join(settings.root, params[:dir])

      ext = "*." + case params[:type]
        when 'images' then "{" + %w[png gif jpg jpeg bmp].join(', ') + "}"
        when 'script' then "js"
        else "*"
      end

      response[:parent] = Pathname.new(dir).parent if dir

      dir += '/' unless dir.to_s[-1] == '/'

      response[:files] = Dir.glob(File.join(dir, ext)).reject { |file| File.directory?(file) }

      response[:dirs]  = Dir.glob(File.join(dir, '*')).select { |file| File.directory?(file)}

      content_type :json
      response.to_json
    end

    post '/lib/weltmeister/api/save' do
      response = { :error => 0 }

      if params[:path] && params[:data]
        dir = File.join(settings.root, params[:path])

        if File.extname(dir) == ".js"
          begin
            File.open(dir, 'w') { |file| file.write(params[:data]) }
          rescue => e
            response.merge! :error => 2, :msg => "Couldn't write to file: #{e.message}"
          end
        else
          response.merge! :error => 3, :msg => "File must have a .js suffix"
        end
      else
        response.merge! :error => 1, :msg => "No Data or Path specified"
      end

      content_type :json
      response.to_json
    end

  end # Server
end # Impact
