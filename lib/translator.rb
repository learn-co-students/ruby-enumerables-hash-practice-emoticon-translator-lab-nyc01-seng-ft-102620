require 'yaml'

def load_library(file)
 final_emoticons = {} 
 YAML.load_file(file).each do |key, value|
   final_emoticons[key] = {}
   final_emoticons[key][:english] = value[0]
   final_emoticons[key][:japanese] = value[1]
 end
 final_emoticons
end


def get_english_meaning(file, emoticon)
  load_library(file).each do |key, value|
    if value[:japanese] == emoticon
      return key
  end
end
return "Sorry, that emoticon was not found"
end


def get_japanese_emoticon(file, emoticon)
  load_library(file).each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end
end
return "Sorry, that emoticon was not found"
end