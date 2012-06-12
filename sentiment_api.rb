#!/usr/bin/env ruby
require 'rubygems'
require 'json'
require 'sinatra'
require "#{File.dirname(__FILE__)}/analyzer"



class SentimentApi < Sinatra::Base
  disable :logging
  disable :raise_errors
  disable :show_exceptions
  
  configure :production do
    disable :dump_errors
  end
  
  set :server, 'thin'
  
  @@the_logic = Analyzer.new

  get '/v1/word/:word.json' do
    res = @@the_logic.word(params[:word])
    content_type 'application/json'
    body res.to_json
    status 200
  end

  post '/v1/word/:word.json' do
    res = @@the_logic.add_word(params[:word],params[:value])
    content_type 'application/json'
    body res.to_json
    status 200
  end

  get '/v1/sentence/:sentence.json' do
    res = @@the_logic.sentence(params[:sentence])
    content_type 'application/json'
    body res.to_json
    status 200
  end

  not_found do
    ""
  end
  
  error InvalidParameters do
    error_code = 422
    content_type 'application/json'
    error error_code, {:error => {:reason => env['sinatra.error'].to_s, :code => error_code}}.to_json 
  end 
  
  error do
    error_code = 500
    content_type 'application/json'
    error error_code, {:error => {:reason => env['sinatra.error'].to_s, :code => error_code}}.to_json
  end
   
end


SentimentApi.run! :port => ARGV[0]
