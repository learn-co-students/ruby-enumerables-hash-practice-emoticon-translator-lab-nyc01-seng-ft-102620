# require modules here
require 'pry'
require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  new_hash = emoticons.each_with_object({}) do |(key, element),new_hash|
    if(!new_hash[key])
      new_hash[key] = {}
    end
    
    if(!new_hash[key][:english])
      new_hash[key][:english] = emoticons[key][0]
    end 
    
    if(!new_hash[key][:japanese])
      new_hash[key][:japanese] = emoticons[key][1]
    end 
  
  end 
  new_hash
end

def get_japanese_emoticon(file_path, western_emo)
  emoticons = load_library(file_path)
  sorry_message = "Sorry, that emoticon was not found"
  emoticons.each do |key,element|
    if(element.key(western_emo) != nil)
      return emoticons[key][:japanese]
    end 
  end
  return sorry_message
end

def get_english_meaning(file_path, japanese_emo)
  emoticons = load_library(file_path)
  sorry_message = "Sorry, that emoticon was not found"
  emoticons.each do |key,element|
    if(element.key(japanese_emo) != nil)
      return key
    end 
  end
  return sorry_message
end