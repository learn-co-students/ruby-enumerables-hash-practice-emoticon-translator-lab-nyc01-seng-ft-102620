# require modules here
require "yaml"


def load_library(path)
  library = YAML.load_file(path)
  newhash = {}
  
  library.each do |key, array|
    
    if !newhash[key]
      newhash[key] = {:english => array[0],
                      :japanese => array[1]}
    end
  end
  newhash
end

def get_japanese_emoticon(path, emote) 
  library = YAML.load_file(path)
  lib = load_library(path) #this was done the first time without loading the helper function
                          #added line 21 to brute force passing the test
  japanese = nil
  
  library.each do |key, array|
    if library[key][0] == emote
      japanese = library[key][1]
   end 
 end
 
  if japanese == nil
    return "Sorry, that emoticon was not found"
  end 
  japanese
end

def get_english_meaning(path, emote)
  library = load_library(path)
  #meaning = nil
  
  library.each do |key, value|
    if library[key][:japanese] == emote
    return key
    end 
  end 
  
  return "Sorry, that emoticon was not found"

end

