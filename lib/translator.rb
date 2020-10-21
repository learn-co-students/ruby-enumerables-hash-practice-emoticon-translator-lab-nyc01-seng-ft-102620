# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  # code goes here
  emos = YAML.load_file(path)
  emos.map do |k, v|
    emos[k] = {:english => v[0], :japanese => v[1]}
  end
  emos
end

def get_japanese_emoticon(path, emote)
  # code goes here
  library = load_library(path)
  library.each do |emotion, languages|
    library[emotion].each do |lang, face|
      if emote == face
        #end method and return the japanese version
        return library[emotion][:japanese]
      end 
    end 
  end   
  #otherwise return this apology
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emote)
  # code goes here
  library = load_library(path)
  library.each do |emotion, languages|
    library[emotion].each do |lang, face|
      if emote == face
        #end method and return a string of the emotion
        return emotion.to_s 
      end 
    end
  end
  #otherwise return this apology
  return "Sorry, that emoticon was not found"
end