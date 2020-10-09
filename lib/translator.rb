require 'yaml'
require 'pry'

# require modules here

 #return a hash, each key is the name of an emoticon 
  #each emoticon name should point into a nested hash containing two keys - :english and :japanese 

def load_library(file)
  
  emoticons = YAML.load_file('./lib/emoticons.yml')
  
  emoticon_library= {}
  
  emoticons.each do |meaning, value| 
    english = value[0]
    japanese = value[1]
    
    emoticon_library[meaning] = {:english => english, :japanese => japanese}
end
emoticon_library
end

def get_english_meaning(file, emoticon)
  # code goes here
  
  load_library(file).each do |key, value| 
    if value[:japanese] == emoticon
      return key 
    end 
  end 
  return "Sorry, that emoticon was not found"
end


def get_japanese_emoticon(file, emoticon)
  # code goes here
  
  load_library(file).each do |key, value| 
    if value[:english] == emoticon
      return value[:japanese]
    end 
  end 
  return "Sorry, that emoticon was not found"
end

