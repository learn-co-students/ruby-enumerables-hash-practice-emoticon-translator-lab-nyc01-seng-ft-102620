# require modules here
require 'yaml' 
require 'pry'


  def load_library(data) 
  emoticons = YAML.load_file(data)
  
  emoticon_library = {}
  
  emoticons.each do |meaning, value| 
    emoticon_library[meaning] = {}
    emoticon_library[meaning][:english] = value[0]
    emoticon_library[meaning][:japanese] = value[1]
  end 
  emoticon_library
  end

def get_japanese_emoticon(data, emoticon)
  emoticons = load_library(data)
  emoticons.each do |key, value|
    if emoticons[key][:english] == emoticon 
      return value[:japanese]
  end 
  #binding.pry 
end 
 "Sorry, that emoticon was not found"
end

def get_english_meaning(data, emoticon)
  emoticons = load_library(data)
  emoticons.each do |key, value| 
    if emoticons[key][:japanese] == emoticon 
      return key
    end 
  #binding.pry
  end 
  "Sorry, that emoticon was not found"
end 